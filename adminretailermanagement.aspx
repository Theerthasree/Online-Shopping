<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminretailermanagement.aspx.cs" Inherits="E__Commerce_Shopping_Application.adminretailermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function(){
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
             //$('.table').DataTable();
         });
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Retailer Details</h4>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="Imgs/retailermanagement.jpg" />
                                       
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Retailer ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>Retailer Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Retailer Name"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="password" TextMode="Password"></asp:TextBox>

                                </div>
                            </div>
                        </div><br />

                        <div class="row">
                            <div class="col-6">
                                <asp:Button ID="Button2" class="btn d-grid gap-2 col-8 mx-auto btn-success" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>
                           
                            <div class="col-6">
                                <asp:Button ID="Button4" class="btn d-grid gap-2 col-8 mx-auto btn-danger" runat="server" Text="Delete" OnClick="Button4_Click" />
                            </div>
                        </div>


                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Home</a><br>
                <br>
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">



                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Retailer List</h4>
                                    </center>
                            </div>
                        </div>

                       

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EshoppingConnectionString %>" SelectCommand="SELECT [Retailer_id], [Retailer_name] FROM [Retailer_master]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Retailer_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="Retailer_id" HeaderText="Retailer_id" ReadOnly="True" SortExpression="Retailer_id" />
                                        <asp:BoundField DataField="Retailer_name" HeaderText="Retailer_name" SortExpression="Retailer_name" />
                                    </Columns>
                                    
                                </asp:GridView>
                            </div>
                        </div>


                    </div>
                </div>


            </div>

        </div>
 </div>
</asp:Content>
