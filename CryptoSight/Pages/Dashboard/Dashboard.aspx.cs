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
            CryptoCurrency.List.Clear();
            new CryptoCurrency("DCC", "Default Crypto Company", 0.00f);
            new CryptoCurrency("SHW", "SHAWALA", 32.65f);
            new CryptoCurrency("DCC2", "Default Crypto Company2", 2.00f);
            new CryptoCurrency("DCC3", "Default Crypto Company3", 3.00f);
        }
    }
}