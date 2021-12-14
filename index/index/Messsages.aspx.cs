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
    public partial class Messsages : System.Web.UI.Page
    {
        string Connection = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if(!IsPostBack)
            {
                PopGVmessags();
            }
            
                string up = "yes";
                SqlConnection con = new SqlConnection(Connection);
                con.Open();
                SqlCommand update = new SqlCommand("UPDATE Messages SET rdm = @red ", con);
                update.Parameters.AddWithValue("@red", up);
                update.ExecuteNonQuery();
                con.Close();
            
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
    }
}