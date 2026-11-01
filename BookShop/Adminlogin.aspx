<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="Adminlogin.aspx.cs" Inherits="BookShop.Adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>
          .design{text-align:center; }
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
            <div class="card back text-white bg-dark">
                
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <img class="imgdesign" width="150" src="imgs/adminUser.gif" />                                                 
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <h3 class="design">Admin Login</h3>                                                  
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="UserName"></asp:TextBox>
                        </div>
   
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            
                           <asp:Button class="btn  btn-block btn-lg btn-outline-success buttonon " ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
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
