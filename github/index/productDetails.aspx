<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="productDetails.aspx.cs" Inherits="index.productDetails" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" href="img/logoicon.png" type="image/png"/>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <meta http-equiv="refresh" content="30" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.css" rel="stylesheet"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.js"></script>

    <link href="css/Product.css" rel="stylesheet" />
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Flawless </title>
    <link rel="stylesheet" href="css/stylesheet.css"/>
    <script src="https://cdn.jsdelivr.net/npm/lazyload@2.0.0-rc.2/lazyload.js"></script>
      <script src="js/swalert.js" type="text/javascript"></script>
    <script>
        function alertme() {
            swal.fire(
                'congratulations!',
                'Your bid has been placed,thank you.',
                'success'
            )
        }
        function alertme2() {
            swal.fire(
                'congratulations!',
                'Your comment has been added,thank you.',
                'success'
            )
        }
        //function alertme3() {
        //    swal.fire(
        //        ' Be attention please!',
        //        'Here the terms you should know before you start bid or buy  gfg.',
        //        'info',
        //        'info'
        //    )
        //}
    </script>
    <script>
        function menuToggle() {
            const toggleMenu = document.querySelector('.menu');
            toggleMenu.classList.toggle('active')
        }
    </script>
    <style>
        .img1234{
            width:300px;
            height:300px;
            border:1px solid;
            border-color:white;
            border-radius:5px;
        }
        #tbl{
            width:130%;
        }
        #button2 {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
}

#button2:hover {
  background-color: #008CBA;
  color: white;
}
.dropdown-menu{
    margin:-30px;
    min-width:fit-content;
}
    </style>
</head>
<body>
        <form id="form1" runat="server">
            <header>
        
              <nav class="navbar navbar-expand-sm navbar-light bg-white">
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
          <li class="nav-item">
          <a class="nav-link active" href="Terms.aspx">Terms</a>
        </li>
      </ul>
        <asp:Label ID="Label5" Visible="false" runat="server" Text="Label"></asp:Label>
      
          <asp:Label ID="Label1" Visible="false" runat="server" Text="Label" style="text-align: right" ForeColor="#99CCFF"></asp:Label><asp:Image ID="Image1" ImageUrl="~/img/check-mark.png" Width="15" Height="15" runat="server" /><asp:Image ID="Image2" ImageUrl="~/img/cancel1.png" Width="15" Height="15" runat="server" />
          <asp:HyperLink ID="HyperLink1" class="btn btn-primary" href="sign in.aspx" runat="server">Sign In</asp:HyperLink>
          <asp:Panel ID="Panel2" runat="server">
        <ul class="navbar-nav">
        <li class="nav-item dropdown"  onclick="menuToggle();">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img src="img/user.png" width="40" height="40" class="rounded-circle">
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="UserPage.aspx"><img src="img/menu-user.png"height="10" width="10"/>My Profile</a>
          <asp:Panel ID="Panel3" runat="server"><a class="dropdown-item" href="AddPost.aspx"><img src="img/menu-setting.png"height="10" width="10"/>add post</a></asp:Panel>
          <a class="dropdown-item" href="ContactUs.aspx"> <img src="img/menu-help.png"height="10" width="10"/>Help</a>
            <asp:LinkButton ID="LinkButton13" class="dropdown-item" CausesValidation="false" OnClick="LinkButton13_Click" runat="server"><img src="img/menu-logout.png"height="10" width="10"/>log out</asp:LinkButton>
         </div>
         </li>   
          </ul>
            </asp:Panel>
    </div>
  </div>     
