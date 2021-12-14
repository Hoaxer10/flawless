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
    public partial class HomePage : System.Web.UI.Page
    {
        int count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            Session["pID1"] = Request.QueryString["id"];
            Image2.Visible = false;
            Image1.Visible = false;
            Panel2.Visible = false;
            string con4 = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
            SqlConnection con12 = new SqlConnection(con4);
            if (con12.State == ConnectionState.Open)
            {
                con12.Close();
            }
            con12.Open();
            SqlCommand cmd3 = con12.CreateCommand();
            SqlCommand cmd4 = con12.CreateCommand();
            cmd3.CommandText = "select * from Messages where receiver='" + Session["user"] + "'and rdm = 'no'";
            cmd4.CommandText = "select * from Bids where owner='" + Session["user"] + "'";
            cmd4.CommandType = CommandType.Text;
            cmd3.CommandType = CommandType.Text;
            cmd3.ExecuteNonQuery();
            cmd4.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd3);
            SqlDataAdapter sda2 = new SqlDataAdapter(cmd4);
            sda.Fill(dt);
            sda2.Fill(dt);
            count = Convert.ToInt32(dt.Rows.Count.ToString());

            not1.Text = count.ToString();
            not2.Text = count.ToString();

            re1.DataSource = dt;
            re1.DataBind();
            re2.DataSource = dt;
            re2.DataBind();
            if (!IsPostBack)
            {

                if (Request.QueryString["category"] != null)
                {
                    DataList1.DataSourceID = null;
                    DataList1.DataSource = SqlDataSource2;
                    DataList1.DataBind();
                }
                if (Session["user"] == null)
                {
                    Panel1.Visible = false;

                }

                //online users
                Label10.Text = Application["onlineUsers"].ToString();
                string con = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
                SqlConnection con1 = new SqlConnection(con);
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter read = new SqlDataAdapter();
                DataSet display = new DataSet();

                if (Session["user"] != null)
                {
                    cmd.CommandText = "select * from customers Where emailAddress='" + Session["user"] + "'";
                    cmd.Connection = con1;
                    read.SelectCommand = cmd;
                    read.Fill(display);
                    Label1.Visible = true;
                    Label1.Text = display.Tables[0].Rows[0]["firstName"].ToString() + " " + display.Tables[0].Rows[0]["lastName"].ToString() + " | " + display.Tables[0].Rows[0]["status"].ToString();
                    HyperLink1.Visible = false;
                    Panel2.Visible = true;
                    Image1.Visible = true;
                                       
                   
                    if (StringComparer.OrdinalIgnoreCase.Equals(display.Tables[0].Rows[0]["status"], "Unverified"))
                    {
                        foreach (DataListItem items in DataList1.Items)
                        {
                            Button buy = items.FindControl("Button2") as Button;

                            cmd.CommandText = "select * from customers where emailAddress='" + Session["user"] + "' and status='Unverified'  ";
                            cmd.Connection = con1;
                            Image2.Visible = true;
                            Image1.Visible = false;
                            Panel3.Visible = false;
                            buy.Enabled = false;
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertme()", true);
                        }
                    }
                }
            }
        }
        public string charNo(object myValues)
        {
            string a;
            a = Convert.ToString(myValues.ToString());
            string b = "";
            if (a.Length >= 15)
            {
                b = a.Substring(0, 15);
                return b.ToString() + "..";
            }
            else
            {
                b = a.ToString();
                return b.ToString();
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {



            //display product signle page
            if (e.CommandName == "viewMore")
            {
                Response.Redirect("productDetails.aspx?id=" + e.CommandArgument.ToString());
            }
            if (e.CommandName == "addtocart")
            {
                Response.Redirect("Order.aspx?id=" + e.CommandArgument.ToString());
            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("sign in.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            DataList1.DataSourceID = null;
            DataList1.DataSource = SqlDataSource1;
            DataList1.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx?category=Electronics");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx?category=Fashion");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx?category=Toys");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx?category=Beauty");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx?category=Skincare");
        }
        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx?category=Cars");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                DataList1.DataSourceID = null;
                DataList1.DataSource = SqlDataSource3;
                DataList1.DataBind();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("sign in.aspx");
            }
        }



        public void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Label id = e.Item.FindControl("Label9") as Label;
            Session["pID12"] = id;
            string con = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
            SqlConnection con1 = new SqlConnection(con);
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter read = new SqlDataAdapter();
            DataSet display = new DataSet();
            if (Session["user"] != null)
            {
                if (!IsPostBack)
                {
                    Button dur = e.Item.FindControl("Button2") as Button;
                    
                    con1.Open();
                    SqlCommand cmd5 = new SqlCommand("select * from products Where ProductID='" + Session["pID12"] + "'", con1);
                    var reader = cmd5.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {

                            var date = DateTime.Today;
                            var DurationDate = DateTime.Compare(Convert.ToDateTime(reader["Duration"]), date);
                            if (DurationDate > 0)
                            {
                                dur.Enabled = true;

                            }
                            else
                            {
                                dur.Enabled = false;
                            }

                        }

                    }


                    con1.Close();
                }
            }
            //shows the winner!//

        }
    }
}