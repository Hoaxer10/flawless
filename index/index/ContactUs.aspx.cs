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
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string con = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
            SqlConnection con1 = new SqlConnection(con);
            con1.Open();

            string name = TextBox1.Text;
            string email = TextBox2.Text;
            string sub = TextBox3.Text;
            string msg = TextBox4.Text;

            SqlCommand cmd = new SqlCommand("insert into ContactUs(name,email,subject,message)" + "values(@name,@email,@sub,@msg)", con1);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@sub", sub);
            cmd.Parameters.AddWithValue("@msg", msg);

            cmd.ExecuteNonQuery();
            con1.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertme()", true);
        }
    }
}