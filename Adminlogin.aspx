<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Adminlogin.aspx.cs" Inherits="E__Commerce_Shopping_Application.Adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-4 mx-auto ">
                <div class="card">
                    <div class="card-body">


                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="Imgs/adminfinal.jpg" />
                                    
                                </center>

                            </div>

                        </div>
                        <div class="row ">
                            <div class="col">
                                <center>
                                 <h3>Admin Login</h3>
                                </center>

                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />

                            </div>

                        </div>

                        <div class="row">
                            <div class="col">
                                <label>AdminId</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="AdminId"></asp:TextBox>

                                </div><br />

                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    
                                </div><br />
                                

                                <div class="form-group d-grid gap-2 ">
                                    <asp:Button class="btn btn-success " ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                                </div><br />

                                




                            </div>

                        </div>


                    </div>
                </div><br /><br />
                
            </div>
        </div>
    </div>

</asp:Content>
