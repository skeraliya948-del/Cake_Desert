using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace SweetDelights
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getCon()
        {
            con = DatabaseHelper.GetOpenConnection();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                Response.Redirect("insert.aspx");
            }
        }

        protected void login_btn_Click(object sender, EventArgs e)
        {
            if (!(string.IsNullOrEmpty(txtemail.Text)) && !(string.IsNullOrEmpty(txtpassword.Text)))
            {
                getCon();

                da = new SqlDataAdapter(
                    "SELECT * FROM emp_tbl WHERE Email='" + txtemail.Text + "' AND Password='" + txtpassword.Text + "'",
                    con
                );

                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["uid"] = ds.Tables[0].Rows[0]["Id"].ToString();
                    Session["admin"] = txtemail.Text;

                    User loggedUser = new User
                    {
                        FullName = ds.Tables[0].Rows[0]["Name"].ToString(),
                        Email = ds.Tables[0].Rows[0]["Email"].ToString(),
                        Phone = ds.Tables[0].Rows[0]["Mobile"].ToString(),
                        IsLoggedIn = true
                    };
                    Session["User"] = loggedUser;

                    Response.Redirect("insert.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Email or Password')</script>");
                }

                con.Close();
            }
            else
            {
                Response.Write("<script>alert('Please enter both Email and Password')</script>");
            }
        }
    }
}
