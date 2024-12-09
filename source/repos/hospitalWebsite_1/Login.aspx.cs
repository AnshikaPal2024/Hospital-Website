using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Configuration;
using System.Runtime.Remoting.Messaging;
using System.Diagnostics.Eventing.Reader;

namespace hospitalWebsite_1
{
    public partial class Login : System.Web.UI.Page

    {
        public static string to;
        string cs = ConfigurationManager.ConnectionStrings["staff"].ConnectionString;
        string randomCode;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string email = txtemail.Text.Trim();
            string password = string.Empty;
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("forgotpassword", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
               
                    cmd.Parameters.AddWithValue("@Email", email);
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    if (rd.Read())
                    {

                        password = rd["Password"].ToString();
                        SendPasswordEmail(email, password);
                        lblmsg.Text = "Your password has been Sent your email";
                    }
                    else
                    {
                        lblmsg.Text = "Email not found.";
                    }

                }
            }

        }

        private void SendPasswordEmail(string email, string password)
        {
            try
            {
                using (SmtpClient client = new SmtpClient("smtp.gmail.com", 587))
                {
                    client.EnableSsl = true;
                    client.Credentials = new NetworkCredential("palanshika452@gmail.com", "bmws kvak atfx nkwt");

                    MailMessage message = new MailMessage();
                    message.From = new MailAddress("palanshika452@gmail.com");
                    message.To.Add(email.ToString()); // Ensure email is a string
                    message.Subject = "Your Password";
                    message.Body = "Your password is: " + password;

                    client.Send(message);  // Send the email
                    lblmsg.Text = "Your password has been sent to your email.";
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = "There was an error sending the email: " + ex.Message;

                System.IO.File.AppendAllText(Server.MapPath("~/Logs/errors.txt"), DateTime.Now + " - " + ex.Message + "\n");
            }
        }

        protected void btnotp_Click(object sender, EventArgs e)
        {
            string from = "palanshika452@gmail.com";  // Replace with your email
            string password = "yourpassword";
            string messageBody = "Thank you...";

            string userEmail = email.Text.Trim();  // Get the email entered by the user

            if (string.IsNullOrEmpty(userEmail))
            {
                Response.Write("Please enter a valid email address.");
                return;
            }

            // Proceed to database call to check if the user exists
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("loginpatient", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Email", userEmail);
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();

                    if (rd.Read())
                    {
                        string userType = rd["UserType"].ToString();
                        string foundEmail = rd["Email"].ToString();
                        string userFullname = rd["Fullname"].ToString();

                        if (!string.IsNullOrEmpty(foundEmail))
                        {
                            // Generate a random 6-digit OTP
                            Random rand = new Random();
                            string randomCode = rand.Next(100000, 999999).ToString();
                            Session["OTP"] = randomCode;
                            Session["UserType"] = userType;  // Store user type (Admin or User)
                            Session["UserName"] = userFullname;

                            // Send OTP to the user's email
                            MailMessage message = new MailMessage();
                            message.From = new MailAddress(from);
                            message.To.Add(userEmail);
                            message.Subject = "Your OTP for Login";
                            message.Body = "Your OTP is: " + randomCode;

                            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
                            smtp.EnableSsl = true;
                            smtp.Port = 587;
                            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtp.Credentials = new NetworkCredential("palanshika452@gmail.com", "bmws kvak atfx nkwt");

                            try
                            {
                                smtp.Send(message);
                                Response.Write("OTP sent successfully to " + userEmail);
                            }
                            catch (Exception ex)
                            {
                                Response.Write("Error: " + ex.Message);
                            }
                        }
                        else
                        {
                            Response.Write("Email not found. Please check the email and try again.");
                        }
                    }
                    else
                    {
                        Response.Write("Invalid email.");
                    }
                }
            }
        }



        protected void btnverifyotp_Click1(object sender, EventArgs e)
        {
            string sessionOtp = Session["OTP"] as string;  // Get the OTP from session

            if (sessionOtp == null)
            {
                Response.Write("OTP has expired or was not generated.");
                return;
            }

            string enteredOtp = txtverifyotp.Text.Trim();  // Get the OTP entered by the user

            if (sessionOtp == enteredOtp)
            {

                string userType = Session["UserType"] as string;

                if (string.IsNullOrEmpty(userType))
                {
                    Response.Write("User type is not identified. Please try again.");
                    return;
                }

                if (userType == "Admin")
                {

                    Response.Redirect("Dasboard.aspx");
                }
                else if (userType == "User")
                {

                    Response.Redirect("Hospitalpage.aspx");
                }
                else
                {
                    Response.Write("User type not recognized.");
                }
            }
            else
            {
                // OTP is incorrect
                Response.Write("Incorrect OTP. Please try again.");
            }
        }
    }
}










