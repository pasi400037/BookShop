using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookShop
{
    public partial class masterpage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Session["role"] == null)
                {
                    LinkButton1.Visible = true; // Sign-in Link btn
                    LinkButton2.Visible = true; // Sign-up Link btn

                    LinkButton3.Visible = false; // Logout Link btn
                    LinkButton7.Visible = false; // Hello user Link btn

                    LinkButton4.Visible = true;  // adminLogin linkbtn
                    LinkButton5.Visible = false; // book managemant link btn
                    LinkButton6.Visible = false; // user managmant link btn
                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false; // Sign-in Link btn
                    LinkButton2.Visible = false; // Sign-up Link btn

                    LinkButton3.Visible = true; // Logout Link btn
                    LinkButton7.Visible = true; // Hello user Link btn
                    LinkButton7.Text = "Hello:" + Session["UserName"].ToString();

                    LinkButton4.Visible = true;  // adminLogin linkbtn
                    LinkButton5.Visible = false; // book managemant link btn
                    LinkButton6.Visible = false; // user managmant link btn
                }
                else if (Session["role"].Equals("Admin"))
                {
                    LinkButton1.Visible = false; // Sign-in Link btn
                    LinkButton2.Visible = false; // Sign-up Link btn

                    LinkButton3.Visible = true; // Logout Link btn
                    LinkButton7.Visible = true; // Hello user Link btn
                    LinkButton7.Text = "Hello: Admin";

                    LinkButton4.Visible = false;  // adminLogin linkbtn
                    LinkButton5.Visible = true; // book managemant link btn
                    LinkButton6.Visible = true; // user managmant link btn
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adminlogin.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin-book-Manage.aspx");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin-User-Manage.aspx");
        }


        //Logout btn click
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            try
            {
                Session["UserName"] = "";
                Session["FullName"] = "";
                Session["role"] = "";

                LinkButton1.Visible = true; // Sign-in Link btn
                LinkButton2.Visible = true; // Sign-up Link btn

                LinkButton3.Visible = false; // Logout Link btn
                LinkButton7.Visible = false; // Hello user Link btn

                LinkButton4.Visible = true;  // adminLogin linkbtn
                LinkButton5.Visible = false; // book managemant link btn
                LinkButton6.Visible = false; // user managmant link btn
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        // ctegory button clicks
        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx?cat=Academic");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx?cat=Action");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx?cat=Biographies");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx?cat=Children's");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx?cat=Computing");
        }

        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx?cat=Self");
        }

        protected void LinkButton14_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx");
        }
    }
}