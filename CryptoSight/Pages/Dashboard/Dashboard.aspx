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
            <span>Total Assets</span>
            <div class="amount">0.00 USD</div>
        </div>
    </header>
    <form id="form1" runat="server">
        <section class="tabs">
            <div class="tab" onclick="switchTab('top-10')">Top 10</div>
            <div class="tab" onclick="switchTab('portfolio')">Portfolio</div>
        </section>

        <%--  --%>

        <%-- asdasd --%>
        <section id="top-10" class="crypto-list">
            <div class="container">
               <div class="container">
                <div class="coin-price">
                    <asp:Image ID="bitcoinLogo" runat="server" ImageUrl="/Assets/Icons/BTC.png" AlternateText="Bitcoin Logo" />
                    <div>
                        <h1>$<span id="bitcoin" runat="server"></span></h1>
                        <h1>Bitcoin</h1>
                    </div>
                </div>
                <div class="coin-price btc">
                    <div class="logo"><asp:Image ID="ethereumLogo" runat="server" ImageUrl="/Assets/Icons/ETH.png" AlternateText="Ethereum Logo" /></div>
                    <div>
                        <h1>$<span id="ethereum" runat="server"></span></h1>
                        <h1>Ethereum</h1>
                    </div>
                </div>
                <div class="coin-price">
                    <div class="logo"><asp:Image ID="bnbLogo" runat="server" ImageUrl="/Assets/Icons/BNB.png" AlternateText="BNB Logo" /></div>
                    <div>
                        <h1>$<span id="bnb" runat="server"></span></h1>
                        <h1>BNB</h1>
                    </div>
                </div>
                <div class="coin-price">
                    <div class="logo"><asp:Image ID="solLogo" runat="server" ImageUrl="/Assets/Icons/SOL.png" AlternateText="Solana Logo" /></div>
                    <div>
                        <h1>$<span id="solana" runat="server"></span></h1>
                        <h1>Solana</h1>
                    </div>
                </div>
                <div class="coin-price">
                    <div class="logo"><asp:Image ID="xrpLogo" runat="server" ImageUrl="/Assets/Icons/XRP.png" AlternateText="XRP Logo" /></div>
                    <div>
                        <h1>$<span id="xrp" runat="server"></span></h1>
                        <h1>XRP</h1>
                    </div>
                </div>
                <div class="coin-price">
                    <div class="logo"><asp:Image ID="cardanoLogo" runat="server" ImageUrl="/Assets/Icons/ADA.png" AlternateText="Cardano Logo" /></div>
                    <div>
                        <h1>$<span id="cardano" runat="server"></span></h1>
                        <h1>Cardano</h1>
                    </div>
                </div>
                <div class="coin-price">
                    <div class="logo"><asp:Image ID="dogecoinLogo" runat="server" ImageUrl="/Assets/Icons/DOGE.png" AlternateText="Dogecoin Logo"/></div>
                    <div>
                        <h1>$<span id="dogecoin" runat="server"></span></h1>
                        <h1>Dogecoin</h1>
                    </div>
                </div>
                <div class="coin-price">
                    <div class="logo"><asp:Image ID="tronLogo" runat="server" ImageUrl="/Assets/Icons/TRON.png" AlternateText="Tron Logo"/></div>
                    <div>
                        <h1>$<span id="tron" runat="server"></span></h1>
                        <h1>Tron</h1>
                    </div>
                </div>
                <div class="coin-price">
                    <div class="logo"><asp:Image ID="chainlinkLogo" runat="server" ImageUrl="/Assets/Icons/CHAINLINK.png" AlternateText="Chainlink Logo" /></div>
                    <div>
                        <h1>$<span id="chainlink" runat="server"></span></h1>
                        <h1>Chainlink</h1>
                    </div>
                </div>
                <div class="coin-price">
                    <div class="logo"><asp:Image ID="polkadotLogo" runat="server" ImageUrl="/Assets/Icons/POLKADOT.png" AlternateText="Polkadot Logo"/></div>
                    <div>
                        <h1>$<span id="polkadot" runat="server"></span></h1>
                        <h1>Polkadot</h1>
                    </div>
                </div>

            </div>
            </div>
            
        </section>

        <section id="portfolio" class="crypto-list hidden">
            <div class="Cryptos">
                <% foreach (CryptoSight.AppCode.CryptoCurrency crypto in CryptoSight.AppCode.CryptoCurrency.List) { %>
                <div class="Crypto">
                    <img src="<%= crypto.ImagePath %>" />
                    <div class="CryptoIdentification">
                        <p class="CryptoAbbreviation"><%= crypto.Abbreviation %></p>
                        <p><%= crypto.Name %></p>
                    </div>
                    <div class="CryptoRight">
                        <p><%= crypto.Value %></p>
                    </div>
                    <a class="TransactionButton">

                    </a>
                </div>
                <% } %>
            </div>
        </section>
    </form>
</body>
</html>
