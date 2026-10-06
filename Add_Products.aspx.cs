using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SweetDelights
{
    public partial class Add_Products : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string fnm;

        string s = ConfigurationManager
                    .ConnectionStrings["dbcon"]
                    .ConnectionString;

        void getCon()
        {
            con = DatabaseHelper.GetOpenConnection();
        }

        void clear()
        {
            txtmodel.Text = string.Empty;
            txtdesc.Text = string.Empty;
            txtweight.Text = string.Empty;
            txtconfig.Text = string.Empty;
            txtprice.Text = string.Empty;
        }

        void fileUpload()
        {
            if (imgUpload.HasFile)
            {
                string folderPath = Server.MapPath("images/");
                if (!System.IO.Directory.Exists(folderPath))
                {
                    System.IO.Directory.CreateDirectory(folderPath);
                }
                fnm = "images/" + imgUpload.FileName;
                imgUpload.SaveAs(Server.MapPath(fnm));
            }
            else
            {
                fnm = "images/default-cake.jpg";
            }
        }

        void fillCombo()
        {
            getCon();

            da = new SqlDataAdapter(
                "SELECT * FROM Add_Company_Tbl",
                con
            );

            ds = new DataSet();

            da.Fill(ds);

            drpcompid.Items.Clear();

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                drpcompid.Items.Add(
                    ds.Tables[0].Rows[i]["Comp_Name"].ToString()
                );
            }

            con.Close();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            getCon();

            fileUpload();

            da = new SqlDataAdapter(
                "SELECT * FROM Add_Company_Tbl WHERE Comp_Name='" +
                drpcompid.SelectedItem.Text + "'",
                con
            );

            ds = new DataSet();

            da.Fill(ds);

            int cid = 1;
            if (ds.Tables[0].Rows.Count > 0)
            {
                cid = Convert.ToInt32(
                    ds.Tables[0].Rows[0]["Comp_Id"]
                );
            }

            cmd = new SqlCommand(
                "INSERT INTO Add_Products_Tbl " +
                "(Prod_Comp_Id, Prod_Name, Prod_Model, Prod_Desc, Prod_Weight, Prod_Config, Prod_Img, Prod_Price) " +
                "VALUES (" +
                "'" + cid + "'," +
                "'" + drpcompid.SelectedItem.Text + "'," +
                "'" + txtmodel.Text + "'," +
                "'" + txtdesc.Text + "'," +
                "'" + txtweight.Text + "'," +
                "'" + txtconfig.Text + "'," +
                "'" + fnm + "'," +
                "'" + txtprice.Text + "'" +
                ")",
                con
            );

            cmd.ExecuteNonQuery();

            Response.Write(
                "<script>alert('Product Added Successfully')</script>"
            );

            clear();

            con.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                fillCombo();

                lblWelcome.Text =
                    "Welcome, " + Session["admin"].ToString();
            }
        }
    }
}
