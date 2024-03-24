using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CryptoSight.AppCode;

namespace CryptoSight {
    public partial class Dashboard : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            
        }

        protected void addTransactionButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pages/Transaction/transaction.aspx");
        }
    }
}