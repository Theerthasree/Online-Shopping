<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Women.aspx.cs" Inherits="E__Commerce_Shopping_Application.Women" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       </br>
    
     <tl class="nav-item dropdown" style="text-decoration: none;">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Women
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
           <li class="dropdown-submenu"   aria-labelledby="navbarDropdownMenuLink">
                <a tabindex="-1" style="text-decoration: none;">TopWear</a>
                
                    <div class="list-group">
                        <a  href="T-shirt.aspx" style="text-decoration: none;">T-shirt</a>
                        <a  href="western.aspx" style="text-decoration: none;">Western dress</a>
                    </div>
                 
                
              </li>

             <li class="dropdown-submenu" aria-labelledby="navbarDropdownMenuLink">
                <a tabindex="-1" style="text-decoration: none;">BottomWear</a>
                
                    <div class="list-group">
                        <a  href="shorts.aspx"style="text-decoration: none;">shorts</a>
                        <a  href="jeans.aspx"style="text-decoration: none;">jeans</a>
                    </div>

              
              </li>
           
          </ul>
        </tl>
      <img class="d-block w-100" src="img/women.jpg" />
</asp:Content>
