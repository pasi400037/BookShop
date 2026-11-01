using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookShop
{
    public partial class Books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["AddToCart"] = "false";
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DropDownList DropDownList = (DropDownList)(e.Item.FindControl("DropDownList1"));
            Session["addproduct"] = "true";
            Response.Redirect("AddtoCart.aspx?id=" + e.CommandArgument.ToString() + "&Quantity=" + DropDownList.Text);

        }
    }
}