<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="Admin-User-Manage.aspx.cs" Inherits="BookShop.Admin__User__Manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--to enable search use jquery--%> 
     <script type="text/javascript">
      $(document).ready(function () {
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
   </script>

    <style>
        .imgdesign {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        .textdesign{text-align:center;}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5 mx-auto">
                <div class="card text-white bg-dark">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">                               
                           <h3 class="textdesign">Member Details</h3>                                
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">                               
                           <img width="120" class="imgdesign" src="imgs/generaluser.png" />                       
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>


                        <%--name and ID--%>
                        <div class="row">
                            <div class="col-md-6">
                                <label>UserName</label>
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="UserName"></asp:TextBox>
                                    <asp:Button class="btn btn-success  " ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full Name" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                                    </div>

                                </div>

                            </div>





                        </div>

                        <div class="row">

                            <div class="col-md-7">
                                <label>DOB</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="DOB" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                                </div>

                            </div>

                            <div class="col-md-5">
                                <label>Contact No</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Contact No" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                                </div>

                            </div>




                        </div>

                        <div class="row">


                            <div class="col-md-7">
                                <label>Email Id</label>
                                <div class="form-group">
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Email Id" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                                    </div>

                                </div>

                            </div>



                            <div class="col-md-5">
                                <label>Pincode</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Pincode" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                                </div>

                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label>Full Postal Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder=" Full Postal Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                                </div>

                            </div>



                        </div>


                        <div class="row">
                            <div class="col-8 mx-auto">
                                <asp:Button class="btn btn-danger btn-block  btn-success" ID="Button2" runat="server" Text="Delet User" OnClick="Button2_Click" />
                            </div>



                        </div>


                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a><br>
                <br>
            </div>

            <div class="col-md-7 mx-auto">
                <div class="row">
                    <div class="col">                       
                           <h3 class="textdesign"> Member List</h3> 
                           <hr />                       
                    </div>
                </div>

                        

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [Member_Registration]"></asp:SqlDataSource>
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <asp:GridView class="table table-striped table-bordered table-responsive-xl" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserName" DataSourceID="SqlDataSource1">
                                            <Columns>
                                                <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName" />
                                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                                <asp:BoundField DataField="Fname" HeaderText="Fname" SortExpression="Fname" />
                                                <asp:BoundField DataField="Contact_No" HeaderText="Contact_No" SortExpression="Contact_No" />
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
