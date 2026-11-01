<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="BookShop.Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .des {
            color: green;
            
            background-color: #ff0000;
        }

        .cal:hover {
            color: orange;
            background-color: #8E44AD;
        }

        .pull-right {
            overflow: hidden;
        }

        .radius {
            border-radius: 5px;
        }

        img {
            margin: auto;
        }
        .link:hover{color:red}
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <section>
        <div class="container mx-auto">
            <div class="row">
                <div class="col-12">

                    <h2 class="font-weight-bold" style="text-align:center;">Top Selling Books </h2>
                    <h5 style="text-align:right;" class="link"><a>View All</a></h5>
                    <div>
                    <div id="carouselExampleControls1" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner img">
                            <div class="carousel-item active">
                                <div class="row ">
                                    <div class="col-3 ">
                                        <img src="home%20book%20img/slider1.jpg" class="d-block w-75 radius " style="border-radius: 5px;" alt="..." />
                                    </div>
                                    <div class="col-3">
                                        <img src="home%20book%20img/slider1.jpg" class="d-block w-75 radius" alt="..." />

                                    </div>
                                    <div class="col-3">
                                        <img src="home%20book%20img/slider1.jpg" class="d-block w-75 radius" alt="..." />

                                    </div>
                                    <div class="col-3 ">
                                        <img src="home%20book%20img/slider1.jpg" class="d-block w-75 radius" alt="..." />

                                    </div>


                                </div>
                            </div>

                            <div class="carousel-item">

                                <div class="row ">
                                    <div class="col-3">
                                        <asp:ImageButton ID="ImageButton1" src="home%20book%20img/slider1.jpg" class="d-block w-75 radius" alt="..." runat="server" />

                                    </div>
                                    <div class="col-3">
                                        <img src="home%20book%20img/slider1.jpg" class="d-block w-75 radius" alt="..." />

                                    </div>
                                    <div class="col-3">
                                        <img src="home%20book%20img/slider1.jpg" class="d-block w-75 radius" alt="..." />

                                    </div>
                                    <div class="col-3">
                                        <img src="home%20book%20img/slider1.jpg" class="d-block w-75 radius" alt="..." />

                                    </div>
                                </div>

                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon des" aria-hidden="true"></span>

                            </a>
                            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                <span class="carousel-control-next-icon des" aria-hidden="true"></span>
                            </a>

                        </div>


                    </div>
                    </div>
                    
                </div>
            </div>

        </div>
    </section>
    <br />



</asp:Content>
