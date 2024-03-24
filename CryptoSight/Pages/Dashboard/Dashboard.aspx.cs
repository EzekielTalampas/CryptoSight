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
            //REMOVE THIS AFTER DEVELOPMENT///////////// note: remember to remove dummy transactions on .mdf after removal
            new CryptoCurrency("DCC", "Default Crypto Company", 0.00f);
            new CryptoCurrency("SHQ", "SHAWALA", 0.00f);
            new CryptoCurrency("DCC2", "Default Crypto Company2", 0.00f);
            new CryptoCurrency("DCC3", "Default Crypto Company3", 0.00f);
            ////////////////////////////////////////////

            new CryptoCurrency("BTC", "Bitcoin", 0.00f, "/Assets/Icons/BTC.png");
            new CryptoCurrency("ETH", "Ethereum", 0.00f, "/Assets/Icons/ETH.png");
            new CryptoCurrency("BNB", "BNB", 0.00f, "/Assets/Icons/BNB.png");
            new CryptoCurrency("SOL", "Solana", 0.00f, "/Assets/Icons/SOL.png");
            new CryptoCurrency("XRP", "Ripple", 0.00f, "/Assets/Icons/XRP.png");
            new CryptoCurrency("ADA", "Cardano", 0.00f, "/Assets/Icons/ADA.png");
            new CryptoCurrency("DOGE", "Dogecoin", 0.00f, "/Assets/Icons/DOGE.png");
            new CryptoCurrency("TRX", "Tron", 0.00f, "/Assets/Icons/TRON.png");
            new CryptoCurrency("LINK", "Chainlink", 0.00f, "/Assets/Icons/CHAINLINK.png");
            new CryptoCurrency("DOT", "Polkadot", 0.00f, "/Assets/Icons/POLKADOT.png");
            CryptoCurrency.Fetch();
        }

        protected void addTransactionButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pages/Transaction/transaction.aspx");
        }
    }
}