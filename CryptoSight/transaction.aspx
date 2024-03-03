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
            <div>
                <label for="currency">BTC Bitcoin</label>
            </div>
            <div>
                <label for="quantity">Quantity</label>
                <asp:TextBox ID="quantity" runat="server" TextMode="Number" CssClass="input-control"></asp:TextBox>
            </div>
            <div>
                <label for="total-spent">Total Spent</label>
                <asp:TextBox ID="totalSpent" runat="server" CssClass="input-control"></asp:TextBox>
            </div>
            <asp:Button ID="buyButton" runat="server" Text="BUY" CssClass="buy-btn" OnClick="buyButton_Click" />
            <asp:Button ID="sellButton" runat="server" Text="SELL" CssClass="sell-btn" OnClick="sellButton_Click" />
        </div>
    </form>
</body>
</html>