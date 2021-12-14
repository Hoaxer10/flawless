<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="index.HomePage" %>

<!DOCTYPE html>
<html lang="en">
<head>
   
  <link rel="shortcut icon" href="img/logoicon.png" type="image/png">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.js"></script>
     


    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Flawless </title>
    <link rel="stylesheet" href="css/stylesheet.css">
          <script src="js/swalert.js" type="text/javascript"></script>

    <script src="https://cdn.jsdelivr.net/npm/lazyload@2.0.0-rc.2/lazyload.js"></script>
    <style>
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
.dropdown-menu{
    margin:-30px;
    min-width:fit-content;
}
#overlay{
    position:fixed;
    z-index:99;
    top:10px;
    left:0px;
    background-color:#ffffff;
    width:100%;
    height:100%;
    filter:alpha(opacity=80);
    opacity:0.80;
    -noz-opacity:0.80;
}
#theprogress{
    background-color:aliceblue;
    width:50px;
    height:24px;
    text-align:center;
    filter:alpha(Opacity=100);
    opacity:1;
    -noz-opacity:1;
}
#modalprogress{
    position:absolute;
    top:30%;
    left:30%;
    margin:-40px 0 0 55px;
    color:white;
}
body>#modalprogress{
    position:fixed;
}
    </style>
    <script>
        function menuToggle() {
            const toggleMenu = document.querySelector('.menu');
            toggleMenu.classList.toggle('active')
        };
       
        function alertme() {
            swal.fire(
                'Oops..!',
                'Your account is not verified yet,please activate your account in your page.\nIf your account is not verified you will lose features as buying, bidding and add post.',
                'error'
            )
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="UpdatePanel1">
             <ProgressTemplate>
                 <div id="overlay">
                     <div id="modalprogress">
                         <div id="theprogress">
                             <img alt="load" src="img/preload.gif" />
                         </div>
                     </div>
                 </div>
             </ProgressTemplate>
         </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
    <header>

              <nav class="navbar navbar-expand-sm navbar-light bg-white">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><img class="" alt="" src="img/logo.png" hight="" width="55"/> FLAWLESS </a>
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">
        <li class="nav-item ">
           <a class="nav-link active" href="SendMessage.aspx">Send message</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="aboutUs.aspx">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="ContactUs.aspx">Contact Us</a>
        </li>
          <li class="nav-item">
          <a class="nav-link active" href="Terms.aspx">Terms</a>
        </li>
          <li class="nav-item">
              <a class="nav-link active bg-danger">Online: <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></a> 
        </li>
      </ul>

        <%--///////////////////////
        pop notification
        ///////////////////////--%>
                            

        <asp:Panel ID="Panel2" runat="server">
       <div class="dropdown for-message">
             <button class="btn  dropdown-toggle" type="button" id="message" data-bs-toggle="dropdown"  aria-expanded="false"><img src="img/new-email.png" width="30" height="30"><span>
                 <asp:Label ID="not1" runat="server" Text="Label"></asp:Label></span></button>
             <div class="dropdown-menu" style="border-style" aria-labelledby="message">
                 <p class="red">You have <asp:Label ID="not2" runat="server" Text="Label"></asp:Label> notification</p>
                 <hr />
                 New message :
                <asp:Repeater ID="re1" runat="server">
                     <ItemTemplate>
                         <a href="Messsages.aspx?emailAddress=<%#Eval("emailAddress") %>">
                     <span class="message  media-body">                              
                             <asp:Label ID="Label3" runat="server" Visible="true" Text=""><%#charNo(Eval("Message")) %></asp:Label>          
                        </a>
                  </ItemTemplate>
                </asp:Repeater>
                 <hr />
                 <div>New bid has been placed on product ID:</div>
            <asp:Repeater ID="re2" runat="server">
                    <ItemTemplate>
                         <span class="message  media-body">
                             <asp:Label ID="Label7" runat="server" Visible="true" Text=""><%#Eval("ProductID") %></asp:Label></span>
                     </span>
                     </ItemTemplate>
                </asp:Repeater>
             </div>
         </div>
            </asp:Panel>
      <form class="d-flex">
          <asp:TextBox ID="TextBox1" runat="server" class="form-control me-1 w-25" type="text" placeholder="Search"></asp:TextBox>
          <asp:Button ID="Button1" OnClick="Button1_Click1" class="btn btn-primary m-2" runat="server" Text="Search" />
        
          <asp:Label ID="Label1" Visible="false" runat="server" Text="Label" style="text-align: right" ForeColor="#99CCFF"></asp:Label><asp:Image ID="Image1" ImageUrl="~/img/check-mark.png" Width="15" Height="15" runat="server" /><asp:Image ID="Image2" ImageUrl="~/img/cancel1.png" Width="15" Height="15" runat="server" />
                <asp:HyperLink ID="HyperLink1" class="btn btn-primary" href="sign in.aspx" runat="server">Sign In</asp:HyperLink>
          <asp:Panel ID="Panel1" runat="server">
        <ul class="navbar-nav">
        <li class="nav-item dropdown"  onclick="menuToggle();">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img src="img/user.png" width="40" height="40" class="rounded-circle">
        </a>
       <div class="dropdown-menu container-fluid" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="UserPage.aspx"><img src="img/menu-user.png"height="10" width="10"/>My Profile</a>
          <asp:Panel ID="Panel3" runat="server"><a class="dropdown-item" href="AddPost.aspx"><img src="img/menu-setting.png"height="10" width="10"/>add post</a></asp:Panel>
          <a class="dropdown-item" href="ContactUs.aspx"> <img src="img/menu-help.png"height="10" width="10"/>Help</a>
            <asp:LinkButton ID="LinkButton13" class="dropdown-item" OnClick="Button1_Click" runat="server"><img src="img/menu-logout.png"height="10" width="10"/>log out</asp:LinkButton>
         </div>
         </li>   
          </ul>
            </asp:Panel>
      </form>
    </div>
  </div>
      
      
</nav>
   <nav class="navbar navbar-expand-sm navbar-light bg-white  border">
      <div class="container-fluid d-flex justify-content-center"> 
          <ul class="navbar-nav ml-auto">
               <li class="nav-item">     
              <a href="#middle"><asp:LinkButton ID="LinkButton2" runat="server" class="nav-link" OnClick="LinkButton2_Click" ><img src="img/options.png" hight="" width="30" /> All Categories</asp:LinkButton></a>             
            </li>
            <li class="nav-item">                
              <asp:LinkButton ID="LinkButton1" class="nav-link" OnClick="LinkButton1_Click" runat="server"><img src="img/electronics.png" hight="" width="30"/> Electronics</asp:LinkButton>              
            </li>
              <li class="nav-item">                
              <asp:LinkButton ID="LinkButton7" class="nav-link" OnClick="LinkButton7_Click" runat="server"><img src="img/cars.png" hight="30" width="30"/> Cars</asp:LinkButton>              
            </li>
            <li class="nav-item">
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" class="nav-link"><img src="img/clothes.png" hight="" width="30" /> Fashion</asp:LinkButton>     
            </li>
              <li class="nav-item">    
              <asp:LinkButton ID="LinkButton4" class="nav-link" OnClick="LinkButton4_Click" runat="server"><img src="img/toys.png" hight="" width="30" /> Toys</asp:LinkButton>    
            </li>
              <li class="nav-item">
                  <asp:LinkButton ID="LinkButton6" class="nav-link" OnClick="LinkButton6_Click" runat="server"><img src="img/beauty.png" hight="" width="30" /> Beauty</asp:LinkButton>
            </li>
              <li class="nav-item">
                  <asp:LinkButton ID="LinkButton5" class="nav-link" OnClick="LinkButton5_Click" runat="server"><img src="img/skincare.png" hight="" width="30" /> Skincare</asp:LinkButton>                  
            </li>              
          </ul>
        </div>
    </nav>
        
        <!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
    <div class="carousel-item img active">
      <img src="img/Banner1.png" alt="" class="d-block" style="width:100%">
    </div>
    <div class="carousel-item img">
      <img src="img/Banner3.png" alt="" class="d-block" style="width:100%">
    </div>
  </div>
  
  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>     
        <br /><br /><br /><br /><br /><br />
             <div class="page">
            <h5 id="explore" style="font-weight:800;"> <span class="bg-warning">Explore Popular Categories</span>
                 </div>    
       <div class="d-flex justify-content-center mt-3">
                <div class="row justify-content-center">
                    <div class="col">           
                           <asp:LinkButton ID="LinkButton14" OnClick="LinkButton7_Click" runat="server"><img src="img/ca-cars.png" alt="Cars" height="150" width="150"></asp:LinkButton>
                           <asp:LinkButton ID="LinkButton8" OnClick="LinkButton1_Click" runat="server"><img src="img/ca-electronics1.png" alt="Electronics" height="150" width="150"></asp:LinkButton>                                                                
                           <asp:LinkButton ID="LinkButton9" OnClick="LinkButton3_Click" runat="server"><img src="img/ca-fashion1.png" alt="Fashion" height="150" width="150"></asp:LinkButton>
                           <asp:LinkButton ID="LinkButton10" OnClick="LinkButton5_Click" runat="server"><img src="img/ca-skincare1.png" alt="Skincare" height="150" width="150"></asp:LinkButton>
                           <asp:LinkButton ID="LinkButton11" OnClick="LinkButton4_Click" runat="server"><img src="img/ca-toys1.png" alt="toys" height="150" width="150"></asp:LinkButton>
                           <asp:LinkButton ID="LinkButton12" OnClick="LinkButton6_Click" runat="server"><img src="img/ca-beautyy.png" alt="Beauty" height="150" width="150"></asp:LinkButton>
                                   </div>
                                </div>
                            </div>             
             <div class="page">
             <h5 id="explore1" style="font-weight:800;"><span class="bg-warning">Explore all Product</span>
          
             </div>
    <section id="ads" class="text-left">
         <br />    
        <asp:Label ID="Label2" runat="server" Visible="false" Text="Sorry! there is no product in this swction yet."></asp:Label>
       <asp:DataList ID="DataList1" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound" runat="server" DataSourceID="SqlDataSource1" RepeatDirection="Vertical" CellPadding="10" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" BorderColor="White" Font-Names="Arial" HorizontalAlign="Center" BorderWidth="1px" CellSpacing="10" GridLines="Both" RepeatColumns="4">
            <EditItemStyle BackColor="Aqua" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="Aqua" Wrap="False" />
            <ItemStyle Font-Names="Arial" Wrap="False" HorizontalAlign="Center" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
            <ItemTemplate>  
                <div class="photo">
  <div class="view zoom overlay z-depth-2 rounded0" id="middle">
    <img class="img1"
      src='ProductImg/<%# Eval("ProductImg") %>' alt="Sample">
    <a href="#!">
    </a>
  </div>
  <div class="text-center pt-4">
    <h5><asp:Label ID="Label4" runat="server" Text='<%# Eval("ProductName") %>' /><asp:Label ID="Label9" Visible="false" runat="server" Text='<%# Eval("ProductID") %>' /></h5>
    <p class="mb-2 text-muted text-uppercase small"><asp:Label ID="Label5" runat="server" Text='<%# Eval("Category") %>' /><asp:Label ID="Label8" Visible="false" runat="server" Text='<%#Eval("Duration") %>'></asp:Label></p>
    <hr>
    <h6 class="mb-3 background-color:gray"><asp:Label ID="Label6" runat="server" Text='<%# Eval("Max") %>' />SAR</h6>
      <asp:Button ID="Button2" class="btn btn-primary btn-sm mr-1 mb-2" OnClick="Button2_Click" CommandName="addtocart" CommandArgument='<%# Eval("ProductID") %>' runat="server" Text="Buy Now!" />
     <asp:Button ID="Button3" class="btn btn-light btn-sm mr-1 mb-2" runat="server" Text="View More" CommandName="viewMore" CommandArgument='<%# Eval("ProductID") %>' /><i
        class="fas fa-info-circle pr-2"></i>
  </div>
</div>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ma %>" SelectCommand="SELECT * FROM [products] WHERE ([ProductName] LIKE '%' + @ProductName + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="ProductName" PropertyName="Text" Type="String" />
            </SelectParameters>
         </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ma %>" SelectCommand="SELECT [ProductID], [ProductName],[Duration], [ProductImg], [ProductDesc], [ProductPrice], [Category], [Max] FROM [products]"></asp:SqlDataSource>    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ma %>" SelectCommand="SELECT * FROM [products] WHERE ([Category] = @Category)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Category" QueryStringField="category" Type="String" />
            </SelectParameters>
         </asp:SqlDataSource>
    </section>
</ContentTemplate></asp:UpdatePanel>  <br>
    <div class="jumbotron text-center" style="margin-bottom:0">
  <div class="footer-basic">
        <footer class="bg-danger text-white pt-5 pb-4">
            <div class="container text-center text-md-start mt-2">
                <div class="row text-center">
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <h5 class="text-uppercase font-weight-bold"> Flawless                    <hr class="mb-4 mt-0 d-inline-block " style="width: 60px; background-color: #ffffff; height: 2px"/>
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
    <!--Start of Tawk.to Script-->
<script type="text/javascript">
    var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
    (function () {
        var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
        s1.async = true;
        s1.src = 'https://embed.tawk.to/6199d33a6885f60a50bcc413/1fl0e27g2';
        s1.charset = 'UTF-8';
        s1.setAttribute('crossorigin', '*');
        s0.parentNode.insertBefore(s1, s0);
    })();
</script>
<!--End of Tawk.to Script-->

</body>
</html>
