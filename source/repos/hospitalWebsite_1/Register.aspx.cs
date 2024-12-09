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
    public partial class Register : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["staff"].ConnectionString.ToString();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtname.Text) ||
               string.IsNullOrWhiteSpace(txtemail.Text) ||
                string.IsNullOrWhiteSpace(txtpassword.Text) ||
                string.IsNullOrEmpty(txtconformpass.Text)) 
  
                {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please fill in all fields.');", true);
                return;
            }

        
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("registerpatient", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
         

                    cmd.Parameters.AddWithValue("@Fullname", txtname.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
                    cmd.Parameters.AddWithValue("@password",txtpassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@confirmpassword",txtconformpass.Text.Trim());




                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();

                        // Clear the fields after successful registration
                        txtname.Text = "";

                        txtemail.Text = "";
                        txtpassword.Text = "";
                        txtconformpass.Text = "";
                    
                     
                        // Optionally show a success message
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Registration successful!');", true);
                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Failed to register: {ex.Message}');", true);
                    }
                }
            }
        }




    }
}