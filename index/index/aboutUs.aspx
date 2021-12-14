<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aboutUs.aspx.cs" Inherits="index.StartedPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/stylesheet.css">
               <script src="swalert.js" type="text/javascript"></script>

    <script>
        function alertme() {
            swal.fire(
                'Thanks for contacting us!',
                'We will be in touch with you shortly.',
                'success'
            )
        }
    </script>
    <style>
        .social-link {
  width: 30px;
  height: 30px;
  border: 1px solid #ddd;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #666;
  border-radius: 50%;
  transition: all 0.3s;
  font-size: 0.9rem;
}
        img{
            border-radius:;
        }

.social-link:hover,
.social-link:focus {
  background: #ddd;
  text-decoration: none;
  color: #555;
}

/**/
#header {
    background-image: url("img/Banner1.png");
    background-size:200vh;
    background-position: center;
    height: 200vh;
}



.header-text {
    text-align: center;
    color: black;
    padding-top: 200px;
}

    .header-text h1 {
        font-size: 70px;
        color: black;
        text-transform: uppercase;
    }

    .header-text p {
        font-size: 20px;
        font-style: italic;
        color: black;
    }

.header-botton {
    margin: 300px auto 0;
}

    .header-botton a {
        width: 150px;
        text-decoration: none;
        display: inline-block;
        margin: 0 10px;
        padding: 12px 0;
        color: #f5f5f5;
        border: .5px solid #f5f5f5;
        position: relative;
        z-index: 1;
        transition: color 0.5s;
    }

        .header-botton a span {
            width: 0;
            height: 100%;
            position: absolute;
            top: 0%;
            left: 0%;
            background-color: #f5f5f5;
            z-index: -1;
            transition: 0.5s;
        }

        .header-botton a:hover span {
            width: 100%;
        }

        .header-botton a:hover {
            color: #ff0000;
        }
       

.photo{
  position:page;
  display: block;
}

.photo img{
  
  object-fit: cover;
  display: block;
  transition: all .3s cubic-bezier(0.645, 0.045, 0.355, 1);
  margin-top: -20px;
}

.photo:hover img{
  box-shadow: 1px 1px 10px 0 lightblue;
}




.photo:hover .glow{
  transform: rotate(45deg) translate(450%, 0);
  transition: all 1s cubic-bezier(0.645, 0.045, 0.355, 1);
}

.photo:hover img,
.photo:hover .glow-wrap{
  margin-top: 0;
}




/* Ends */



#author:hover{
  color: #111;
}



Resources
    </style>
</head>
<body>
    
    <div id="header">
    <div class="header-text">
            <div class="header-botton">
                <a href="sign in.aspx"><span></span>Sign In</a>
                <a href="HomePage.aspx"><span></span>Home Page</a>
            </div>
        </div>
    <form id="form1" runat="server">
    <div class="bg-light">
  <div class="container py-5">
    <div class="row h-100 align-items-center py-5">
      <div class="col-lg-6">
        <h1 class="display-4">About us</h1>
        <p class="lead text-muted mb-0">FLAWLESS Co. is a global auction website that established in 2021
                            and connects millions of buyers and sellers in more than 60 markets around the world. 
                            We exist to make economic opportunity easy for individuals, entrepreneurs, businesses and organizations.</p>
      </div>
      <div class="col-lg-6 d-none d-lg-block"><a class="photo"><img src="img/Logohq.png" alt="" class="img-fluid"></a></div>
    </div>
  </div>
</div>
        
<div class="bg-white py-5">
  <div class="container py-5">
    <div class="row align-items-center mb-5">
      <div class="col-lg-6 order-2 order-lg-1"><i class="fa fa-bar-chart fa-2x mb-3 text-primary"></i>
        <h2 class="font-weight-black">24/7 Customer service.</h2>
        <p class="font-italic text-muted mb-4">Dont worry,any help any time.</p><a href="ContactUs.aspx" class="btn btn-light px-5 rounded-pill shadow-sm">Learn More</a>
      </div>
      <div class="col-lg-5 px-5 mx-auto order-1 order-lg-2">
                    <a class="photo">  
          <img src="img/no-bg.png" alt="" width="500" class="img-fluid-100 mb-4 mb-lg-0"></a></div>
    </div>
      
    <div class="row align-items-center">
      <div class="col-lg-5 px-5 mx-auto">
          <a class="photo">  
          <img src='https://bootstrapious.com/i/snippets/sn-about/img-2.jpg'class="img-fluid-50 mb-4 mb-lg-0" width='350' />
