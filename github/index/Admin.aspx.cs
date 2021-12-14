using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.IO;

namespace index
{
    public partial class Admin : System.Web.UI.Page
    {

        string con2 = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopGvEmp();
                PopuGvCustomer();
                PopGvProd();
                PopGvOrder();
                PopGvContact();
                PopWinnersr();
                PopActi();
                PopComm();
                string con = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
                SqlConnection con1 = new SqlConnection(con);
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter read = new SqlDataAdapter();
                DataSet display = new DataSet();

                if (Session["admin"] != null)
                {
                    cmd.CommandText = "select * from employee Where emailAdd='" + Session["admin"] + "'";
                    cmd.Connection = con1;
                    read.SelectCommand = cmd;
                    read.Fill(display);
                    Label1.Visible = true;
                    Label1.Text = "Welcome : " + display.Tables[0].Rows[0]["firstName"].ToString() + " " + display.Tables[0].Rows[0]["lastName"].ToString();
                    
                }
                if(Session["admin"] == null)
                {
                    Response.Redirect("sign in.aspx");
                }

            }

        }

        void PopGvEmp()
        {

            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(con2))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM employee", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GvEmp.DataSource = dtbl;
                GvEmp.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GvEmp.DataSource = dtbl;
                GvEmp.DataBind();
                GvEmp.Rows[0].Cells.Clear();
                GvEmp.Rows[0].Cells.Add(new TableCell());
                GvEmp.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GvEmp.Rows[0].Cells[0].Text = "No Data Found ..!";
                GvEmp.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(con2))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO employee (Id,firstName,lastName,phoneNumer,emailAdd,password) VALUES (@Id,@FirstName,@LastName,@Contact,@Email,@pass)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@Id", (GvEmp.FooterRow.FindControl("txtId") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@FirstName", (GvEmp.FooterRow.FindControl("txtFirstNameFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@LastName", (GvEmp.FooterRow.FindControl("txtLastNameFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Contact", (GvEmp.FooterRow.FindControl("txtphoneFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@pass", (GvEmp.FooterRow.FindControl("passwordFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Email", (GvEmp.FooterRow.FindControl("txtEmailFooter") as TextBox).Text.Trim());
                        sqlCmd.ExecuteNonQuery();
                        PopGvEmp();
                        lblSuccessMessage.Text = "New Record Added";
                        lblErrorMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvEmp.EditIndex = e.NewEditIndex;
            PopGvEmp();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvEmp.EditIndex = -1;
            PopGvEmp();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(con2))
                {
                    sqlCon.Open();
                    string query = "UPDATE employee SET firstName=@FirstName,lastName=@LastName,phoneNumer=@Contact,emailAdd=@Email WHERE Id = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@FirstName", (GvEmp.Rows[e.RowIndex].FindControl("txtFirstName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@LastName", (GvEmp.Rows[e.RowIndex].FindControl("txtLastName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Contact", (GvEmp.Rows[e.RowIndex].FindControl("txtContact") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Email", (GvEmp.Rows[e.RowIndex].FindControl("txtEmail") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(GvEmp.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    GvEmp.EditIndex = -1;
                    PopGvEmp();
                    lblSuccessMessage.Text = "Selected Record Updated";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(con2))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM employee WHERE Id = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(GvEmp.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    PopGvEmp();
                    lblSuccessMessage.Text = "Selected Record Deleted";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }



        /// //////////////////////////////////////////////////////////
        /// //////////////////////////////////////////////////////////
        //customers control panel
        void PopuGvCustomer()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(con2))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM customers", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GvCustomer.DataSource = dtbl;
                GvCustomer.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GvCustomer.DataSource = dtbl;
                GvCustomer.DataBind();
                GvCustomer.Rows[0].Cells.Clear();
                GvCustomer.Rows[0].Cells.Add(new TableCell());
                GvCustomer.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GvCustomer.Rows[0].Cells[0].Text = "No Data Found ..!";
                GvCustomer.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }
        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(con2))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM customers WHERE emailAddress = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", (GvCustomer.DataKeys[e.RowIndex].Value));
                    sqlCmd.ExecuteNonQuery();
                    PopuGvCustomer();
                    lblSuccessMessage2.Text = "Selected Record Deleted";
                    lblErrorMessage2.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage2.Text = "";
                lblErrorMessage2.Text = ex.Message;
            }
        }
        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvCustomer.EditIndex = -1;
            PopuGvCustomer();
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(con2))
                {
                    sqlCon.Open();
                    string query = "UPDATE customers SET firstName=@FirstName,lastName=@LastName,phoneNumber=@Contact,emailAddress=@Email where emailAddress=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@FirstName", (GvCustomer.Rows[e.RowIndex].FindControl("txtfirstCust") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@LastName", (GvCustomer.Rows[e.RowIndex].FindControl("txtlastCust") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Contact", (GvCustomer.Rows[e.RowIndex].FindControl("txtphoneCust") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Email", (GvCustomer.Rows[e.RowIndex].FindControl("txtEmailCust") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", (GvCustomer.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    GvCustomer.EditIndex = -1;
                    PopuGvCustomer();
                    lblSuccessMessage2.Text = "Selected Record Updated";
                    lblErrorMessage2.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage2.Text = "";
                lblErrorMessage2.Text = ex.Message;
            }
        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvCustomer.EditIndex = e.NewEditIndex;
            PopuGvCustomer();
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }




        /// ////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////
        ///product panel
        void PopGvProd()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(con2))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM products", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GvProd.DataSource = dtbl;
                GvProd.DataBind();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GvProd.DataSource = dtbl;
                GvProd.DataBind();
                GvProd.Rows[0].Cells.Clear();
                GvProd.Rows[0].Cells.Add(new TableCell());
                GvProd.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GvProd.Rows[0].Cells[0].Text = "No Data Found ..!";
                GvProd.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridView3_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvProd.EditIndex = e.NewEditIndex;
            PopGvProd();
        }

        protected void GridView3_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvProd.EditIndex = -1;
            PopGvProd();
        }

        protected void GridView3_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(con2))
                {
                    sqlCon.Open();
                    string query = "UPDATE products SET ProductName=@productName,ProductDesc=@productDesc,ProductPrice=@productPrice,ProductImg=@productImg,Category=@cateogry WHERE ProductID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@productName", (GvProd.Rows[e.RowIndex].FindControl("ProductNametbl") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@productDesc", (GvProd.Rows[e.RowIndex].FindControl("ProductDestbl") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@productPrice", (GvProd.Rows[e.RowIndex].FindControl("ProductPricetbl") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@productImg", (GvProd.Rows[e.RowIndex].FindControl("ProductImgtbl") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@cateogry", (GvProd.Rows[e.RowIndex].FindControl("Categorytbl") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", (GvProd.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    GvProd.EditIndex = -1;
                    PopGvProd();
                    lblSuccessMessage3.Text = "Selected Record Updated";
                    lblErrorMessage3.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage3.Text = "";
                lblErrorMessage3.Text = ex.Message;
            }
        }

        protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(con2))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM products WHERE ProductID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", (GvProd.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    PopGvProd();
                    lblSuccessMessage3.Text = "Selected Record Deleted";
                    lblErrorMessage3.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage3.Text = "";
                lblErrorMessage3.Text = ex.Message;
            }
        }
        /// <summary>
        /// orders
        /// </summary>
        void PopGvOrder()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(con2))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Orders", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GvOrder.DataSource = dtbl;
                GvOrder.DataBind();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GvOrder.DataSource = dtbl;
                GvOrder.DataBind();
                GvOrder.Rows[0].Cells.Clear();
                GvOrder.Rows[0].Cells.Add(new TableCell());
                GvOrder.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GvOrder.Rows[0].Cells[0].Text = "No Data Found ..!";
                GvOrder.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void GridView4_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            foreach (GridViewRow rows in GvOrder.Rows)
            {
                Label orderId = rows.FindControl("lblId") as Label;
                DropDownList approval = rows.FindControl("DropDownList1") as DropDownList;
                Button submit = rows.FindControl("subBtn") as Button;

                if (approval.SelectedValue == "accept")
                {
                    if(submit != null)
                    {
                        try
                        {
                            using (SqlConnection sqlCon = new SqlConnection(con2))
                            {
                                sqlCon.Open();
                                string query = "UPDATE Orders SET PayStatus=@paySts WHERE OrderId = @id";
                                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                                sqlCmd.Parameters.AddWithValue("@paySts", approval.SelectedValue);
                                sqlCmd.Parameters.AddWithValue("@id", orderId.Text);
                                sqlCmd.ExecuteNonQuery();
                                GvOrder.EditIndex = -1;
                                PopGvOrder();
                                Label40.Text = "Selected Record Updated";
                                Label41.Text = "";
                            }
                        }
                        catch (Exception ex)
                        {
                            Label40.Text = "";
                            Label41.Text = ex.Message;
                        }
                        string mailcon = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
                        SqlConnection mailcon1 = new SqlConnection(mailcon);
                        string sqlquery = "select * from Orders where OrderId = @OrderId";
                        SqlCommand cmd = new SqlCommand(sqlquery, mailcon1);
                        cmd.Parameters.AddWithValue("@OrderId", orderId.Text);
                        mailcon1.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            string userpu = reader["userPurch"].ToString();
                            string orderid = reader["OrderId"].ToString();
                            string invodate = reader["orderDate"].ToString();
                            string shipadd = reader["shipAddress"].ToString();
                            string proname = reader["productname"].ToString();
                            string proprice = reader["productprice"].ToString();
                            string image = reader["productimg"].ToString();


                            MailMessage message = new MailMessage("flawless@meshari-ipa.com", userpu.ToString());
                            message.Subject = "Your Order has been submit";
                            message.Body = string.Format("hello : " +
                                "<h1>{0}</h1>order date:<br/><h1>" +
                                "{1}</h1>ship address:<h1>{2}</h1>order id:<br/><h1>" +
                                "{3}</h1>product name:<h1>{4}</h1>total:<br/><h1>" +
                                "{5}</h1><h1>{6}"
                                , userpu, invodate, shipadd, orderid, proname, proprice, image);
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
                            string Sender = "Flawless team <flawless@meshari-ipa.com>";
                            message.From = new MailAddress(Sender);
                            smtp.Send(message);
                        }
                    }

                }
                if(approval.SelectedValue == "declined")
                {
                    if (submit != null)
                    {
                        try
                        {
                            using (SqlConnection sqlCon = new SqlConnection(con2))
                            {
                                sqlCon.Open();
                                string query = "UPDATE Orders SET PayStatus=@paySts WHERE OrderId = @id";
                                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                                sqlCmd.Parameters.AddWithValue("@paySts", approval.SelectedValue);
                                sqlCmd.Parameters.AddWithValue("@id", orderId.Text);
                                sqlCmd.ExecuteNonQuery();
                                GvOrder.EditIndex = -1;
                                PopGvOrder();
                                Label40.Text = "Selected Record Updated";
                                Label41.Text = "";
                            }
                        }
                        catch (Exception ex)
                        {
                            Label40.Text = "";
                            Label41.Text = ex.Message;
                        }
                        string mailcon = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
                        SqlConnection mailcon1 = new SqlConnection(mailcon);
                        string sqlquery = "select * from Orders where OrderId = @OrderId";
                        SqlCommand cmd = new SqlCommand(sqlquery, mailcon1);
                        cmd.Parameters.AddWithValue("@OrderId", orderId.Text);
                        mailcon1.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            string userpu = reader["userPurch"].ToString();
                            string orderid = reader["OrderId"].ToString();
                            string invodate = reader["orderDate"].ToString();
                            string shipadd = reader["shipAddress"].ToString();
                            string proname = reader["productname"].ToString();
                            string proprice = reader["productprice"].ToString();
                            string image = reader["productimg"].ToString();
                            MailMessage message = new MailMessage("flawless@meshari-ipa.com", userpu.ToString());
                            message.Subject = "Your Order has been denied";
                            message.Body = string.Format("hello : " + "<h1>Your order has been denied,pleas contact us for more information,all regards,flawless auction.<h1>" +
                                "<h1>{0}</h1>order date:<br/><h1>" +
                                "{1}</h1>ship address:<h1>{2}</h1>order id:<br/><h1>" +
                                "{3}</h1>product name:<h1>{4}</h1>total:<br/><h1>" +
                                "{5}</h1><h1>{6}"
                                , userpu, invodate, shipadd, orderid, proname, proprice, image);
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
                            string Sender = "Flawless team <flawless@meshari-ipa.com>";
                            message.From = new MailAddress(Sender);
                            smtp.Send(message);

                        }
                    }
                }

            }
        }

        protected void GridView4_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvOrder.EditIndex = e.NewEditIndex;
            PopGvOrder();
        }

        protected void GridView4_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvOrder.EditIndex = -1;
            PopGvOrder();
        }

        protected void GridView4_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
        }

        protected void GridView4_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(con2))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM Orders WHERE OrderId = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", (GvOrder.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    PopGvOrder();
                    Label40.Text = "Selected Record Deleted";
                    Label41.Text = "";
                }
            }
            catch (Exception ex)
            {
                Label40.Text = "";
                Label41.Text = ex.Message;
            }
        }

        void PopGvContact()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(con2))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM ContactUs", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GvContact.DataSource = dtbl;
                GvContact.DataBind();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GvContact.DataSource = dtbl;
                GvContact.DataBind();
                GvContact.Rows[0].Cells.Clear();
                GvContact.Rows[0].Cells.Add(new TableCell());
                GvContact.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GvContact.Rows[0].Cells[0].Text = "No Data Found ..!";
                GvContact.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }
        //
        //buttons
        

        

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void info_Click(object sender, EventArgs e)
        {
            GvCustomer.Visible = true;
            GvEmp.Visible = false;
            GvOrder.Visible = false;
            GvProd.Visible = false;
            GvContact.Visible = false;
            GridView1.Visible = false;
        }

        protected void prod_Click(object sender, EventArgs e)
        {
            GvCustomer.Visible = false;
            GvEmp.Visible = false;
            GvOrder.Visible = false;
            GvProd.Visible = true;
            GvContact.Visible = false;
            GridView1.Visible = false;

        }

        protected void order_Click(object sender, EventArgs e)
        {
            GvCustomer.Visible = false;
            GvEmp.Visible = false;
            GvOrder.Visible = true;
            GvProd.Visible = false;
            GvContact.Visible = false;
            GridView1.Visible = false;

        }

        protected void mess_Click(object sender, EventArgs e)
        {
            GvCustomer.Visible = false;
            GvEmp.Visible = false;
            GvOrder.Visible = false;
            GvProd.Visible = false;
            GvContact.Visible = true;
            GridView1.Visible = false;

        }

        protected void Emp_Click(object sender, EventArgs e)
        {
            GvCustomer.Visible = false;
            GvEmp.Visible = true;
            GvOrder.Visible = false;
            GvProd.Visible = false;
            GvContact.Visible = false;
            GridView1.Visible = false;

        }

       
        protected void GvContact_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(con2))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM ContactUs WHERE Id = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", (GvContact.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    PopGvContact();
                    LabelWinner1.Text = "Selected Record Deleted";
                    LabelWinner2.Text = "";
                }
            }
            catch (Exception ex)
            {
                LabelWinner1.Text = "";
                LabelWinner2.Text = ex.Message;
            }
        }


        protected void logOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("HomePage.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            GvCustomer.Visible = false;
            GvEmp.Visible = false;
            GvOrder.Visible = false;
            GvProd.Visible = false;
            GvContact.Visible = false;
            GridView1.Visible = true;
        }
        void PopWinnersr()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(con2))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Winners", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridView1.DataSource = dtbl;
                GridView1.DataBind();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridView1.DataSource = dtbl;
                GridView1.DataBind();
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridView1.Rows[0].Cells[0].Text = "No Data Found ..!";
                GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(con2))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM Winners WHERE Id = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", (GridView1.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    PopWinnersr();
                    LabelWinner1.Text = "Selected Record Deleted";
                    LabelWinner2.Text = "";
                }
            }
            catch (Exception ex)
            {
                LabelWinner1.Text = "";
                LabelWinner2.Text = ex.Message;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GvContact_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        void PopActi()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(con2))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Activasion", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridView2.DataSource = dtbl;
                GridView2.DataBind();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridView2.DataSource = dtbl;
                GridView2.DataBind();
                GridView2.Rows[0].Cells.Clear();
                GridView2.Rows[0].Cells.Add(new TableCell());
                GridView2.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridView2.Rows[0].Cells[0].Text = "No Data Found ..!";
                GridView2.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }
        protected void GridView2_RowCommand1(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridView2_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(con2))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM Activasion WHERE ActId = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", (GridView2.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    PopActi();
                    Label2.Text = "Selected Record Deleted";
                    Label3.Text = "";
                }
            }
            catch (Exception ex)
            {
                Label2.Text = "";
                Label3.Text = ex.Message;
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        void PopComm()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(con2))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Comments", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridView3.DataSource = dtbl;
                GridView3.DataBind();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridView3.DataSource = dtbl;
                GridView3.DataBind();
                GridView3.Rows[0].Cells.Clear();
                GridView3.Rows[0].Cells.Add(new TableCell());
                GridView3.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridView3.Rows[0].Cells[0].Text = "No Data Found ..!";
                GridView3.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            GvCustomer.Visible = false;
            GvEmp.Visible = false;
            GvOrder.Visible = false;
            GvProd.Visible = false;
            GvContact.Visible = false;
            GridView1.Visible = false;
            GridView2.Visible = true;
        }

        protected void GridView3_RowCommand1(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridView3_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(con2))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM Comments WHERE Id = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", (GridView3.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    PopComm();
                    Label4.Text = "Selected Record Deleted";
                    Label5.Text = "";
                }
            }
            catch (Exception ex)
            {
                Label2.Text = "";
                Label3.Text = ex.Message;
            }
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            GvCustomer.Visible = false;
            GvEmp.Visible = false;
            GvOrder.Visible = false;
            GvProd.Visible = false;
            GvContact.Visible = false;
            GridView1.Visible = false;
            GridView3.Visible = true;
        }

        protected void GvEmp_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            
        }

        protected void GvCustomer_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvCustomer.PageIndex = e.NewPageIndex;
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(con2))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM customers", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GvCustomer.DataSource = dtbl;
                GvCustomer.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GvCustomer.DataSource = dtbl;
                GvCustomer.DataBind();
                GvCustomer.Rows[0].Cells.Clear();
                GvCustomer.Rows[0].Cells.Add(new TableCell());
                GvCustomer.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GvCustomer.Rows[0].Cells[0].Text = "No Data Found ..!";
                GvCustomer.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        protected void GvProd_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvProd.PageIndex = e.NewPageIndex;
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(con2))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM products", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GvProd.DataSource = dtbl;
                GvProd.DataBind();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GvProd.DataSource = dtbl;
                GvProd.DataBind();
                GvProd.Rows[0].Cells.Clear();
                GvProd.Rows[0].Cells.Add(new TableCell());
                GvProd.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GvProd.Rows[0].Cells[0].Text = "No Data Found ..!";
                GvProd.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        protected void GvOrder_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvOrder.PageIndex = e.NewPageIndex;
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(con2))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Orders", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GvOrder.DataSource = dtbl;
                GvOrder.DataBind();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GvOrder.DataSource = dtbl;
                GvOrder.DataBind();
                GvOrder.Rows[0].Cells.Clear();
                GvOrder.Rows[0].Cells.Add(new TableCell());
                GvOrder.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GvOrder.Rows[0].Cells[0].Text = "No Data Found ..!";
                GvOrder.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        protected void GvContact_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvContact.PageIndex = e.NewPageIndex;
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(con2))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM ContactUs", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GvContact.DataSource = dtbl;
                GvContact.DataBind();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GvContact.DataSource = dtbl;
                GvContact.DataBind();
                GvContact.Rows[0].Cells.Clear();
                GvContact.Rows[0].Cells.Add(new TableCell());
                GvContact.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GvContact.Rows[0].Cells[0].Text = "No Data Found ..!";
                GvContact.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(con2))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Winners", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridView1.DataSource = dtbl;
                GridView1.DataBind();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridView1.DataSource = dtbl;
                GridView1.DataBind();
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridView1.Rows[0].Cells[0].Text = "No Data Found ..!";
                GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(con2))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Activasion", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridView2.DataSource = dtbl;
                GridView2.DataBind();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridView2.DataSource = dtbl;
                GridView2.DataBind();
                GridView2.Rows[0].Cells.Clear();
                GridView2.Rows[0].Cells.Add(new TableCell());
                GridView2.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridView2.Rows[0].Cells[0].Text = "No Data Found ..!";
                GridView2.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView3.PageIndex = e.NewPageIndex;
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(con2))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Comments", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridView3.DataSource = dtbl;
                GridView3.DataBind();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridView3.DataSource = dtbl;
                GridView3.DataBind();
                GridView3.Rows[0].Cells.Clear();
                GridView3.Rows[0].Cells.Add(new TableCell());
                GridView3.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridView3.Rows[0].Cells[0].Text = "No Data Found ..!";
                GridView3.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }


        protected void GvCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GvCustomer_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void GvContact_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}

        


