using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospitalWebsite_1
{
    public partial class Hospitalpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ShowLogin", "showLoginButton();", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ShowUsername", "showUsername('" + Session["UserName"].ToString() + "');", true);
            }
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Hospitalpage.aspx");
        }
    }
}