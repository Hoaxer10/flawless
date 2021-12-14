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
using System.IO;

namespace index
{
    public partial class bidOrder : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = DateTime.Now.ToShortDateString();

            if (!IsPostBack)
            {
                DataTable dtbl = new DataTable();
                DataRow dr;
                dtbl.Columns.Add("ProductImg");
                dtbl.Columns.Add("ProductName");
                dtbl.Columns.Add("ProductPrice");
                dtbl.Columns.Add("Category");



                if (Request.QueryString["id"] != null)
                {
                    
                        dr = dtbl.NewRow();
                        string newCon = connection;
                        SqlConnection sqlcon = new SqlConnection(newCon);
                        string newQuy = "select ProductImg,ProductName,ProductPrice,Category from products where ProductID=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = newQuy;
                        cmd.Connection = sqlcon;
                        SqlDataAdapter sda = new SqlDataAdapter();
                        sda.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        dr["ProductImg"] = ds.Tables[0].Rows[0]["ProductImg"].ToString();
                        dr["ProductName"] = ds.Tables[0].Rows[0]["ProductName"].ToString();
                        dr["Category"] = ds.Tables[0].Rows[0]["Category"].ToString();
                        dr["ProductPrice"] = ds.Tables[0].Rows[0]["ProductPrice"].ToString();


                        dtbl.Rows.Add(dr);
                        GridView1.DataSource = dtbl;
                        GridView1.DataBind();

                        Session["ItemsInCart113"] = dtbl;

                }
                   
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            foreach (GridViewRow items in GridView1.Rows)
            {
                TextBox shipAdd = items.FindControl("TextBox1") as TextBox;
                FileUpload img = items.FindControl("FileUpload1") as FileUpload;
                DataTable dt1;
                dt1 = (DataTable)Session["ItemsInCart113"];


                string con = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
                SqlConnection con1 = new SqlConnection(con);
                if (Session["ItemsInCart113"] != null)
                {
                    for (int x = 0; x < dt1.Rows.Count; x++)
                    {
                        string date = Label1.Text;
                        string ship = shipAdd.Text;
                        string prdname = dt1.Rows[x]["ProductName"].ToString();
                        string prdprice = dt1.Rows[x]["ProductPrice"].ToString();
                        string primg = dt1.Rows[x]["ProductImg"].ToString();
                        string imgPa = Path.GetFileName(img.PostedFile.FileName);
                        img.SaveAs(Server.MapPath("receiptImg/" + imgPa));
                        string status = Label2.Text;

                        SqlCommand comm = new SqlCommand("Insert into Orders(orderDate,shipAddress,userPurch,productname,productprice,productimg,PayStatus,receiptImg)" + " values(@Odate,@ship,@user,@prodname,@prodprice,@prodimg,@paySts,@receImg)", con1);


                        comm.Parameters.AddWithValue("@Odate", date);
                        comm.Parameters.AddWithValue("@ship", ship);
                        comm.Parameters.AddWithValue("@prodname", prdname);
                        comm.Parameters.AddWithValue("@prodprice", prdprice);
                        comm.Parameters.AddWithValue("@prodimg", primg);
                        comm.Parameters.AddWithValue("@paySts", status);
                        comm.Parameters.AddWithValue("@receImg", imgPa);
                        comm.Parameters.AddWithValue("@user", Session["user"]);



                        con1.Open();



                        comm.ExecuteNonQuery();


                        con1.Close();

                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertme()", true);
                    }
                }

            }

        }
    }
}