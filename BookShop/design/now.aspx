<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="now.aspx.cs" Inherits="BookShop.now" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            text-align: center;
        }

        .auto-style3 {
            padding: 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="card">
                    <div class="card-body">
                        <div class="col-md-2">
                            <div class="row">
                                <div class="col">
                                    <div class="list-group">
                                        <button type="button" class="list-group-item list-group-item-action active">
                                            Cras justo odio
                                        </button>
                                        <button type="button" class="list-group-item list-group-item-action">Dapibus ac facilisis in</button>
                                        <button type="button" class="list-group-item list-group-item-action">Morbi leo risus</button>
                                        <button type="button" class="list-group-item list-group-item-action">Porta ac consectetur ac</button>
                                        <button type="button" class="list-group-item list-group-item-action" disabled>Vestibulum at eros</button>
                                    </div>
                                </div>
                            </div>

                            

                        </div>
                        <div class="col-md-10">                            
                                <asp:DataList ID="DataList1" runat="server" CellPadding="5" CellSpacing="5" DataSourceID="SqlDataSource1" Width="30%" Height="315px" HorizontalAlign="Center" RepeatColumns="3" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <table class="auto-style1 table  table-responsive rounded">
                                            <tr>
                                                <td class="text-center" style="border: 1px solid #000000; border-radius:30px; text-align: center;">
                                                    <asp:Image ID="Image1" CssClass="auto-style3 " runat="server" ImageUrl='<%# Eval("Book_Img") %>' Height="300px" Width="250px" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Book_Name") %>'></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Book_Cost") %>'></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Book_Description") %>'></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="Button1" runat="server" class="btn btn-success" Text="Add to Card" />
                                                    <br />
                                                    </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>

                                </asp:DataList>

                                <br />
                                <br />
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [Admin_Book_Inventry]"></asp:SqlDataSource>

                            
                        </div>

                    </div>
                </div>

            </div>
        </div>

    </form>
</body>
</html>
