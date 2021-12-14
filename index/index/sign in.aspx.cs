using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace index
{
    public partial class sign_in : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string con = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
            SqlConnection con1 = new SqlConnection(con);
            con1.Open();


            string checkUser = "select count(*) from customers where emailAddress='" + TextBox2.Text + "'";
            SqlCommand comma = new SqlCommand(checkUser, con1);


            string checkAdmin = "select count(*) from employee where emailAdd='" + TextBox2.Text + "'";
            SqlCommand comma2 = new SqlCommand(checkAdmin, con1);


            int temp2 = Convert.ToInt32(comma2.ExecuteScalar().ToString());
            int temp = Convert.ToInt32(comma.ExecuteScalar().ToString());
            con1.Close();
            if (temp2 == 1)
            {
                con1.Open();
                string checkPassAdmin = "select password from employee where emailAdd='" + TextBox2.Text + "'";
                SqlCommand adminCheck = new SqlCommand(checkPassAdmin, con1);
                string adminPass = adminCheck.ExecuteScalar().ToString();
                string AdminName = TextBox2.Text.Trim();

                if (adminPass == TextBox1.Text)
                {
                    Session["admin"] = AdminName;
                    Response.Redirect("Admin.aspx");
                }
                else
                {
                    Label5.Visible = true;
                    Label4.Visible = false;
                    Label6.Visible = false;
                }
            
            
            }
            if (temp == 1)
            {
                con1.Open();

                string checkPassword = "select password from customers where emailAddress='" + TextBox2.Text + "'";
                SqlCommand PassCheck = new SqlCommand(checkPassword, con1);
                string password = PassCheck.ExecuteScalar().ToString();

                string fullName = TextBox2.Text.Trim();


                if (password == TextBox1.Text)
                {
                    Session["user"] = fullName;
                    Response.Redirect("HomePage.aspx");
                    
                }
                else
                {
                    Label5.Visible = true;
                    Label4.Visible = false;
                    Label6.Visible = false; 
                }
            }
            else
            {
                Label5.Visible = true;
                Label4.Visible = false;
                Label6.Visible = false;

            }
            }
        }
    }
