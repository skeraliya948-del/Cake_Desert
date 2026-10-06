using System;

namespace SweetDelights
{
    public partial class Add_To_Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }
    }
}
