<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="Book.aspx.cs" Inherits="BookShop.Booksinlib" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       
        .auto-style1 {
            color: #FF0000;
        }
       
    </style>
    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                 
                <div class="card-fluid">


                    <div class="card-body">
                        <div class="row">

                            <div class="col-md-3 ">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="list-group h-6 mt-4" id="list-tab" role="tablist">
                                            <asp:LinkButton ID="books" class="list-group-item list-group-item-action  " runat="server" OnClick="books_Click">All Books</asp:LinkButton>
                                            <asp:LinkButton ID="Academic" class="list-group-item list-group-item-action  " runat="server" OnClick="Academic_Click" >Academic</asp:LinkButton>
                                            <asp:LinkButton ID="Action" class="list-group-item list-group-item-action  " runat="server" OnClick="Action_Click">Action & Adventure</asp:LinkButton>
                                            <asp:LinkButton ID="Biographies" class="list-group-item list-group-item-action  " runat="server" OnClick="Biographies_Click">Biographies</asp:LinkButton>
                                            <asp:LinkButton ID="Children" class="list-group-item list-group-item-action  " runat="server" OnClick="Children_Click">Children's Books</asp:LinkButton>
                                            <asp:LinkButton ID="Computing" class="list-group-item list-group-item-action  " runat="server" OnClick="Computing_Click">Computing & Internet</asp:LinkButton>
                                            <asp:LinkButton ID="Self" class="list-group-item list-group-item-action  " runat="server" OnClick="Self_Click" >Self & Help</asp:LinkButton>
                                        </div>
                                    </div>

                                </div>

                            </div>

                            <div class="col-md-9 ">
                                
                                <br />
                                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1all" CellPadding="8" CellSpacing="10" HorizontalAlign="Center" OnItemCommand="DataList1_ItemCommand" RepeatColumns="3" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <div class="container">
                                            <div class="row">
                                               
                                                <table class=" table  table-responsive rounded" aria-haspopup="True" aria-selected="true" style="border:1px solid black; border-style:outset">
                                                    <tr>
                                                        <td class="text-center " aria-haspopup="False" aria-setsize="" >
                                                            <asp:Image ID="Image1" CssClass="auto-style3 " runat="server" ImageUrl='<%# Eval("Book_Img") %>' Height="290px" Width="250px" Style="border-radius:5px" />
                                                            <hr />
                                                            
                                                            <h5>
                                                                <asp:Label ID="Label2" runat="server" ForeColor="Black" Text='<%# Eval("Book_Name") %>' Width="250px"></asp:Label>
                                                            </h5>
                                                           
                                                            <span class="auto-style1">
                                                            <h4><span class="auto-style1"><span class="auto-style4" style="font-family: arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">₹</span></span><asp:Label ID="Label3" runat="server" Text='<%# Eval("Book_Cost") %>'></asp:Label>
                                                            </h4>
                                                            </span>
                                                           <br />
                                                            <h5>
                                                                <asp:DropDownList ID="DropDownList1" runat="server" Height="21px" Width="43px">
                                                                    <asp:ListItem>1</asp:ListItem>
                                                                    <asp:ListItem>2</asp:ListItem>
                                                                    <asp:ListItem>3</asp:ListItem>
                                                                    <asp:ListItem>4</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </h5>
                                                            <br />
                                                            <asp:Button ID="Button1" runat="server" class="btn btn-success" Text="Add to Card" CommandArgument='<%# Eval("Book_Id")%>' CommandName="addtocart" />
                                                            <br />
                                                            <br />
                                                            <asp:Button ID="Button2" runat="server" class="btn btn-success" CommandArgument='<%# Eval("Book_Id")%>' CommandName="viewdetails" Text="View Details" />
                                                            <br />
                                                            
                                                        </td>
                                                    </tr>
                                                </table>

                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                                <br />
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource1all" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [Admin_Book_Inventry]"></asp:SqlDataSource>
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource2cat" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [Admin_Book_Inventry] WHERE ([Category] = @Category)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="Category" QueryStringField="cat" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />

                            </div>
                        </div>




                    </div>
                </div>

            </div>





        </div>
    </div>

</asp:Content>
