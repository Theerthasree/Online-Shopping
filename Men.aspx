<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Men.aspx.cs" Inherits="E__Commerce_Shopping_Application.Men" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     </br>
    
     <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Men
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
           <li class="dropdown-submenu">
                <a tabindex="-1" href="#">TopWear</a>
                <ul class="dropdown-menu">
                  <li><a  href="shirtM.aspx">Formal-shirt</a></li>
                  <li><a  href="Casual.aspx">Causal-Shirt</a></li>
                   
                </ul>
              </li>

             <li class="dropdown-submenu">
                <a tabindex="-1" href="#">BottomWear</a>
                <ul class="dropdown-menu">
                  <li><a tabindex="-1" href="JeanM.aspx">Jeans</a></li>
                  <li><a tabindex="-1" href="formalM.aspx">Formal-pant</a></li>
                   
                </ul>
              </li>
           
          </ul>
        </li>
      <img class="d-block w-100" src="img/men11.jpg" />

</asp:Content>
