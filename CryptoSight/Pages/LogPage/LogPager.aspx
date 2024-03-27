<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogPager.aspx.cs" Inherits="CryptoSight.Pages.LogPage.LogPager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link href="LogPager.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        let toRegister = false;

        
        document.addEventListener('DOMContentLoaded', function () {

            document.getElementById('<%= RegisterStatus.ClientID %>').value = toRegister;
            
            document.querySelector('.Selector').style.transform =
                'translateX(' + (document.querySelector('.LogInButton').offsetLeft - document.querySelector('#LogForm').offsetLeft) + 'px)';
            for (div of document.querySelectorAll('.Registration')) div.style.display = "none";
            
            document.querySelector('.LogInButton').addEventListener('click', function () {
                if (!toRegister) return;
                toRegister = false;
                document.querySelector('.Selector').style.transform =
                    'translateX(' + (document.querySelector('.LogInButton').offsetLeft - document.querySelector('#LogForm').offsetLeft) + 'px)';
                
                for (div of document.querySelectorAll('.Registration')) div.style.display = "none";
                document.getElementById('<%= RegisterStatus.ClientID %>').value = toRegister;
            })
            
            document.querySelector('.RegisterButton').addEventListener('click', function () {
                if (toRegister) return;
                toRegister = true;
                document.querySelector('.Selector').style.transform =
                    'translateX(' + (document.querySelector('.RegisterButton').offsetLeft - document.querySelector('#LogForm').offsetLeft) + 'px)';
                
                for (div of document.querySelectorAll('.Registration')) div.style.display = "block";
                document.getElementById('<%= RegisterStatus.ClientID %>').value = toRegister;
            })
        })
    </script>
</head>
<body>
    <form id="LogForm" runat="server">
        <asp:HiddenField ID="RegisterStatus" runat="server" Value="Check" ClientIDMode="Static" />
        <h1>CoinSight</h1>
        <div class="ButtonHolder">
            <button class="LogInButton" type="button">Log In</button>
            <button class="RegisterButton" type="button">Sign Up</button>
        </div>
        <div class="Selector"></div>
        <h4>Username</h4>
        <asp:TextBox runat="server" class="txtbox" ID="txtUsername" />
        <div class="Registration">
            <h4>Gmail</h4>
            <asp:TextBox runat="server" class="txtbox" />
        </div>
        <h4>Password</h4>
        <asp:TextBox runat="server" class="txtbox" ID="Password" TextMode="Password" />
        <div class="Registration">
            <h4>Confirm Password</h4>
            <asp:TextBox runat="server" class="txtbox" ID="confirmPass" TextMode="Password" />
           <asp:CompareValidator runat="server" ControlToValidate="confirmPass" ControlToCompare="Password" ErrorMessage="Passwords dont match!" ForeColor="Yellow" />
        </div>
        <asp:button runat="server" class="Submit" Text="Submit" Onclick="Parse"/>
    </form>
</body>
</html>
