using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospitalWebsite_1
{
    public partial class PatientService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {

            Session.Clear();
            Session.Abandon();
            Response.Redirect("Hospitalpage.aspx");
        }
    }
}