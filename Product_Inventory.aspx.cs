using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E__Commerce_Shopping_Application
{
    public partial class Product_Inventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAuthorPublisherValues();
            }

            GridView1.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {

            getBookByID();
        }
      

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                Response.Write("<script>alert('Product Already Exists, try some other Product ID');</script>");
            }
            else
            {
                addNewBook();
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            updateBookByID();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteBookByID();
        }

        // user define functions 
        void deleteBookByID()
        {
            if (checkIfBookExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from Product_Details WHERE Product_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Product Deleted Successfully');</script>");

                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }

        void updateBookByID()
        {

            if (checkIfBookExists())
            {
                try
                {

                    int actual_stock = Convert.ToInt32(TextBox4.Text.Trim());
                    int current_stock = Convert.ToInt32(TextBox5.Text.Trim());

                   

                    if (global_actual_stock == actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_issued_books)
                        {
                            Response.Write("<script>alert('Actual Stock value cannot be less than the Issued books');</script>");
                            return;


                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_books;
                            TextBox5.Text = "" + current_stock;

                        }
                    }



                    string genres = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        genres = genres + ListBox1.Items[i] + ",";
                    }
                    genres = genres.Remove(genres.Length - 1);

                    string filepath = "~/Product_Inventory/book1";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("Product_Inventory/" + filename));
                        filepath = "~/Product_Inventory/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE Product_Details set Product_name=@book_name, Fabric_type=@genre, shipper_name=@author_name, Retailer_name=@publisher_name, Mfg_date=@publish_date, Categeory=@language, Edition=@edition, Price=@book_cost, No_of_products=@no_of_pages, Product_descerption=@book_description, actual=@actual_stock, current=@current_stock, Product_img_link=@book_img_link where Product_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);
                    cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publish_date", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_pages", TextBox11.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                    cmd.Parameters.AddWithValue("@book_img_link", filepath);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Book Updated Successfully');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Book ');</script>");
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID');</script>");
            }
        }

        //void getBookByID()
        //{
        //    try
        //    {
        //        SqlConnection con = new SqlConnection(strcon);
        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }
        //        SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id='" + TextBox1.Text.Trim() + "';", con);
        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();
        //        da.Fill(dt);
        //        if (dt.Rows.Count >= 1)
        //        {
        //            TextBox2.Text = dt.Rows[0]["book_name"].ToString();
        //            TextBox3.Text = dt.Rows[0]["publish_date"].ToString();
        //            TextBox9.Text = dt.Rows[0]["edition"].ToString();
        //            TextBox10.Text = dt.Rows[0]["book_cost"].ToString().Trim();
        //            TextBox11.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
        //            TextBox4.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
        //            TextBox5.Text = dt.Rows[0]["current_stock"].ToString().Trim();
        //            TextBox6.Text = dt.Rows[0]["book_description"].ToString();
        //            TextBox7.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));

        //            DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
        //            DropDownList2.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
        //            DropDownList3.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();

        //            ListBox1.ClearSelection();
        //            string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
        //            for (int i = 0; i < genre.Length; i++)
        //            {
        //                for (int j = 0; j < ListBox1.Items.Count; j++)
        //                {
        //                    if (ListBox1.Items[j].ToString() == genre[i])
        //                    {
        //                        ListBox1.Items[j].Selected = true;

        //                    }
        //                }
        //            }

        //            global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
        //            global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
        //            global_issued_books = global_actual_stock - global_current_stock;
        //            global_filepath = dt.Rows[0]["book_img_link"].ToString();

        //        }
        //        else
        //        {
        //            Response.Write("<script>alert('Invalid Book ID');</script>");
        //        }

        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //}


        void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Product_Details WHERE Product_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0]["Product_name"].ToString();
                    TextBox3.Text = dt.Rows[0]["Mfg_date"].ToString();
                    TextBox9.Text = dt.Rows[0]["Edition"].ToString();
                    TextBox10.Text = dt.Rows[0]["Price"].ToString().Trim();
                    TextBox11.Text = dt.Rows[0]["No_of_products"].ToString().Trim();
                    TextBox4.Text = dt.Rows[0]["actual"].ToString().Trim();
                    TextBox5.Text = dt.Rows[0]["current"].ToString().Trim();
                    TextBox6.Text = dt.Rows[0]["Product_descerption"].ToString();
                    TextBox7.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual"].ToString()) - Convert.ToInt32(dt.Rows[0]["current"].ToString()));

                    DropDownList1.SelectedValue = dt.Rows[0]["Categeory"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["shipper_name"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["Retailer_name"].ToString().Trim();

                    ListBox1.ClearSelection();
                    string[] genre = dt.Rows[0]["Fabric_type"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if (ListBox1.Items[j].ToString() == genre[i])
                            {
                                ListBox1.Items[j].Selected = true;

                            }
                        }
                    }

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current"].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["Product_img_link"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Invalid Product ID');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }

        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT Retailer_name from Retailer_master;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "Retailer_name";
                DropDownList3.DataBind();

                cmd = new SqlCommand("SELECT Retailer_name from Retailer_master;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "Retailer_name";
                DropDownList2.DataBind();

            }
            catch (Exception ex)
            {

            }
        }

        

        bool checkIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Product_Details where Product_id='" + TextBox1.Text.Trim() + "' OR Product_name='" + TextBox2.Text.Trim() + "';", con);
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

        void addNewBook()
        {
            try
            {
                string genres = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    genres = genres + ListBox1.Items[i] + ",";
                }
                // genres = Adventure,Self Help,
                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/Product_Inventory/book1.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("Product_Inventory/" + filename));
                filepath = "~/Product_Inventory/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Product_Details(Product_id,Product_name,Fabric_type,shipper_name,Retailer_name,Mfg_date,Categeory,Edition,Price,No_of_products,Product_descerption,actual,current,Product_img_link) values(@Product_id,@Product_name,@genre,@shipper_name,@Retailer_name,@Mfg_date,@Categeory,@edition,@Price,@No_of_products,@book_description,@actual_stock,@current_stock,@Product_img_link)", con);

                cmd.Parameters.AddWithValue("@Product_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Product_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@shipper_name", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Retailer_name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Mfg_date", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Categeory", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@Price", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@No_of_products", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Product_img_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Product added successfully.');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        
    }
}