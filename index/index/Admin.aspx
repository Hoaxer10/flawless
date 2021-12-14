<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="index.Admin" %>

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
    <script type="text/javascript">
        function Confirm() {
            alert("Are you sure?")
        }
    </script>
    <style>       
        footer{
            position:relative;
            margin-top:280px;
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
        <li class="nav-item ">
           <a class="nav-link active" href="https://dashboard.tawk.to/#/dashboard/6199d33a6885f60a50bcc413">Dashboard</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#">About</a>
        </li>
        <li class="nav-item">          
        </li>
          <li class="nav-item">
              <button class="btn btn-danger" type="button" data-bs-toggle="offcanvas" data-bs-target="#demo">
    Control Panel
  </button>
          </li>
      </ul>
        </div>
      <ul>          
      </ul>
      <div class="text-right"> 
      </div>
        </nav> 
        <div class="offcanvas offcanvas-end h-75" id="demo">
  <div class="offcanvas-header">
    <h4 class="offcanvas-title "><asp:Label ID="Label1"  runat="server" Text="Label"></asp:Label></h4>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
  </div>
  <div class="offcanvas-body">
     <asp:LinkButton ID="Emp" OnClick="Emp_Click" class="btn btn-danger w-100" runat="server"><img src="img/businessman.png" alt="" width="30" height="30" />Employee</asp:LinkButton><br /><br />                    
     <asp:LinkButton ID="info" OnClick="info_Click" class="btn btn-danger w-100" runat="server"><img src="img/account.png" alt="" width="30" height="30" />Customers</asp:LinkButton><br /> <br />                    
     <asp:LinkButton ID="prod" OnClick="prod_Click" class="btn btn-danger w-100" runat="server"><img src="img/cubes.png" alt="" width="30" height="30" />Products</asp:LinkButton>   <br /> <br />         
     <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" class="btn btn-danger w-100" runat="server"><img src="img/winning.png" alt="" width="30" height="30" />Winners</asp:LinkButton>  <br />  <br />                 
     <asp:LinkButton ID="order" OnClick="order_Click" class="btn btn-danger w-100" runat="server"><img src="img/delivery.png" alt="" width="30" height="30" />Orders</asp:LinkButton>  <br />  <br />          
     <asp:LinkButton ID="mess" OnClick="mess_Click" class="btn btn-danger w-100" runat="server"><img src="img/email.png" alt="" width="30" height="30" />Messages</asp:LinkButton><br /> <br /> 
     <asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" class="btn btn-danger w-100" runat="server"><img src="img/customer.png" alt="" width="30" height="30" />Activasion</asp:LinkButton><br /> <br /> 
     <asp:LinkButton ID="LinkButton3" OnClick="LinkButton3_Click" class="btn btn-danger w-100" runat="server"><img src="img/comment.png" alt="" width="30" height="30" />Comments</asp:LinkButton><br /> <br /> 
     <asp:LinkButton ID="logOut" OnClick="logOut_Click" class="btn btn-danger w-100" runat="server"><img src="img/logout.png" alt="" width="30" height="30" />log out</asp:LinkButton><br /> <br /> 
  </div>
</div>
      <div class="text-right">       
<%--employee control panel--%>   
          <div class="container">
            <br />
            <div class="text-center">
            <asp:GridView ID="GvEmp" Visible="false" OnPageIndexChanging="GvEmp_PageIndexChanging" class="table table-bordered table-condensed table-responsive table-hover " AllowPaging="true"  runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="Id"
                ShowHeaderWhenEmpty="true"
                OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting"
                BackColor="White" BorderColor="#CCCCCC"  BorderStyle="None" BorderWidth="1px" CellPadding="3">                
                <Columns>
                    <asp:TemplateField HeaderText="employee ID">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Id") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtId" Text='<%# Eval("Id") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtId" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("firstName") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" Text='<%# Eval("firstName") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFirstNameFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("lastName") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLastName" Text='<%# Eval("lastName") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtLastNameFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("phoneNumer") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtContact" Text='<%# Eval("phoneNumer") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtphoneFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("emailAdd") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmail" Text='<%# Eval("emailAdd") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtEmailFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="password">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("password") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="passwordtbl" Text='<%# Eval("password") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="passwordFooter" runat="server" />
                        </FooterTemplate>
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
                        <FooterTemplate>
                            <asp:ImageButton ImageUrl="~/adminImg/addnew.png" runat="server" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>
            <br />
            <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" />
            <br />
            <br />
            <br />
<%--customers control panel--%>
            <asp:GridView ID="GvCustomer" OnSelectedIndexChanging="GvCustomer_SelectedIndexChanging" OnPageIndexChanging="GvCustomer_PageIndexChanging" Visible="false" class="table table-bordered table-condensed table-responsive table-hover "  runat="server" AllowPaging="true" AutoGenerateColumns="false" ShowFooter="false" DataKeyNames="emailAddress"
                ShowHeaderWhenEmpty="true" 
                OnRowCommand="GridView2_RowCommand" OnRowDeleting="GridView2_RowDeleting" 
                OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowUpdating="GridView2_RowUpdating" 
                OnRowEditing="GridView2_RowEditing" 
                
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">                
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
                    <asp:TemplateField HeaderText="status">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("status") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtstsCust" Text='<%# Eval("status") %>' runat="server" />
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
            <asp:Label ID="lblSuccessMessage2" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="lblErrorMessage2" Text="" runat="server" ForeColor="Red" />

            <%--///////////////////////////////
            product panel--%>
            <asp:GridView ID="GvProd" Visible="false" OnPageIndexChanging="GvProd_PageIndexChanging" class="table table-bordered table-condensed table-responsive table-hover "  runat="server" AutoGenerateColumns="false" ShowFooter="false" DataKeyNames="ProductID"
                ShowHeaderWhenEmpty="true" 
                OnRowCommand="GridView3_RowCommand" OnRowDeleting="GridView3_RowDeleting" 
                OnRowCancelingEdit="GridView3_RowCancelingEdit" OnRowUpdating="GridView3_RowUpdating" 
                OnRowEditing="GridView3_RowEditing">                
                <SortedDescendingHeaderStyle BackColor="#00547E" />               
                <Columns>
                    <asp:TemplateField HeaderText="product ID">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ProductID") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ProductIDtbl" Text='<%# Eval("ProductID") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="ProductIDFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ProductName") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ProductNametbl" Text='<%# Eval("ProductName") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="ProductNameFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product description">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ProductDesc") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ProductDestbl" Text='<%# Eval("ProductDesc") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="ProductDesFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Prodcut price">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ProductPrice") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ProductPricetbl" Text='<%# Eval("ProductPrice") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="ProductPriceFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Prodcut Image">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ProductImg") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ProductImgtbl" Text='<%# Eval("ProductImg") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="ProductImgFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Prodcut category">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Category") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Categorytbl" Text='<%# Eval("Category") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="CategoryFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("userName") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="userNametbl" Text='<%# Eval("userName") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="userNameFooter" runat="server" />
                        </FooterTemplate>
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
            <asp:Label ID="lblSuccessMessage3" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="lblErrorMessage3" Text="" runat="server" ForeColor="Red" />
<%--            ///////Order panel--%>
            <asp:GridView ID="GvOrder" Visible="false" OnPageIndexChanging="GvOrder_PageIndexChanging" class="table table-bordered table-condensed table-responsive table-hover "  runat="server" AutoGenerateColumns="false" ShowFooter="false" DataKeyNames="OrderId"
                ShowHeaderWhenEmpty="true" 
                OnRowCommand="GridView4_RowCommand" OnRowDeleting="GridView4_RowDeleting" 
                OnRowCancelingEdit="GridView4_RowCancelingEdit" OnRowUpdating="GridView4_RowUpdating" 
                OnRowEditing="GridView4_RowEditing" 
                 OnSelectedIndexChanged="GridView4_SelectedIndexChanged">             
                <Columns>
                    <asp:TemplateField HeaderText="Order ID">
                        <ItemTemplate>                
                           <asp:Label ID="lblId" Text='<%# Eval("OrderId") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="OrderIdtbl" Text='<%# Eval("OrderId") %>' runat="server" />
                        </EditItemTemplate>                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Order Date">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("orderDate") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="orderDatetbl" Text='<%# Eval("orderDate") %>' runat="server" />
                        </EditItemTemplate>                     
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ship Address">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("shipAddress") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="shipAddresstbl" Text='<%# Eval("shipAddress") %>' runat="server" />
                        </EditItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("userPurch") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="userPurchtbl" Text='<%# Eval("userPurch") %>' runat="server" />
                        </EditItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Prodcut Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("productname") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="productnametbl" Text='<%# Eval("productname") %>' runat="server" />
                        </EditItemTemplate>                     
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="product price">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("productprice") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="productpricetbl" Text='<%# Eval("productprice") %>' runat="server" />
                        </EditItemTemplate>                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Image">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("productimg") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="productimgrbl" Text='<%# Eval("productimg") %>' runat="server" />
                        </EditItemTemplate>                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Order status">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("PayStatus") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="PayStatustbl" Text='<%# Eval("PayStatus") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Receipt">
                        <ItemTemplate>
                            <img alt="" width="50" height="50" src='\receiptImg\<%# Eval("receiptImg") %>'/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="receiptImgtbl" Text='<%# Eval("receiptImg") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="approval">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>accept</asp:ListItem>
                                <asp:ListItem>declined</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button OnClientClick="Confirm();" ID="subBtn" runat="server" CssClass="btn btn-primary" Text="submit" />
                        </ItemTemplate>
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
            <asp:Label ID="Label40" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="Label41" Text="" runat="server" ForeColor="Red" />
          <asp:GridView ID="GvContact" OnPageIndexChanging="GvContact_PageIndexChanging" class="table table-bordered table-condensed table-responsive table-hover " Visible="false"  runat="server" AutoGenerateColumns="false" ShowFooter="false" DataKeyNames="Id"
                ShowHeaderWhenEmpty="true" 
                OnRowCommand="GvContact_RowCommand" OnRowDeleting="GvContact_RowDeleting"  
                 OnSelectedIndexChanged="GvContact_SelectedIndexChanged">             
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>                
                           <asp:Label ID="lblId" Text='<%# Eval("Id") %>' runat="server" />
                        </ItemTemplate>                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("name") %>' runat="server" />
                        </ItemTemplate>                     
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subject">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("subject") %>' runat="server" />
                        </ItemTemplate>                    
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="message">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("message") %>' runat="server" />
                        </ItemTemplate>                     
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/adminImg/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                       </asp:TemplateField>
                </Columns>
            </asp:GridView>
          <asp:GridView ID="GridView1" OnPageIndexChanging="GridView1_PageIndexChanging" class="table table-bordered table-condensed table-responsive table-hover " Visible="false"  runat="server" AutoGenerateColumns="false" ShowFooter="false" DataKeyNames="Id"
                ShowHeaderWhenEmpty="true" 
                OnRowCommand="GridView1_RowCommand1" OnRowDeleting="GridView1_RowDeleting1" 
                 OnSelectedIndexChanged="GridView1_SelectedIndexChanged">             
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>                
                           <asp:Label ID="lblId" Text='<%# Eval("Id") %>' runat="server" />
                        </ItemTemplate>                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Email") %>' runat="server" />
                        </ItemTemplate>                     
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Id">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ProductId") %>' runat="server" />
                        </ItemTemplate>                    
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Heigest bid">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("heigestBid") %>' runat="server" />
                        </ItemTemplate>                     
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/adminImg/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                       </asp:TemplateField>
                </Columns>
            </asp:GridView>
           <br />
            <asp:Label ID="LabelWinner1" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="LabelWinner2" Text="" runat="server" ForeColor="Red" />
              <asp:GridView ID="GridView2" OnPageIndexChanging="GridView2_PageIndexChanging" class="table table-bordered table-condensed table-responsive table-hover " Visible="false"  runat="server" AutoGenerateColumns="false" ShowFooter="false" DataKeyNames="ActId"
                ShowHeaderWhenEmpty="true" 
                OnRowCommand="GridView2_RowCommand1" OnRowDeleting="GridView2_RowDeleting1"  
                 OnSelectedIndexChanged="GridView2_SelectedIndexChanged">             
                <Columns>
                    <asp:TemplateField HeaderText="Activasion ID">
                        <ItemTemplate>                
                           <asp:Label ID="lblId" Text='<%# Eval("ActId") %>' runat="server" />
                        </ItemTemplate>                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ActEmail") %>' runat="server" />
                        </ItemTemplate>                     
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="status">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("status") %>' runat="server" />
                        </ItemTemplate>                    
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Code">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("activasionCode") %>' runat="server" />
                        </ItemTemplate>                     
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/adminImg/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                       </asp:TemplateField>
                </Columns>
            </asp:GridView>
              <br />
            <asp:Label ID="Label2" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="Label3" Text="" runat="server" ForeColor="Red" />
               <asp:GridView ID="GridView3" OnPageIndexChanging="GridView3_PageIndexChanging" AllowPaging="true" class="table table-bordered table-condensed table-responsive table-hover " Visible="false"  runat="server" AutoGenerateColumns="false" ShowFooter="false" DataKeyNames="Id"
                ShowHeaderWhenEmpty="true" 
                OnRowCommand="GridView3_RowCommand1" OnRowDeleting="GridView3_RowDeleting1"  
                 OnSelectedIndexChanged="GridView3_SelectedIndexChanged">             
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>                
                           <asp:Label ID="lblId" Text='<%# Eval("Id") %>' runat="server" />
                        </ItemTemplate>                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Id">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Productid") %>' runat="server" />
                        </ItemTemplate>                     
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("EmailAddUser") %>' runat="server" />
                        </ItemTemplate>                    
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="comment">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("comment") %>' runat="server" />
                        </ItemTemplate>                     
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/adminImg/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                       </asp:TemplateField>
                </Columns>
            </asp:GridView>
              <br />
            <asp:Label ID="Label4" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="Label5" Text="" runat="server" ForeColor="Red" />
              </div>
          </ContentTemplate>
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
        </div>
    </form>
</body>
</html>
