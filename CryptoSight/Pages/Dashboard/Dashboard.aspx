<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CryptoSight.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Coin</title>
    <link href="dashboard.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="dashboard.js"></script>
</head>
<body>
    <header class="dashboard-header">
        <h1>CoinSight</h1>
        <div class="total-assets">
            <span>Total aAssets</span>
            <div class="amount">0.00 USD</div>
        </div>
    </header>
    <form id="form1" runat="server">
        <section class="tabs">
            <div class="tab" onclick="switchTab('top-10')">Top 10</div>
            <div class="tab" onclick="switchTab('portfolio')">Portfolio</div>
        </section>


        <section id="top-10" class="crypto-list">
            <div class="Cryptos">
                <div class="Crypto">
                    <div class="logo">
                        <asp:Image ID="Image1" runat="server" ImageUrl="/Assets/Icons/BTC.png" AlternateText="Bitcoin Logo" />
                    </div>
                    <div class="CryptoIdentification">
                        <p class="CryptoAbbreviation">BTC</p>
                        <p>Bitcoin</p>
                    </div>
                    <div class="CryptoRight">
                        <p>$<span id="bitcoin" runat="server"></span></p>
                    </div>
                </div>
                <div class="Crypto">
                    <div class="logo">
                        <asp:Image ID="Image2" runat="server" ImageUrl="/Assets/Icons/ETH.png" AlternateText="Bitcoin Logo" />
                    </div>
                    <div class="CryptoIdentification">
                        <p class="CryptoAbbreviation">ETH</p>
                        <p>Ethereum</p>
                    </div>
                    <div class="CryptoRight">
                        <p>$<span id="ethereum" runat="server"></span></p>
                    </div>
                </div>
                <div class="Crypto">
                    <div class="logo">
                        <asp:Image ID="Image3" runat="server" ImageUrl="/Assets/Icons/BNB.png" AlternateText="Bitcoin Logo" />
                    </div>
                    <div class="CryptoIdentification">
                        <p class="CryptoAbbreviation">BNB</p>
                        <p>BNB</p>
                    </div>
                    <div class="CryptoRight">
                        <p>$<span id="bnb" runat="server"></span></p>
                    </div>
                </div>
                <div class="Crypto">
                    <div class="logo">
                        <asp:Image ID="Image4" runat="server" ImageUrl="/Assets/Icons/SOL.png" AlternateText="Bitcoin Logo" />
                    </div>
                    <div class="CryptoIdentification">
                        <p class="CryptoAbbreviation">SOL</p>
                        <p>Solana</p>
                    </div>
                    <div class="CryptoRight">
                        <p>$<span id="solana" runat="server"></span></p>
                    </div>
                </div>
                <div class="Crypto">
                    <div class="logo">
                        <asp:Image ID="Image5" runat="server" ImageUrl="/Assets/Icons/XRP.png" AlternateText="Bitcoin Logo" />
                    </div>
                    <div class="CryptoIdentification">
                        <p class="CryptoAbbreviation">XRP</p>
                        <p>Ripple</p>
                    </div>
                    <div class="CryptoRight">
                        <p>$<span id="xrp" runat="server"></span></p>
                    </div>
                </div>
                <div class="Crypto">
                    <div class="logo">
                        <asp:Image ID="Image6" runat="server" ImageUrl="/Assets/Icons/ADA.png" AlternateText="Bitcoin Logo" />
                    </div>
                    <div class="CryptoIdentification">
                        <p class="CryptoAbbreviation">ADA</p>
                        <p>Cardano</p>
                    </div>
                    <div class="CryptoRight">
                        <p>$<span id="cardano" runat="server"></span></p>
                    </div>
                </div>
                <div class="Crypto">
                    <div class="logo">
                        <asp:Image ID="Image7" runat="server" ImageUrl="/Assets/Icons/DOGE.png" AlternateText="Bitcoin Logo" />
                    </div>
                    <div class="CryptoIdentification">
                        <p class="CryptoAbbreviation">DOGE</p>
                        <p>Dogecoin</p>
                    </div>
                    <div class="CryptoRight">
                        <p>$<span id="dogecoin" runat="server"></span></p>
                    </div>
                </div>
                <div class="Crypto">
                    <div class="logo">
                        <asp:Image ID="Image8" runat="server" ImageUrl="/Assets/Icons/TRON.png" AlternateText="Bitcoin Logo" />
                    </div>
                    <div class="CryptoIdentification">
                        <p class="CryptoAbbreviation">TRX</p>
                        <p>Tron</p>
                    </div>
                    <div class="CryptoRight">
                        <p>$<span id="tron" runat="server"></span></p>
                    </div>
                </div>
                <div class="Crypto">
                    <div class="logo">
                        <asp:Image ID="Image9" runat="server" ImageUrl="/Assets/Icons/CHAINLINK.png" AlternateText="Bitcoin Logo" />
                    </div>
                    <div class="CryptoIdentification">
                        <p class="CryptoAbbreviation">LINK</p>
                        <p>Chainlink</p>
                    </div>
                    <div class="CryptoRight">
                        <p>$<span id="chainlink" runat="server"></span></p>
                    </div>
                </div>
                <div class="Crypto">
                    <div class="logo">
                        <asp:Image ID="Image10" runat="server" ImageUrl="/Assets/Icons/POLKADOT.png" AlternateText="Bitcoin Logo" />
                    </div>
                    <div class="CryptoIdentification">
                        <p class="CryptoAbbreviation">DOT</p>
                        <p>Polkadot</p>
                    </div>
                    <div class="CryptoRight">
                        <p>$<span id="polkadot" runat="server"></span></p>
                    </div>
                </div>

            </div>
            
        </section>

        <section id="portfolio" class="crypto-list hidden">
            <div class="add-transaction">
                <asp:Button ID="addTransactionButton" runat="server" Text="Add Transaction" CssClass="add-transaction-btn" OnClick="addTransactionButton_Click" />
            </div>
        </section>
    </form>
</body>
</html>
