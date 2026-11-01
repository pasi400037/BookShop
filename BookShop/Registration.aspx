<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="BookShop.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .design{text-align:center; }
        .boldfont{font-weight: bold;}
        .design:hover{color:green;}
        .CardDesign:hover {
            background-color: green;
        }
        .imgdesign {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

         .buttonon {
            display: inline-block;
            padding: 5px 15px;
            font-size: 24px;                             
            border: none;
            border-radius: 15px;
            box-shadow: 0 9px #ff0000;
        }
        .buttonon:hover {background-color: #000000;}
        
    </style>

    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- in registration.cs file "dropdoown1 clear"--%>

    <div class="container ">
        <div class="row ">
            <div class="col-md-8 mx-auto ">
                <div class="card text-white bg-dark">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                
                           <img width="150" class="imgdesign" src="imgs/User.gif" />
                        
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">                                   
                                    <h4 class="design"><i class="fas fa-user-plus"></i> Sign-Up</h4>
                                                        
                            </div>
                        </div>
                        <div class="row">
                            <div class="col ">
                                <hr />
                            </div>
                        </div>
                        
                        
                        


                        <%--name and dob--%>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"  MaxLength="10" placeholder="Full Name" ></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>D-O-B</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Member ID" TextMode="Date"></asp:TextBox>
                                </div>

                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact No</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact-No"  TextMode="Number" MaxLength="10"  ></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Email Id</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email Id" TextMode="email"></asp:TextBox>
                                </div>

                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-4">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
                                        <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
                                        <asp:ListItem Text="Assam" Value="Assam" />
                                        <asp:ListItem Text="Bihar" Value="Bihar" />
                                        <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                                        <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                        <asp:ListItem Text="Goa" Value="Goa" />
                                        <asp:ListItem Text="Gujarat" Value="Gujarat" />
                                        <asp:ListItem Text="Haryana" Value="Haryana" />
                                        <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
                                        <asp:ListItem Text="Jammu and Kashmir" Value="Jammu and Kashmir" />
                                        <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                                        <asp:ListItem Text="Karnataka" Value="Karnataka" />
                                        <asp:ListItem Text="Kerala" Value="Kerala" />
                                        <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
                                        <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                                        <asp:ListItem Text="Manipur" Value="Manipur" />
                                        <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
                                        <asp:ListItem Text="Mizoram" Value="Mizoram" />
                                        <asp:ListItem Text="Nagaland" Value="Nagaland" />
                                        <asp:ListItem Text="Odisha" Value="Odisha" />
                                        <asp:ListItem Text="Punjab" Value="Punjab" />
                                        <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                        <asp:ListItem Text="Sikkim" Value="Sikkim" />
                                        <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
                                        <asp:ListItem Text="Telangana" Value="Telangana" />
                                        <asp:ListItem Text="Tripura" Value="Tripura" />
                                        <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
                                        <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
                                        <asp:ListItem Text="West Bengal" Value="West Bengal" />
                                    </asp:DropDownList>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="City" TextMode="SingleLine"></asp:TextBox>
                                </div>

                            </div>

                            <div class="col-md-4">
                                <label>Pincode</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Pincode" TextMode="number" OnTextChanged="TextBox6_TextChanged"></asp:TextBox>
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Address</label>
                                <div class="form-group">
                                    <asp:TextBox  CssClass="form-control" ID="TextBox7" runat="server" TextMode="MultiLine" placeholder="Enter Your Full Address" Rows="2"></asp:TextBox>
                                </div>

                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <label> <i class="fas fa-user"></i> Username</label>
                                <div class="form-group">
                                   
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Username"></asp:TextBox>
                                </div>

                            </div>


                            <div class="col-md-6">
                                <label><i class="fas fa-lock"></i> Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="form-group boldfont">
                            <asp:Button class="btn  btn-block btn-lg btn-outline-success buttonon" ID="Button1" runat="server" Text="Sign-up" OnClick="Button1_Click"   />
                        </div>
                        <div class="form-group design ">
                            <asp:LinkButton   ID="LinkButton1" runat="server">Sign-In</asp:LinkButton>
                            
                        </div>

                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a><br>
                <br>
            </div>
        </div>
    </div>

</asp:Content>
