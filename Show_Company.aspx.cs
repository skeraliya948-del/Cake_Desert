using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SweetDelights
{
    public partial class Show_Company : System.Web.UI.Page
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
            getCon();

            da = new SqlDataAdapter(
                "SELECT * FROM Add_Company_Tbl",
                con
            );

            ds = new DataSet();

            da.Fill(ds);

            DataList1.DataSource = ds;
            DataList1.DataBind();

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
                Label1.Text =
                    "Welcome, " + Session["admin"].ToString();

                fillDataList();
            }
        }

        protected void DataList1_ItemCommand(
            object source,
            System.Web.UI.WebControls.DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_cid")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                ViewState["cid"] = id;

                Response.Redirect(
                    "Show_Products.aspx?cid=" + ViewState["cid"]
                );
            }
        }
    }
}
