using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CryptoSight.AppCode;

namespace CryptoSight
{
    public partial class transaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (CryptoCurrency.Dict.Count == 0) {
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
            }
        }

        protected void BuyButton_Click(object sender, EventArgs e)
        {
            CryptoCurrency.UpdateCoin(SelectedCoin.Text, int.Parse(quantity.Text));
            Response.Redirect("/Pages/Dashboard/Dashboard.aspx");
        }

        protected void SellButton_Click(object sender, EventArgs e)
        {
            string coin = SelectedCoin.Text;
            int quantityToSell = int.Parse(quantity.Text);

            if (CryptoCurrency.Dict.ContainsKey(coin) && CryptoCurrency.Dict[coin].Holding >= quantityToSell)
            {
                CryptoCurrency.UpdateCoin(coin, -quantityToSell); 
                Response.Redirect("/Pages/Dashboard/Dashboard.aspx");
            }
            else
            {
                
                Response.Redirect("/Pages/Transaction/transaction.aspx?error=insufficient_quantity");
            }
        }
        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pages/Dashboard/Dashboard.aspx");
        }
    }
}