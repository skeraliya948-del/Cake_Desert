using System;

namespace SweetDelights
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Shopping Cart & Checkout - Sweet Delights Bakery";

            if (!IsPostBack && Session["User"] != null)
            {
                User loggedUser = (User)Session["User"];
                txtCustName.Text = loggedUser.FullName;
                txtCustPhone.Text = loggedUser.Phone;
            }
        }
    }
}
