using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace hospitalWebsite_1
{
    public partial class Login_1 : Page
    {
        // Connection string from web.config
        string cs = ConfigurationManager.ConnectionStrings["staff"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Add any logic for the page load if needed
        }

        protected void btnloginotp_Click(object sender, EventArgs e)
        {
            // Get email from txtemail (updated to the correct ID)
            string email = txtemail.Text.Trim();

            // Validate email input
            if (string.IsNullOrEmpty(email))
            {
                lblErrorMessag.Text = "Please enter your email address.";
                return;
            }

            // Debug: Log the email being checked
            System.Diagnostics.Debug.WriteLine("Checking email: " + email);

            // Check if user exists in the database and is active
            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {
                    con.Open();
                    string selectuser = "SELECT id, loginotpcreate FROM [userinfo] WHERE email=@Email AND isactive='1'";
                    SqlCommand cmd = new SqlCommand(selectuser, con);
                    cmd.Parameters.AddWithValue("@Email", email);

                    SqlDataReader rd = cmd.ExecuteReader();
                    if (rd.Read()) // User found
                    {
                        DateTime? lastOtpCreateTime = rd["loginotpcreate"] as DateTime?;
                        string login_otp = string.Empty;

                        // Debug: Log user found
                        System.Diagnostics.Debug.WriteLine("User found, last OTP created: " + lastOtpCreateTime);

                        // Check if OTP is expired (valid for 10 minutes)
                        if (lastOtpCreateTime.HasValue && lastOtpCreateTime.Value.AddMinutes(10) > DateTime.Now)
                        {
                            login_otp = rd["loginotp"].ToString(); // Reuse the existing OTP if still valid
                        }
                        else
                        {
                            // Generate a new OTP if expired or no OTP exists
                            Random random = new Random();
                            login_otp = random.Next(100000, 999999).ToString();

                            // Update OTP and create time in the database
                            rd.Close();
                            string updateAcc = "UPDATE [userinfo] SET loginotp=@LoginOtp, loginotpcreate=@LoginOtpCreate WHERE email=@Email";
                            SqlCommand cmdupdate = new SqlCommand(updateAcc, con);
                            cmdupdate.Parameters.AddWithValue("@LoginOtp", login_otp);
                            cmdupdate.Parameters.AddWithValue("@LoginOtpCreate", DateTime.Now);
                            cmdupdate.Parameters.AddWithValue("@Email", email);
                            cmdupdate.ExecuteNonQuery();
                        }

                        // Send OTP via email
                        try
                        {
                            SendOtpEmail(email, login_otp);
                            lblSuccessMessage.Text = "OTP sent successfully to your email.";
                            lblErrorMessag.Text = ""; // Clear any previous error message
                        }
                        catch (Exception ex)
                        {
                            lblErrorMessag.Text = "Error sending OTP: " + ex.Message;
                        }
                    }
                    else
                    {
                        // Log the email and if the user is not found
                        System.Diagnostics.Debug.WriteLine("User not found or inactive for email: " + email);
                        lblErrorMessag.Text = "User not found or inactive.";
                        lblErrorMessag.ForeColor = System.Drawing.Color.Red;
                    }

                    con.Close();
                }
                catch (Exception ex)
                {
                    lblErrorMessag.Text = "Error accessing the database: " + ex.Message;
                    lblErrorMessag.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        // Method to send OTP via email
        private void SendOtpEmail(string recipientEmail, string otp)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(recipientEmail);
                mail.From = new MailAddress("palanshika@gmail.com");
                mail.Subject = "Login OTP valid for 10 minutes";

                string emailBody = "<h1>Hello User</h1>";
                emailBody += "<p>Your OTP for login is: <strong>" + otp + "</strong></p>";
                emailBody += "<p>It is valid for 10 minutes.</p>";
                emailBody += "<p>Thank you!</p>";

                mail.Body = emailBody;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    Credentials = new NetworkCredential("palanshika452@gmail.com", "bmws kvak atfx nkwt")
                };

                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                throw new Exception("Error sending email: " + ex.Message);
            }
        }
    }
}
