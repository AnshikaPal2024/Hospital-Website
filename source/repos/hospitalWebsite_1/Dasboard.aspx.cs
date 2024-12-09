using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospitalWebsite_1
{
    public partial class Dasboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                lblUserName.Text = "Welcome," + Session["UserName"].ToString();
            }
            else
            {
                lblUserName.Text = "Welcome,Guest";
            }
        }
    }
}