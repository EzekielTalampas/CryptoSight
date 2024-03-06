<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogPager.aspx.cs" Inherits="CryptoSight.Pages.LogPage.LogPager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link href="LogPager.css" rel="stylesheet" type="text/css" />
    <script src="LogPager.js"></script>
</head>
<body>
    <form id="LogForm" runat="server">
        <h1>CoinSight</h1>
        <div class="ButtonHolder">
            <button class="LogInButton" type="button">Log In</button>
            <button class="RegisterButton" type="button">Sign Up</button>
        </div>
        <div class="Selector"></div>
        <h4>Username</h4>
        <asp:TextBox runat="server" class="txtbox" />
        <div class="Registration">
            <h4>Gmail</h4>
            <asp:TextBox runat="server" class="txtbox" />
        </div>
        <h4>Password</h4>
        <asp:TextBox runat="server" class="txtbox" ID="Pass" TextMode="Password" />
        <div class="Registration">
            <h4>Confirm Password</h4>
            <asp:TextBox runat="server" class="txtbox" ID="confirmPass" TextMode="Password" />
           <asp:CompareValidator runat="server" ControlToValidate="confirmPass" ControlToCompare="Pass" ErrorMessage="Passwords dont match!" ForeColor="Yellow" />
        </div>
        <asp:button runat="server" class="Submit" Text="Log In" />
    </form>
</body>
</html>
