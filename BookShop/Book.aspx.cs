using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookShop
{
    public partial class Booksinlib : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Session["addproduct"] = "false";

            if (Request.QueryString["cat"] != null)

            {
                DataList1.DataSourceID = null;
                DataList1.DataSource = SqlDataSource2cat;
                DataList1.DataBind();
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

            

            if (e.CommandName == "addtocart")
            {
                Session["addproduct"] = "true";
                DropDownList DropDownList = (DropDownList)(e.Item.FindControl("DropDownList1"));
                Session["addproduct"] = "true";
                Response.Redirect("AddtoCart.aspx?id=" + e.CommandArgument.ToString() + "&Quantity=" + DropDownList.Text);
            }
            if (e.CommandName == "viewdetails")
            {
                Response.Redirect("ViewDetails.aspx?id=" + e.CommandArgument.ToString());
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx?cat=Academic");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx?cat=Self");
        }

        protected void books_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx");
        }

        protected void Academic_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx?cat=Academic");
        }

        protected void Action_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx?cat=Action");
        }

        protected void Biographies_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx?cat=Biographies");
        }

        protected void Children_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx?cat=Children's");
        }

        protected void Computing_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx?cat=Computing");
        }

        protected void Self_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx?cat=Self");
        }
    }
}