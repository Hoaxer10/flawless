<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPost.aspx.cs" Inherits="index.AddPost" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>add post</title>
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
        <div class="main">
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Add post</h2>
                                        <img src="img/pro-icon.png" height="70" width="70"/>
                                     <div class="form-group d-inline">
                                         <asp:TextBox ID="TextBox6" Visible="false" runat="server"></asp:TextBox>
<%--                                      <asp:Label ID="Label3" runat="server" Visible="false" Text="Label"></asp:Label>--%>
                                     <asp:TextBox ID="TextBox3"  placeholder="Product Name"  runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox3"  runat="server" ErrorMessage="Please Enter Product Name"><span class="text-danger">*</span></asp:RequiredFieldValidator>
                                     </div>
                                     <div class="form-group">
                                     <asp:TextBox ID="TextBox2" placeholder="Product Description"  runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBox2"  runat="server" ErrorMessage="Please Enter Product description"><span class="text-danger">*</span></asp:RequiredFieldValidator>
                                     </div>
                                     <div class="form-group d-inline ">
                                     <asp:TextBox ID="TextBox4"  placeholder="Base Price" type="number"  runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox4"  runat="server" ErrorMessage="Please Enter Base Price">*</asp:RequiredFieldValidator>
                                     </div>
                                     <div class="form-group">
                                     <asp:TextBox ID="TextBox1"  placeholder="Max price" type="number" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="TextBox1"  runat="server" ErrorMessage="Please Enter Max Price"><span class="text-danger">*</span></asp:RequiredFieldValidator>
                                     </div>
                                     <div class="form-group">
                                     <asp:TextBox ID="TextBox5" type="date"  placeholder="End date" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox5" ErrorMessage="Please Enter End Date"><span class="text-danger">*</span></asp:RequiredFieldValidator>
                                     </div>
                                     <div class="form-group d-inline">
                                     <asp:Label ID="Label4" runat="server" Text="">Product image</asp:Label>
                                     <asp:FileUpload ID="FileUpload1" runat="server" /> 
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="FileUpload1" runat="server" ForeColor="Red" ErrorMessage="Please select an image for your product"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ErrorMessage="Only image files are allowed" 
                                    ControlToValidate="FileUpload1" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.JPG|.gif|.GIF|.png|.PNG|.bmp|.BMP)$">
                                    </asp:RegularExpressionValidator>
                                     </div>
                                     <div class="form-group">
                                     <asp:Label ID="Label5" runat="server" Text="Label">Category</asp:Label>                                        
                                     <asp:DropDownList ID="DropDownList1" runat="server">
                                     <asp:ListItem>Electronics</asp:ListItem>
                                     <asp:ListItem>Toys</asp:ListItem>
                                     <asp:ListItem>Fashion</asp:ListItem>
                                     <asp:ListItem>Cars</asp:ListItem>
                                     <asp:ListItem>Beauty</asp:ListItem>
                                     <asp:ListItem>Skincare</asp:ListItem>
                                     <asp:ListItem>other</asp:ListItem>
                                      </asp:DropDownList>
                                             </div>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Please choose product category"><span class="text-danger">*</span></asp:RequiredFieldValidator>
                                     
                                      <div class="form-group form-button">
                                     <asp:Button ID="Button1"  OnClick="Button1_Click" runat="server" Text="submit" />
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
</form>
</body>
</html>
