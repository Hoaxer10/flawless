<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="index.UserPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
  
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

#theprogress {
    background-color: aliceblue;
    width: 50px;
    height: 24px;
    text-align: center;
    filter: alpha(Opacity=100);
    opacity: 1;
    -noz-opacity: 1;
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
         <nav class="navbar navbar-expand-sm navbar-light bg-white text-center">
  <div class="container-fluid">
    <a class="navbar-brand" href="HomePage.aspx"><img class="" alt="" src="img/logo.png" hight="" width="55"/> FLAWLESS </a>
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">      
        <li class="nav-item">
          <a class="nav-link active" href="aboutUs.aspx">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="ContactUs.aspx">Contact Us</a>
        </li>
      </ul>
        </div>
      <ul class="navbar-nav ml-auto">
          <li class="nav-item">
                    <asp:LinkButton ID="info" OnClick="info_Click" class="nav-link" runat="server"><img src="img/account.png" alt="" width="30" height="30" />Information</asp:LinkButton>
          </li>
          <li class="nav-item">
                    <asp:LinkButton ID="prod" OnClick="prod_Click" class="nav-link" runat="server"><img src="img/cubes.png" alt="" width="30" height="30" />Products</asp:LinkButton>
          </li>
          <li class="nav-item">
                    <asp:LinkButton ID="order" OnClick="order_Click" class="nav-link" runat="server"><img src="img/delivery.png" alt="" width="30" height="30" />Orders</asp:LinkButton>
          </li>
          <li class="nav-item">
           <a href="#" class="nav-link"  onclick="window.open('Messsages.aspx','FP','width=800,height=700,top=1500,left=1500,fullscreen=no,resizable=0');"><img src="img/customer.png" alt="" width="30" height="30" />Messages</a>
          </li>
          <li class="nav-item"> 
          <a href="#" class="nav-link"  onclick="window.open('Activation.aspx','FP','width=800,height=700,top=1500,left=1500,fullscreen=no,resizable=0');"><img src="img/customer.png" alt="" width="30" height="30" />activation</a>         
          </li>
      </ul>
      </div>
        </nav>                    
        <div>
            
            <div class="container">
            <asp:GridView ID="GVproduct" Visible="false" class="table table-bordered table-condensed table-responsive table-hover "  runat="server" AutoGenerateColumns="false" ShowFooter="false" DataKeyNames="ProductID"
                ShowHeaderWhenEmpty="true" 
                OnRowCommand="GridView3_RowCommand" OnRowDeleting="GridView3_RowDeleting" 
                OnRowCancelingEdit="GridView3_RowCancelingEdit" OnRowUpdating="GridView3_RowUpdating" 
                OnRowEditing="GridView3_RowEditing" 
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" CellPadding="10" Width="1000px" CellSpacing="20" HorizontalAlign="Justify">                            
                <Columns>
                    <asp:TemplateField HeaderText="product ID">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ProductID") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ProductIDtbl" Text='<%# Eval("ProductID") %>' runat="server" />
                        </EditItemTemplate>                    
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ProductName") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ProductNametbl" Text='<%# Eval("ProductName") %>' runat="server" />
                        </EditItemTemplate>                      
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product description">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ProductDesc") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ProductDestbl" Text='<%# Eval("ProductDesc") %>' runat="server" />
                        </EditItemTemplate>                      
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Prodcut price">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ProductPrice") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ProductPricetbl" Text='<%# Eval("ProductPrice") %>' runat="server" />
                        </EditItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Prodcut Image">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ProductImg") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ProductImgtbl" Text='<%# Eval("ProductImg") %>' runat="server" />
                        </EditItemTemplate>                      
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Prodcut category">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Category") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Categorytbl" Text='<%# Eval("Category") %>' runat="server" />
                        </EditItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("userName") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="userNametbl" Text='<%# Eval("userName") %>' runat="server" />
                        </EditItemTemplate>                        
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/adminImg/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/adminImg/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/adminImg/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/adminImg/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                       </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="lblSuccessMessage1" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="lblErrorMessage1" Text="" runat="server" ForeColor="Red" />
            <br />
            <asp:GridView ID="GVcustomer" Visible="false" class="table table-bordered table-condensed table-responsive table-hover "  runat="server" AllowPaging="true" AutoGenerateColumns="false" ShowFooter="false" DataKeyNames="emailAddress"
                ShowHeaderWhenEmpty="true" 
                OnRowCommand="GridView2_RowCommand" 
                OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowUpdating="GridView2_RowUpdating" 
                OnRowEditing="GridView2_RowEditing" 
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" CellPadding="10" Width="1000px" CellSpacing="20">                      
                <Columns>
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("firstName") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtfirstCust" Text='<%# Eval("firstName") %>' runat="server" />
                        </EditItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("lastName") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtlastCust" Text='<%# Eval("lastName") %>' runat="server" />
                        </EditItemTemplate>                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("phoneNumber") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtphoneCust" Text='<%# Eval("phoneNumber") %>' runat="server" />
                        </EditItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("emailAddress") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmailCust" Text='<%# Eval("emailAddress") %>' runat="server" />
                        </EditItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/adminImg/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/adminImg/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/adminImg/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                       </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="lblSuccessMessage2" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="lblErrorMessage2" Text="" runat="server" ForeColor="Red" />
            <br />
             <asp:GridView ID="GVorder" Visible="false" class="table table-bordered table-condensed table-responsive table-hover "  runat="server" AutoGenerateColumns="false" ShowFooter="false" DataKeyNames="OrderId"
                ShowHeaderWhenEmpty="true"                 
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" CellPadding="10" Width="1000px" CellSpacing="20">                              
                <Columns>
                    <asp:TemplateField HeaderText="Order ID">
                        <ItemTemplate>
                            <asp:Label ID="lblId" Text='<%# Eval("OrderId") %>' runat="server" />
                        </ItemTemplate>                                            
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Order Date">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("orderDate") %>' runat="server" />
                        </ItemTemplate>                                            
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ship Address">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("shipAddress") %>' runat="server" />
                        </ItemTemplate>                                             
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("userPurch") %>' runat="server" />
                        </ItemTemplate>                                             
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Prodcut Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("productname") %>' runat="server" />
                        </ItemTemplate>                                             
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="product price">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("productprice") %>' runat="server" />
                        </ItemTemplate>                                               
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Image">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("productimg") %>' runat="server" />
                        </ItemTemplate>                                               
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Order status">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("PayStatus") %>' runat="server" />
                        </ItemTemplate>                      
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Receipt">
                        <ItemTemplate>
                            <img alt="" height="80px" src='\receiptImg\<%# Eval("receiptImg") %>'/>
                        </ItemTemplate>                        
                    </asp:TemplateField>                   
                </Columns>
            </asp:GridView>
                 <br />
            <asp:Label ID="LabelOrdersuc" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="LabelOrderfai" Text="" runat="server" ForeColor="Red" />
            <br />               
         <asp:GridView ID="GVmessags" Visible="false" class="table table-bordered table-condensed table-responsive table-hover "   runat="server" AutoGenerateColumns="False" ShowFooter="false" DataKeyNames="Id"
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
                 <br />
            <asp:Label ID="Label1" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="Label2" Text="" runat="server" ForeColor="Red" />
            <br />
        </div>
        </div>
        <br />
        <br />
        <br /></ContentTemplate>
            </asp:UpdatePanel>
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
