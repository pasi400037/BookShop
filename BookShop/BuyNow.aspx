<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="BuyNow.aspx.cs" Inherits="BookShop.BuyNow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">

                                <h3 class="design designone text-center"><i class="fas fa-sign-in-alt "></i>Check Out</h3>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label><i class="fas fa-user"></i>Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Name"></asp:TextBox>
                                </div>

                                <label><i class="fas fa-user"></i>Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Email"></asp:TextBox>
                                </div>

                                <label><i class="fas fa-user"></i>M-Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Mobil-N"></asp:TextBox>
                                </div>

                                <label><i class="fas fa-user"></i>Total ammount</label>
                                <div class="form-group">

                                    <asp:Label ID="Label1" CssClass="form-control text-center" runat="server" Text="Rs" BackColor="White" ForeColor="#CC0000"></asp:Label>
                                </div>

                                <%--Source Code For Hidden field--%>
                                <input type="hidden" runat="server" id="key" name="key" value="gtKFFx" />
                                <input type="hidden" runat="server" id="salt" name="salt" value="eCwWELxi" />
                                <input type="hidden" runat="server" id="hash" name="hash" value="" />
                                <input type="hidden" runat="server" id="txnid" name="txnid" value="" />

                                <div class="form-group boldfont">
                                    <asp:Button class="btn btn-block btn-lg btn-warning buttonon" ID="Button1" runat="server" Text="Pay Now" OnClick="Button1_Click" />
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a><br>
                <br>
            </div>
        </div>
    </div>
</asp:Content>
