using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Doan_ASPX.HtppCode;

namespace Doan_ASPX.admin
{
    public partial class FoodType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLoai_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/admin/img/" + imgUpload.FileName);
            string ch = "~/admin/img/" + imgUpload.FileName;
            imgUpload.SaveAs(path);

            string tpName = typeName.Text;
            int tpPost = Convert.ToInt32(typePost.SelectedValue);
            int status = Convert.ToInt32(Status.SelectedValue);
            string usName = userName.Text;

            food_types fdType = new food_types(tpName, tpPost, ch, status, usName);

            fdType.addFoodType();
        }
    }
}