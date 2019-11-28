using System;
using System.Collections.Generic;
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

        }

        protected void btnTaoSP_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/admin/img/" + fulImg.FileName);
            string ch = "~/admin/img/" + fulImg.FileName;
            fulImg.SaveAs(path);
            string pathThumb = Server.MapPath("~/admin/img/" + fulThumb.FileName);
            string Thumb = "~/admin/img/" + fulThumb.FileName;
            fulThumb.SaveAs(pathThumb);
            string Name = TenSP.Text;
            string Des = MTa.Text;
            double price = double.Parse(Price.Text);
            double price_promo = double.Parse(Price_promo.Text);
            string unit = Unit.Text;
            double percent_promo = double.Parse(Percent_Promo.Text);
            int rating = Convert.ToInt32(DanhGia.SelectedValue);
            int sold = Convert.ToInt32(Sold.Text);
            double point = double.Parse(Point.Text);
            int type = Convert.ToInt32(drl_loai.SelectedValue);
            int status = Convert.ToInt32(drl_Active.SelectedValue);

            Foods fd = new Foods(Name, Des, price, price_promo, Thumb, ch, unit, percent_promo, rating, sold, point, type, status);
            fd.adFood();
        }
    }
}