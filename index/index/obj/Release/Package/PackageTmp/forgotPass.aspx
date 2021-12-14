<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotPass.aspx.cs" Inherits="index.WebForm3" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sign in </title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.js"></script>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/stylesheet.css">
    <link href="css/StyleSheet1.css" rel="stylesheet" />
   <script src="js/swalert.js" type="text/javascript"></script>
    <script>
        function alertme() {
            swal.fire(
                'congratulations!',
                'We send your password to your email, Please check your email, Thank you.',
                'success'
            )
        }
    </script>
</head>
<body>
    <form runat="server">
    <div class="body1">
                  
    <br />
    <br />
        <div class="main">
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-form">
                            <h2 class="form-title">password recovery <img src="img/customer.png" alt="" width="50" height="50" /></h2>
                                     <div class="form-group d-inline">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox1" runat="server" ErrorMessage="You must enter an Email" ForeColor="Red"></asp:RequiredFieldValidator >
        <asp:TextBox ID="TextBox1" CssClass="form-control mb-2" placeholder="Email"  runat="server"></asp:TextBox> 
        <asp:Button ID="Button1" OnClick="Button1_Click" Class="btn btn-primary" runat="server" Text="Submit" />   
        <asp:Label ID="Label1"  runat="server" Text=""></asp:Label>
        <div class="back-to-shop"><a href="HomePage.aspx">&leftarrow;</a><span class="text-muted">Back to Home</span></div>
                                     </div>
                                     </div>
                        <div class="signup-image">
                                         <img src="img/SIGNUP.jpg" height="1500" width="1500" alt="sing up image">
                                     </div>
                                    </div>
                                     
                               </div>
                             </section>
                       </div>
                     </div>
                   </form>     
</body>
</html>
