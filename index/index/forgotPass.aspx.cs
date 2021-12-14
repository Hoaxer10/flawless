using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Net;
using System.Net.Mail;

namespace index
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string con = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
            SqlConnection con1 = new SqlConnection(con);
            string sqlquery = "select emailAddress,password from customers where emailAddress = @emailAddress";
            SqlCommand cmd = new SqlCommand(sqlquery, con1);
            cmd.Parameters.AddWithValue("@emailAddress", TextBox1.Text);
            con1.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if(reader.Read())
            {
                string userName = reader["emailAddress"].ToString();
                string password = reader["password"].ToString();

                MailMessage message = new MailMessage("flawless@meshari-ipa.com", TextBox1.Text);
                message.Subject = "Your password";
                message.Body = "Dear " + userName + ", your password is: " + password + "\n\n\nThanks and regards\nFlawless team.";
                message.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "mail.meshari-ipa.com";
                smtp.EnableSsl = false;
                NetworkCredential ncc = new NetworkCredential();
                ncc.UserName = "flawless@meshari-ipa.com";
                ncc.Password = "Sana@2021";
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = ncc;
                smtp.Port = 8889;
                smtp.Send(message);
                string sender1 = "Flawless team <flawless@meshari-ipa.com>";
                message.From = new MailAddress(sender1);
                Label1.Text = "your password has been sent to " + TextBox1.Text;
                Label1.ForeColor = Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertme()", true);

            }
            else
            {
                Label1.Text = TextBox1.Text + "- this email is not exist";
                Label1.ForeColor = Color.Red;


            }

        }
    }
}