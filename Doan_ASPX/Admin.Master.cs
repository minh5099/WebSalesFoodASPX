using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doan_ASPX
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                lblUser.Text = Session["User"].ToString();
            }
        }

        protected void btnLogout_Onclick(object sender, EventArgs e)
        {
            Session.Remove("User");
            Response.Redirect("~/admin/Login.aspx");
        }
    }
}