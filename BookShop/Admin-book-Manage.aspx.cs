using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace BookShop
{
    public partial class Admin_book__config : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;


        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        //Go Button Click
        protected void Button1_Click(object sender, EventArgs e)
        {
            GetBookByiD();
            
        }
        //add Button Click
        protected void Button2_Click(object sender, EventArgs e)
        {
            // Response.Write("<script>alert('clicked');</script>");
            try
            {
                addbook();
                clearTextBox();
                GridView1.DataBind();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
             
            


        }
        //Update Button Click
        protected void Button3_Click(object sender, EventArgs e)
        {
            UpdateBook();
            GridView1.DataBind();
        }
        //Deleat Button Click
        protected void Button4_Click(object sender, EventArgs e)
        {
            Deleatebook();
            GridView1.DataBind();
        }


        //User Define Function -----------------

        // update book
        void UpdateBook()
        {      
            if (CheckMemberExist())
            {
                try
                {
                    // to select multple gonres
                    String genres = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        genres = genres + ListBox1.Items[i] + ",";
                    }
                    genres = genres.Remove(genres.Length - 1);

                    //image update
                    string filepath = "~/Book_Invantory/books";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if(filename == "" || filepath == null)
                    {
                        filepath = global_filepath;               
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("Book_Invantory/" + filename));
                        filepath = "~/Book_Invantory/" + filename;
                    }


                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("Update Admin_Book_Inventry Set Category=@Category,Book_Name=@Book_Name,Author_Name=@Author_Name,Publisher_Name=@Publisher_Name,Language=@Language,Publish_Date=@Publish_Date,Edition=@Edition,Book_Cost=@Book_Cost,Actual_Cost=@Actual_Cost,Current_Stock=@Current_Stock,Genres=@Genres,Book_Description=@Book_Description,Book_Img=@Book_Img where Book_Id='"+TextBox1.Text.Trim()+"' ",con);

                    
                    cmd.Parameters.AddWithValue("@Category", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Book_Name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Author_Name", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@Publisher_Name", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@Language", DropDownList4.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Publish_Date", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@Edition", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@Book_Cost", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@Actual_Cost", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@Current_Stock", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@Genres", genres);
                    cmd.Parameters.AddWithValue("@Book_Description", TextBox8.Text.Trim());
                    cmd.Parameters.AddWithValue("@Book_Img", filepath);
                    cmd.ExecuteNonQuery();
                    cmd.Clone();
                    Response.Write("<script>alert('book update successful');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        //Check User Exist or Not 
        bool CheckMemberExist()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Admin_Book_Inventry where Book_Id='" + TextBox1.Text.Trim() + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }

        }

        //addbook 
        void addbook()
        {
            try
            {
                //for file upload image
                string filepath = "imgs/books.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("Book_Invantory/" + filename));
                filepath = "~/Book_Invantory/" + filename; 


                // to select multple gonres
                String genres = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    genres = genres + ListBox1.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1); 

                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO Admin_Book_Inventry(Book_Id,Category,Book_Name,Author_Name,Publisher_Name,Language,Publish_Date,Edition,Book_Cost,Actual_Cost,Current_Stock,Genres,Book_Description,Book_Img) values(@Book_Id,@Category,@Book_Name,@Author_Name,@Publisher_Name,@Language,@Publish_Date,@Edition,@Book_Cost,@Actual_Cost,@Current_Stock,@Genres,@Book_Description,@Book_Img)", con);
                cmd.Parameters.AddWithValue("@Book_Id",TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Category", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Book_Name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Author_Name", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@Publisher_Name", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@Language", DropDownList4.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Publish_Date", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Edition", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Book_Cost", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Actual_Cost", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@Current_Stock", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@Genres",genres);
                cmd.Parameters.AddWithValue("@Book_Description", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@Book_Img",filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('book Added');</script>");
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //getnookbyid
        void GetBookByiD()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Admin_Book_Inventry WHERE Book_Id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    
                    DropDownList1.SelectedValue = dt.Rows[0]["Category"].ToString();
                    TextBox2.Text = dt.Rows[0]["Book_Name"].ToString();
                    TextBox9.Text = dt.Rows[0]["Author_Name"].ToString();
                    TextBox10.Text= dt.Rows[0]["Publisher_Name"].ToString();
                    DropDownList4.SelectedValue = dt.Rows[0]["Language"].ToString();
                    TextBox3.Text = dt.Rows[0]["publish_date"].ToString();
                    TextBox4.Text = dt.Rows[0]["Edition"].ToString();
                    TextBox5.Text = dt.Rows[0]["Book_Cost"].ToString();
                    TextBox6.Text = dt.Rows[0]["Actual_Cost"].ToString();
                    TextBox7.Text = dt.Rows[0]["Current_Stock"].ToString();
                    // to select multiple genre
                    ListBox1.ClearSelection(); //to show select after reload
                    string[] genre = dt.Rows[0]["Genres"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if (ListBox1.Items[j].ToString() == genre[i])
                            {
                                ListBox1.Items[j].Selected = true;
                            }

                        }
                    }// end multi select code

                    TextBox8.Text = dt.Rows[0]["Book_Description"].ToString().Trim();
                    //for img
                    global_filepath = dt.Rows[0]["Book_Img"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('invalid book id');</script>");
                }

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // Deleatbook
        void Deleatebook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE from Admin_Book_Inventry where Book_Id='"+TextBox1.Text.Trim()+"'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book Deleated Suucsefull');</script>");
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //clearTexbox
        void clearTextBox()
        {
            try
            {
                TextBox1.Text="";
                DropDownList1.SelectedItem.Value="";
                TextBox9.Text = "";
                TextBox10.Text = "";
                DropDownList4.SelectedItem.Value="";
                TextBox3.Text="";
                TextBox4.Text="";
                TextBox5.Text="";
                TextBox6.Text="";
                TextBox7.Text="";
                
                 TextBox8.Text="";
                 
            }
            catch
            {

            }

        }
    }
}