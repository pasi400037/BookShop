<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="Admin-book-Manage.aspx.cs" Inherits="BookShop.Admin_book__config" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--script to show upload image on top of book add --%>
    <script type="text/javascript">       
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
 
                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

     <%--to enable search use jquery--%> 
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });
   </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card text-white bg-dark">
                    <div class="card-body">

                        <%--Tital of container--%>
                        <div class="row">
                            <div class="col">
                                <center>
                           <h3>Book Details</h3>                            
                        </center>
                            </div>
                        </div>

                        <%--Image of Book --%>
                        <div class="row">
                            <div class="col">
                                <center>
                           <img width="110" height="150" id="imgview" src="Book_Invantory/books.png" />
                        </center>
                            </div>
                        </div>

                        <%--Line between containt--%>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <%--book img upload file--%>
                        <div class="row">
                            <div class="col">
                                <asp:FileUpload onchange="readURL(this)" class="form-control"  ID="FileUpload1" runat="server" />
                            </div>
                        </div>


                        <%--ID and Category--%>
                        <div class="row">
                            <div class="col-md-6">
                                <label>book Id</label>
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control"  ID="TextBox1" runat="server" placeholder="book Id" Text="B00"></asp:TextBox>
                                    <asp:Button class="btn btn-success  " ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Category</label>
                                <div class="form-group">
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">                                          
                                            <asp:ListItem Text="Academic" Value="Academic" />
                                            <asp:ListItem Text="Action" Value="Action" />                                           
                                            <asp:ListItem Text="Biographies" Value="Biographies" />
                                            <asp:ListItem Text="Children's" Value="Children's" />
                                            <asp:ListItem Text="Computing" Value="Computing" />                                            
                                            <asp:ListItem Text="Self" Value="Self" />
                                        </asp:DropDownList>
                                    </div>

                                </div>

                            </div>

                        </div>

                        <%--Book-name--%>
                        <div class="row">
                            <div class="col">
                                <label>Book Name</label>
                                <div class="form-group">
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control"  ID="TextBox2" runat="server"></asp:TextBox>
                                        
                                    </div>

                                </div>

                            </div>
                        </div>

                        <%--Authoe and Publisher--%>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Author Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Publisher</label>
                                <div class="form-group">
                                   <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server"></asp:TextBox>
                                </div>
                                </div>
                            </div>
                        </div>

                        <%--Language and Publish Date--%>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Language</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList4" runat="server">
                                        
                                        <asp:ListItem Text="English" Value="English" />
                                        <asp:ListItem Text="Hindi" Value="Hindi" />
                                        <asp:ListItem Text="Marathi" Value="Marathi" />
                                        <asp:ListItem Text="French" Value="French" />
                                        <asp:ListItem Text="German" Value="German" />
                                        <asp:ListItem Text="Urdu" Value="Urdu" />
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Publish Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>
                                    
                                </div>
                            </div>
                        </div>


                        <%--Author,Publisher and actual-atock,currant-stock and geonery--%>
                        <div class="row">

                            <%--Author and Publisher--%>
                            <div class="col-md-4">
                                <label>Edition</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Edition" TextMode="SingleLine"></asp:TextBox>
                                    
                                </div>




                                <label>Bookcost</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Bookcost(PerUnit)" TextMode="number"></asp:TextBox>
                                </div>





                            </div>

                            <%--actual-atock and currant-stock--%>
                            <div class="col-md-4">
                                <label>Actual Stock</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>
                                </div>



                                <label>Current Stock</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Current Stock" TextMode="number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <%--geonery--%>
                            <div class="col-md-4">
                                <label>Geonery</label>
                                <div class="form-group">
                                    <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                                        
                                        <asp:ListItem Text="Action" Value="Action" />
                                        <asp:ListItem Text="Adventure" Value="Adventure" />
                                        <asp:ListItem Text="Comic Book" Value="Comic Book" />
                                        <asp:ListItem Text="Self Help" Value="Self Help" />
                                        <asp:ListItem Text="Motivation" Value="Motivation" />
                                        <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                                        <asp:ListItem Text="Wellness" Value="Wellness" />
                                        <asp:ListItem Text="Crime" Value="Crime" />
                                        <asp:ListItem Text="Drama" Value="Drama" />
                                        <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                        <asp:ListItem Text="Horror" Value="Horror" />
                                        <asp:ListItem Text="Poetry" Value="Poetry" />
                                        <asp:ListItem Text="Personal Development" Value="Personal Development" />
                                        <asp:ListItem Text="Romance" Value="Romance" />
                                        <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                        <asp:ListItem Text="Suspense" Value="Suspense" />
                                        <asp:ListItem Text="Thriller" Value="Thriller" />
                                        <asp:ListItem Text="Art" Value="Art" />
                                        <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                        <asp:ListItem Text="Encyclopedia" Value="Encyclopedia" />
                                        <asp:ListItem Text="Health" Value="Health" />
                                        <asp:ListItem Text="History" Value="History" />
                                        <asp:ListItem Text="Math" Value="Math" />
                                        <asp:ListItem Text="Textbook" Value="Textbook" />
                                        <asp:ListItem Text="Science" Value="Science" />
                                        <asp:ListItem Text="Travel" Value="Travel" />

                                    </asp:ListBox>
                                </div>
                            </div>

                        </div>


                        <%--Address--%>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Book Description</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder=" Book Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>

                            </div>



                        </div>

                        <%--Add and Update and Delete Buttons--%>
                        <div class="row">

                            <div class="col-4 ">
                                <asp:Button class="btn btn-success btn-block  btn-success " ID="Button2" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>

                            <div class="col-4 ">
                                <asp:Button class="btn btn-warning btn-block  btn-success" ID="Button3" runat="server" Text="Update" OnClick="Button3_Click" />
                            </div>

                            <div class="col-4 ">
                                <asp:Button class="btn btn-danger btn-block  btn-success" ID="Button4" runat="server" Text="Deleat" OnClick="Button4_Click" />
                            </div>



                        </div>

                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a><br>
                <br>
            </div>


             <%--Books List Code--%>
            <div class="col-md-6">
                <div class="">
                    <div class="card-body">
                        <%--Tital of container2--%>
                        <div class="row">
                            <div class="col">
                                <center>
                           <h3> Book inventry List</h3> 
                           <hr />
                        </center>
                            </div>
                        </div>

                       
                        

                        <%--List of Book From Database--%>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [Admin_Book_Inventry]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped  table-responsive-lg table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Book_Id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="Book_Id" HeaderText="ID" ReadOnly="True" SortExpression="Book_Id" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                     <div class="col-lg-10">
                                                         <div class="row">
                                                             <div class="col-12">
                                                                 Name:<asp:Label ID="Label1" runat="server" Text='<%# Eval("Book_Name") %>' Font-Bold="True" Font-Size="Medium"></asp:Label>
                                                             </div>
                                                         </div>

                                                         <div class="row">
                                                             <div class="col-12">

                                                                 category:<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("Category") %>'></asp:Label>
                                                                 &nbsp;| Language:<asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("Language") %>'></asp:Label>

                                                             </div>
                                                         </div>

                                                         <div class="row">
                                                             <div class="col-12" style="color: #FF0000; font-size: small; font-weight: normal;">

                                                                 ₹<asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" Text='<%# Eval("Book_Cost") %>' ForeColor="Red"></asp:Label>
                                                                 </div>
                                                         </div>


                                                     </div> 
                                                        <div class="col-lg-2">
                                                            <asp:Image ID="Image1" class="img-fluid p-1" runat="server" ImageUrl='<%# Eval("Book_Img") %>' />
                                                     </div> 
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>


                    </div>
                </div>

            </div>
        </div>
    </div>



</asp:Content>
