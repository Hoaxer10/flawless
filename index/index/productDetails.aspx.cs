using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;
using System.Net;



namespace index
{
    public partial class productDetails : System.Web.UI.Page
    {
        public void Page_Load(object sender, EventArgs e)
        {
            Image2.Visible = false;
            Image1.Visible = false;
            Label5.Text = DateTime.Now.ToShortDateString();

            Session["pID1"] = Request.QueryString["id"];

            if (!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    Panel2.Visible = false;
                }


                string con = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
                SqlConnection con1 = new SqlConnection(con);
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter read4 = new SqlDataAdapter();
                DataSet display4 = new DataSet();

                if (Session["user"] != null)
                {
                    cmd.CommandText = "select * from customers Where emailAddress='" + Session["user"] + "'";
                    cmd.Connection = con1;
                    read4.SelectCommand = cmd;
                    read4.Fill(display4);
                    Label1.Visible = true;
                    Label1.Text = display4.Tables[0].Rows[0]["firstName"].ToString() + " " + display4.Tables[0].Rows[0]["lastName"].ToString() + " | " + display4.Tables[0].Rows[0]["status"].ToString();
                    HyperLink1.Visible = false;
                    Panel2.Visible = true;
                    Image1.Visible = true;


                    if (StringComparer.OrdinalIgnoreCase.Equals(display4.Tables[0].Rows[0]["status"], "Unverified"))
                    {
                        foreach (DataListItem items in DataList1.Items)
                        {
                            Button buy = items.FindControl("Button1") as Button;

                            cmd.CommandText = "select * from customers where emailAddress='" + Session["user"] + "' and status='Unverified'  ";
                            cmd.Connection = con1;
                            Image2.Visible = true;
                            Image1.Visible = false;
                            Panel3.Visible = false;
                            Button2.Enabled = false;
                            buy.Enabled = false;
                        }
                    }
                }
                Label3.Visible = false;
                Label4.Visible = false;
                Session["pID1"] = Request.QueryString["id"];

                if (Session["bid"] == null)
                {
                    //Auction winner//
                    string con2 = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
                    SqlConnection con12 = new SqlConnection(con2);
                    SqlCommand cmd1 = new SqlCommand();
                    SqlDataAdapter read = new SqlDataAdapter();
                    DataSet display = new DataSet();

                    cmd1.CommandText = "select ProductID,emailAddress,bid_price as maxbid_price from Bids where bid_price = (select max(bid_price) from Bids where ProductID = @P)";
                    cmd1.Connection = con12;
                    cmd1.Parameters.AddWithValue("@P", Session["pID1"]);
                    read.SelectCommand = cmd1;
                    read.Fill(display);
                    if (display.Tables[0].Rows.Count > 0)
                    {
                        Label3.Text = display.Tables[0].Rows[0]["emailAddress"].ToString();
                        Session["winner"] = Label3.Text;
                        Label4.Visible = false;
                    }
                }
                else
                {
                    string con2 = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
                    SqlConnection con12 = new SqlConnection(con2);
                    SqlCommand cmd1 = new SqlCommand();
                    SqlDataAdapter read = new SqlDataAdapter();
                    DataSet display = new DataSet();


                    cmd1.CommandText = "select ProductID,emailAddress,bid_price as maxbid_price from Bids where bid_price = (select max(bid_price) from Bids where ProductID = @P)";
                    cmd1.Parameters.AddWithValue("@P", Session["pID1"]);
                    cmd1.Connection = con12;
                    read.SelectCommand = cmd1;
                    read.Fill(display);
                    if (display.Tables[0].Rows.Count > 0)
                    {
                        Label3.Text = display.Tables[0].Rows[0]["emailAddress"].ToString();
                        Session["winner"] = Label3.Text;
                        Label4.Visible = false;
                    }
                }
            }
        }



