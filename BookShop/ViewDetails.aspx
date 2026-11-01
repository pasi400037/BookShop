<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="BookShop.Books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   
    <style type="text/css">
        .auto-style1 {
            width: 203%;
            height: 409px;
        }
        .auto-style2 {
            text-align: left;
            height: 56px;
        }
        .auto-style3 {
            color: #FF0000;
        }
        .auto-style5 {
            text-align: left;
            height: 40px;
        }
        .auto-style6 {
            text-align: left;
            height: 155px;
        }
        .auto-style7 {
            text-align: left;
            height: 115px;
        }
        .auto-style8 {
            text-align: left;
            height: 56px;
            width: 2px;
        }
        .auto-style9 {
            text-align: left;
            height: 40px;
            width: 2px;
        }
        .auto-style10 {
            text-align: left;
            height: 155px;
            width: 2px;
        }
        .auto-style11 {
            text-align: left;
            height: 115px;
            width: 2px;
        }
        .auto-style13 {
            font-size: large;
        }
        .auto-style14 {
            text-align: left;
            height: 40px;
            font-size: large;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">

                                <asp:DataList ID="DataList1" runat="server" DataKeyField="Book_Id" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand" HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <table class="auto-style1 ">
                                            <tr>
                                                <td rowspan="6" class="text-center">
                                                    <asp:Image ID="Image1" runat="server" CssClass="img-rounded"  ImageUrl='<%# Eval("Book_Img") %>'  height="300" Width="200" />
                                                    <br />
                                                    <br />
                                                    Quantity:<asp:DropDownList ID="DropDownList1" runat="server" Height="20px" Width="39px">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <br />
                                                    <br />
                                                    
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("Book_Id")%>' CommandName="AddToCart" Height="59px" ImageUrl="~/imgs/addc.png" Width="209px" />
                                                    <br />
                                                    <br />
                                                </td>
                                                <td class="auto-style8">
                                                    &nbsp;</td>
                                                <td class="auto-style2">&nbsp;</td>
                                                <td class="auto-style2">
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Black" Text='<%# Eval("Book_Name") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style9">
                                                    &nbsp;</td>
                                                <td class="auto-style5">&nbsp;</td>
                                                <td class="auto-style5"><span class="auto-style3">₹</span><asp:Label ID="Label5" runat="server" ForeColor="Red" Text='<%# Eval("Book_Cost") %>' Font-Size="X-Large"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style9">
                                                    &nbsp;</td>
                                                <td class="auto-style5">&nbsp;</td>
                                                <td class="auto-style14"><span class="auto-style13"><strong>Author:&nbsp;</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("Author_Name") %>' CssClass="auto-style13"></asp:Label>
                                                    <span class="auto-style13">&nbsp;</span></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style10">
                                                    &nbsp;</td>
                                                <td class="auto-style6">&nbsp;</td>
                                                <td class="auto-style6"><span class="auto-style13"><strong>Highlights:</strong>&nbsp;&nbsp;&nbsp;Language:</span><asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("Language") %>' CssClass="auto-style13"></asp:Label>
                                                    <br class="auto-style13" />
                                                    <br class="auto-style13" />
                                                    <span class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span> <span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;" class="auto-style13">&nbsp;Publisher:</span><span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><asp:Label ID="Label7" runat="server" CssClass="auto-style13" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("Publisher_Name") %>'></asp:Label>
                                                    </span><span class="auto-style13" style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                                                    <br />
                                                    <br />
                                                    </span><span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                                                    <span class="auto-style13" style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Edition:</strong></span><asp:Label ID="Label8" runat="server" CssClass="auto-style13" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("Edition") %>'></asp:Label>
                                                    <span class="auto-style13" style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                                                    <br />
                                                    <br />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: rgb(135, 135, 135); font-family: Roboto, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><span class="auto-style13" style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><strong>Publication:</strong> 
                                                    Date:</span></span><span style="color: rgb(135, 135, 135); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><asp:Label ID="Label9" runat="server" CssClass="auto-style13" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text='<%# Eval("Publish_Date") %>'></asp:Label>
                                                    </span><span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                                                    <br class="auto-style13" />
                                                    </span><span class="auto-style13" style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style11">
                                                    &nbsp;</td>
                                                <td class="auto-style7">&nbsp;</td>
                                                <td class="auto-style7"><span class="auto-style13"><strong>Description&nbsp;:</strong></span> <span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                                                    <br />
                                                    &nbsp;<asp:Label ID="Label10" runat="server" Font-Size="Medium" Text='<%# Eval("Book_Description") %>' ViewStateMode="Enabled" Width="650px"></asp:Label>
                                                    </span>
                                                    <br />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style11">&nbsp;</td>
                                                <td class="auto-style7">&nbsp;</td>
                                                <td class="auto-style7">&nbsp;</td>
                                            </tr>
                                        </table>
                                        <br />



                                    </ItemTemplate>
                                </asp:DataList>
                                <br />
                                <br />
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [Admin_Book_Inventry] WHERE ([Book_Id] = @Book_Id)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="Book_Id" QueryStringField="id" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </div>
                        </div>             
                    </div>
                </div>
            </div>
            <br />
        </div>

        
    </div>


</asp:Content>
