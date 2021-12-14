using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Globalization;



namespace index
{
    public partial class AddPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("sign in.aspx");
            }
            TextBox6.Text = DateTime.Now.ToShortDateString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string con = ConfigurationManager.ConnectionStrings["ma"].ConnectionString;
            SqlConnection con1 = new SqlConnection(con);
            Session["tillEnd"] = TextBox5.Text;
            string max = TextBox1.Text;
            string duration = TextBox5.Text;
            string dateNow = TextBox6.Text;
            String proDesc = TextBox2.Text;
            string ProName = TextBox3.Text;
            String Price = TextBox4.Text;
            string catry = DropDownList1.Text;
            string imgPa = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Server.MapPath("ProductImg/" + imgPa));

            SqlCommand comm = new SqlCommand("Insert into products(ProductName,ProductDesc,ProductPrice,ProductImg,Category,userName,Max,PostDate,Duration)" + " values(@pNm,@Pdes,@Pmny,@Pimg,@Pcay,@uName,@mxPrice,@date,@end)", con1);
            
            comm.Parameters.AddWithValue("@pNm", ProName);
            comm.Parameters.AddWithValue("@Pdes", proDesc);
            comm.Parameters.AddWithValue("@Pmny", Price);
            comm.Parameters.AddWithValue("@Pimg", imgPa);
            comm.Parameters.AddWithValue("@Pcay", catry);
            comm.Parameters.AddWithValue("@uName", Session["user"]);
            comm.Parameters.AddWithValue("@mxPrice", max);
            comm.Parameters.AddWithValue("@date", dateNow);
            comm.Parameters.AddWithValue("@end", duration);



            con1.Open();



            comm.ExecuteNonQuery();
            

            con1.Close();
            Response.Redirect("HomePage.aspx");
        }

        protected void DropDownList2_CallingDataMethods(object sender, CallingDataMethodsEventArgs e)
        {

        }
    }
}