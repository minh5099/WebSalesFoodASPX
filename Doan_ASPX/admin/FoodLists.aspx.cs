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
            //if (Session["User"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
            //SqlConnection conn = new SqlConnection(@"Data Source=desktop-ttj28qj\mysql;Initial Catalog=Doan_ASPX;Integrated Security=True");
            //string sQuerry = "";
            //if(Request["id"]!=null)
            //{
            //    Response.Redirect("~/admin/Food.aspx?id='"+Request["id"].ToString()+ "'");
            //}
            //sQuerry = "Select * from [Doan_ASPX].[dbo].[food]";
            //DataTable dt = DataProviders.getDataTable(sQuerry);

            //if (Request["key"] != null)
            //{
            //    sQuerry = sQuerry + "where name like '%"+Request["key"].ToString()+"%'";
            //}
            //int so_item_1trang = 3;
            //int sotrang = dt.Rows.Count % so_item_1trang + (dt.Rows.Count % so_item_1trang == 0 ? 0 : 1);
            ////Lấy số  trang với request
            //int page = Request["page"] == null ? 1 : Convert.ToInt32(Request["page"]);

            //int from = (page - 1) * 3;
            //int to = page * 3 - 1;
            //for (int i = dt.Rows.Count;i >= 0;i--)
            //{
            //    if(i<from || i>to)
            //    {
            //        dt.Rows.RemoveAt(i);
            //    }
            //}
            if(!IsPostBack)
            {
                string squerry = "select * from food";
                rpt_ListFood.DataSource = DataProviders.getDataTable(squerry);
                rpt_ListFood.DataBind();
            }

        }
        protected void Search_Click(object sender, EventArgs e)
        {
            //string ten = searchName.Text;
            //string sQuerry = "SELECT * FROM [Doan_ASPX].[dbo].[member] WHERE [username] LIKE  '%" + ten + "%'";
            //DataTable dt = DataProviders.getDataTable(sQuerry);
            Response.Redirect("~/admin/FoodLists.aspx?key=" + searchName.Text);

        }
    } 
}