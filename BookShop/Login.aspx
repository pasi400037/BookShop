<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BookShop.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .design{text-align:center; }
        .boldfont{font-weight: bold;}
        .designone:hover{color:green;}
        .imgdesign{display: block; margin-left: auto; margin-right: auto;}
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

<div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card text-white bg-dark">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        
                           <img class="imgdesign" width="130" src="imgs/User.gif" />
                        
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        
                           <h3 class="design designone"><i class="fas fa-sign-in-alt"></i> Sign-In</h3>
                        
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <label><i class="fas fa-user"></i> UserName</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="UserName"></asp:TextBox>
                        </div>
                        <label><i class="fas fa-lock"></i> Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group boldfont">
                           <asp:Button class="btn btn-block btn-lg btn-outline-secondary buttonon" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                        </div>
                        <div class="form-group design">
                            <asp:LinkButton  ID="LinkButton1" runat="server">Sign-Up</asp:LinkButton>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br><br>
         </div>
      </div>
   </div>

</asp:Content>
