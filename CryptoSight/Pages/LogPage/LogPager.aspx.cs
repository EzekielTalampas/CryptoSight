using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CryptoSight.AppCode;

namespace CryptoSight.Pages.LogPage {
    public partial class LogPager : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
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
        protected void Parse(object sender, EventArgs e) {
            string[] User = LogIn.GetUsers(txtUsername.Text);
            if (RegisterStatus.Value == "true") {
                if (User != null) {
                    txtUsername.Text = "Username already taken!";
                    txtUsername.Focus();
                    return;
                }
                Debug.WriteLine($"USER {txtUsername.Text} HAS REGISTERED SUCCESSFULLY");
                LogIn.RegisterUser(txtUsername.Text, Password.Text);
            } else if (RegisterStatus.Value == "false") {
                if (User == null) {
                    txtUsername.Text = "User not found!";
                    txtUsername.Focus();
                    Debug.WriteLine($"USERNAME CHECK FAILED");
                    return;
                }
                if (User[1] != Password.Text) {
                    Password.Text = "Wrong Password!";
                    Password.Focus();
                    Debug.WriteLine($"PASSWORD CHECK FAILED {User[1]}");
                    return;
                }
                Debug.WriteLine($"USER {User[0]} HAS LOGGED IN SUCCESSFULLY");
                CryptoCurrency.Username = User[0];
                Response.Redirect("/Pages/DashBoard/Dashboard.aspx");
            }
        }
    }
}