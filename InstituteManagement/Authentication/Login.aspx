<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="InstituteManagement.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LoginPage</title>
    <link href="../Css/Login.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="maincontainer">
            <div class="onecontainer">
                <img src="../Image/loginVactores.jpg" />
            </div>
            <div class="secondcontainer">
                <h1>Sign in
                </h1>
                <label for="inp" class="input-container">
                    <asp:TextBox ID="Emailaddress" runat="server" placeholder="&nbsp;" CssClass="input" required="requried"></asp:TextBox>
                    <span class="label">Username or Email Address</span>
                </label>
                <label for="inp" class="input-container">
                    <asp:TextBox ID="Password" runat="server" required="requried" placeholder="&nbsp;" CssClass="input" TextMode="Password"></asp:TextBox>
                    <span class="label">Password</span>
                </label>

                <asp:Button ID="Signin" runat="server" CssClass="button" OnClick="Signin_Click" Text="Sign In" />
                <asp:Label ID="Validornot" runat="server" CssClass="Validornot" Text="" ForeColor="Red"></asp:Label>
            </div>
            <asp:HyperLink ID="ForgetPassword" runat="server" CssClass="ForgetPassword" NavigateUrl="../password/ForgotPassword.aspx">ForgetPassword?..</asp:HyperLink>
        </div>
    </form>
</body>
</html>
