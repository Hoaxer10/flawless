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
    public partial class sign_up : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            //Clear btn
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            Label1.Visible = false;

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //sign up btn


            string con = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
            SqlConnection con1 = new SqlConnection(con);
            SqlCommand chk = new SqlCommand("select * from Customers where emailAddress = @emailChk", con1);
            chk.Parameters.AddWithValue("@emailChk", TextBox3.Text.Trim());

            string s1 = TextBox1.Text;
            String s2 = TextBox2.Text;
            string s3 = TextBox3.Text;
            String s4 = TextBox4.Text;
            string s5 = TextBox5.Text;
            string st = "Unverified";

            SqlCommand comm = new SqlCommand("insert into customers(firstName,lastName,emailAddress,phoneNumber,password,status)" + " values(@fn,@ln,@em,@ph,@pas,@st)", con1);

            comm.Parameters.AddWithValue("@fn", s1);
            comm.Parameters.AddWithValue("@ln", s2);
            comm.Parameters.AddWithValue("@em", s3);
            comm.Parameters.AddWithValue("@ph", s4);
            comm.Parameters.AddWithValue("@pas", s5);
            comm.Parameters.AddWithValue("@st", st);


            con1.Open();
            if (chk.ExecuteReader().HasRows)
            {
                Label2.Visible = true;
                con1.Close();
            }
            else
            {
                con1.Close();
                con1.Open();
                comm.ExecuteNonQuery();
                Label1.Visible = true;
                con1.Close();
                Response.Redirect("sign in.aspx");
            }
        }
    }
}