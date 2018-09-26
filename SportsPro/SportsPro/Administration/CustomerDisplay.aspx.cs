using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SportsPro.Models;
using Microsoft.AspNet.FriendlyUrls;

namespace SportsPro.Administration
{
    public partial class CustomerDisplay : System.Web.UI.Page
    {
       
       
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ddlCustomer.DataBind();

                string id = "";
                if (RouteData.Values.ContainsKey("CustomerID"))
                {
                    id = RouteData.Values["CustomerID"].ToString();
                }
                else
                {
                    var segments = Request.GetFriendlyUrlSegments();
                    if (segments.Count > 0) id = segments[0];
                }

                if (id == "") Reload();
                else ShowSelectedCustomer(id);
            }    

        }

        protected void ddlCustomer_SelectedIndexChanged1(object sender, EventArgs e)
        {
            Reload();
        }

        private void Reload()
        {
            var id = ddlCustomer.SelectedValue;
            var url = FriendlyUrl.Href("/Administration", "CustomerDisplay", id);
            Response.Redirect(url);
        }

        private void ShowSelectedCustomer(string id)
        {

            var selectedCustomer = GetSelectedCustomer(id);
            
            lblAddress.Text = selectedCustomer.Address + " " + selectedCustomer.City + " " + selectedCustomer.State + " " + selectedCustomer.ZipCode;

            lblPhone.Text = selectedCustomer.Phone;
            lblEmail.Text = selectedCustomer.Email;
            ddlCustomer.SelectedValue = selectedCustomer.CustomerID;
        }

        private Customer GetSelectedCustomer(string id)
        {
            //get row from SqlDataSource based on value in drop-down list
            DataView customersTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            customersTable.RowFilter = $"CustomerID = '{id}'";
            DataRowView row = customersTable[0];

            //create a new product object and load with data from row
            Customer c = new Customer();
            c.CustomerID = row["CustomerID"].ToString();
            c.Name = row["Name"].ToString();
            c.Address = row["Address"].ToString();
            c.City = row["City"].ToString();
            c.State = row["State"].ToString();
            c.ZipCode = row["ZipCode"].ToString();
            c.Phone = row["Phone"].ToString();
            c.Email = row["Email"].ToString();
            return c;
        }

        protected void btnAddToContactList_Click(object sender, EventArgs e)
        {
            var selectedCustomer = GetSelectedCustomer(ddlCustomer.SelectedValue);
            CustomerList cart = CustomerList.GetCustomers();
            Customer cartItem = cart[selectedCustomer.CustomerID];

            if (cartItem == null)
            {
                cart.AddItem(selectedCustomer);
            }


            Response.Redirect("/Administration/ContactDisplay");
        }

        

        protected void btnDisplayContactList_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Administration/ContactDisplay");
        }

       
    }
}