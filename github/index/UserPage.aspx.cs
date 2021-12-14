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
    public partial class UserPage : System.Web.UI.Page
    {
        string Connection = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                PopGVcustomer();
                PopGVproduct();
                PopGVorder();
                PopGVmessags();
            }
            
        }
        void PopGVproduct()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(Connection))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM products where userName='"+ Session["user"] +"'", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GVproduct.DataSource = dtbl;
                GVproduct.DataBind();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GVproduct.DataSource = dtbl;
                GVproduct.DataBind();
                GVproduct.Rows[0].Cells.Clear();
                GVproduct.Rows[0].Cells.Add(new TableCell());
                GVproduct.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GVproduct.Rows[0].Cells[0].Text = "No Data Found ..!";
                GVproduct.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridView3_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVproduct.EditIndex = e.NewEditIndex;
            PopGVproduct();
        }

        protected void GridView3_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVproduct.EditIndex = -1;
            PopGVproduct();
        }

        protected void GridView3_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(Connection))
                {
                    sqlCon.Open();
                    string query = "UPDATE products SET ProductName=@productName,ProductDesc=@productDesc,ProductPrice=@productPrice,ProductImg=@productImg,Category=@cateogry WHERE ProductID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@productName", (GVproduct.Rows[e.RowIndex].FindControl("ProductNametbl") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@productDesc", (GVproduct.Rows[e.RowIndex].FindControl("ProductDestbl") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@productPrice", (GVproduct.Rows[e.RowIndex].FindControl("ProductPricetbl") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@productImg", (GVproduct.Rows[e.RowIndex].FindControl("ProductImgtbl") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@cateogry", (GVproduct.Rows[e.RowIndex].FindControl("Categorytbl") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", (GVproduct.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    GVproduct.EditIndex = -1;
                    PopGVproduct();
                    lblSuccessMessage1.Text = "Selected Record Updated";
                    lblErrorMessage1.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage1.Text = "";
                lblErrorMessage1.Text = ex.Message;
            }
        }

        protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(Connection))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM products WHERE ProductID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", (GVproduct.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    PopGVproduct();
                    lblSuccessMessage1.Text = "Selected Record Deleted";
                    lblErrorMessage1.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage1.Text = "";
                lblErrorMessage1.Text = ex.Message;
            }
        }
        void PopGVmessags()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(Connection))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Messages where receiver='" + Session["user"] + "'", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GVmessags.DataSource = dtbl;
                GVmessags.DataBind();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GVmessags.DataSource = dtbl;
                GVmessags.DataBind();
                GVmessags.Rows[0].Cells.Clear();
                GVmessags.Rows[0].Cells.Add(new TableCell());
                GVmessags.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GVmessags.Rows[0].Cells[0].Text = "No Data Found ..!";
                GVmessags.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

            }       

            void PopGVcustomer()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(Connection))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM customers where emailAddress='"+ Session["user"] +"'", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GVcustomer.DataSource = dtbl;
                GVcustomer.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GVcustomer.DataSource = dtbl;
                GVcustomer.DataBind();
                GVcustomer.Rows[0].Cells.Clear();
                GVcustomer.Rows[0].Cells.Add(new TableCell());
                GVcustomer.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GVcustomer.Rows[0].Cells[0].Text = "No Data Found ..!";
                GVcustomer.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }
       
        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVcustomer.EditIndex = -1;
            PopGVcustomer();
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(Connection))
                {
                    sqlCon.Open();
                    string query = "UPDATE customers SET firstName=@FirstName,lastName=@LastName,phoneNumber=@Contact,emailAddress=@Email where emailAddress=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@FirstName", (GVcustomer.Rows[e.RowIndex].FindControl("txtfirstCust") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@LastName", (GVcustomer.Rows[e.RowIndex].FindControl("txtlastCust") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Contact", (GVcustomer.Rows[e.RowIndex].FindControl("txtphoneCust") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Email", (GVcustomer.Rows[e.RowIndex].FindControl("txtEmailCust") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", (GVcustomer.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    GVcustomer.EditIndex = -1;
                    PopGVcustomer();
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
            GVcustomer.EditIndex = e.NewEditIndex;
            PopGVcustomer();
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        void PopGVorder()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(Connection))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Orders where userPurch='"+Session["user"]+"'", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GVorder.DataSource = dtbl;
                GVorder.DataBind();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GVorder.DataSource = dtbl;
                GVorder.DataBind();
                GVorder.Rows[0].Cells.Clear();
                GVorder.Rows[0].Cells.Add(new TableCell());
                GVorder.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GVorder.Rows[0].Cells[0].Text = "No Data Found ..!";
                GVorder.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void info_Click(object sender, EventArgs e)
        {
            GVcustomer.Visible = true;
            //GVmessags.Visible = false;
            GVorder.Visible = false;
            GVproduct.Visible = false;
        }

        protected void prod_Click(object sender, EventArgs e)
        {
            GVcustomer.Visible = false;
            //GVmessags.Visible = false;
            GVorder.Visible = false;
            GVproduct.Visible = true;
        }

        protected void order_Click(object sender, EventArgs e)
        {
            GVcustomer.Visible = false;
            //GVmessags.Visible = false;
            GVorder.Visible = true;
            GVproduct.Visible = false;
        }

        protected void mess_Click(object sender, EventArgs e)
        {
            GVcustomer.Visible = false;
            //GVmessags.Visible = true;
            GVorder.Visible = false;
            GVproduct.Visible = false;
        }

        protected void active_Click(object sender, EventArgs e)
        {

        }
    }
}