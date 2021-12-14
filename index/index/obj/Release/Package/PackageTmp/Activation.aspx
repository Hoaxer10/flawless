<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Activation.aspx.cs" Inherits="index.Activation" %>

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
                'Your email is activated,Thank you.',
                'success'
            )
        }
    </script>
    <style>
         #overlay {
    position: fixed;
    z-index: 99;
    top: 10px;
    left: 0px;
    background-color: #ffffff;
    width: 100%;
    height: 100%;
    filter: alpha(opacity=80);
    opacity: 0.80;
    -noz-opacity: 0.80;
}


#modalprogress {
    position: absolute;
    top: 30%;
    left: 30%;
    margin: -40px 0 0 55px;
    color: white;
}

body > #modalprogress {
    position: fixed;
}
    </style>
</head>
<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="UpdatePanel1">
             <ProgressTemplate>
                 <div id="overlay">
                     <div id="modalprogress">
                         <div id="theprogress">
                             <asp:Image ID="Image1" runat="server" ImageUrl="img/preload.gif" />     
                         </div>
                     </div>
                 </div>
             </ProgressTemplate>
         </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
    <div class="body1">                  
    <br />
    <br />
        <div class="main">
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-form">
                            <h2 class="form-title">activasion <img src="img/customer.png" alt="" width="50" height="50" /></h2>
                                     <div class="form-group d-inline">
                                    <asp:Label ID="Label1" Visible="false" runat="server" ForeColor="Green" Text="Label"></asp:Label>
                                         <br />
                                    <asp:TextBox ID="TextBox2" CssClass="form-control mb-2" placeholder="Please confirm your Email"  runat="server"></asp:TextBox>
                                    <asp:TextBox ID="TextBox1" Visible="false" CssClass="form-control mb-2" placeholder="Please confirm your activasion code"  runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox1" runat="server" ErrorMessage="You must enter an activasion code" ForeColor="Red"></asp:RequiredFieldValidator>
                                     <asp:Button ID="Button3" CssClass="btn btn-lg btn-primary btn-block" OnClick="Button3_Click" runat="server" Text="Send" />
                                      <asp:Button ID="sendCode" Visible="false" CssClass="btn btn-lg btn-primary btn-block" OnClick="sendCode_Click" runat="server" Text="Verify" />
                                         <asp:Label ID="Label2" Visible="false" runat="server" Text="Label"></asp:Label>
                                         <asp:Label ID="Label3" runat="server" Visible="false" ForeColor="Red" Text="Your email is already activated"></asp:Label>
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
                </ContentTemplate>
            </asp:UpdatePanel>
                   </form>     
</body>
</html>

