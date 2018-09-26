using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SportsPro.Models;

namespace SportsPro
{
    public partial class CustomerSurvey : System.Web.UI.Page
    {
        private DataView incidentTableList;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            txtEnterYourCustomerID.Focus();

            txtAdditionalComments.Text = "";
            lblCustomerIDMessage.Text = "";
            enableControls(false);

        }

        public void enableControls(bool status)
        {

            rdolstResponseTime.Enabled = status;
            rdolstTechnicianEfficiency.Enabled = status;
            rdolstProblemResolution.Enabled = status;
            txtAdditionalComments.Enabled = status;
            cbxPleaseContactMeToDiscussThisIncident.Enabled = status;
            rdoContactByEmail.Enabled = status;
            rdoContactByPhone.Enabled = status;
            btnSubmit.Enabled = status;
        }

        protected void btnGetIncidents_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {


                incidentTableList = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

                incidentTableList.RowFilter = $"CustomerID = {txtEnterYourCustomerID.Text} And DateClosed Is Not Null";

                if (incidentTableList.Count > 0)
                {
                    this.displayIncidentsList();


                    lstIncidents.SelectedIndex = 0;
                    lstIncidents.Focus();


                    enableControls(true);

                }
                else
                {
                    lblCustomerIDMessage.Text = "This Customer has no incidents";
                }
            }
        }

        public void displayIncidentsList()
        {
            lstIncidents.Items.Clear();
            lstIncidents.Items.Add(new ListItem("--Select an Incident--", "none"));
            foreach (DataRowView row in incidentTableList)
            {
                Incident i = new Incident();
                i.IncidentID = int.Parse(row["IncidentID"].ToString());
                i.CustomerID = int.Parse(row["CustomerID"].ToString());
                i.ProductCode = row["ProductCode"].ToString();
                i.TechID = row["TechID"].ToString();
                i.DateOpened = row["DateOpened"].ToString();
                i.DateClosed = row["DateClosed"].ToString();
                i.Title = row["Title"].ToString();
                i.Description = row["Description"].ToString();
                lstIncidents.Items.Add(new ListItem(i.CustomerIncidentDisplay(), i.IncidentID.ToString()));

            }
        }

        protected void validatorsGroup_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "customerID")
            {
                Page.Validate("CustomerID");
            }
            else
            {
                Page.Validate("Survey");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Survey survey_object = new Survey();
                survey_object.CustomerID = int.Parse(txtEnterYourCustomerID.Text);
                string k = lstIncidents.SelectedValue;
                survey_object.IncidentID = int.Parse(lstIncidents.SelectedValue);
                if (rdolstResponseTime.SelectedIndex != -1)
                {
                    survey_object.ResponseTime = int.Parse(rdolstResponseTime.SelectedValue);
                }

                if (rdolstTechnicianEfficiency.SelectedIndex != -1)
                {
                    survey_object.TechEfficiency = int.Parse(rdolstTechnicianEfficiency.SelectedValue);
                }

                if (rdolstProblemResolution.SelectedIndex != -1)
                {
                    survey_object.Resolution = int.Parse(rdolstProblemResolution.SelectedValue);
                }

                survey_object.Comments = txtAdditionalComments.Text;

                if (cbxPleaseContactMeToDiscussThisIncident.Checked)
                {
                    survey_object.Contact = true;
                    if (rdoContactByEmail.Checked)
                    {
                        survey_object.ContactBy = "Email";
                    }
                    else if (rdoContactByPhone.Checked)
                    {
                        survey_object.ContactBy = "Phone";
                    }
                }
                else
                {
                    survey_object.Contact = false;
                }
                Session.Add("Contact", survey_object.Contact);

                Response.Redirect("/SurveyComplete");
            }

        }
    }
}