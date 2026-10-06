using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace SweetDelights
{
    public partial class insert : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getCon()
        {
            con = DatabaseHelper.GetOpenConnection();
        }

        public void fileUpload()
        {
            if (imgupload.HasFile)
            {
                string folderPath = Server.MapPath("images/");
                if (!System.IO.Directory.Exists(folderPath))
                {
                    System.IO.Directory.CreateDirectory(folderPath);
                }
                fnm = "images/" + imgupload.FileName;
                imgupload.SaveAs(Server.MapPath(fnm));
            }
            else
            {
                fnm = "images/default-user.jpg";
            }
        }

        void fillGrid()
        {
            getCon();
            da = new SqlDataAdapter("Select * from emp_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
        }

        public void clear()
        {
            txtusername.Text = string.Empty;
            txtaddress.Text = string.Empty;
            txtemail.Text = string.Empty;
            txtpassword.Text = string.Empty;
            txtmbl.Text = string.Empty;
            rdogen.SelectedIndex = -1;
            drpcity.SelectedIndex = -1;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            pnlLoginLink.Visible = false;
            pnlAdminGrid.Visible = true;

            if (!IsPostBack)
            {
                if (Session["User"] != null)
                {
                    User user = (User)Session["User"];
                    lblWelcome.Text = "Welcome " + user.FullName;
                }
                else if (Session["admin"] != null)
                {
                    getCon();
                    da = new SqlDataAdapter("Select Name from emp_tbl where Email='" + Session["admin"].ToString() + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0]["Name"] != DBNull.Value && !string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Name"].ToString()))
                    {
                        lblWelcome.Text = "Welcome " + ds.Tables[0].Rows[0]["Name"].ToString();
                    }
                    else
                    {
                        lblWelcome.Text = "Welcome " + Session["admin"].ToString();
                    }
                    con.Close();
                }
                else
                {
                    lblWelcome.Text = "Welcome to User Registration";
                }

                fillGrid();
            }
        }

        void fillData()
        {
            getCon();
            da = new SqlDataAdapter("select * from emp_tbl where Id ='" + ViewState["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            txtusername.Text = ds.Tables[0].Rows[0]["Name"].ToString();

            if (ds.Tables[0].Rows[0]["Gender"].ToString() == "Male")
            {
                rdogen.SelectedValue = "Male";
            }
            else
            {
                rdogen.SelectedValue = "Female";
            }

            txtemail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            drpcity.SelectedValue = ds.Tables[0].Rows[0]["City"].ToString();
            txtaddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
            txtmbl.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
            con.Close();
        }

        protected void Save_btn_Click(object sender, EventArgs e)
        {
            try
            {
                if (Save_btn.Text == "Save")
                {
                    getCon();
                    fileUpload();
                    string command = "insert into emp_tbl(Name,Gender,Email,Password,City,Address,Mobile,Image) values('" + txtusername.Text + "','" + rdogen.SelectedValue + "','" + txtemail.Text + "','" + txtpassword.Text + "','" + drpcity.SelectedValue + "','" + txtaddress.Text + "','" + txtmbl.Text + "','" + fnm + "')";
                    cmd = new SqlCommand(command, con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    // Instantly log in user after registration
                    Session["admin"] = txtemail.Text;
                    User newUser = new User
                    {
                        FullName = txtusername.Text,
                        Email = txtemail.Text,
                        Phone = txtmbl.Text,
                        IsLoggedIn = true
                    };
                    Session["User"] = newUser;
                    lblWelcome.Text = "Welcome " + txtusername.Text;

                    fillGrid();
                    Response.Write("<script>alert('User Registered & Saved Successfully!');</script>");
                    clear();
                }
                else
                {
                    getCon();
                    cmd = new SqlCommand("update emp_tbl set Name='" + txtusername.Text + "',Gender='" + rdogen.SelectedValue + "',Email='" + txtemail.Text + "',City='" + drpcity.SelectedValue + "',Address='" + txtaddress.Text + "',Mobile='" + txtmbl.Text + "' where Id='" + ViewState["id"] + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    fillGrid();
                    clear();
                    Response.Write("<script>alert('Data Edited Successfully');</script>");
                    Save_btn.Text = "Save";
                }
            }
            catch (SqlException ex)
            {
                if (con != null && con.State == ConnectionState.Open)
                {
                    con.Close();
                }

                if (ex.Number == 2627 || ex.Message.Contains("UNIQUE KEY") || ex.Message.Contains("duplicate"))
                {
                    Response.Write("<script>alert('Error: This Email address is already registered! Please enter a different email.');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Database Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
                }
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                Save_btn.Text = "Update";
                fillData();
            }
            else if (e.CommandName == "cmd_del")
            {
                getCon();
                cmd = new SqlCommand("delete from emp_tbl where Id = '" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                fillGrid();
                Response.Write("<script>alert('Data Deleted Successfully');</script>");
            }
        }
    }
}
