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
            //REMOVE THIS AFTER DEVELOPMENT///////////// note: remember to remove dummy transactions on .mdf after removal
            new CryptoCurrency("DCC", "Default Crypto Company");
            new CryptoCurrency("SHQ", "SHAWALA");
            new CryptoCurrency("DCC2", "Default Crypto Company2");
            new CryptoCurrency("DCC3", "Default Crypto Company3");
            ////////////////////////////////////////////

            new CryptoCurrency("BTC", "Bitcoin", "/Assets/Icons/BTC.png");
            new CryptoCurrency("ETH", "Ethereum", "/Assets/Icons/ETH.png");
            new CryptoCurrency("BNB", "BNB", "/Assets/Icons/BNB.png");
            new CryptoCurrency("SOL", "Solana", "/Assets/Icons/SOL.png");
            new CryptoCurrency("XRP", "Ripple", "/Assets/Icons/XRP.png");
            new CryptoCurrency("ADA", "Cardano", "/Assets/Icons/ADA.png");
            new CryptoCurrency("DOGE", "Dogecoin", "/Assets/Icons/DOGE.png");
            new CryptoCurrency("TRX", "Tron", "/Assets/Icons/TRON.png");
            new CryptoCurrency("LINK", "Chainlink", "/Assets/Icons/CHAINLINK.png");
            new CryptoCurrency("DOT", "Polkadot", "/Assets/Icons/POLKADOT.png");
            CryptoCurrency.Fetch();
        }

        protected void addTransactionButton_Click(object sender, EventArgs e)
        {
            Button button = sender as Button;
            string CoinType = button.ID;
            Debug.WriteLine(CoinType);
            Response.Redirect("/Pages/Transaction/transaction.aspx");
        }
    }
}