                //Auction cloeses//
                public void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
                {
            
                     string con = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
                     SqlConnection con1 = new SqlConnection(con);
                     SqlCommand cmd = new SqlCommand();
                     SqlDataAdapter read = new SqlDataAdapter();
                     DataSet display = new DataSet();
                    
                        if (!IsPostBack)
                        {
                             TextBox bid = e.Item.FindControl("TextBox2") as TextBox;
                             Button bidBtn = e.Item.FindControl("Button1") as Button;
                             Label duration = e.Item.FindControl("durationlbl") as Label;
                             Panel HideClosedPost = e.Item.FindControl("Panel1") as Panel;
                             Label endingPost = e.Item.FindControl("endingPost") as Label;
                              ImageButton buyNow1 = e.Item.FindControl("ImageButton2") as ImageButton;
                             RequiredFieldValidator valid1 = e.Item.FindControl("RequiredFieldValidator1") as RequiredFieldValidator;
                             Label proId = e.Item.FindControl("Label1") as Label;
                             Session["test"] = buyNow1;
                             Session["HBid"] = bid.Text;
                             string con5 = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
                             SqlConnection con15 = new SqlConnection(con5);
                             con1.Open();
                             SqlCommand cmd5 = new SqlCommand("select * from products Where ProductID='" + Session["pID1"] + "'", con1);
                             var reader = cmd5.ExecuteReader();

                             if (reader.HasRows)
                             {
                                 while (reader.Read())
                                 {

                                    var date = DateTime.Today;
                                    var DurationDate = DateTime.Compare(Convert.ToDateTime(reader["Duration"]), date);
                                     if (DurationDate > 0)
                                     {
                                         endingPost.Visible = false;
                                         bidBtn.Enabled = true;
                                     }
                                    else
                                    {
                                         HideClosedPost.Visible = false;
                                         endingPost.Visible = true;
                                         Label pID = e.Item.FindControl("Label1") as Label;
                                         Session["pID1"] = pID;
                                         Button checkOutBtn = e.Item.FindControl("check123") as Button;
                                         if (Session["user"] != null && Session["winner"] != null)
                                         {
                                             if (Session["winner"].ToString() == Session["user"].ToString())
                                             {
                                                checkOutBtn.Visible = true;
                                             }
                                         }
                                    }

                                 }

                             }
                                                
                            if (Session["user"] != null)
                            {
                                    string con7 = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
                                    SqlConnection con17 = new SqlConnection(con7);
                                    SqlCommand cmd7 = new SqlCommand();
                                    SqlDataAdapter read47 = new SqlDataAdapter();
                                    DataSet display47 = new DataSet();
                                       cmd7.CommandText = "select * from customers Where emailAddress='" + Session["user"] + "'";
                                       cmd7.Connection = con17;
                                       read47.SelectCommand = cmd7;
                                       read47.Fill(display47);
                                if (StringComparer.OrdinalIgnoreCase.Equals(display47.Tables[0].Rows[0]["status"], "Unverified"))
                                {
                                    ImageButton buyNow = e.Item.FindControl("ImageButton2") as ImageButton;
                                    Button buy = e.Item.FindControl("Button1") as Button;
                                    cmd7.CommandText = "select * from customers where emailAddress='" + Session["user"] + "' and status='Unverified'  ";
                                    cmd7.Connection = con17;
                                    Image2.Visible = true;
                                    Image1.Visible = false;
                                    Panel3.Visible = false;
                                    Button2.Enabled = true;
                                    buy.Enabled = false;
                                    buyNow.Visible = false;
                                }
                            }
                        }
                    

                    con1.Close();
                }
                    
