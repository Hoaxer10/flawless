<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Messsages.aspx.cs" Inherits="index.Messsages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" href="img/logoicon.png" type="image/png">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sidebars/">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.js"></script>   
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title> My page </title>
        <link rel="stylesheet" href="css/stylesheet.css">

    <script src="https://cdn.jsdelivr.net/npm/lazyload@2.0.0-rc.2/lazyload.js"></script>
    <style>       
        footer{
            position:relative;
            margin-top:150px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-sm navbar-light bg-white text-center">
  <div class="container-fluid">
    <a class="navbar-brand" href="HomePage.aspx"><img class="" alt="" src="img/logo.png" hight="" width="55"/> FLAWLESS </a>
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">
        <li class="nav-item ">
           <a class="nav-link active" href="HomePage.aspx">Home Page</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="aboutUs.aspx">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="ContactUs.aspx">Contact Us</a>
        </li>
      </ul>
        </div>
      </div>
        </nav>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GVmessags" Visible="true" class="table table-bordered table-condensed table-responsive table-hover "   runat="server" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="Id"
                ShowHeaderWhenEmpty="True" CellPadding="10" Width="1000px" CellSpacing="20"> 
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("name") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="sender">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("sender") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="subject">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("subject") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="message">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("message") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="date">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("date") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="jumbotron text-center" style="margin-bottom:0">
  <div class="footer-basic">
        <footer class="bg-danger text-white pt-5 pb-4">
            <div class="container text-center text-md-start mt-2">
                <div class="row text-center">
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <h5 class="text-uppercase font-weight-bold"> Flawless </h5>
                        <hr class="mb-4 mt-0 d-inline-block " style="width: 60px; background-color: #ffffff; height: 2px"/>
                        <p style="text-align:justify"> FLAWLESS Co. is a global auction website that established in 2021
                            and connects millions of buyers and sellers in more than 60 markets around the world. 
                            We exist to make economic opportunity easy for individuals, entrepreneurs, businesses and organizations. </p>
                    </div>
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <h6 class="text-uppercase fw-bold">Usefull Links</h6>
                        <hr class="mb-4 mt-0 d-inline-block " style="width: 60px; background-color: #ffffff; height: 2px"/>
                        <p><a href="#" class="text-white" style="text-decoration: none;"> About</a></p>
                        <p><a href="#" class="text-white" style="text-decoration: none;"> Contact Us</a></p>
                        <p><a href="#" class="text-white" style="text-decoration: none;"> Careers</a></p>
                        <p><a href="#" class="text-white" style="text-decoration: none;"> FAQ </a></p>
                    </div>
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <h6 class="text-uppercase fw-bold">Polices</h6>
                        <hr class="mb-4 mt-0 d-inline-block " style="width: 60px; background-color: #ffffff; height: 2px"/>
                        <p><a href="#" class="text-white" style="text-decoration: none;"> Privacy Policy </a></p>
                        <p><a href="#" class="text-white" style="text-decoration: none;"> Term of Use</a></p>
                    </div>
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <h6 class="text-uppercase fw-bold">Contact</h6>
                        <hr class="mb-4 mt-0 d-inline-block " style="width: 60px; background-color: #ffffff; height: 2px"/>
                        <p><img src="img/home.png" height="20" width="20"/>  Jeddah, Al-Manar 3433, KSA</p>
                        <p><img src="img/mail.png" height="20" width="20"/>   info@flawless.com</p>
                        <p><img src="img/phone-call.png" height="20" width="20"/> + 012 534 5678</p>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
    </form>
</body>
</html>
