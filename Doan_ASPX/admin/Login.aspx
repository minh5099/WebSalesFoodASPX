<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Doan_ASPX.admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!--===============================================================================================-->	
	    <link rel="icon" type="image/png" href="<%= Page.ResolveUrl("~/admin/")%>img/icons/favicon.ico"/>
    <!--===============================================================================================-->
	    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/admin/")%>vendor/bootstrap/css/bootstrap.min.css"/>
    <!--===============================================================================================-->
	    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/admin/")%>fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
    <!--===============================================================================================-->
	    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/admin/")%>fonts/Linearicons-Free-v1.0.0/icon-font.min.css"/>
    <!--===============================================================================================-->
	    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/admin/")%>vendor/animate/animate.css"/>
    <!--===============================================================================================-->	
	    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/admin/")%>vendor/css-hamburgers/hamburgers.min.css"/>
    <!--===============================================================================================-->
	    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/admin/")%>vendor/animsition/css/animsition.min.css"/>
    <!--===============================================================================================-->
	    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/admin/")%>vendor/select2/select2.min.css"/>
    <!--===============================================================================================-->	
	    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/admin/")%>vendor/daterangepicker/daterangepicker.css"/>
    <!--===============================================================================================-->
	    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/admin/")%>css/util.css"/>
	    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/admin/")%>css/main.css"/>
    <!--===============================================================================================-->
</head>
<body>
    <form id="Login" runat="server">
        <div class="limiter">
		<div class="container-login100" style="background-image: url('img/bg-01.jpg');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
					Account Login
				</span>
                <div class="login100-form validate-form p-b-33 p-t-5 form-group">
					<div class="wrap-input100 validate-input" data-validate = "Enter Email">
						<!--<input class="input100" type="text" id="txtus" name="username" placeholder="User name"/>-->
                        <asp:TextBox runat="server" CssClass="input100" id="txtEmail" name="Email" placeholder="Email" ></asp:TextBox>
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
					<!--<input class="input100" type="password" id="txtpass" name="pass" placeholder="Password"/>-->
                        <asp:TextBox runat="server" CssClass="input100" id="txtPass" name="username" placeholder="Password" TextMode="Password" ></asp:TextBox>
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>

					<div class="container-login100-form-btn m-t-32">
                        <asp:Button runat="server" CssClass="login100-form-btn" Text="Đăng Nhập" ID="btnLogin" OnClick="login_Click"/>
					</div>
                    <asp:Label runat="server" ID="lblError" CssClass="text-danger  m-l-86"></asp:Label>
                </div>
			</div>
		</div>
	</div>
    </form>
    <!--===============================================================================================-->
	    <script src="<%= Page.ResolveUrl("~/admin/")%>vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
	    <script src="<%= Page.ResolveUrl("~/admin/")%>vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
	    <script src="<%= Page.ResolveUrl("~/admin/")%>vendor/bootstrap/js/popper.js"></script>
	    <script src="<%= Page.ResolveUrl("~/admin/")%>vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
	    <script src="<%= Page.ResolveUrl("~/admin/")%>vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
	    <script src="<%= Page.ResolveUrl("~/admin/")%>vendor/daterangepicker/moment.min.js"></script>
	    <script src="<%= Page.ResolveUrl("~/admin/")%>vendor/daterangepicker/daterangepicker.js"></script>
    <!--===============================================================================================-->
	    <script src="<%= Page.ResolveUrl("~/admin/")%>vendor/countdowntime/countdowntime.js"></script>
    <!--===============================================================================================-->
	    <script src="<%= Page.ResolveUrl("~/admin/")%>js/main.js"></script>
</body>
</html>
