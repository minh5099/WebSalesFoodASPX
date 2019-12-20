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
            string ch = "img/" + imgUpload.FileName;
            imgUpload.SaveAs(path);

            string tpName = typeName.Text;
            int tpPost = Convert.ToInt32(typePost.SelectedValue);
            int status = Convert.ToInt32(Status.SelectedValue);
            string usName = userName.Text;

            food_types fdType = new food_types(tpName, tpPost, ch, status, usName);
          
            if (fdType.addFoodType() == true)
            {
                //lblmodal.Text = "Thêm thành công";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thêm Thành Công')", true);
            }
            else
            {
                //lblmodal.Text = "Thêm Thất Bại";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thêm Thất Bại)", true);
            }
        }
    }
}