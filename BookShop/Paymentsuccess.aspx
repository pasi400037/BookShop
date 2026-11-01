<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="Paymentsuccess.aspx.cs" Inherits="BookShop.Paymentsuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        
                        <div class="row">
                            <div class="col">

                                <h3 class="design designone text-center"><i class="fas fa-sign-in-alt "></i>Payment successful</h3>

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
                                  <center>  <img src="imgs/pay.gif" /> </center> 
                                </div>
                                 
                               <center>  <asp:Label ID="Label1" CssClass="text-center" runat="server" ></asp:Label></center>     
                                
                                                                                                                
                                
                               
                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Continue Shopping</a><br>
                <br>
            </div>
        </div>
    </div>



</asp:Content>
