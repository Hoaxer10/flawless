<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="index.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset='utf-8'>
                                <meta name='viewport' content='width=device-width, initial-scale=1'>
                                <title>Order</title>
                                <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
                                <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
                                <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
       <script src="js/swalert.js" type="text/javascript"></script>
    <script>
        function alertme() {
            swal.fire(
                'congratulations!',
                'Your order is under Process, we will send the order to your email soon!',
                'success'
            )
        }
    </script>
                                <style>

body {
    background: #ddd;
    min-height: 100vh;
    vertical-align: middle;
    display: flex;
    font-family: sans-serif;
    font-size: 0.8rem;
    font-weight: bold
}

.title {
    margin-bottom: 2vh
}

.card {
    margin: 100px;
    max-width: 1600spx;
    width: 90%;
    box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    border-radius: 1rem;
    border: transparent
}

@media(max-width:767px) {
    .card {
        margin: 3vh auto
    }
}
 table {
    border: 0px;
}
 tbody {
     border: 0px;
 }

 tr {
     border: 0px;
 }
.cart {
    background-color: #fff;
    padding: 4vh 5vh;
    border-bottom-left-radius: 1rem;
    border-top-left-radius: 1rem;
            width:100rem;
            height:600px;
            

}

@media(max-width:767px) {
    .cart {
        padding: 4vh;
        border-bottom-left-radius: unset;
        border-top-right-radius: 1rem;
        
    }
}

.summary {
    background-color: #ddd;
    padding: 4vh;
    color: rgb(65, 65, 65)
}

@media(max-width:767px) {
    .summary {
        border-top-right-radius: unset;
        border-bottom-left-radius: 1rem
    }
}

.summary .col-2 {
    padding: 0
}

.summary .col-10 {
    padding: 0
}

.row {
    margin: 0;
}

.title b {
    font-size: 1.5rem
}

.main {
    margin: 0;
    padding: 2vh 0;
    width: 50px;
}

.col-2, .col {
    padding: 0;
    margin-right: 0px;
}
    .item {
        /* To correctly align image, regardless of content height: */
        vertical-align: top;
        display: inline-block;
        /* To horizontally center images and caption */
        text-align: center;
        /* The width of the container also implies margin around the images. */
        width: 120px;
    }

    .caption {
    /* Make the caption a block so it occupies its own line. */
    display: block;
    }
a {
    padding: 0 1vh
}

.close {
    margin-left: auto;
    font-size: 0.7rem
}

img {
    width: 300px;
    border-radius:10px;
    margin:10px;

}

.back-to-shop {
    margin-top: 4.5rem
}

h5 {
    margin-top: 4vh
}

hr {
    margin-top: 1.25rem
}

form {
    padding: 2vh 0
}

select {
    border: 1px solid rgba(0, 0, 0, 0.137);
/**/    padding: 1.5vh 1vh;
    margin-bottom: 4vh;
    outline: none;
    width: 100%;
    background-color: rgb(247, 247, 247)
}

input {
    border: 1px solid rgba(0, 0, 0, 0.137);
    padding: 1vh;
    margin-bottom: 4vh;
    outline: none;
    width: 100%;
    background-color: rgb(247, 247, 247)
}

input:focus::-webkit-input-placeholder {
    color: transparent
}

.btn {
    background-color: #000;
    border-color: #000;
    color: white;
    width: 100%;
    font-size: 0.7rem;
    margin-top: 4vh;
    padding: 1vh;
    border-radius: 0
}
 .row-check {
     justify-content: space-evenly
 }
.btn:focus {
    box-shadow: none;
    outline: none;
    box-shadow: none;
    color: white;
    -webkit-box-shadow: none;
    -webkit-user-select: none;
    transition: none
}

.btn:hover {
    color: white
}

a {
    color: black
}

a:hover {
    color: black;
    text-decoration: none
}

#code {
    background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253), rgba(255, 255, 255, 0.185)), url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
    background-repeat: no-repeat;
    background-position-x: 95%;
    background-position-y: center
}
#im1{
    margin-right:500px;
    margin-left:-500px;
}
.GridView1{
    border:0px solid;
}
                                </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" Visible="false" runat="server" Text=""></asp:Label>
        
        <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" BorderColor="#999999" BorderWidth="0px" GridLines="None" ShowHeader="False" >
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div class="card">
    <div class="row">
        <div class="col-md-4 cart">
            <div class="title">
                <div class="row">
                    <div class="col">
                        <h4><b><span class="align-content-center">Shopping Cart</span></b></h4>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row row-check d-flex">
<div class="p-4">
  <div class="view zoom overlay z-depth-2 rounded">
    <img  alt="" src='\ProductImg\<%# Eval("ProductImg") %>'>
    <a href="#!">
    </a>
  </div>
  <div class="text-center p-md-4">
    <h5><%#Eval("ProductName") %></h5>
    <p class="mb-2 text-muted text-uppercase small"><%#Eval("Category") %></p>
    <hr>
    <h6 class="mb-3 background-color:gray"><%#Eval("Max") %>SAR</h6>
    
  </div>
</div>               
            </div>
            <div class="back-to-shop"><a href="HomePage.aspx">&leftarrow;</a><span class="text-muted">Back to Home</span></div>
        </div>

        <div class="col-md-4 summary">
             <div class="title">
                <div class="row">
                    <div class="col">
                        <h4><b><span class="align-content-center">Summary</span></b></h4>
                    </div>
                </div>
            </div>
            <hr />
           
            <form>
                <p>Ship address</p> 
                    
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Ship address" ForeColor="Red"></asp:RequiredFieldValidator>
                
                <p>SHIPPING</p> <select>
                    <option class="text-muted">Standard-Delivery</option>
                </select>
                <p>Payment Method</p> <select>
                    <option class="text-muted"> bank transfer</option>
                </select>
                <p>Bank: Al Rajhi</p>
                <p>Owner: Saeed asiri</p>
                <p>Account NO: 1234567890</p>
                <hr />
                <p>Please upload your receipt</p><asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="FileUpload1" runat="server" ErrorMessage="Receipt image" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Only image files are allowed" 
                ControlToValidate="FileUpload1" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.JPG|.gif|.GIF|.png|.PNG|.bmp|.BMP)$">
                </asp:RegularExpressionValidator>

            </form>
            <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                <div class="col">TOTAL PRICE</div>
                <div class="col text-right"><%#Eval("Max") %>SAR</div>
                
            </div>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="CHECKOUT" class="btn"/>
        </div>
     <div class="col-md-4 summary">
             <div class="title">
                <div class="row">
                    <div class="col">
                        <img  src="img/Logohq.png"/>
                    </div>
                </div>
            </div>
        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                </Columns>
            </asp:GridView>

                    
        <asp:Label ID="Label2" Visible="false" runat="server" Text="Pending"></asp:Label>
                
</form>
</body>
</html>