                    //shows the winner!//

                
                //Buttons that move to order page//
                protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)

                {
                    if (e.CommandName == "addtocart")
                    {
                        Response.Redirect("Order.aspx?id=" + e.CommandArgument.ToString());
                    }
                    if (e.CommandName == "addtocart2")
                    {
                        Response.Redirect("bidOrder.aspx?id=" + e.CommandArgument.ToString());

                    }

                }
                protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
                {

                }
                //Make bid Button//
                protected void BidBtn_Click(object sender, EventArgs e)
                {
                    if (Session["user"] == null)
                    {
                        Response.Redirect("sign in.aspx");
                    }
                    if (Session["user"] != null)
                    {
                        string con = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
                        SqlConnection con1 = new SqlConnection(con);
                        SqlConnection con2 = new SqlConnection(con);
                        foreach (DataListItem item in DataList1.Items)
                        {
                            con1.Open();
                            con2.Open();
                            Label owner = item.FindControl("Label8") as Label;
                            TextBox newPrice = item.FindControl("TextBox1") as TextBox;
                            Label prodID = item.FindControl("Label7") as Label;
                            Label Date1 = item.FindControl("Label2") as Label;
                            Session["bid"] = newPrice.Text;
                            SqlCommand command = new SqlCommand("Insert Into Bids(bid_price,time,emailAddress,ProductID,owner)" + "values(@bidPrice,@Time,@user,@prdID,@ow)", con1);
                            SqlCommand UpCommand = new SqlCommand("UPDATE products SET ProductPrice=@UpbidPrice where ProductID =@id ", con2);
                            command.Parameters.AddWithValue("@bidPrice", newPrice.Text);
                            UpCommand.Parameters.AddWithValue("@UpbidPrice", newPrice.Text);
                            command.Parameters.AddWithValue("@user", Session["user"].ToString());
                            command.Parameters.AddWithValue("@prdID", prodID.Text);
                            command.Parameters.AddWithValue("@Time", Date1.Text);
                            command.Parameters.AddWithValue("@ow", owner.Text);
                            UpCommand.Parameters.AddWithValue("@id", prodID.Text);
                            command.ExecuteNonQuery();
                            UpCommand.ExecuteNonQuery();
                            con1.Close();
                            con2.Close();
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertme()", true);
                        }
                    }
                }

                protected void LinkButton13_Click(object sender, EventArgs e)
                {
                    Session.Abandon();
                    Response.Redirect("sign in.aspx");
                }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string commentCon = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
            SqlConnection conn = new SqlConnection(commentCon);

            if (Session["user"] == null)
            {
                Response.Redirect("sign in.aspx");
            }
            if (Session["user"] != null)
            {
                conn.Open();
                string comment = TextBox4.Text;

                SqlCommand CommentCommand = new SqlCommand("Insert Into Comments(Productid,EmailAddUser,date,comment)" + "values(@pid,@user1,@dt,@comm)", conn);
                CommentCommand.Parameters.AddWithValue("@pid", Session["pID1"].ToString());
                CommentCommand.Parameters.AddWithValue("@user1", Session["user"].ToString());
                CommentCommand.Parameters.AddWithValue("@dt",Convert.ToDateTime(Label5.Text));
                CommentCommand.Parameters.AddWithValue("@comm", comment);

                CommentCommand.ExecuteNonQuery();
                conn.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertme2()", true);

            }
        }

        
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("<script>alert('welcome again, please read the terms before you start bidding. '\n' you have two choices, bid or buy.');</script>");

        }

        protected void check123_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            SqlCommand comm = new SqlCommand("insert into Winners(Email,productId,heigestBid)" + "values(@em,@pid,@hBid)", con);
            SqlCommand commChk = new SqlCommand("select * from Winners where productId='" + Session["pID1"] + "'",con);
            
            comm.Parameters.AddWithValue("@em", Session["winner"].ToString());
            comm.Parameters.AddWithValue("@pid", Session["pID1"]);
            comm.Parameters.AddWithValue("@hBid", Session["HBid"]);
            con.Open();

            if (commChk.ExecuteReader().HasRows)
            {
                con.Close();
            }
            else
            {
                con.Close();
                con.Open();
                comm.ExecuteNonQuery();
            }
        }

        
    }
}

