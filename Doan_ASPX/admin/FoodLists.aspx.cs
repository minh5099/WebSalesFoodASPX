using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Doan_ASPX.HtppCode;

namespace Doan_ASPX.admin
{
    public partial class FoodLists : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (IsPostBack == false)
            {
                LoadingPage();

            }
        }
        protected void LoadingPage()
        {
            string sQuerry = "Select * from [Doan_ASPX].[dbo].[food]";

            DataTable dt = DataProviders.getDataTable(sQuerry);


        }

        public string DisplayStatus(object obj)
        {
            bool rl = Convert.ToBoolean(int.Parse(obj.ToString()));
            if (rl) return "Active";
            else return "Not Active";
        }

        public void clearValuer()
        {

        }

        protected void Search_Click(object sender, EventArgs e)
        {
            string ten = searchName.Text;
            string sQuerry = "SELECT * FROM [Doan_ASPX].[dbo].[member] WHERE [username] LIKE  '%" + ten + "%'";
            DataTable dt = DataProviders.getDataTable(sQuerry);

        }
    } 
}