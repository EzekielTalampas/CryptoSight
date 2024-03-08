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

        <section id="portfolio" class="crypto-list hidden">
            <div class="container">
                <div class="container">
                    <div class="coin-price">
                        <div class="logo"><asp:Image ID="Image10" runat="server" /></div>
                        <div>
                            <h1>$00<span id="Span1" runat="server"></span></h1>
                            <h1>Bitcoin</h1>
                        </div>
                    </div>
                    <div class="coin-price">
                        <div class="logo"><asp:Image ID="Image11" runat="server" /></div>
                        <div>
                            <h1>$00<span id="Span2" runat="server"></span></h1>
                            <h1>Ethereum</h1>
                        </div>
                    </div>
                    <div class="coin-price">
                        <div class="logo"><asp:Image ID="Image12" runat="server" /></div>
                        <div>
                            <h1>$00<span id="Span3" runat="server"></span></h1>
                            <h1>BNB</h1>
                        </div>
                    </div>
                    <div class="coin-price">
                        <div class="logo"><asp:Image ID="Image13" runat="server" /></div>
                        <div>
                            <h1>$00<span id="Span4" runat="server"></span></h1>
                            <h1>Solana</h1>
                        </div>
                    </div>
                    <div class="coin-price">
                        <div class="logo"><asp:Image ID="Image14" runat="server" /></div>
                        <div>
                            <h1>$00<span id="Span5" runat="server"></span></h1>
                            <h1>XRP</h1>
                        </div>
                    </div>
                    <div class="coin-price">
                        <div class="logo"><asp:Image ID="Image15" runat="server" /></div>
                        <div>
                            <h1>$00<span id="Span6" runat="server"></span></h1>
                            <h1>Cardano</h1>
                        </div>
                    </div>
                    <div class="coin-price">
                        <div class="logo"><asp:Image ID="Image16" runat="server" /></div>
                        <div>
                            <h1>$00<span id="Span7" runat="server"></span></h1>
                            <h1>Dogecoin</h1>
                        </div>
                    </div>
                    <div class="coin-price">
                        <div class="logo"><asp:Image ID="Image17" runat="server" /></div>
                        <div>
                            <h1>$00<span id="Span8" runat="server"></span></h1>
                            <h1>Tron</h1>
                        </div>
                    </div>
                    <div class="coin-price">
                        <div class="logo"><asp:Image ID="Image18" runat="server" /></div>
                        <div>
                            <h1>$00<span id="Span9" runat="server"></span></h1>
                            <h1>Chainlink</h1>
                        </div>
                    </div>
                    <div class="coin-price">
                        <div class="logo"><asp:Image ID="Image19" runat="server" /></div>
                        <div>
                            <h1>$00<span id="Span10" runat="server"></span></h1>
                            <h1>Polkadot</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
