
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sign in.aspx.cs" Inherits="index.sign_in" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sign in </title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.js"></script>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="css/StyleSheet1.css" rel="stylesheet" />
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
                            <h2 class="form-title">Sign In</h2>
                                     <div class="form-group d-inline">
                                     <img src="img/user-icon.png" height="20" width="20"/>
                                    <asp:TextBox ID="TextBox2" CssClass="form-control mb-2" placeholder="Email"  runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox1" runat="server" ErrorMessage="You must enter an Email" ForeColor="Red"><span class="text-danger">*</span></asp:RequiredFieldValidator>
                                     </div>
                                         <div class="form-group">
                                    <asp:TextBox ID="TextBox1" CssClass="form-control mb-2" placeholder="password" type="password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox1" runat="server" ErrorMessage="You must enter a password" ForeColor="Red"><span class="text-danger">*</span></asp:RequiredFieldValidator>                                     </div>
                                    <div class="form-group form-button">
                                     <asp:Button ID="Button3" CssClass="btn btn-lg btn-primary btn-block" OnClick="Button1_Click" runat="server" Text="sign in" />
                                        <a href="#"  onclick="window.open('forgotPass.aspx','FP','width=600,height=700,top=1500,left=1500,fullscreen=no,resizable=0');">forget password?</a>           
        
                                     <asp:Label ID="Label4" runat="server" Visible="false" Text="sign in success" ForeColor="#009933"></asp:Label>
                                        <br />
                                     <asp:Label ID="Label5" runat="server" Visible="false" ForeColor="Red" CssClas="fonts" Text="Your password incorrect"></asp:Label>
                                     <asp:Label ID="Label6" runat="server" Visible="false" ForeColor="Red" Text="Your email incorrect"></asp:Label>
                                     <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
                                        
                                    <p> Don't have an account?, sign up <a href="sign up.aspx">here</a></p>
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


