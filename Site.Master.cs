using System;
using System.Web.UI;
using System.Data.SqlClient;

namespace SweetDelights
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckUserSession();
            }
        }

        private void CheckUserSession()
        {
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                lblUserGreeting.Text = "Hello, " + user.FullName;
                pnlUserLoggedIn.Visible = true;
                pnlUserLoggedOut.Visible = false;
            }
            else if (Session["admin"] != null)
            {
                try
                {
                    using (SqlConnection con = DatabaseHelper.GetOpenConnection())
                    {
                        SqlCommand cmd = new SqlCommand("SELECT Name FROM emp_tbl WHERE Email = @Email", con);
                        cmd.Parameters.AddWithValue("@Email", Session["admin"].ToString());
                        object result = cmd.ExecuteScalar();
                        if (result != null && result != DBNull.Value && !string.IsNullOrEmpty(result.ToString()))
                        {
                            lblUserGreeting.Text = "Hello, " + result.ToString();
                        }
                        else
                        {
                            lblUserGreeting.Text = "Hello, User";
                        }
                    }
                }
                catch
                {
                    lblUserGreeting.Text = "Hello, User";
                }

                pnlUserLoggedIn.Visible = true;
                pnlUserLoggedOut.Visible = false;
            }
            else
            {
                pnlUserLoggedIn.Visible = false;
                pnlUserLoggedOut.Visible = true;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
}