</nav>               
<hr />
<h5 id="explore" style="font-weight:500;"> <span class="bg-warning">Please read the term before you start bidding or buying.</span></h5>                
                
            <%--retrive product details--%>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ma %>" SelectCommand="SELECT * FROM [products] WHERE ([ProductID] = @ProductID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ProductID" QueryStringField="ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DataList ID="DataList1"  runat="server" OnItemDataBound="DataList1_ItemDataBound" OnItemCommand="DataList1_ItemCommand"  DataKeyField="ProductID" DataSourceID="SqlDataSource1"  OnSelectedIndexChanged="DataList1_SelectedIndexChanged" BorderColor="White" BorderWidth="1px" CellPadding="0" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" RepeatDirection="Horizontal" CellSpacing="10" GridLines="Horizontal">
                <ItemTemplate>
                    <div class="container d-flex justify-content-center">
                    <figure class="card card-product-grid card-lg"> 
                    <div class="mt-4 m-4 text-black-50">
                        Owner's :  <asp:Label ID="Label8" runat="server" Text='<%#Eval("userName") %>'></asp:Label><br />
                        Product ID :  <asp:Label ID="Label7" runat="server" Text='<%#Eval("ProductID") %>'></asp:Label>
                        <a href="#"  onclick="window.open('SendMessage.aspx','FP','width=800,height=700,top=1500,left=1500,fullscreen=no,resizable=0');">Send message</a>           
                    </div>
                    <a href='\ProductImg\<%# Eval("ProductImg") %>'
                data-size="710x823">
                <img width="300" height="300" alt="" src='\ProductImg\<%# Eval("ProductImg") %>' />
                 </a>
                    <hr />
                     <figcaption class="info-wrap">
                         <div class="row">
                                   <h5 class="mt-0 text-black-50"><%#Eval("ProductName") %></h5>
                             <p><%#Eval("Category") %></p>
                                   <p ><%#Eval("ProductDesc") %></p>
                         </div>
                     </figcaption>
                     <div class="bottom-wrap-payment">
                          <figcaption class="info-wrap">
                              <div class="row">
                              <a>Bids: <%#Eval("ProductPrice") %>SAR</a>
                              </div>
                          </figcaption>
                     </div>
                    <div class="bottom-wrap-payment">
                        <figcaption class="info-wrap">
                             <div class="row">
                                 <div class="col-md-9 col-xs-9">
                                 <h5> Post Date:</h5> <asp:Label ID="Label2" runat="server" Text='<%#Eval("PostDate") %>'></asp:Label>
                                     </div>
                                 <div class="col-md-3 col-xs-3 text-right">
                                     
                                    <h5>Post End at:</h5><asp:Label ID="Label6" runat="server" Text='<%#Eval("Duration") %>'></asp:Label>
                                </div>
                             </div>                                                           
                        </figcaption>
                    </div>                         
                        <div class="bottom-wrap"> 
                            <asp:Label ID="endingPost" Visible="true" runat="server" Text="Post has been closed"></asp:Label>
                            <asp:Panel ID="Panel1" runat="server">
<div class="classic-tabs border rounded px-4 pt-1">
  <ul class="nav tabs-primary nav-justified" id="advancedTab" role="tablist">
    <li class="nav-item">
        <a runat="server" class="nav-link active show" data-bs-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">Buy Now</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="info-tab" data-bs-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="false">Place bid</a>
    </li>
  </ul>
  <div class="tab-content" id="advancedTabContent">
    <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
      <h3>Buy it now for:</h3>
      <h4><asp:TextBox ID="TextBox3" Enabled="false" CssClass="btn btn-danger" Text='<%#Eval("Max") %>' runat="server"></asp:TextBox>SAR</h4>
       <asp:ImageButton ID="ImageButton2" CausesValidation="false"  ImageUrl="~/img/checkOut.png" CssClass="text-left" Width="150" Height="150" runat="server" CommandName="addtocart" CommandArgument='<%# Eval("ProductID") %>' />
    </div>
    <div class="tab-pane fade" id="info" role="tabpanel" aria-labelledby="info-tab">
      <h5>Lowest bid:<asp:TextBox ID="TextBox2" Enabled="false" Text='<%#Eval("ProductPrice") %>' class="form-control bg-danger" runat="server"></asp:TextBox></h5>
      <table class="table table-striped table-bordered mt-3">
        <tbody>
          <tr>
            <th scope="row" class="w-150 dark-grey-text h6">
                <div class="input-group mb-3 mt-3">
                    <asp:TextBox ID="TextBox1"  class="form-control" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" class="btn btn-outline-primary" runat="server" Text="Place Bid" OnClick="BidBtn_Click" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox1" runat="server" ErrorMessage="you must put a bid" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="TextBox1" ControlToCompare="TextBox2" Operator="GreaterThan" runat="server" ErrorMessage="your bid must be greater than last bid" ForeColor="Red"></asp:CompareValidator>
                    <asp:CompareValidator ID="CompareValidator2" ControlToValidate="TextBox1" ControlToCompare="TextBox3" Operator="LessThan" runat="server" ErrorMessage="your bid must be less than buy now price" ForeColor="Red"></asp:CompareValidator>

                </div  
             </th>
          </tr>
        </tbody>
      </table>
    </div>
</div>
    </div>
 </asp:Panel>
        <asp:Button ID="check123" runat="server" OnClick="check123_Click" CausesValidation="false" CssClass="btn btn-primary" Text="check out" Visible="false" CommandName="addtocart2" CommandArgument='<%# Eval("ProductID") %>' />

   </div>
        </div>
            </ItemTemplate>
            </asp:DataList>
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>            
                <%-- Comments --%>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ma %>" SelectCommand="SELECT * FROM [Comments] WHERE ([Productid] = @Productid)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Productid" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
        </asp:SqlDataSource>
<div class="container">
    <div class="row height d-flex justify-content-center align-items-center">
        <div class="col-md-6 w-50">
            <div class="card">
                <div class="p-3">
                    <h6>Comments</h6>
                
                <div class="mt-3 d-flex flex-row align-items-center p-3 form-color"> <img src="img/generaluser.png" width="50" class="rounded-circle mr-2"> <asp:TextBox ID="TextBox4" class="form-control" placeholder="Enter your comment..." runat="server"></asp:TextBox><asp:Button ID="Button2" OnClick="Button2_Click" class="btn btn-danger" CausesValidation="false" runat="server" Text="add" /> </div>
                <div class="mt-2">
                    <div class="d-flex flex-row p-3"> <img src="img/generaluser.png" width="40" height="40" class="rounded-circle mr-3">
                        <div class="w-100">
                            <div class="d-flex justify-content-between align-items-center">
<asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2">
    <ItemTemplate>
                                <div class="d-flex flex-row align-items-center"> <span class="mr-2"><%#Eval("EmailAddUser") %></span>  </div> <small><%#Eval("date") %></small>
                            
                            <p class="text-justify comment-text mb-0"><%#Eval("comment") %></p>
        </ItemTemplate>
        </asp:DataList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
    </div>
     <div class="footer-basic">
         <footer class="bg-danger text-white pt-5 pb-4">
            <div class="container text-center text-md-start mt-2">
                <div class="row text-center">
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <h5 class="text-uppercase font-weight-bold"> Flawless 
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
</form>
</body>
</html>