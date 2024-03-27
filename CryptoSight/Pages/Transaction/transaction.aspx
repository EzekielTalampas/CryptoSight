<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="transaction.aspx.cs" Inherits="CryptoSight.transaction" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Transaction</title>
    <link rel="stylesheet" href="transactions.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="transaction-form">
            <h2>Add Transaction</h2>
            <div class="form-group">
                <label for="currency">Select Cryptocurrency</label>
                <asp:DropDownList ID="SelectedCoin" runat="server" CssClass="input-control">
                    <asp:ListItem Selected="True" Value="BTC">BTC</asp:ListItem>
                    <asp:ListItem Value="ETH">ETH</asp:ListItem>
                    <asp:ListItem Value="BNB">BNB</asp:ListItem>
                    <asp:ListItem Value="SOL">SOL</asp:ListItem>
                    <asp:ListItem Value="XRP">XRP</asp:ListItem>
                    <asp:ListItem Value="ADA">ADA</asp:ListItem>
                    <asp:ListItem Value="DOGE">DOGE</asp:ListItem>
                    <asp:ListItem Value="TRX">TRX</asp:ListItem>
                    <asp:ListItem Value="LINK">LINK</asp:ListItem>
                    <asp:ListItem Value="DOT">DOT</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="quantity">Quantity</label>
                <asp:TextBox ID="quantity" runat="server" TextMode="Number" CssClass="input-control"></asp:TextBox>
                <asp:RangeValidator runat="server" ControlToValidate="quantity" ErrorMessage="Enter a number above 0"
                    Type="Integer" MinimumValue="1" MaximumValue="2147483647" ForeColor="Red"></asp:RangeValidator>
            </div>

            <div class="btn-group">
                <asp:Button ID="buyButton" runat="server" Text="BUY" CssClass="buy-btn" OnClick="BuyButton_Click" />
                <asp:Button ID="sellButton" runat="server" Text="SELL" CssClass="sell-btn" OnClick="SellButton_Click" />
                <asp:Button ID="backButton" runat="server" Text="Cancel" CssClass="back-btn" OnClick="BackButton_Click" />
            </div>
        </div>
    </form>
</body>
</html>
