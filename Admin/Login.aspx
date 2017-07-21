<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row paddingTop20">
                <div class="col-md-4 col-md-offset-4 paddingTop100">
                    Username:
                    <asp:TextBox ID="TextBoxUsername" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    Password:
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <br />
                    <asp:Button ID="ButtonLogIn" runat="server" Text="Log in" OnClick="ButtonLogIn_Click" CssClass="btn btn-success btn-block" />
                    <a class="btn btn-primary btn-block" href="../Default.aspx">Tilbage</a>

                    <p style="color: red;">
                        <asp:Literal ID="LiteralMsg" runat="server"></asp:Literal>
                    </p>
                    


                </div>
            </div>
        </div>
    </form>
    <script src="../Scripts/jquery-1.9.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
</body>
</html>
