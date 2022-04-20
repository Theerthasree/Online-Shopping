<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="imageview.aspx.cs" Inherits="E__Commerce_Shopping_Application.imageview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="col-md-5">
        <div style="max-width" class=" tumbnail">
            <div>
                <img width="150px" src="img/dress1.jpg" />
            </div>
        </div>
        <div class ="col-md-5">
            <p class ="pronameview">H&M dress wide variety avaiable

            </p>
            <span class ="proOgprice"> 1000Rs</span>
            <span class="propricediscount">(210 off)</span>
        </div>
    </div>
   <div class="divDet1">
       <h5 class="">Size</h5>
       <div>

           <asp:RadioButtonList ID="RadioButtonList1" runat="server">
               <asp:ListItem value="S" text="S" > </asp:ListItem>
                <asp:ListItem value="M" text="M" > </asp:ListItem>
                <asp:ListItem value="L" text="L"  ></asp:ListItem>
                <asp:ListItem value="Xl" text="XL" > </asp:ListItem>
           </asp:RadioButtonList>
           <div class="divDet1">
               <asp:Button ID="Button1" runat="server" Text="add to cart" />

           </div>
           <div class="divDet1">
              <p class ="product Quality"> <b>PRODUCT QUALITY</b>
                  <h5>100% cotton washable in washing machine </h5>


            </p>
           </div>
          
     
   </div>
</asp:Content>
