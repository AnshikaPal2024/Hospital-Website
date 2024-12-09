using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace hospitalWebsite_1
{
    public partial class PatientAppointment : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["staff"].ConnectionString.ToString();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {

            try
            {
                if (string.IsNullOrEmpty(txtfirstname.Text.Trim()) ||
               string.IsNullOrEmpty(txtlastname.Text.Trim()) ||
               string.IsNullOrEmpty(txtphone.Text.Trim()) ||
               string.IsNullOrEmpty(txtemail.Text.Trim()))
                {
                    Response.Write("please fill out of all required fields.");
                    return;
                }

                using (SqlConnection con = new SqlConnection(cs))
                {
                    using (SqlCommand cmd = new SqlCommand("user_appointment", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Action", "insert");
                        cmd.Parameters.AddWithValue("@firstname", txtfirstname.Text);
                        cmd.Parameters.AddWithValue("@lastname", txtlastname.Text);
                        cmd.Parameters.AddWithValue("@dob", datedob.Text);
                        cmd.Parameters.AddWithValue("@gender", ddlgender.Text);
                        cmd.Parameters.AddWithValue("@phone", txtphone.Text);
                        cmd.Parameters.AddWithValue("@email", txtemail.Text);
                        cmd.Parameters.AddWithValue("@appointmentdate", appointmentDate.Text);
                        cmd.Parameters.AddWithValue("@selectdoc", ddldoctor.Text);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        Response.Write("Your Appointment Successfully Booked!");
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write("Error:" + ex.Message);
            }

        }
    }
}