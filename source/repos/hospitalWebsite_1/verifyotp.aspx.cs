using System;
using System.Collections.Generic;

using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Collections.Specialized;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;

namespace hospitalWebsite_1
{
    public partial class verifyotp : System.Web.UI.Page
    {
        string randomNumber;
        string cs = ConfigurationManager.ConnectionStrings["staff"].ConnectionString.ToString(); // Connection String from Web.config

        protected void Page_Load(object sender, EventArgs e)
        {
            // Any initialization logic if needed
        }

        // Button to send OTP to the user's phone
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string result;
            string apiKey = "NTIzMjM3NGQzNjc5Nzc0ZTcyNjI1YTQ3NTQ0MTQ1NDg=";  // Example API Key for the SMS service
            string numbers = txtphone.Text;  // User's phone number
            string name = txtname.Text;  // User's name
            Random rnd = new Random();
            randomNumber = rnd.Next(100000, 999999).ToString(); // Generate 6-digit random OTP
            string message = "Hey " + name + ", Your OTP is " + randomNumber;

            // Create the API URL for sending the message
            string url = "https://api.txtlocal.com/send/?apikey=" + apiKey + "&numbers=" + numbers + "&message=" + message + "&sender=OTPSender";

            // Sending the request to the SMS API
            try
            {
                // Create an HTTP request
                HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(url);
                objRequest.Method = "POST";
                objRequest.ContentLength = Encoding.UTF8.GetByteCount(url);
                objRequest.ContentType = "application/x-www-form-urlencoded";

                using (StreamWriter myWriter = new StreamWriter(objRequest.GetRequestStream()))
                {
                    myWriter.Write(url); 
                }

                // Get the response from the API
                HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
                using (StreamReader sr = new StreamReader(objResponse.GetResponseStream()))
                {
                    result = sr.ReadToEnd();
                }

                // Store OTP in the database
                SaveOTPToDatabase(name, numbers, randomNumber);

                Response.Write("OTP Sent Successfully!");
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }

        // Save OTP and phone number to the database
        private void SaveOTPToDatabase(string name, string phoneNumber, string otp)
        {
            // Directly inserting values into the query (not recommended)
            string query = "INSERT INTO VerifyOTP (Name, PhoneNumber, OTP, OTPExpiry) VALUES ('" + name + "', '" + phoneNumber + "', '" + otp + "', '" + DateTime.Now.AddMinutes(5) + "')";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();  // Executes the insert query
                }
                catch (Exception ex)
                {
                    Response.Write("Error while saving OTP: " + ex.Message);
                }
            }
        }


        // Button to verify OTP entered by the user
        protected void btnverify_Click(object sender, EventArgs e)
        {
            string phoneNumber = txtphone.Text;
            string enteredOTP = txtotp.Text;

            if (VerifyOTP(phoneNumber, enteredOTP))
            {
                Response.Write("Login Successful!");
            }
            else
            {
                Response.Write("Wrong OTP or OTP Expired");
            }
        }

        // Verify the OTP from the database
        private bool VerifyOTP(string phoneNumber, string enteredOTP)
        {
            bool isVerified = false;
            string query = "SELECT OTP, OTPExpiry FROM Users WHERE PhoneNumber = @PhoneNumber AND OTP = @OTP";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                cmd.Parameters.AddWithValue("@OTP", enteredOTP);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        reader.Read();
                        DateTime otpExpiry = Convert.ToDateTime(reader["OTPExpiry"]);
                        if (otpExpiry > DateTime.Now)  // Check if OTP has expired
                        {
                            isVerified = true;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Error while verifying OTP: " + ex.Message);
                }
            }

            return isVerified;
        }
    }

}
