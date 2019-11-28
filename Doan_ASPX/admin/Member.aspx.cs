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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Login"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
            if(IsPostBack == false)
            {
                LoadingPage();
                btnDeleteRecord.Attributes.Add("onclick", "javascript:return Del()");
            }

        }

        protected void LoadingPage()
        {
            string sQuerry = "Select * from [Doan_ASPX].[dbo].[member]";

            DataTable dt = DataProviders.getDataTable(sQuerry);

            gridTable.DataSource = dt;
            gridTable.DataBind();
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

            //SqlConnection con = new SqlConnection(@"Data Source =DESKTOP-TTJ28QJ\MYSQL; Initial Catalog = Doan_ASPX; Integrated Security = True");
            //con.Open();

            //SqlCommand cmd = new SqlCommand("Select * from [Doan_ASPX].[dbo].[member] where username = @username", con);
            //cmd.Parameters.AddWithValue("@username", UserName.Text);
            //SqlDataReader rd = cmd.ExecuteReader();
            //if (rd.HasRows)
            //{
            //    lblUs.Visible = true;
            //}
            //else
            //{   
            //    lblUs.Visible = false;
            //    Account acc = new Account(sUsername, sEmail, sName, sPass, sPhone, sRole, sStatus);
            //    acc.adMember();
            //}

            string sQuerry = "Select* from[Doan_ASPX].[dbo].[member] where username = @username";

            SqlParameter[] paras = new SqlParameter[1];
            paras[0] = new SqlParameter("@username", UserName.Text);

            if (DataProviders.executeScalar(sQuerry, paras) == -1)
            {
                lblUs.Visible = false;
                Account acc = new Account(sUsername, sEmail, sName, sPass, sPhone, sRole, sStatus);
                acc.adMember();
                clearValuer();
            }
            else {
                lblUs.Visible = true;
            }

            LoadingPage();

        }
        //Hiển Thị Role
        public string DisplayRole(object obj)
        {
            bool rl = Convert.ToBoolean(int.Parse(obj.ToString()));
            if (rl) return "Admin";
            else return "Client";
        }

        public string DisplayStatus(object obj)
        {
            bool rl = Convert.ToBoolean(int.Parse(obj.ToString()));
            if (rl) return "Active";
            else return "Not Active";
        }

        protected void gridTable_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnRegister.Visible = false;
            btnUpdate.Visible = true;
            UserName.Enabled = true;
            GridViewRow gr = gridTable.SelectedRow;
            UserName.Text = gr.Cells[0].Text;
            Email.Text = gr.Cells[1].Text;
            Password.Text = gr.Cells[2].Text;
            Name.Text =gr.Cells[3].Text;
            Phone.Text = gr.Cells[4].Text;  
            Role.SelectedValue = (gr.Cells[5].Text);
            Status.SelectedValue = (gr.Cells[6].Text);
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            string sUsername = UserName.Text;
            string sName = Name.Text;
            string sPass = Password.Text;
            string sPhone = Phone.Text;
            string sEmail = Email.Text;
            int sRole = Convert.ToInt32(Role.SelectedValue);
            int sStatus = Convert.ToInt32(Status.SelectedValue);
            Account acc = new Account(sUsername, sEmail, sName, sPass, sPhone, sRole, sStatus);
            acc.adMember();
            clearValuer();
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
            string sQuerry = "SELECT * FROM [Doan_ASPX].[dbo].[member] WHERE [username] LIKE  '%" +ten+"%'";
            DataTable dt = DataProviders.getDataTable(sQuerry);
            gridTable.DataSource = dt;
            gridTable.DataBind();
        }
    }
}