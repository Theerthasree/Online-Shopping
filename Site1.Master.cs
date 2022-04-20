using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E__Commerce_Shopping_Application
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    LinkButton1.Visible = true;//user login link button
                    LinkButton2.Visible = true;//sign up link  link button

                    LinkButton3.Visible = false;//logout link button
                    LinkButton7.Visible = false;//hello user link button

                    LinkButton6.Visible = true;//admin login  link  link button

                    LinkButton11.Visible = false;//logout link button
                    LinkButton12.Visible = false;//hello user link button
                    LinkButton8.Visible = false;//logout link button
                    LinkButton9.Visible = false;//hello user link button
                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false;//user login link button
                    LinkButton2.Visible = false;//sign up link  link button

                    LinkButton3.Visible = true;//logout link button
                    LinkButton7.Visible = true;//hello user link button
                    LinkButton7.Text = "Hello "+ Session["username"].ToString(); 

                    LinkButton6.Visible = true;//admin login  link  link button
                    LinkButton5.Visible = true;//hello user link button


                    LinkButton11.Visible = false;//logout link button
                    LinkButton12.Visible = false;//hello user link button
                    LinkButton8.Visible = false;//logout link button
                    LinkButton9.Visible = false;//hello user link button

                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = false;//user login link button
                    LinkButton2.Visible = false;//sign up link  link button

                    LinkButton3.Visible = true;//logout link button
                    LinkButton7.Visible = true;//hello user link button
                    LinkButton7.Text = "Hello Admin" ;

                    LinkButton6.Visible = false;//admin login  link  link button

                    LinkButton5.Visible = true;//hello user link button

                    LinkButton11.Visible = true;//logout link button
                    LinkButton12.Visible = true;//hello user link button
                    LinkButton8.Visible = true;//logout link button
                    LinkButton9.Visible = true;//hello user link button

                }
                else if (Session["role"].Equals("retailer"))
                {
                    LinkButton1.Visible = false;//user login link button
                    LinkButton2.Visible = false;//sign up link  link button

                    LinkButton3.Visible = true;//logout link button
                    LinkButton7.Visible = true;//hello user link button
                    LinkButton7.Text = "Hello"+Session["username"].ToString() ;

                    LinkButton6.Visible = true;//admin login  link  link button

                    LinkButton11.Visible = false;//logout link button
                    LinkButton12.Visible = false;//hello user link button
                    LinkButton8.Visible = true;//logout link button
                    LinkButton9.Visible = false;//hello user link button

                    LinkButton5.Visible = false;//hello user link button

                }

            }
            catch (Exception ex)
            {

            }

        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adminlogin.aspx");

        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("usermanagement.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminretailermanagement.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product_Inventory.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";

            LinkButton1.Visible = true;//user login link button
            LinkButton2.Visible = true;//sign up link  link button

            LinkButton3.Visible = false;//logout link button
            LinkButton7.Visible = false;//hello user link button

            LinkButton6.Visible = true;//admin login  link  link button

            LinkButton11.Visible = false;//logout link button
            LinkButton12.Visible = false;//hello user link button
            LinkButton8.Visible = false;//logout link button
            LinkButton9.Visible = false;//hello user link button
            Response.Redirect("retailerlogin.aspx");
        }

        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            Response.Redirect("retailerlogin.aspx");

        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewproduct.aspx");
        }
    }
}