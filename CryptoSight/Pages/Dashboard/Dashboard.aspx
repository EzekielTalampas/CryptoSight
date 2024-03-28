<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CryptoSight.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Coin</title>
    <link href="dashboard.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var cachedData = localStorage.getItem('cryptoData');

            if (cachedData) {
                var response = JSON.parse(cachedData);
                updateCryptoPrices(response);
            } else {
                fetchCryptoData();
            }
        });

        function fetchCryptoData() {
            var liveprices = {
                "async": true,
                "crossDomain": true,
                "url": "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,binancecoin,solana,ripple,cardano,dogecoin,tron,chainlink,polkadot&vs_currencies=usd",
                "method": "GET",
                "headers": {}
            };

            $.ajax(liveprices).done(function (response) {
                console.log(response);

                localStorage.setItem('cryptoData', JSON.stringify(response));

                updateCryptoPrices(response);
            }).fail(function (jqXHR, textStatus, errorThrown) {
                console.log("Error:", errorThrown);
            });
        }

        function updateCryptoPrices(response) {
            $("#bitcoin").text(response.bitcoin.usd);
            $("#ethereum").text(response.ethereum.usd);
            $("#bnb").text(response.binancecoin.usd);
            $("#solana").text(response.solana.usd);
            $("#xrp").text(response.ripple.usd);
            $("#cardano").text(response.cardano.usd);
            $("#dogecoin").text(response.dogecoin.usd);
            $("#tron").text(response.tron.usd);
            $("#chainlink").text(response.chainlink.usd);
            $("#polkadot").text(response.polkadot.usd);

            $("#Bitcoin").text("$" + (response.bitcoin.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["BTC"].Holding%>));
            $("#Ethereum").text("$" + (response.ethereum.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["ETH"].Holding%>));
            $("#BNB").text("$" + (response.binancecoin.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["BNB"].Holding%>));
            $("#Solana").text("$" + (response.solana.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["SOL"].Holding%>));
            $("#Ripple").text("$" + (response.ripple.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["XRP"].Holding%>));
            $("#Cardano").text("$" + (response.cardano.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["ADA"].Holding%>));
            $("#Dogecoin").text("$" + (response.dogecoin.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["DOGE"].Holding%>));
            $("#Tron").text("$" + (response.tron.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["TRX"].Holding%>));
            $("#Chainlink").text("$" + (response.chainlink.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["LINK"].Holding%>));
            $("#Polkadot").text("$" + (response.polkadot.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["DOT"].Holding%>));

            $("#TotalCoin").text((
                response.bitcoin.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["BTC"].Holding%> +
                response.ethereum.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["ETH"].Holding%> +
                response.binancecoin.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["BNB"].Holding%> +
                response.solana.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["SOL"].Holding%> +
                response.ripple.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["XRP"].Holding%> +
                response.cardano.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["ADA"].Holding%> +
                response.dogecoin.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["DOGE"].Holding%> +
                response.tron.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["TRX"].Holding%> +
                response.chainlink.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["LINK"].Holding%> +
                response.polkadot.usd * <%= CryptoSight.AppCode.CryptoCurrency.Dict["DOT"].Holding%>).toFixed(2) + "USD");
        }

        function switchTab(tabId) {
            document.querySelectorAll('.crypto-list').forEach(tabContent => {
                tabContent.style.display = 'none';
            });
            document.querySelectorAll('.tabs .tab').forEach(tabButton => {
                tabButton.classList.remove('active');
            });
            document.getElementById(tabId).style.display = 'block';
            document.getElementById(tabId + '-btn').classList.add('active');
        }
        window.addEventListener('load', function () {
            switchTab('top-10');
        });
        function switchTab(tabId) {
            document.querySelectorAll('.crypto-list').forEach(tabContent => {
                tabContent.style.display = 'none';
            });
            document.querySelectorAll('.tabs .tab').forEach(tabButton => {
                tabButton.classList.remove('active');
            });
            document.getElementById(tabId).style.display = 'block';
            document.getElementById(tabId + '-btn').classList.add('active');
        }
        window.addEventListener('load', function () {
            switchTab('top-10');
        });
    </script>
</head>
<body>
    <div class="dashboard-container"> 
    <header class="dashboard-header">
        <h1>CoinSight</h1>
        <div class="total-assets">
            <span>Total Assets</span>
            <div class="amount"><span id="TotalCoin" runat="server"/></div>
        </div>
    </header>
        
    <form id="form1" runat="server">
        <div class="logout-button">
            <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="logout-btn" OnClick="btnLogout_Click" />
        </div>
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
                <asp:Button ID="addTransactionButton" runat="server" Text="Add Transaction" CssClass="add-transaction-btn" OnClick="AddTransactionButton_Click" />
            </div>
            <div class="Cryptos">
                <% foreach (KeyValuePair<string, CryptoSight.AppCode.CryptoCurrency> crypto in CryptoSight.AppCode.CryptoCurrency.Dict) if (crypto.Value.Holding != 0) { %>
                <div class="Crypto">
                    <img src="<%= crypto.Value.ImagePath %>" />
                    <div class="CryptoIdentification">
                        <p class="CryptoAbbreviation"><%= crypto.Value.Abbreviation %></p>
                        <p><%= crypto.Value.Name %></p>
                    </div>
                    <div class="CryptoRight">
                        <p><%= crypto.Value.Holding %></p>
                        <p><span id="<%= crypto.Value.Name %>" /></p>
                    </div>
                </div>
                <% } %>
            </div>
            
        </section>
    </form>
        </div>
</body>
</html>
