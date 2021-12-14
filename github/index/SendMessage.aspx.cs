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
    public partial class SendMessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = DateTime.Now.ToString();
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
            string receiver = TextBox5.Text;
            string dateMsg = Label1.Text;
            string read = "no";

            SqlCommand cmd = new SqlCommand("insert into Messages(name,sender,receiver,date,subject,message,rdm)" + "values(@name,@send,@rece,@dt,@sub,@mess,@rd)", con1);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@send", email);
            cmd.Parameters.AddWithValue("@sub", sub);
            cmd.Parameters.AddWithValue("@mess", msg);
            cmd.Parameters.AddWithValue("@dt", dateMsg);
            cmd.Parameters.AddWithValue("@rece", receiver);
            cmd.Parameters.AddWithValue("@rd", read);


            cmd.ExecuteNonQuery();
            con1.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertme()", true);
        }
    }
}