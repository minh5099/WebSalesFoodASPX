using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Doan_ASPX.HtppCode;

namespace Doan_ASPX.admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            SqlConnection conn = new SqlConnection(@"Data Source=desktop-ttj28qj\mysql;Initial Catalog=Doan_ASPX;Integrated Security=True");
            string qrry = "SELECT * FROM [dbo].[member]";
            if (Request["username"] != "" && Request["chucnang"] == "update")
            {
                string ten = Request.QueryString["username"];
                string sQuerry = "SELECT * FROM [dbo].[member] where username = '" + ten + "'";
                DataTable dt = DataProviders.getDataTable(sQuerry);
                binding(dt);
                btnUpdate.Visible = true;
                btnRegister.Visible = false;
            }
            if (Request["key"] != null)
            {
                qrry = qrry + " where name like '%" + Request["key"].ToString() + "%'";
            }
            SqlDataAdapter da = new SqlDataAdapter(qrry, conn);
            DataTable dtTable = new DataTable();
            da.Fill(dtTable);
            int so_item_1trang = 10;
            int sotrang = dtTable.Rows.Count / so_item_1trang + (dtTable.Rows.Count % so_item_1trang == 0 ? 0 : 1);
            int page = Request["page"] == null ? 1 : Convert.ToInt32(Request["page"]);

            int from = (page - 1) * 10;
            int to = page * 10 - 1;
            for (int i = dtTable.Rows.Count - 1; i >= 0; i--)
            {
                if (i < from || i > to)
                {
                    dtTable.Rows.RemoveAt(i);
                }
            }
            rptListMember.DataSource = dtTable;
            rptListMember.DataBind();
            DataTable dtPage = new DataTable();
            dtPage.Columns.Add("index");
            dtPage.Columns.Add("active");
            for (int i = 1; i <= sotrang; i++)
            {
                DataRow dr = dtPage.NewRow();
                dr["index"] = i;

                if ((Request["page"] == null && i == 1) || (Request["page"] != null && Convert.ToInt32(Request["page"]) == i))
                    dr["active"] = 1;
                else
                    dr["active"] = 0;
                dtPage.Rows.Add(dr);
            }
            Repeater2.DataSource = dtPage;
            Repeater2.DataBind();
        }

        //Binding Data
        public void binding(DataTable dt)
        {
            foreach(DataRow row in dt.Rows)
            {
                UserName.Text = row["username"].ToString();
                Email.Text = row["email"].ToString();
                Name.Text = row["name"].ToString();
                Phone.Text = row["phone"].ToString();
                Role.SelectedValue = row["role"].ToString();
                Status.SelectedValue = row["status"].ToString();
            }
        }

        protected void LoadingPage()
        {
            string sQuerry = "Select * from [Doan_ASPX].[dbo].[member]";

            DataTable dt = DataProviders.getDataTable(sQuerry);

            //gridTable.DataSource = dt;
            //gridTable.DataBind();
            rptListMember.DataSource = dt;
            rptListMember.DataBind();
        }
      
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string sUsername = UserName.Text;
            string sName = Name.Text;
            string sPass = Password.Text;
            string sPhone = Phone.Text;
            string sEmail = Email.Text;
            int sRole = Convert.ToInt32(Role.SelectedValue);
            int sStatus = Convert.ToInt32(Status.SelectedValue);
            //int Status = (rad.Check?1:0); doi vs RadioButton

            Account acc = new Account(sUsername, sEmail, sPass, sName, sPhone, sRole, sStatus);
            if (acc.adMember() == false)
            {
                lblUs.Visible = true;
            }
            else
            {
                lblUs.Visible = false;
                LoadingPage();
            }
            
            //string sQuerry = "Select* from[Doan_ASPX].[dbo].[member] where username = @username";

            //SqlParameter[] paras = new SqlParameter[1];
            //paras[0] = new SqlParameter("@username", UserName.Text);

            //if (DataProviders.executeScalar(sQuerry, paras) == -1)
            //{
            //    lblUs.Visible = true;
            //}
            //else {
            //    Account acc = new Account(sUsername, sEmail, sName, sPass, sPhone, sRole, sStatus);
            //    acc.adMember();
            //    clearValuer();
            //    lblUs.Visible = false;
            //    LoadingPage();
            //}
        }
        //Hiển Thị Role dạng văn bản với gridview
        //public string DisplayRole(object obj)
        //{
        //    bool rl = Convert.ToBoolean(int.Parse(obj.ToString()));
        //    if (rl) return "Admin";
        //    else return "Client";
        //}

        //public string DisplayStatus(object obj)
        //{
        //    bool rl = Convert.ToBoolean(int.Parse(obj.ToString()));
        //    if (rl) return "Active";
        //    else return "Not Active";
        //}

        protected void gridTable_SelectedIndexChanged(object sender, EventArgs e)
        {
           // btnRegister.Visible = false;
           // btnUpdate.Visible = true;
           // UserName.Enabled = false;
           //// GridViewRow gr = gridTable.SelectedRow;
           // UserName.Text = gr.Cells[1].Text;
           // Email.Text = gr.Cells[2].Text;
           // Password.Text = gr.Cells[3].Text;
           // Name.Text =gr.Cells[4].Text;
           // Phone.Text = gr.Cells[5].Text;
           // Role.SelectedValue = (gr.RowIndex.ToString());
           // Status.SelectedValue = (gr.RowIndex.ToString());
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            UserName.Enabled = true;
            string sUsername = UserName.Text;
            string sName = Name.Text;
            string sPass = Password.Text;
            string sPhone = Phone.Text;
            string sEmail = Email.Text;
            int sRole = Convert.ToInt32(Role.SelectedValue);
            int sStatus = Convert.ToInt32(Status.SelectedValue);
            string sQuerry = "UPDATE [dbo].[member] SET [email] = @email ,[pass] = @pass ,[name] = @name ,[phone] = @phone ,[role] = @role ,[status] = @status WHERE [username] = '" + sUsername + "'";

            SqlParameter[] paras = new SqlParameter[6];
            paras[0] = new SqlParameter("@email", sEmail);
            paras[1] = new SqlParameter("@name", sName);
            paras[2] = new SqlParameter("@pass", sPass);
            paras[3] = new SqlParameter("@phone", sPhone);
            paras[4] = new SqlParameter("@role", sRole);
            paras[5] = new SqlParameter("@status", sStatus);

            DataProviders.executeNonQuery(sQuerry, paras);

            clearValuer();
            btnRegister.Visible = true;
            btnUpdate.Visible = false;
            LoadingPage();
            Response.Redirect("~/admin/Member.aspx");
        }

        public void clearValuer()
        {
            UserName.Text = "";
            Name.Text = ""; 
            Password.Text = ""; 
            Phone.Text = ""; 
            Email.Text = ""; 
            Role.SelectedValue = "1";
            Status.SelectedValue = "1";
        }


        //Method for Deleting Record  
        //protected void DeleteRecord(string value)
        //{
        //    string sQuerry = " DELETE FROM [dbo].[member] WHERE username = '" + value + "'";

        //    DataProviders.excute(sQuerry);
        //}

        //protected void btnDeleteRecord_Click(object sender, EventArgs e)
        //{
        //    foreach (GridViewRow grow in gridTable.Rows)
        //    {
        //        //Searching CheckBox("chkDel") in an individual row of Grid  
        //        CheckBox chkdel = (CheckBox)grow.FindControl("chkDel");
        //        //If CheckBox is checked than delete the record with particular empid  
        //        if (chkdel.Checked)
        //        {
        //            string username = grow.Cells[1].Text;
        //            DeleteRecord(username);
        //        }
        //    }
        //    //Displaying the Data in GridView  
        //    LoadingPage();
        //}

        protected void Search_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Member.aspx?key=" + searchName.Text);
        }

        [WebMethod()]
        public static string delData_onclick(string username)
        {
            string sQuerry = "UPDATE [dbo].[member] SET [status] = @status WHERE [username] = '" + username + "'";
            SqlParameter[] paras = new SqlParameter[1];
            paras[0] = new SqlParameter("@status", "0");
            DataProviders.executeNonQuery(sQuerry, paras);
            return username + " has delete ";
        }
    }
}