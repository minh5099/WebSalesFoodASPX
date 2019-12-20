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
    public partial class Food : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["User"] == null)
            //{
            //    Response.Redirect("~/admin/Login.aspx");
            //}
            if (Request["id"] != null)
            {
                string sQuerry = "SELECT * FROM [dbo].[member] where username = '" + Request["id"] + "'";
                DataTable dt = DataProviders.getDataTable(sQuerry);
                binding(dt);
                btnTaoSP.Visible = false;
                btnUpdate.Visible = true;
            }
            if(!IsPostBack)
            {
                bindingData();
            }
        }

        //Binding dữ liệu trong database
        private void bindingData()
        {
            string squery = "select * from food_type";
            SqlDataAdapter da = DataProviders.getDa(squery);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ds.Tables[0].Columns.Add("type", typeof(string), "type_name");
            drl_loai.DataValueField = "type_id";
            drl_loai.DataTextField = "type";
            drl_loai.DataSource = ds;
            drl_loai.DataBind();
        }

        //Phân Trang
        private void pagination()
        {

        }

        public void binding(DataTable dt)
        {
            foreach (DataRow row in dt.Rows)
            {
                txtTenSP.Text = row["name"].ToString();
            }
        }

        protected void btnTaoSP_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/admin/img/" + fulImg.FileName);
            string ch = "img/" + fulImg.FileName;
            fulImg.SaveAs(path);
            string pathThumb = Server.MapPath("~/admin/img/" + fulThumb.FileName);
            string Thumb = "img/" + fulThumb.FileName;
            fulThumb.SaveAs(pathThumb);
            string Name = txtTenSP.Text;
            string Des = MTa.Text;
            //decimal price = Convert.ToDecimal(txtPrice.Text);
            //decimal price_promo = Convert.ToDecimal(txtPrice_promo.Text);
            int price = Convert.ToInt32(txtPrice.Text);
            int price_promo = Convert.ToInt32(txtPrice_promo.Text);
            string unit = txtUnit.Text;
            //decimal percent_promo = Convert.ToDecimal(txtPercent_Promo.Text);
            int percent_promo = Convert.ToInt32(txtPercent_Promo.Text);
            int rating = Convert.ToInt32(DanhGia.SelectedValue);
            int sold = int.Parse(txtSold.Text);
            //decimal point = Convert.ToDecimal(txtPoint.Text);
            int point = Convert.ToInt32(txtPoint.Text);
            int type = Convert.ToInt32(drl_loai.SelectedValue);
            int status = Convert.ToInt32(drl_Active.SelectedValue);

            food fd = new food(Name, Des, price, price_promo, Thumb, ch, unit, percent_promo, rating, sold, point, type, status);
            if(fd.addSanPham() == true)
            {
                //lblmodal.Text = "Thêm thành công";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thêm Thành Công')", true);
            }
            else
            {
                //lblmodal.Text = "Thêm Thất Bại";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thêm Thất Bại')", true);
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            btnTaoSP.Visible = true;
            btnUpdate.Visible = false;
        }
    }
}