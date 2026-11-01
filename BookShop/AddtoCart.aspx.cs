using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace BookShop
{
    public partial class UserCard : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static Boolean availabledesignid = false;
        

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Session["addproduct"].ToString() == "true")
                {
                    Session["addproduct"] = "false";
                    DataTable dt = new DataTable();
                    DataRow dr;
                    dt.Columns.Add("sno");
                    dt.Columns.Add("Book_Id");
                    dt.Columns.Add("Book_Name");
                    dt.Columns.Add("Book_img");
                    dt.Columns.Add("quantity");
                    dt.Columns.Add("Book_Cost");
                    dt.Columns.Add("total");


                    if (Request.QueryString["id"] != null)
                    {
                        if (Session["Buyitems"] == null)
                        {

                            dr = dt.NewRow();

                            SqlConnection scon = new SqlConnection(strcon);
                            String myquery = "select * from Admin_Book_Inventry where Book_Id=" + Request.QueryString["id"];
                            SqlCommand cmd = new SqlCommand();
                            cmd.CommandText = myquery;
                            cmd.Connection = scon;
                            SqlDataAdapter da = new SqlDataAdapter();
                            da.SelectCommand = cmd;
                            DataSet ds = new DataSet();
                            da.Fill(ds);
                            dr["sno"] = 1;
                            dr["Book_Id"] = ds.Tables[0].Rows[0]["Book_Id"].ToString();
                            dr["Book_Name"] = ds.Tables[0].Rows[0]["Book_Name"].ToString();
                            dr["Book_img"] = ds.Tables[0].Rows[0]["Book_img"].ToString();
                            dr["quantity"] = Request.QueryString["quantity"];
                            dr["Book_Cost"] = ds.Tables[0].Rows[0]["Book_Cost"].ToString();
                            Int64 price = Convert.ToInt64(ds.Tables[0].Rows[0]["Book_Cost"].ToString());
                            Int64 quantity = Convert.ToInt64(Request.QueryString["quantity"].ToString());
                            Int64 totalprice = price * quantity;
                            dr["total"] = totalprice;
                            
                            dt.Rows.Add(dr);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            Session["buyitems"] = dt;
                           

                        }
                        else
                        {
                            checkdesignid();
                            if (availabledesignid == true)
                            {
                                Response.Write("Book_Id " + Request.QueryString["id"] + " " + availabledesignid);
                                updatequantity();
                                DataTable dt1;
                                dt1 = (DataTable)Session["buyitems"];
                                GridView1.DataSource = dt1;
                                GridView1.DataBind();
                                availabledesignid = false;
                            }
                            else
                            {
                                dt = (DataTable)Session["buyitems"];
                                int sr;
                                sr = dt.Rows.Count;

                                dr = dt.NewRow();

                                SqlConnection scon = new SqlConnection(strcon);
                                String myquery = "select * from Admin_Book_Inventry where Book_Id=" + Request.QueryString["id"];
                                SqlCommand cmd = new SqlCommand();
                                cmd.CommandText = myquery;
                                cmd.Connection = scon;
                                SqlDataAdapter da = new SqlDataAdapter();
                                da.SelectCommand = cmd;
                                DataSet ds = new DataSet();
                                da.Fill(ds);
                                dr["sno"] = sr + 1;
                                dr["Book_Id"] = ds.Tables[0].Rows[0]["Book_Id"].ToString();
                                dr["Book_Name"] = ds.Tables[0].Rows[0]["Book_Name"].ToString();
                                dr["Book_img"] = ds.Tables[0].Rows[0]["Book_img"].ToString();
                                dr["quantity"] = Request.QueryString["quantity"];
                                dr["Book_Cost"] = ds.Tables[0].Rows[0]["Book_Cost"].ToString();
                                Int64 price = Convert.ToInt64(ds.Tables[0].Rows[0]["Book_Cost"].ToString());
                                Int64 quantity = Convert.ToInt64(Request.QueryString["quantity"].ToString());
                                Int64 totalprice = price * quantity;
                                dr["total"] = totalprice;
                                
                                dt.Rows.Add(dr);
                                GridView1.DataSource = dt;
                                GridView1.DataBind();
                                Session["buyitems"] = dt;
                               

                            }


                        }
                    }


                }
                else
                {
                    DataTable dt;
                    dt = (DataTable)Session["buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        //user define method

        private void calculateSum()
        {
            Int64 grandtotal = 0;
            foreach (GridViewRow row in GridView1.Rows)
            {

                grandtotal = grandtotal + Convert.ToInt64(row.Cells[6].Text); //Where Cells is the column. Just changed the index of cells
            }
            GridView1.FooterRow.Cells[5].Text = "Grand Total";
            GridView1.FooterRow.Cells[6].Text = grandtotal.ToString();
        }


        private void checkdesignid()
        {
            DataTable dt1;
            int designid;
            int querydesignid = Convert.ToInt16(Request.QueryString["id"]);
            dt1 = (DataTable)Session["buyitems"];
            foreach (DataRow row in dt1.Rows)
            {
                designid = Convert.ToInt32(row["Book_Id"].ToString());
                if (designid == querydesignid)
                {
                    availabledesignid = true;
                }
            }
        }


        private void updatequantity()
        {
            DataTable dt1;
            int designid;
            int querydesignid = Convert.ToInt16(Request.QueryString["id"]);
            dt1 = (DataTable)Session["buyitems"];
            foreach (DataRow row in dt1.Rows)
            {
                designid = Convert.ToInt32(row["Book_Id"].ToString());
                if (designid == querydesignid)
                {
                    int newquantity = Convert.ToInt32(row["quantity"].ToString()) + Convert.ToInt32(Request.QueryString["quantity"].ToString());
                    row["quantity"] = newquantity;
                    Int64 price = Convert.ToInt64(row["Book_Cost"].ToString());
                    Int64 totalprice = price * newquantity;
                    row["total"] = totalprice;
                    break;
                }
            }
            Session["buyitems"] = dt1;
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            calculateSum();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyNow.aspx?price=" + GridView1.FooterRow.Cells[6].Text.ToString());
        }

        //end user define

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           
        }
    }
    
}