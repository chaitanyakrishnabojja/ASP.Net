using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsPro.Models;

namespace SportsPro.Administration
{
    public partial class ContactDisplay : System.Web.UI.Page
    {
        private CustomerList cart;

        protected void Page_Load(object sender, EventArgs e)
        {
            cart = CustomerList.GetCustomers();
            if (!IsPostBack) this.DisplayCart();

        }

        private void DisplayCart()
        {

            lstCart.Items.Clear();
            for (int i = 0; i < cart.Count; i++)
            {
                lstCart.Items.Add(cart[i].Display());
            }
        }

        protected void btnRemoveContact_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                if (lstCart.SelectedIndex > -1)
                {
                    cart.RemoveAt(lstCart.SelectedIndex);
                    this.DisplayCart();
                }
                else
                {
                    lblMessage.Text = "Please Select a contact to remove";
                }
            }
        }

        protected void btnEmptyList_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                cart.Clear();
                this.DisplayCart();
            }
        }

        protected void btnSelectAdditionalCustomers_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Administration/CustomerDisplay");
        }
    }
}