using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportsPro.Models
{
    public class Incident
    {
        public int IncidentID { get; set; }
        public int CustomerID { get; set; }
        public string ProductCode { get; set; }
        public string TechID { get; set; }
        public string DateOpened { get; set; }
        public string DateClosed { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string CustomerIncidentDisplay()
        {
            string displayString = string.Format("Incident for product {0} closed {1} ({2})",
                this.ProductCode, this.DateClosed, this.Title);
            return displayString;
        }
    }
}