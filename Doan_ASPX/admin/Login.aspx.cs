﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Doan_ASPX.HtppCode;

namespace Doan_ASPX.admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void login_Click(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(@"Data Source =DESKTOP-TTJ28QJ\MYSQL; Initial Catalog = Doan_ASPX; Integrated Security = True");
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from[Doan_ASPX].[dbo].[member] where email = '"+ txtEmail.Text +"' and pass = '" + txtPass.Text + "' ",con);
            da.SelectCommand = cmd;
            da.Fill(ds, "member");
            if (ds.Tables[0].Rows.Count > 0)
            {
                string Name = "";
                string getName = "Select username from[Doan_ASPX].[dbo].[member] where email = '" + txtEmail.Text + "'";
                DataTable dt = DataProviders.getDataTable(getName);
                foreach (DataRow row in dt.Rows)
                {
                    Name = row["username"].ToString();
                }
                Session["User"] = Name;
                Response.Redirect("~/admin/Member.aspx");
            }
            else
            {
                lblError.Text = "Sai Tài Khoản Hoặc Mật Khẩu";
            }
        }
    }
}