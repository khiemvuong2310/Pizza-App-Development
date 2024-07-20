<%-- 
    Document   : Home
    Created on : Mar 5, 2024, 1:07:40 AM
    Author     : admin
--%>

<%@page import="Models.Entity.Customer"%>
<%@page import="Models.Entity.Account"%>
<%@page import="Models.DAO.CustomerDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.Entity.Category"%>
<%@page import="Models.DAO.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="Models.Entity.Product"%>
<%@page import="Models.DAO.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Pizza</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <style>
            html {
                position: relative;
                min-height: 100%;
            }

            body {
                margin: 0;
                margin-bottom: 250px;
            }

            .mainPart{
                background-color: #e5edff
            }
            img{
                width:  100%;
            }

            .row{
                padding-bottom: 30px
            }
            h2{
                float: right
            }
            input[type='submit']{
                background-color: #3479B4;
                color: white;
                border-radius: 5px;
                width: 40%;
                height: 30px
            }
            .sizesearch{
                width: 380px;
            }

            .unit:hover{
                background-color: #cad1d5;
            }
            .unit a:hover{
                text-decoration: none
            }

            .unit a{
                color: black
            }
            .unit {
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 15px;
                margin-bottom: 20px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                transition: box-shadow 0.3s ease;
            }

            .unit:hover {
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            }

            .unit a {
                color: black;
                text-decoration: none;
            }

            .unit a:hover {
                text-decoration: underline;
            }

            .unit img {
                width: 100%;
                border-radius: 5px;
            }

            .unit h3 {
                color: #3FB3A7;
                margin-top: 10px;
                margin-bottom: 5px;
            }

            .unit h2 {
                color: #333;
                font-size: 18px;
                font-weight: bold;
            }

            .unit p {
                font-size: 14px;
                line-height: 1.5;
            }

            .unit form {
                margin-top: 10px;
            }

            .unit input[type='submit'] {
                background-color: #3479B4;
                color: white;
                border: none;
                border-radius: 3px;
                padding: 8px 15px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .unit input[type='submit']:hover {
                background-color: #23527c;
            }
        </style>
    </head>

    <body class="mainPart">
        <jsp:include page="NavigationBar.jsp"></jsp:include>
            <div class="container">

            <%
                List<Product> productList = new ArrayList();
                ProductDAO productDao = new ProductDAO();
                String category = (String) session.getAttribute("categorySelected");
                if (session.getAttribute("productList") != null) {
                    productList = (List<Product>) session.getAttribute("productList");
                } else {
                    productList = productDao.getProductList();
                }
            %>


            <h1>Pizza Menu</h1>
            <%
                if (request.getAttribute("Message") != null) {
            %>
            <%=request.getAttribute("Message")%>
            <%
                }
            %>
            <div class="header-search col-md-6">
                <div class="form-group has-feedback has-search sizesearch">
                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                    <input type="text" class="form-control sizesearch" placeholder="Product Name" name="txtSearchValue" oninput="searchByName(this)">
                </div>
            </div>

            <h3 style="padding:  50px ">All Pizza: <%=category == null ? "All category" : category%></h3>

            <div class="container-fluid" id="content">
                <%
                    CategoryDAO categoryDao = new CategoryDAO();
                    Category c;

                    for (int i = 0; i < productList.size(); i++) {
                        if (i % 3 == 0) {
                %>
                <div class="row">
                    <%
                        }
                        Product p = productList.get(i);
                        c = categoryDao.getCategoryById(p.getCategoryId());
                    %>
                    <div class="col-md-4 unit">
                        <a href="ProductController?action=view&action1=view&productId=<%=p.getProductId()%>">
                            <img src="<%=p.getProductImage()%>" class="img-fluid">
                            <h3 style="color: #3FB3A7"><%=p.getProductName()%></h3>
                            <h2>$<%=p.getUnitPrice()%></h2>
                            <p style=" font-weight: bold;"><%=c.getCategoryName()%></p>
                            <p><%=c.getDescription()%></p>
                        </a>
                        <%
                            if (session.getAttribute("account") != null) {
                                CustomerDAO customerDao = new CustomerDAO();

                        %>
                        <form action="CartController?productId=<%=p.getProductId()%>&action=Add" method="post">
                            <input value="Add to Cart" type="submit">
                        </form>

                        <%
                        } else {
                        %>
                        <form action="Login.jsp" method="post">
                            <input value="Add to Cart" type="submit">
                        </form>
                        <%
                            }
                        %>


                    </div>
                    <%
                        if ((i + 1) % 3 == 0 || i == productList.size() - 1) {
                    %>
                </div>
                <%
                        }
                    }

                %>
            </div>

        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
            function searchByName(param) {
                var value = param.value;

                $.ajax({
                    url: "/Assignment_ShoppingWebsite_SE172984/SearchProductController",
                    type: "get", //send it through get method
                    data: {
                        txtSearchValue: value
                    },
                    success: function (response) {
                        //Do Something
                        var content = document.getElementById("content");
                        content.innerHTML = response;
                    },
                    error: function (xhr) {
                    }
                });
            }

        </script>
    </body>
</html>
