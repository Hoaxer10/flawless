using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.Configuration;

namespace index
{
    public partial class Activation : System.Web.UI.Page
    {
        
        string Connection = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
        static string activationCode;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "We send activasion code to your email, Please check your mail.";
            Session["act"] = TextBox2.Text;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Connection);

            Random random = new Random();
            activationCode = random.Next(1001, 9999).ToString();
            SqlCommand chk = new SqlCommand("select * from Activasion where ActEmail='" + Session["act"].ToString() + "' and status = 'Verified'", con);
            SqlCommand comm = new SqlCommand("insert into Activasion(ActEmail,status,activasionCode)" + "values('"+ Session["act"].ToString() + "','Unverified','"+activationCode+"')", con);
            SqlCommand com2 = new SqlCommand("Update  customers set status = 'Unverified' where emailAddress='"+ Session["act"].ToString() + "'", con);
            con.Open();
            if (chk.ExecuteReader().HasRows)
            {
                Label3.Visible = true;
                con.Close();
            }
            else
            {

                con.Close();
                con.Open();
                comm.ExecuteNonQuery();
                com2.ExecuteNonQuery();
                CodeSent();
                TextBox2.Enabled = false;
                TextBox1.Visible = true;
                Button3.Visible = false;
                sendCode.Visible = true;
                Label1.Visible = true;
            }
        }
        private void CodeSent()
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "mail.meshari-ipa.com";
            smtp.Port = 8889;
            smtp.Credentials = new System.Net.NetworkCredential("flawless@meshari-ipa.com", "Sana@2021");
            smtp.EnableSsl = false;
            MailMessage msg = new MailMessage();
            msg.Subject = "Here is your activasion code:";
            msg.Body = "Dear " + Session["act"].ToString() + ", Your activasion code is  " + activationCode + "\n\n\nThanks and regards\nFlawless team.";
            string toAddress = TextBox2.Text;
            msg.To.Add(toAddress);
            string Sender = "Flawless team <flawless@meshari-ipa.com>";
            msg.From = new MailAddress(Sender);
            smtp.Send(msg);
        }

        protected void sendCode_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Connection);

            SqlCommand com2 = new SqlCommand("select * from Activasion where ActEmail='" + Session["act"].ToString() + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = com2;
            DataSet ds = new DataSet();
            sda.Fill(ds);
            if(ds.Tables[0].Rows.Count > 0)
            {
                string activasionCode;
                activasionCode = ds.Tables[0].Rows[0]["activasionCode"].ToString();
                if(activasionCode == TextBox1.Text)
                {
                    statusUpdate();
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertme()", true);
                }
                else
                {
                    Label2.Text = "You have entered invalid code,please check your code again";
                }
            }
            con.Close();
        }
        private void statusUpdate()
        {
            SqlConnection con = new SqlConnection(Connection);
            SqlCommand update = new SqlCommand("Update Activasion set status='Verified' where ActEmail='" + Session["act"].ToString() + "'", con);
            SqlCommand update2 = new SqlCommand("Update customers set status='Verified' where emailAddress='" + Session["act"].ToString() + "'", con);
            con.Open();
            update.ExecuteNonQuery();
            update2.ExecuteNonQuery();
        }
    }
}