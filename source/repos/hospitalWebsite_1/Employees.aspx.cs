using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace hospitalWebsite_1
{
    public partial class Employees : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["staff"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
         if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
           
           using(SqlConnection con=new SqlConnection(cs))
            {
                using(SqlCommand cmd=new SqlCommand("select*from Employee", con))
                {
                   
                    con.Open();
                    SqlDataAdapter da=new SqlDataAdapter(cmd);
                    DataTable dt=new DataTable();
                    da.Fill(dt);
                    gvdata.DataSource = dt;
                    gvdata.DataBind();
                }
            }
        }

        protected void btnsaved_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("insertemp", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

       
                    cmd.Parameters.AddWithValue("@Name", txtname.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtemail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Number", txtnumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@Department", txtdepartment.Text.Trim());
                  

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

         
            BindGridView();

        
            txtname.Text = "";
            txtemail.Text = "";
            txtnumber.Text = "";
            txtdepartment.Text = "";
    

            // Close the modal
            ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseModal", "$('#searchModal').modal('hide');", true);
        }
    }
}