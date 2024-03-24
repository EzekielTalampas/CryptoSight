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
            new CryptoCurrency("DCC", "Default Crypto Company", 0.00f);
            new CryptoCurrency("SHQ", "SHAWALA", 0.00f);
            new CryptoCurrency("DCC2", "Default Crypto Company2", 0.00f);
            new CryptoCurrency("DCC3", "Default Crypto Company3", 0.00f);
            CryptoCurrency.Fetch();
        }

        protected void addTransactionButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pages/Transaction/transaction.aspx");
        }
    }
}