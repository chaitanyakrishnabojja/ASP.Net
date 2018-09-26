using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsPro.Models;

namespace SportsPro
{
    public partial class SurveyComplete : System.Web.UI.Page
    {
        private bool contact_check;

        protected void Page_Load(object sender, EventArgs e)
        {
            contact_check = (bool)Session["Contact"];
            if (contact_check)
            {
                lblMessage.Text = "A customer service representative will contact you within 24 hours";
            }

        }
    }
}