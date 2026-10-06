using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SweetDelights
{
    public partial class ViewDetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager
                    .ConnectionStrings["dbcon"]
                    .ConnectionString;

        void getCon()
        {
            con = DatabaseHelper.GetOpenConnection();
        }

        void fillDataList()
        {
            string pid = Request.QueryString["pid"];

            if (string.IsNullOrEmpty(pid))
            {
                pid = "1"; // Fallback demo ID if no query string is passed
            }

            getCon();

            da = new SqlDataAdapter(
                "SELECT * FROM Add_Products_Tbl WHERE Prod_Id = " + pid,
                con
            );

            ds = new DataSet();

            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataList1.DataSource = ds;
                DataList1.DataBind();
            }

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
                fillDataList();
            }
        }
    }
}
