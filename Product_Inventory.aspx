<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product_Inventory.aspx.cs" Inherits="E__Commerce_Shopping_Application.Product_Inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Product Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                            <img id="imgview" width="100px" src="Product_Inventory/book1.png" />
                            
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Product ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Product ID"></asp:TextBox>
                               <asp:Button class="  btn btn-primary" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />
                               <%-- <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" ><i class="fas fa-check-circle"></i></asp:LinkButton>--%>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-8">
                        <label>Product Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Product Name"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Fabric type</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                              <asp:ListItem Text=" Denim" Value=" Denim" />
                              <asp:ListItem Text="Printed" Value="Printed" />
                              <asp:ListItem Text="Jacquard" Value="Jacquard" />
                              <asp:ListItem Text="Silk" Value="Silk" />
                              <asp:ListItem Text="Linen" Value="Linen" />
                              <asp:ListItem Text="Leather " Value="Leather " />
                           </asp:DropDownList>
                        </div>
                        <label>Seller Name</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                              <asp:ListItem Text="seller 1" Value="seller 1" />
                              <asp:ListItem Text="seller 2" Value="seller 2" />
                           </asp:DropDownList>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Shipper Name</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList3" runat="server">
                              <asp:ListItem Text="A1" Value="a1" />
                              <asp:ListItem Text="a2" Value="a2" />
                           </asp:DropDownList>
                        </div>
                        <label>Date of Mfg</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Categeory</label>
                        <div class="form-group">
                           <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                              <asp:ListItem Text="T-shirt" Value="T-shirt" />
                              <asp:ListItem Text="Pant" Value="Pant" />
                              <asp:ListItem Text="Trouser" Value="Trouser" />
                              <asp:ListItem Text="Suit" Value="Suit" />                           
                           </asp:ListBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Edition</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Edition"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Price</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Cost(per unit)" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>No Of Product</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Total Availibility" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Actual Stock</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Current Stock</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Current Stock" TextMode="Number" ReadOnly="True" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Total order</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Count" TextMode="Number" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label>Produt Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div><br />
                  <div class="row">
                     <div class="col-4">
                        <asp:Button ID="Button1" class="btn d-grid gap-2 col-8 mx-auto btn-success" runat="server" Text="Add" OnClick="Button1_Click"/>
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button3" class="btn d-grid gap-2 col-8 mx-auto btn-warning" runat="server" Text="Update" OnClick="Button3_Click"/>
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button2" class="btn d-grid gap-2 col-8 mx-auto btn-danger" runat="server" Text="Delete" OnClick="Button2_Click"/>
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
                           <h4>Product Inventory List</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EshoppingConnectionString %>" SelectCommand="SELECT * FROM [Product_Details]"></asp:SqlDataSource>
                          
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Product_id" DataSourceID="SqlDataSource1">
                           <Columns>
                              <asp:BoundField DataField="Product_id" HeaderText="ID" ReadOnly="True" SortExpression="Product_id" >
                                 <ControlStyle Font-Bold="True" />
                                 <ItemStyle Font-Bold="True" />
                              </asp:BoundField>
                              <asp:TemplateField>
                                 <ItemTemplate>
                                    <div class="container-fluid">
                                       <div class="row">
                                          <div class="col-lg-10">
                                             <div class="row">
                                                <div class="col-12">
                                                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("Product_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   <span>Shipper - </span>
                                                   <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("shipper_name") %>'></asp:Label>
                                                   &nbsp;| <span><span>&nbsp;</span>Fabric_type - </span>
                                                   <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("Fabric_type") %>'></asp:Label>
                                                   &nbsp;| 
                                                   <span>
                                                      Categeory -<span>&nbsp;</span>
                                                      <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("Categeory") %>'></asp:Label>
                                                   </span>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Retailer_name -
                                                   <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("Retailer_name") %>'></asp:Label>
                                                   &nbsp;| Mfg Date -
                                                   <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("Mfg_date") %>'></asp:Label>
                                                   &nbsp;| Pages -
                                                   <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("No_of_products") %>'></asp:Label>
                                                   &nbsp;| Edition -
                                                   <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("Edition") %>'></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Cost -
                                                   <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("Price") %>'></asp:Label>
                                                   &nbsp;| Actual Stock -
                                                   <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("actual") %>'></asp:Label>
                                                   &nbsp;| Available Stock -
                                                   <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("current") %>'></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Description -
                                                   <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("Product_descerption") %>'></asp:Label>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="col-lg-2">
                                             <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("Product_img_link") %>' />
                                          </div>
                                       </div>
                                    </div>
                                 </ItemTemplate>
                              </asp:TemplateField>
                           </Columns>
                        </asp:GridView>
                        <hr>
                     </div>
                  </div>
               <%--   <div class="row">
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Product_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="Product_id" HeaderText="Product_id" ReadOnly="True" SortExpression="Product_id" />
                                <asp:BoundField DataField="Product_name" HeaderText="Product_name" SortExpression="Product_name" />
                                <asp:BoundField DataField="Fabric_type" HeaderText="Fabric_type" SortExpression="Fabric_type" />
                                <asp:BoundField DataField="shipper_name" HeaderText="shipper_name" SortExpression="shipper_name" />
                                <asp:BoundField DataField="Retailer_name" HeaderText="Retailer_name" SortExpression="Retailer_name" />
                                <asp:BoundField DataField="Mfg_date" HeaderText="Mfg_date" SortExpression="Mfg_date" />
                                <asp:BoundField DataField="Categeory" HeaderText="Categeory" SortExpression="Categeory" />
                                <asp:BoundField DataField="Edition" HeaderText="Edition" SortExpression="Edition" />
                                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                                <asp:BoundField DataField="No_of_products" HeaderText="No_of_products" SortExpression="No_of_products" />
                                <asp:BoundField DataField="Product_descerption" HeaderText="Product_descerption" SortExpression="Product_descerption" />
                                <asp:BoundField DataField="actual" HeaderText="actual" SortExpression="actual" />
                                <asp:BoundField DataField="current" HeaderText="current" SortExpression="current" />
                                <asp:BoundField DataField="Product_img_link" HeaderText="Product_img_link" SortExpression="Product_img_link" />
                            </Columns>
                         </asp:GridView>
                     </div>
                  </div>--%>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>
