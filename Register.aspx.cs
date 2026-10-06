using System;

namespace SweetDelights
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("insert.aspx");
        }
    }
}
