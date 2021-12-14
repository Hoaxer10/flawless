<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="index.WebForm1" %>



<!DOCTYPE html>
<html lang="en">
<head>
  <title>Seller page</title>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  #header{
    text-align: center;
    margin-bottom: 0;
    height: 150px;
    background-image: url('img/header-bidding.png');
    color: rgb(255, 255, 255);

}
  img{
      width: 240px;
      height: 240px;


      
  }
  datalist{
      border-radius:20px;
  }

  
 
      </style>
</head>
<body>


    <form id="form1" runat="server">


<div id="header">

  <h1>Flawless Auction</h1>
  <p>بيع و اشتري وانت مطمن!!!</p> 
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="left: 0px; top: 0px">
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item" style="text-align: left">
          <asp:HyperLink ID="HyperLink2" class="nav-link" href="addPost.aspx"  runat="server"><div class="text-left">
              Add post</div></asp:HyperLink>
          
            <li class="nav-item" style="text-align: left">
        <a class="nav-link" href="#">
          <div class="text-left">
              <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>electronic</asp:ListItem>
            <asp:ListItem>cars</asp:ListItem>
            <asp:ListItem>fashion</asp:ListItem>
            <asp:ListItem>sports</asp:ListItem>
            <asp:ListItem>other</asp:ListItem>
                       </asp:DropDownList></div>
             
      
    </ul>
                <div class="text-right">

      </div>

  </div> 
    
                <asp:Label ID="Label1" Visible="false" runat="server" Text="Label" style="text-align: center" ForeColor="#99CCFF"></asp:Label>
                <asp:HyperLink ID="HyperLink1" class="btn btn-primary" href="sign in.aspx" runat="server">Sign In</asp:HyperLink>
                <asp:Button ID="Button1" class="btn btn-primary" Visible ="false" runat="server" OnClick="Button1_Click" Text="log out" />

</nav>
    <section id="ads" class="text-left">


         <br />
                        <span class="badge badge-info">Online:<asp:Label ID="Label3" runat="server" Text=""></asp:Label></span>

        <asp:DataList ID="DataList1" OnItemCommand="DataList1_ItemCommand" runat="server" DataSourceID="SqlDataSource1" CellSpacing="1" RepeatDirection="Horizontal" CellPadding="50" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" BorderColor="Black" Font-Names="Arial" GridLines="Both" HorizontalAlign="Center" RepeatColumns="4" BorderWidth="5px">
            <EditItemStyle BackColor="Aqua" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="Aqua" Wrap="False" />
            <ItemStyle Font-Names="Arial" Wrap="False" HorizontalAlign="Center" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
            <ItemTemplate>
                
                
                
                   <div class="row">
            <div class="col-md-0">
            <div class="card text-center">
                <img alt="" src='\ProductImg\<%# Eval("ProductImg") %>'/>
 
                </div>
            </div>
        </div>
                <asp:Label Visible="false" ID="Label2" runat="server" Text='<%# Eval("ProductID") %>' />
                <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' />
                <br />
                
                <asp:Button ID="Button2" class="btn btn-info" runat="server" Text="View More" CommandName="viewMore" CommandArgument='<%# Eval("ProductID") %>' />

            </ItemTemplate>

        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" SelectCommand="SELECT [ProductID], [ProductName], [ProductImg], [ProductDesc], [ProductPrice] FROM [products]"></asp:SqlDataSource>


         
    </section>
  <br>

    <div class="jumbotron text-center" style="margin-bottom:0">

  <div class="footer-basic">
        <footer>
            <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-facebook"></i></a></div>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Home</a></li>
                <li class="list-inline-item"><a href="#">Services</a></li>
                <li class="list-inline-item"><a href="#">About</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
            </ul>
            <p class="copyright">Flawless © 2021</p>
        </footer>
    </div>
</div>
    </form>
</body>
</html>


