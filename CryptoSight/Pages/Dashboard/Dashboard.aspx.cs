using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CryptoSight.AppCode;

namespace CryptoSight {
    public partial class Dashboard : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            CryptoCurrency.Fetch();
        }

        protected void AddTransactionButton_Click(object sender, EventArgs e)
        {
            Button button = sender as Button;
            string CoinType = button.ID;
            Debug.WriteLine(CoinType);
            Response.Redirect("/Pages/Transaction/transaction.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear(); 
            Response.Redirect("~/Pages/LogPage/LogPager.aspx");
        }
    }
}