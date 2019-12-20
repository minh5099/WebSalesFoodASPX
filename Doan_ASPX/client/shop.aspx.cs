using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Doan_ASPX.HtppCode;

namespace Doan_ASPX.client
{
    public partial class shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                showProduct();
            }
        }
        
        //Get Data Show Product
        private void showProduct()
        {
            string squery = "";
            if (Request["category"] == null)
            {
                hplAll.Attributes.Add("class", "active");
                squery = "select * from food";
            }
            else
            {
                string category = Request["category"].ToString();
                switch (category)
                {
                    case "25":
                        {
                            hplVegetables.Attributes.Add("class", "active");
                            squery = "select * from food where type = '" + Request["category"].ToString() + "'";
                        }
                        break;
                    case "5":
                        {
                            hplFruits.Attributes.Add("class", "active");
                            squery = "select * from food where type = '" + Request["category"].ToString() + "'";
                        }
                        break;
                    case "8":
                        {
                            hplJuice.Attributes.Add("class", "active");
                            squery = "select * from food where type = '" + Request["category"].ToString() + "'";
                        }
                        break;
                    case "7":
                        {
                            hpltDried.Attributes.Add("class", "active");
                            squery = "select * from food where type = '" + Request["category"].ToString() + "'";
                        }
                        break;
                }
            }
            DataTable dt = DataProviders.getDataTable(squery);
            rptProduct.DataSource = dt;
            rptProduct.DataBind();
        }
    }
}