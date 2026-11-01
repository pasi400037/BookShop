<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="BookShop.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        body {
            background: #e2eaef;
        }

        .auto-style1 {
            margin-right: 3px;
        }

        .cal:hover {
            color: orange;
            background-color: #4783F4;
        }

        .calone:hover {
            color: orange;
            background-color: #6A29BFD4;
        }

        .cal2 {
            color: black;
        }

            .cal2:hover {
                color: orange;
            }

        .cal3 {
            color: orange;
        }

            .cal3:hover {
                color: black;
            }

        .cal0 {
            background-color: #6e479b
        }

        /*form product slider*/
         .des {
               
            background-color: orange;
        }
         .radius {
            border-radius: 5px;
        }

        img {
            margin: auto;
        }
        .link:hover{color:red}

        .carousel-control-prev-icon, .carousel-control-next-icon {
    height: 50px;
    width: 50px;
    outline: black;
    background-color: rgba(0, 0, 0, 0.3);
    background-size: 100%, 100%;
    border-radius: 50%;
    border: 1px solid black;
}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

         <%--image slider--%>
    <div class="container-fluid">
        <div class="row heigh">
            <div class="col ">
                <div class="card bg-dark text-white ">
                    <section>

                        <div id="carouselExampleCaptions" class="carousel slide  " data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                                <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="imgs/banner1.jpg" class="d-block w-100 " alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="imgs/banner2.jpg" class="d-block w-100 " alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="imgs/himg3.png" class="d-block w-100 " alt="...">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>

                    </section>

                </div>

            </div>
        </div>
    </div>

    <br />




    <div class="container-fluid">
        <div class="row">
            <div class="col-12">

             
           <%--shping details and about us--%>
                <section>

                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <button type="button" class="btn btn-outline-primary w-100">
                                    <i class="fas fa-shipping-fast fa-lg"></i>
                                    <div>
                                        Free Shipping Item
                                    </div>
                                </button>
                            </div>

                            <div class="col-md-3">
                                <button type="button" class="btn btn-outline-primary w-100">
                                    <i class="fas fa-undo fa-lg"></i>
                                    <div>
                                        Money Back Guarantee

                                    </div>
                                </button>
                            </div>

                            <div class="col-md-3">
                                <button type="button" class="btn btn-outline-primary w-100">
                                    <i class="fas fa-money-bill-wave fa-lg"></i>
                                    <div>
                                        Cash On Delivery
                                    </div>
                                </button>
                            </div>

                            <div class="col-md-3">
                                <button type="button" class="btn btn-outline-primary w-100">
                                    <i class="far fa-life-ring fa-lg"></i>
                                    <div>
                                        24/7 Help & Support  
                                    </div>
                                </button>
                            </div>


                        </div>
                    </div>
                    <br />

                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <h2 style="text-align: center; font-weight: bold">About BS</h2>
                                <hr style="border:"0.5" solid red; width:150px"/>
                                <div class="row">
                                    <div class="col-4">

                                        <div class="row">
                                            <div class="col-12">

                                                <h3 style="color: #d26ad3"><i class="fas fa-child fa-2x"></i> Study Aid</h3>
                                                <p>Books that help make your student life easier and better.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                                            </div>
                                            <br />
                                            <div class="col-12">
                                                <h3 style="color: #699f59"><i class="fas fa-graduation-cap fa-2x"></i> Activity Books</h3>
                                                <p>Sharpen your mind with interesting activities and some mind game.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>

                                            </div>
                                            <br />

                                            <div class="col-12">
                                                <h3 style="color: #ff6a00"><i class="fas fa-arrows-alt fa-2x"></i> Colouring Books</h3>
                                                <p>Escape into a world full of colours and patterns.</p>

                                            </div>
                                            <br />

                                        </div>
                                    </div>

                                    <div class="col-4">

                                        <img src="home%20book%20img/homecenter.png" class="w-100" />
                                    </div>

                                    <div class="col-4">

                                        <div class="row">
                                            <div class="col-12">
                                                <h3 style="color: #e64040"><i class="fas fa-camera fa-2x"></i> Picture Books</h3>
                                                <p>Kick start your child's learning by combining visual and verbal narratives.</p>


                                            </div>
                                            <br />

                                            <div class="col-12">
                                                <h3 style="color: #6e479b"><i class="fas fa-book fa-2x"></i> Story Books</h3>
                                                <p>Treat yourself with fun stories from all around the world.</p>

                                            </div>
                                            <br />

                                            <div class="col-12">
                                                <h3 style="color: #52c2ce"><i class="far fa-file-pdf fa-2x"></i> Poems</h3>
                                                <p>Get your hands on our huge poem collection.</p>

                                            </div>
                                            <br />

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <br />               
                          
               <%--book by category--%>
                <section>
                    <div class="container-fluid  " style="background-color: #4783F4; font-weight: bold; ">
                        <div class="row">
                            <div class="col-12">
                                <br />
                                <h2 style="text-align: center; color: #ffffff">Books by Category <span class="heading-icon"><i class="fa fa-book" style="color: #fc5b4e;"></i></span></h2>

                                <hr />
                                <br />
                                <br />
                                <%--list1--%>
                                <div class="row">
                                    <div class="col-md-4">
                                        <button type="button" class="btn btn-light btn-lg w-100 cal" style="font-weight: bold;">

                                            <div class="cal">
                                                Academic
                                            </div>
                                        </button>
                                    </div>

                                    <div class="col-md-4">
                                        <button type="button" class="btn btn-light btn-lg w-100 cal" style="font-weight: bold;">
                                            <div class="cal">
                                                Action & Adventure

                                            </div>
                                        </button>
                                    </div>

                                    <div class="col-md-4">
                                        <button type="button" class="btn btn-light btn-lg w-100 cal" style="font-weight: bold;">

                                            <div class="cal">
                                                Biographies
                                            </div>
                                        </button>
                                    </div>


                                </div>
                                <br />
                                <br />
                                <br />
                                <%--list2--%>
                                <div class="row">
                                    <div class="col-md-4">
                                        <button type="button" class="btn btn-light btn-lg w-100 cal" style="font-weight: bold;">

                                            <div class="cal">
                                                Children's Books
                                            </div>
                                        </button>
                                    </div>

                                    <div class="col-md-4">
                                        <button type="button" class="btn btn-light btn-lg w-100 cal" style="font-weight: bold;">

                                            <div class="cal">
                                                Computing & Internet

                                            </div>
                                        </button>
                                    </div>

                                    <div class="col-md-4">
                                        <button type="button" class="btn btn-light btn-lg w-100 cal" style="font-weight: bold;">

                                            <div class="cal">
                                                Self Help
                                            </div>
                                        </button>
                                    </div>


                                </div>



                                <img src="home%20book%20img/homei.png" class="w-100" />

                            </div>
                        </div>


                    </div>
                </section>
                <br />

                 <%-- prduct slider--%>
                <section>
        <div class="container mx-auto">
            <div class="row">
                <div class="col-12">

                    <h2 class="font-weight-bold" style="text-align:center;">Best Sellers Books </h2>
                    <h5 style="text-align:right;" class="link"><a>View All</a></h5>
                    <div>
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
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
                <br />

                 <%--top author--%>
                <section>
                    <div class="container-fluid  " style="background-color: #6A29BFD4; font-weight: bold;">
                        <div class="row">
                            <div class="col-12">
                                <br />
                                <br />
                                <h2 style="text-align: center; color: #ffffff">Top Authors </h2>
                                <br />
                                <hr />
                                <br />
                                <br />

                                <div class="row">

                                    <div class="col-6">
                                        <img src="home%20book%20img/homeauthor.png" class="w-100 " />
                                    </div>

                                    <div class="col-6">
                                        <%--list1--%>
                                        <div class="row">
                                            <div class="col-6">
                                                <button type="button" class="btn btn-light btn-lg w-100 calone" style="font-weight: bold;">

                                                    <div class="calone">
                                                        Academic
                                                    </div>
                                                </button>
                                            </div>

                                            <div class="col-6">
                                                <button type="button" class="btn btn-light btn-lg w-100 calone" style="font-weight: bold;">
                                                    <div class="calone">
                                                        Action & Adventure

                                                    </div>
                                                </button>
                                            </div>
                                        </div>
                                        <br />
                                        <br />
                                        <%--list2--%>
                                        <div class="row">
                                            <div class="col-6">
                                                <button type="button" class="btn btn-light btn-lg w-100 calone" style="font-weight: bold;">

                                                    <div class="calone">
                                                        Academic
                                                    </div>
                                                </button>
                                            </div>

                                            <div class="col-6">
                                                <button type="button" class="btn btn-light btn-lg w-100 calone" style="font-weight: bold;">
                                                    <div class="calone">
                                                        Action & Adventure

                                                    </div>
                                                </button>
                                            </div>
                                        </div>
                                        <br />
                                        <br />
                                        <%--list3--%>
                                        <div class="row">
                                            <div class="col-6">
                                                <button type="button" class="btn btn-light btn-lg w-100 calone" style="font-weight: bold;">

                                                    <div class="calone">
                                                        Academic
                                                    </div>
                                                </button>
                                            </div>

                                            <div class="col-6">
                                                <button type="button" class="btn btn-light btn-lg w-100 calone" style="font-weight: bold;">
                                                    <div class="calone">
                                                        Action & Adventure

                                                    </div>
                                                </button>
                                            </div>
                                        </div>
                                        <br />
                                        <br />
                                        <%--list3--%>
                                        <div class="row">
                                            <div class="col-6">
                                                <button type="button" class="btn btn-light btn-lg w-100 calone" style="font-weight: bold;">

                                                    <div class="calone">
                                                        Academic
                                                    </div>
                                                </button>
                                            </div>

                                            <div class="col-6">
                                                <button type="button" class="btn btn-light btn-lg w-100 calone" style="font-weight: bold;">
                                                    <div class="calone">
                                                        Action & Adventure

                                                    </div>
                                                </button>
                                            </div>
                                        </div>



                                    </div>
                                </div>







                            </div>
                        </div>


                    </div>
                </section>
                <br />

               <%-- prduct slider 2--%>
               <section>
        <div class="container mx-auto">
            <div class="row">
                <div class="col-12">

                    <h2 class="font-weight-bold" style="text-align:center;">New Releases </h2>
                    <h5 style="text-align:right;" class="link"><a>View All</a></h5>
                    <div>
                    <div id="carouselExampleFade" class="carousel slide" data-ride="carousel">
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
                                        <asp:ImageButton ID="ImageButton2" src="home%20book%20img/slider1.jpg" class="d-block w-75 radius" alt="..." runat="server" />

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
                            <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon des" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
                                <span class="carousel-control-next-icon  des" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>


                        </div>


                    </div>
                    </div>
                    
                </div>
            </div>

        </div>
    </section>
    <br />
                <br />

                <%--book by age--%>
                <section>
                   
                    <div class="container-fluid" style="background-image: url(home%20book%20img/homeand.jpg); background-repeat: no-repeat; background-size: cover; font-weight: bold;">

                        <div class="row">
                            <div class="col-12">

                                <br />
                                <br />
                                <h2 style="text-align: center; font-weight: bold; color: black">Books by Age Group </h2>
                                <br />
                                <br />
                                <br />
                                <br />
                                <%--list1--%>
                                <div class="row">
                                    <div class="col-md-3">
                                        <button type="button" class="btn  btn-lg w-100 cal0" style="font-weight: bold;">

                                            <div class="btn-group">
                                                <h4 class="cal3">0-2&nbsp;</h4>
                                                <h4 class="cal2">Years</h4>


                                            </div>
                                        </button>
                                    </div>

                                    <div class="col-md-3">
                                        <button type="button" class="btn  btn-lg w-100 cal0" style="font-weight: bold;">
                                            <div class="btn-group">
                                                <h4 class="cal3">2-5&nbsp;</h4>
                                                <h4 class="cal2">Years</h4>


                                            </div>
                                        </button>
                                    </div>

                                    <div class="col-md-3">
                                        <button type="button" class="btn  btn-lg w-100 cal0" style="font-weight: bold;">

                                            <div class="btn-group">
                                                <h4 class="cal3">5-8&nbsp;</h4>
                                                <h4 class="cal2">Years</h4>


                                            </div>
                                        </button>
                                    </div>


                                </div>
                                <br />
                                <br />
                                <br />
                                <%--list2--%>
                                <div class="row">
                                    <div class="col-md-3">
                                        <button type="button" class="btn  btn-lg w-100 cal0" style="font-weight: bold;">

                                            <div class="btn-group">
                                                <h4 class="cal3">8-14&nbsp;</h4>
                                                <h4 class="cal2">Years</h4>


                                            </div>
                                        </button>
                                    </div>

                                    <div class="col-md-3">
                                        <button type="button" class="btn  btn-lg w-100 cal0" style="font-weight: bold;">

                                            <div class="btn-group">
                                                <h4 class="cal3">14-18&nbsp;</h4>
                                                <h4 class="cal2">Years</h4>


                                            </div>
                                        </button>
                                    </div>

                                </div>
                                <br />
                                <br />
                                <br />
                                <%--list2--%>
                                <div class="row">
                                    <div class="col-md-3">
                                        <button type="button" class="btn  btn-lg w-100 cal0" style="font-weight: bold;">

                                            <div class="btn-group">
                                                <h4 class="cal3">19+&nbsp;</h4>
                                                <h4 class="cal2">Years</h4>


                                            </div>
                                        </button>
                                    </div>

                                </div>
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />




                            </div>


                        </div>
                    </div>
                </section>
    
                








            </div>
        </div>
    </div>

</asp:Content>
