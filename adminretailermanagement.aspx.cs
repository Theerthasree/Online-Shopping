using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E__Commerce_Shopping_Application
{
    
    public partial class adminretailermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();

        }

        

        // add button click 
        protected void Button2_Click(object sender, EventArgs e)
        {

            if (checkifretailerexists())
            {
                Response.Write("<script>alert('Retailer with this Id already exists. Please select diffrent author Id. ');</script>");
            }
            else
            {
                addNewRetailer();
            }
        }

        //delete button click 
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkifretailerexists())
            {
                deleteAuthor();
            }

            else
            {
                Response.Write("<script>alert('Retailer Does not Exists ');</script>");
            }
        }
        // go button click 
        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        void deleteAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE from Retailer_master Where Retailer_id= '"+TextBox1.Text.Trim() +"'", con);
                cmd.ExecuteNonQuery();
                con.Close();
            
                Response.Write("<script>alert('Retailer Deleted Successfully');</script>");
                clearForm();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
       
        void addNewRetailer()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO Retailer_master(Retailer_id,Retailer_name,password) values(@Retailer_id,@Retailer_name,@password)", con);
                cmd.Parameters.AddWithValue("@Retailer_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Retailer_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox3.Text.Trim());
                

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Retailer added Successfully');</script>");
                clearForm(); 
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkifretailerexists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Retailer_master where Retailer_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        
        void clearForm()
        {
            TextBox1.Text = " ";
            TextBox3.Text = " ";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}