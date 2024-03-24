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
                <select id="currency" runat="server" class="input-control">
                    <option value="BTC">BTC</option>
                    <option value="ETH">ETH</option>
                    <option value="BNB">BNB</option>
                    <option value="SOL">SOL</option>
                    <option value="XRP">XRP</option>
                    <option value="ADA">ADA</option>
                    <option value="DOGE">DOGE</option>
                    <option value="TRX">TRX</option>
                    <option value="LINK">LINK</option>
                    <option value="DOT">DOT</option>
                </select>
            </div>
            <div class="form-group">
                <label for="quantity">Quantity</label>
                <asp:TextBox ID="quantity" runat="server" TextMode="Number" CssClass="input-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="total-spent">Total Spent</label>
                <asp:TextBox ID="totalSpent" runat="server" CssClass="input-control"></asp:TextBox>
            </div>
            <div class="btn-group">
                <asp:Button ID="buyButton" runat="server" Text="BUY" CssClass="buy-btn" OnClick="buyButton_Click" />
                <asp:Button ID="sellButton" runat="server" Text="SELL" CssClass="sell-btn" OnClick="sellButton_Click" />
                <asp:Button ID="backButton" runat="server" Text="Cancel" CssClass="back-btn" OnClick="backButton_Click" />
            </div>
        </div>
    </form>
</body>
</html>
