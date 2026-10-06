using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SweetDelights
{
    public partial class Show_Products : System.Web.UI.Page
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

        // Show ALL products
        void fillAllProducts()
        {
            getCon();

            da = new SqlDataAdapter(
                "SELECT * FROM Add_Products_Tbl",
                con
            );

            ds = new DataSet();

            da.Fill(ds);

            DataList1.DataSource = ds;
            DataList1.DataBind();

            if (ds.Tables[0].Rows.Count == 0)
            {
                lblEmpty.Visible = true;
                lblEmpty.Text = "No products found.";
            }
            else
            {
                lblEmpty.Visible = false;
            }

            con.Close();
        }

        // Show products of selected company
        void fillCompanyProducts(int cid)
        {
            getCon();

            da = new SqlDataAdapter(
                "SELECT * FROM Add_Products_Tbl WHERE Prod_Comp_Id = " + cid,
                con
            );

            ds = new DataSet();

            da.Fill(ds);

            DataList1.DataSource = ds;
            DataList1.DataBind();

            if (ds.Tables[0].Rows.Count == 0)
            {
                lblEmpty.Visible = true;
                lblEmpty.Text = "No products found for this company.";
            }
            else
            {
                lblEmpty.Visible = false;
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
                Label3.Text =
                    "Welcome, " + Session["admin"].ToString();

                string cid = Request.QueryString["cid"];

                if (string.IsNullOrEmpty(cid))
                {
                    // Show all products
                    fillAllProducts();
                }
                else
                {
                    // Show products of selected company
                    int companyId = Convert.ToInt32(cid);

                    fillCompanyProducts(companyId);
                }
            }
        }

        protected void DataList1_ItemCommand(
            object source,
            System.Web.UI.WebControls.DataListCommandEventArgs e)
        {
            // View Details
            if (e.CommandName == "cmd_view")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                Response.Redirect(
                    "ViewDetails.aspx?pid=" + id
                );
            }

            // Add To Cart
            if (e.CommandName == "cmd_cart")
            {
                int productId = Convert.ToInt32(e.CommandArgument);

                if (Session["uid"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                int userId = Convert.ToInt32(Session["uid"]);

                getCon();

                // Check whether product is already in cart
                SqlCommand checkCmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Cart_Tbl WHERE Cart_User_Id = "
                    + userId +
                    " AND Cart_Prod_Id = "
                    + productId,
                    con
                );

                int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                if (count > 0)
                {
                    // Product already exists
                    // Increase quantity by 1
                    SqlCommand updateCmd = new SqlCommand(
                        "UPDATE Cart_Tbl SET Quentity = Quentity + 1 " +
                        "WHERE Cart_User_Id = " + userId +
                        " AND Cart_Prod_Id = " + productId,
                        con
                    );

                    updateCmd.ExecuteNonQuery();
                }
                else
                {
                    // Product does not exist
                    // Add new product to cart
                    SqlCommand insertCmd = new SqlCommand(
                        "INSERT INTO Cart_Tbl " +
                        "(Cart_User_Id, Cart_Prod_Id, Quentity, AddedDate) " +
                        "VALUES (" +
                        userId + ", " +
                        productId + ", " +
                        "1, GETDATE())",
                        con
                    );

                    insertCmd.ExecuteNonQuery();
                }

                con.Close();

                // After adding product, open cart
                Response.Redirect("Add_To_Cart.aspx");
            }
        }
    }
}
