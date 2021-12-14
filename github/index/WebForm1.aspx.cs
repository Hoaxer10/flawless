using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace index
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //online users
            Label3.Text = Application["onlineUsers"].ToString();


            //display user name
            string con = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
            SqlConnection con1 = new SqlConnection(con);
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter read = new SqlDataAdapter();
            DataSet display = new DataSet();

            if(Session["user"] != null )
            {
                cmd.CommandText = "select * from customers Where emailAddress='" + Session["user"] + "'";
                cmd.Connection = con1;
                read.SelectCommand = cmd;
                read.Fill(display);
                Label1.Visible = true;
                Label1.Text = display.Tables[0].Rows[0]["firstName"].ToString() + " " + display.Tables[0].Rows[0]["lastName"].ToString();
                HyperLink1.Visible = false;
                Button1.Visible = true;
                HyperLink2.Visible = true;

            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            //logout button
            Session.Abandon();
            Response.Redirect("sign in.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            //display product signle page
            if(e.CommandName == "viewMore")
            {
                Response.Redirect("productDetails.aspx?id=" + e.CommandArgument.ToString());
            }
        }
    }
}