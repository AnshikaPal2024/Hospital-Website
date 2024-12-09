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
    public partial class AdminDashboard : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["staff"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAppointment();
            }
        }

        private void BindAppointment()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("user_appointment", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "showappointment"); // We just need the "showappointment" action

                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    gvappointment.DataSource = dt;
                    gvappointment.DataBind();
                }
            }
        }
    }
}