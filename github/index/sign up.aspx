<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sign up.aspx.cs" Inherits="index.sign_up" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">
<head>
  <title> Sign in </title>
    <i class="bi bi-box-arrow-in-right"></i>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.js"></script>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/stylesheet.css">
    <link href="css/StyleSheet1.css" rel="stylesheet" />

</head>

<body>
    <form runat="server">
    <div class="body1">
                  
    <br />
    <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="main">
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Sign up</h2>
                                     <div class="form-group d-inline">
                                     <img src="img/user-icon.png" height="20" width="20"/>
                                     <asp:TextBox ID="TextBox1" placeholder="First Name"  runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox1"  runat="server" ErrorMessage="Please Enter First Name"><span class="text-danger">*</span></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="rev" runat="server" ControlToValidate="TextBox1"
                                     ErrorMessage="Spaces are not allowed!" ForeColor="Red" ValidationExpression="[^\s]+" />
                                     </div>
                                     <div class="form-group">
                                     <asp:TextBox ID="TextBox2" placeholder="Last Name"  runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBox2"  runat="server" ErrorMessage="Please Enter Last Name"><span class="text-danger">*</span></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2"
                                     ErrorMessage="Spaces are not allowed!" ForeColor="Red" ValidationExpression="[^\s]+" />
                                     </div>
                                     <div class="form-group d-inline ">
                                         <img src="img/mail-icon.png" height="20" width="20"/>
                                     <asp:TextBox ID="TextBox3" placeholder="Email"  runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox3"  runat="server" ErrorMessage="Please Enter Your Email">*</asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBox3" runat="server" ErrorMessage="Please Enter A Correct Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"><span class="text-danger">*</span></asp:RegularExpressionValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3"
                                     ErrorMessage="Spaces are not allowed!" ForeColor="Red" ValidationExpression="[^\s]+" />
                                     </div>
                                     <div class="form-group">
                                     <asp:TextBox ID="TextBox7" placeholder="Re-enter Your Email"  runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="TextBox7"  runat="server" ErrorMessage="Please Confirm Your Email"><span class="text-danger">*</span></asp:RequiredFieldValidator>
                                     <asp:CompareValidator ID="CompareValidator3" ControlToValidate="TextBox7" ControlToCompare="TextBox3" Operator="Equal" runat="server" ErrorMessage="Email does not match"><span class="text-danger">*</span></asp:CompareValidator>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox7"
                                     ErrorMessage="Spaces are not allowed!" ForeColor="Red" ValidationExpression="[^\s]+" />
                                     </div>
                                     <div class="form-group">
                                     <asp:TextBox ID="TextBox4"  placeholder="Phone No:" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox4" ErrorMessage="Please Enter Your Phone Number"><span class="text-danger">*</span></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox4"
                                     ErrorMessage="Spaces are not allowed!" ForeColor="Red" ValidationExpression="[^\s]+" />
                                     </div>
                                     <div class="form-group d-inline">
                                         <img src="img/lock-icon.png" height="20" width="20"/>
                                     <asp:TextBox ID="TextBox5"  placeholder="Password" type="password" runat="server"></asp:TextBox> 
                                         <ajaxToolkit:PasswordStrength ID="TextBox5_PasswordStrength" TextCssClass="bg-light" runat="server" BehaviorID="TextBox5_PasswordStrength" MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" MinimumUpperCaseCharacters="1" PreferredPasswordLength="6" PrefixText="Password strength : " TargetControlID="TextBox5" />
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBox5" runat="server" ForeColor="Red" ErrorMessage="Please enter an paassword"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox5"
                                     ErrorMessage="Spaces are not allowed!" ForeColor="Red" ValidationExpression="[^\s]+" />
                                     </div>
                                     <div class="form-group">
                                     <asp:TextBox ID="TextBox6"   placeholder="Re-Password" type="password" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="Please Confirm Your Password"><span class="text-danger">*</span></asp:RequiredFieldValidator>
                                     <asp:CompareValidator ID="CompareValidator2" ControlToValidate="TextBox6" ControlToCompare="TextBox5" runat="server" ErrorMessage="password does not match" ForeColor="Red"><span class="text-danger">*</span></asp:CompareValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="TextBox6"
                                     ErrorMessage="Spaces are not allowed!" ForeColor="Red" ValidationExpression="[^\s]+" />
                                     </div>
                                     <div class="form-group">
                                     <asp:CheckBox ID="CheckBox2" runat="server" Text="I agree all statements in" />
                                     </div>
                                     <div class="form-group form-button">
                                     <asp:Button ID="Button1" type="submit" class="btn btn-primary mb-2"  OnClick="Button1_Click" runat="server" Text="Register" />
                                         <br />
                                     <asp:Button ID="Button2" type="submit" class="btn btn-dark"  OnClick="Button2_Click" runat="server" Text="Reset" />
                                                                                  <a href="sign in.aspx" class="signup-image-link">I am already member</a>

                                     <asp:Label ID="Label1" runat="server" Text="Thank you for registering" Visible="False" ForeColor="Green"></asp:Label>
                                         <asp:Label ID="Label2" runat="server" Visible="false" ForeColor="Red" Text="Your email is already exists"></asp:Label>
                                     <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" BorderColor="#3333FF" BorderStyle="Solid" />

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
</div>

   
   
          
    
  </form>
</body>

</html>
