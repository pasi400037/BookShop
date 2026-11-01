<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="Productinfo.aspx.cs" Inherits="BookShop.Productinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>

        .newrrival
        {
            background:green;
            width:50px;
            color:white;
            font-size:12px;
            font-weight:bold;
        }
        .col-md-7 h2
        {
            color:#555;
        }
        .stars
        {
            height:15px;
        }
        .price
        {
            color:#FE980F;
            font-size:26px;
            font-weight:bold;
            padding-top:20px;
        }
        .cart
        {
            background:#FE980F;
            color:#ffffff;
            font-size:15px;
            margin-left:20px;
        }
        
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
           
            <asp:DataList ID="DataList1" runat="server">
                 <div class="col-md-5">

                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100"  src="<%# Eval("Book_Img") %>" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="<%# Eval("Book_Img") %>" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="<%# Eval("Book_Img") %>" alt="Third slide">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

            </div>
            <div class="col-md-7">
                <p class="newrrival text-center">New</p>
                <h2> Men's T sherts v Neck Bliue Color</h2>
                <p>product code : ISRC12341</p>
                <img src="" class="stars"/>
                <p class="price">USD $14 </p>
                <p><b>Availability:</b> in stock</p>
                <p><b>Condition:</b> NEW</p>
                <p><b>Brand:</b> xyz company</p>
                <asp:Label ID="Label1" runat="server" Text="Quntity:"></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button1" CssClass="btn btn-default cart" runat="server" Text="Add To Cart" />
            </div>
            </asp:DataList>
           
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
    <br />
    <br />
    <br />
    <br />

</asp:Content>
