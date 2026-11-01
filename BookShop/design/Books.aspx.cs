using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookShop
{
    public partial class Admin_home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["cat"] != null)

            {
                GridView1.DataSourceID = null;
                GridView1.DataSource = SqlDataSource2;
                GridView1.DataBind();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            GridView1.DataSourceID = null;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Books.aspx?cat=Academic");
            
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Books.aspx?cat=Action & Adventure");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Books.aspx?cat=Biographies");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Books.aspx?cat=Children's");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Books.aspx?cat=Computing");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("Books.aspx?cat=Self");
        }



        //View details click 
        
    }
}