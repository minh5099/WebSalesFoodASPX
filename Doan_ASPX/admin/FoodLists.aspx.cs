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
            if (IsPostBack == false)
            {
                LoadingPage();
                btnDeleteRecord.Attributes.Add("onclick", "javascript:return Del()");
            }
        }

        protected void LoadingPage()
        {
            string sQuerry = "Select * from [Doan_ASPX].[dbo].[food]";

            DataTable dt = DataProviders.getDataTable(sQuerry);

            gridTable.DataSource = dt;
            gridTable.DataBind();
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

        protected void DeleteRecord(string value)
        {
            string sQuerry = " DELETE FROM [dbo].[member] WHERE username = '" + value + "'";

            DataProviders.excute(sQuerry);
        }

        protected void btnDeleteRecord_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow grow in gridTable.Rows)
            {
                //Searching CheckBox("chkDel") in an individual row of Grid  
                CheckBox chkdel = (CheckBox)grow.FindControl("chkDel");
                //If CheckBox is checked than delete the record with particular empid  
                if (chkdel.Checked)
                {
                    string username = grow.Cells[1].Text;
                    DeleteRecord(username);
                }
            }
            //Displaying the Data in GridView  
            LoadingPage();
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            string ten = searchName.Text;
            string sQuerry = "SELECT * FROM [Doan_ASPX].[dbo].[member] WHERE [username] LIKE  '%" + ten + "%'";
            DataTable dt = DataProviders.getDataTable(sQuerry);
            gridTable.DataSource = dt;
            gridTable.DataBind();
        }
    }
}