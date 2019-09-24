<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PatientSystem.Login" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="Content/concept-master/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/concept-master/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="Content/concept-master/assets/libs/css/style.css">
    <link rel="stylesheet" href="Content/concept-master/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-align: center;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
        }
    </style>
</head>

<body>
    <!-- ============================================================== -->
    <!-- login page  -->
    <!-- ============================================================== -->
    <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center"><h4>
                Patient Management
                                                 </h4><span class="splash-description">Please enter your user information.</span></div>
            <div class="card-body">
                <form runat="server">
                    <div class="form-group">
                        <asp:TextBox ID="Email" runat="server" class="form-control form-control-lg" placeholder="Email" ValidationGroup="LoginFrame"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Email" ValidationGroup="LoginFrame" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="Password" runat="server" class="form-control form-control-lg" placeholder="Password" TextMode="Password" ValidationGroup="PwdFrame"></asp:TextBox>
                    </div>
                    <asp:Label ID="lblMsg" Text="" runat="server" Style="color: #FF0000; font-weight: 700"></asp:Label>
                    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary btn-block btn-flat" Text="Sign In" OnClick="btnLogin_Click" />
                </form>
            </div>
        </div>
    </div>

    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="Content/concept-master/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="Content/concept-master/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
</body>

</html>
