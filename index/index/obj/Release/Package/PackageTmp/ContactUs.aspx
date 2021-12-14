<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="index.ContactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" href="img/logoicon.png" type="image/png">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.js"></script>
     


    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title> Flawless </title>
    <link rel="stylesheet" href="css/stylesheet.css">
    <script src="https://cdn.jsdelivr.net/npm/lazyload@2.0.0-rc.2/lazyload.js"></script>
           <script src="swalert.js" type="text/javascript"></script>

    <style>
        .he{
            text-align:center;
        }
    </style>
    <script>
        function alertme() {
            swal.fire(
                'Thanks for contacting us!',
                'We will be in touch with you shortly.',
                'success'
            )
        }
    </script>
</head>
    
<body>
    <form id="form1" runat="server">
        <div>
            <header class="he">
        
              <nav class="navbar  navbar-expand-sm navbar-light bg-danger">
  <div class="container-fluid">
    <a class="navbar-brand" href="HomePage.aspx"><img class="" alt="" src="img/logo.png" hight="" width="55"/> FLAWLESS </a>
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">
        <li class="nav-item ">
           <a class="nav-link active" href="HomePage.aspx">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="aboutUs.aspx">About</a>
        </li>
      </ul>
       
      
    </div>
  </div>
      
      
</nav>
                </header>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <section class="content">

      <!-- Default box -->
                <div class="container">
      <div class="card">
        <div class="card-body row">
          <div class="col-5 text-center d-flex align-items-center justify-content-center">
            <div class="">
              <div class="signup-image">
                      <img src="img/SIGNUP.jpg" height="500" width="500" alt="sing up image">
                  </div>
            </div>
          </div>
          <div class="col-7">
            <div class="form-group">
              <label for="inputName">Name</label>
                <asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox1" runat="server" ForeColor="Red" ErrorMessage="Please enter your name"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
              <label for="inputEmail">E-Mail</label>
                <asp:TextBox ID="TextBox2" class="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBox2" runat="server" ForeColor="Red" ErrorMessage="Please enter your email"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
              <label for="inputSubject">Subject</label>
                <asp:TextBox ID="TextBox3" class="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox3" runat="server" ForeColor="Red" ErrorMessage="Please enter subject"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
              <label for="inputMessage">Message</label>
                <asp:TextBox ID="TextBox4" class="form-control" Rows="4" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBox4" runat="server" ForeColor="Red" ErrorMessage="Please enter your message"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Button ID="Button1" OnClick="Button1_Click" class="btn btn-warning" runat="server" Text="Send message" />
            </div>
          </div>
        </div>
      </div>
                    </div>
                </section>
            <br />

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
        </div>
    </form>
</body>
</html>
