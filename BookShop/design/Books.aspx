<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="BookShop.Admin_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <%--to enable search use jquery--%> 
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });
   </script>

    <style>
        .Textdesign{text-align:center;}
        .auto-style2 {
            font-size: 80%;
            font-weight: 400;
            color: #FF0000;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mx-auto">
        <div class="row">
            <div class="col">
                <div class="card">
                    
                    
                    <div class="card-body">                       
                        <div class="row">

                            <div class="col-3">                              
                                <div class="row">
                                    <div class="col">
                                        <div class="list-group " id="list-tab" role="tablist">
                                            <asp:LinkButton ID="LinkButton1" class="list-group-item list-group-item-action "  runat="server" OnClick="LinkButton1_Click" >All Books</asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton2" class="list-group-item list-group-item-action " runat="server" OnClick="LinkButton2_Click"  >Academic</asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton3" class="list-group-item list-group-item-action " runat="server" OnClick="LinkButton3_Click"  >Action & Adventure</asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton4" class="list-group-item list-group-item-action " runat="server" OnClick="LinkButton4_Click"  >Biographies</asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton5" class="list-group-item list-group-item-action " runat="server" OnClick="LinkButton5_Click"  >Children's Books</asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton6" class="list-group-item list-group-item-action " runat="server" OnClick="LinkButton6_Click"  >Computing & Internet</asp:LinkButton>    
                                            <asp:LinkButton ID="LinkButton7" class="list-group-item list-group-item-action " runat="server" OnClick="LinkButton7_Click"  >Self & Help</asp:LinkButton>
                                        </div>
                                    </div>
                                    
                                </div>
                                                                                           
                            </div>

                            <div class="col-9">
                                <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [Admin_Book_Inventry]"></asp:SqlDataSource>
                            <div class="col">                              
                                <asp:GridView class="table table-striped  table-responsive-lg table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Book_Id" DataSourceID="SqlDataSource1">
                                    <Columns>                                   
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:TemplateField>
                                            <ItemTemplate>                                                 
                                                <div class="container-fluid">                                                  
                                                    <div class="row">                                                       
                                                     <div class="col-lg-10">                                                   
                                                         <div class="row">
                                                             <div class="col-12">
                                                                 Name:<asp:Label ID="Label1" runat="server" Text='<%# Eval("Book_Name") %>' Font-Bold="True" Font-Size="Medium"></asp:Label>
                                                                 <br />
                                                                 <br />
                                                                 Author:<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("Author_Name") %>'></asp:Label>
                                                                 &nbsp;| Publisher:<asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("Publisher_Name") %>'></asp:Label>
                                                                 <br />
                                                                 <br />
                                                                 <span class="auto-style2">₹</span><asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text='<%# Eval("Book_Cost") %>'></asp:Label>
                                                                 &nbsp;<br />
                                                                 <br />
                                                                 <asp:Button ID="Button1" runat="server" Text="Add To Card" />
                                                                 <asp:Button ID="Button2" runat="server" Text="ViewDetails" />
                                                                 <br />
                                                                 <br />
                                                                 <br />
                                                             </div>
                                                         </div>

                                                        
                                                         


                                                     </div> 
                                                        <div class="col-lg-2">
                                                            <asp:Image ID="Image1" runat="server" class="img-fluid " ImageUrl='<%# Eval("Book_Img") %>' />
                                                     </div> 
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <br />
                                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Book_Id" DataSourceID="SqlDataSource2" Height="50px" Width="125px">
                                    <Fields>
                                        <asp:BoundField DataField="Book_Id" HeaderText="Book_Id" ReadOnly="True" SortExpression="Book_Id" />
                                        <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                                        <asp:BoundField DataField="Book_Name" HeaderText="Book_Name" SortExpression="Book_Name" />
                                        <asp:BoundField DataField="Author_Name" HeaderText="Author_Name" SortExpression="Author_Name" />
                                        <asp:BoundField DataField="Publisher_Name" HeaderText="Publisher_Name" SortExpression="Publisher_Name" />
                                        <asp:BoundField DataField="Language" HeaderText="Language" SortExpression="Language" />
                                        <asp:BoundField DataField="Publish_Date" HeaderText="Publish_Date" SortExpression="Publish_Date" />
                                        <asp:BoundField DataField="Edition" HeaderText="Edition" SortExpression="Edition" />
                                        <asp:BoundField DataField="Book_Cost" HeaderText="Book_Cost" SortExpression="Book_Cost" />
                                        <asp:BoundField DataField="Actual_Cost" HeaderText="Actual_Cost" SortExpression="Actual_Cost" />
                                        <asp:BoundField DataField="Current_Stock" HeaderText="Current_Stock" SortExpression="Current_Stock" />
                                        <asp:BoundField DataField="Genres" HeaderText="Genres" SortExpression="Genres" />
                                        <asp:BoundField DataField="Book_Description" HeaderText="Book_Description" SortExpression="Book_Description" />
                                        <asp:BoundField DataField="Book_Img" HeaderText="Book_Img" SortExpression="Book_Img" />
                                    </Fields>
                                </asp:DetailsView>
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [Admin_Book_Inventry] WHERE ([Category] = @Category)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="Category" QueryStringField="cat" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                                <br />
                            </div>
                        </div>
                            </div>
                        </div>

                       


                    </div>
                </div>
                 
            </div>
        </div>
    </div>

    <br />
    <br />
    <br />

</asp:Content>