</a>
</div>
      <div class="col-lg-6"><i class="fa fa-leaf fa-2x mb-3 text-primary"></i>
        <h2 class="font-weight-light">Product Diversity!</h2>
        <p class="font-italic text-muted mb-4">You gonna find vairty of product that serves you in your life at your home.</p><a href="HomePage.aspx" class="btn btn-light px-5 rounded-pill shadow-sm">Learn More</a>
      </div>
    </div>
    <div class="row align-items-center mb-5">
      <div class="col-lg-6 order-2 order-lg-1"><i class="fa fa-bar-chart fa-2x mb-3 text-primary"></i>
        <h2 class="font-weight-black">Bid.</h2>
        <p class="font-italic text-muted mb-4">It's your choice,if are you the higher bidder so you are the winner,but if you are the cash one you can buy the product whenever!</p><a href="HomePage.aspx" class="btn btn-light px-5 rounded-pill shadow-sm">Learn More</a>
      </div>
      <div class="col-lg-5 px-5 mx-auto order-1 order-lg-2">
                    <a class="photo">  
          <img src="img/auc-go.jpg" alt="" width="500" class=" img-fluid-100 mb-4 mb-lg-0">
</a>
      </div>

    </div>
       <div class="row align-items-center">
      <div class="col-lg-5 px-5 mx-auto">
          <a class="photo">  
          <img src='img/money-1.png'class="img-fluid-50 mb-4 mb-lg-0" width='350' />
</a>
</div>
      <div class="col-lg-6"><i class="fa fa-leaf fa-2x mb-3 text-primary"></i>
        <h2 class="font-weight-light">Quick purchase.</h2>
        <p class="font-italic text-muted mb-4">Put the products, with variations in the product listing, directly in the consumer basket! With the first click on "buy now" the article is emphasised and all eligible variations are indicated.</p><a href="HomePage.aspx" class="btn btn-light px-5 rounded-pill shadow-sm">Learn More</a>
      </div>
    </div>
  </div>
</div>

<div class="bg-light py-5">
  <div class="container py-5">
    <div class="row mb-4">
      <div class="col-lg-5">
        <h2 class="display-4 font-weight-light justify-content-center">Our team</h2>
      </div>
    </div>
      
    <div class="row justify-content-center">
      <!-- Team item-->
        
      <div class="col-xl-3 col-sm-6 mb-5">
          <a class="photo">
        <div class="bg-white rounded shadow-sm py-5 px-4"><img src="img/generaluser.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
          <h5 class="mb-0">Saeed asiri</h5><span class="small text-uppercase text-muted">CEO - Founder</span>
          <ul class="social mb-0 list-inline mt-3">
            <li class="list-inline-item"><a href="#" class="social-link"><img src="img/LinkedIn_icon_circle.svg.png" alt="" width="20" height="20"></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><img src="img/25231.png" alt="" width="20" height="20"></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><img src="img/instagram-circle-icon-png-4.jpg" alt="" width="20" height="20"></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><img src="img/unnamed.png" alt="" width="20" height="20"></a></li>
          </ul>
        </div>
      </div>
            </a>
      <!-- End-->

      <!-- Team item-->
        <a class="photo">
      <div class="col-xl-3 col-sm-6 mb-5">
        <div class="bg-white rounded shadow-sm py-5 px-4"><img src="img/generaluser.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
          <h5 class="mb-0">Nawaf aljuaid</h5><span class="small text-uppercase text-muted">CEO - Founder</span>
          <ul class="social mb-0 list-inline mt-3">
            <li class="list-inline-item"><a href="#" class="social-link"><img src="img/LinkedIn_icon_circle.svg.png" alt="" width="20" height="20"></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><img src="img/25231.png" alt="" width="20" height="20"></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><img src="img/instagram-circle-icon-png-4.jpg" alt="" width="20" height="20"></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><img src="img/unnamed.png" alt="" width="20" height="20"></a></li>
          </ul>
        </div>
      </div>
            </a>
      <!-- End-->
    </div>
  </div>
</div>
                    <h5 id="explore" style="font-weight:800;"> <span class="text-center">Contact Us</span></h5>

        <section class="content">

      <!-- Default box -->
                <div class="container">
      <div class="card">
        <div class="card-body row">
          <div class="col-5 text-center d-flex align-items-center justify-content-center">
            <div class="">
              <div class="row text-center">
                       <div class=" mb-4">
                        <h6 class="text-uppercase fw-bold">Contact</h6>
                        <hr class="mb-4 mt-0 d-inline-block " style="width: 60px; background-color: #ffffff; height: 2px"/>
                        <p><img src="img/home.png" height="20" width="20"/>  Jeddah, Al-Manar 3433, KSA</p>
                        <p><img src="img/mail.png" height="20" width="20"/>   info@flawless.com</p>
                        <p><img src="img/phone-call.png" height="20" width="20"/> + 012 534 5678</p>
                    </div>
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
                <asp:Button ID="Button1"  class="btn btn-warning" OnClick="Button1_click" runat="server" Text="Send message" />
            </div>
          </div>
        </div>
      </div>
                    </div>
                </section>
        <br />
        <div class="jumbotron text-center" style="padding:0px 0px; margin-bottom:0px;">
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
                        <p><a href="aboutUs" class="text-white" style="text-decoration: none;"> About</a></p>
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
