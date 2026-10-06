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
    public partial class Add_Company : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm, nm;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getCon()
        {
            con = DatabaseHelper.GetOpenConnection();
        }

        void fillGrid()
        {
            getCon();
            da = new SqlDataAdapter("Select * from Add_Company_Tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();
        }

        void filUpload()
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
                fnm = "images/default-company.jpg";
            }
        }

        void clear()
        {
            txtnm.Text = string.Empty;
            txtadd.Text = string.Empty;
            txteml.Text = string.Empty;
            txtonm.Text = string.Empty;
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
                lblresult.Text = "Welcome, " + Session["admin"].ToString();
            }
        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Add_Products.aspx");
        }

        protected void add_comp_btn_Click(object sender, EventArgs e)
        {
            getCon();
            filUpload();
            cmd = new SqlCommand("insert into Add_Company_Tbl(Comp_Name, Comp_Owner_Name,Comp_Email,Comp_Address,Comp_Cover_Img) values('" + txtnm.Text + "','" + txtonm.Text + "','" + txteml.Text + "','" + txtadd.Text + "','" + fnm + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            clear();
            Response.Write("<script>alert('Company Added Successfully')</script>");
        }
    }
}
