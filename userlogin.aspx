<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="E__Commerce_Shopping_Application.userlogin" %>
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
                                 
                                    <img width="150px" src="Imgs/userfinal.png" />
                                </center>

                            </div>

                        </div>
                        <div class="row ">
                            <div class="col">
                                <center>
                                 <h3>User Login</h3>
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
                                <label>User Id</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="User ID"></asp:TextBox>

                                </div>

                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    
                                </div><br />
                                

                                <div class="form-group d-grid gap-2 ">
                                    <asp:Button class="btn btn-success " ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                                </div><br />

                                <div class="form-group d-grid gap-2 ">
                                    <input class="btn btn-info" id="Button2" type="button" value="Sign Up" />
                                </div><br />




                            </div>

                        </div>


                    </div>
                </div>
                <a href="Homepage.aspx"><< Back to Home  </a> <br /><br />
            </div>
        </div>
    </div>

</asp:Content>
