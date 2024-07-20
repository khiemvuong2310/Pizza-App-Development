<%@page import="Models.Entity.Account"%>
<%@page import="Models.Entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="Models.DAO.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">-->
<style>
    .dropdown:hover .dropdown-menu {
        display: block;
    }
    .navbar-custom {
        background-color: #204AC9;
        color: white;
        font-size: 25px;
        height: 5%
    }

    .navbar-custom .navbar-nav > li > a {
        color: white;
        align-items: center;
        display: flex;
        padding: 15px;
    }

    .navbar-custom .navbar-nav > li > a:hover {
        background-color: #00334d;
        color: white;
    }
    .navbar-custom .navbar-nav > li > a:visited {
        background-color: #00334d;
        color: white;
    }
    .navbar-custom .navbar-nav > li > a:active {
        background-color: #00334d;
        color: white;
    }

    .navbar-brand {
        display: flex;
        align-items: center;
        height: 100%;
    }

    .navbar-brand img {
        max-height: 30%;
        max-width: 30%;
        padding-right: 20px;
    }

    .title{
        color: white;
        margin-right: 20px;
        height: 120px
    }
    .rightMenu{
        color: white;
        margin-right: 5px;
        height: 120px
    }
    #heading-title{
        color: white;
        align-items: center;
        display: flex;
        font-size: 30px;
    }
</style>

<nav class="navbar navbar-default navbar-custom">
    <div class="container-fluid">
        <div class="navbar-header">
            <!--            <a class="navbar-brand" href="Home.jsp" id="heading-title"><img src="image/Icon.png"><span>Pizza Store</span></a>-->
            <a class="navbar-brand" href="Menu.jsp" id="heading-title" style="margin-top: 36px;"><span>Pizza Store</span></a>
        </div>
        
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="nav navbar-nav">
                <li ><a href="ProductController?action=searchByCategory" class="title">Pizzas</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle title" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categories <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <% CategoryDAO categoryDao = new CategoryDAO();
                            List<Category> categoryList = categoryDao.getCategoryList();
                            for (Category c : categoryList) {
                        %>
                        <li><a href="ProductController?category=<%=c.getCategoryName()%>
                               &action=searchByCategory"><%=c.getCategoryName()%></a></li>
                            <% }%>
                        <hr/>
                        <li><a href="ProductController?action=searchByCategory">Show All</a></li>
                    </ul>
                </li>
                <%
                    Account a = null;
                    if (session.getAttribute("account") != null) {
                        a = (Account) session.getAttribute("account");
                        //Check Acount true=Admin
                        if (a.isType()) {
                %>
                <li><a href="ManageOrder.jsp" class="title">Order</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="ManageProduct.jsp" class="rightMenu"><span class="glyphicon glyphicon-user"></span> <%=a.getFullName()%></a></li>
                <li><a href="LogOutController" class="rightMenu"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
                <li><a href="CartController?action=view" class="rightMenu"><span class="glyphicon glyphicon-shopping-cart"></span> View Cart</a></li>
            </ul>
            <%
                //Còn lại User
            } else {
            %>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="OrderHistory.jsp" class="rightMenu">Order History</a></li>
                <li><a class="rightMenu"><span class="glyphicon glyphicon-user"></span> <%=a.getFullName()%></a></li>
                <li><a href="LogOutController" class="rightMenu"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
                <li><a href="CartController?action=view" class="rightMenu"><span class="glyphicon glyphicon-shopping-cart"></span> View Cart</a></li>
            </ul>
            <%                    }
            } else {
            %>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="SignUp.jsp" class="rightMenu"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                <li><a href="Login.jsp" class="rightMenu"><span class="glyphicon glyphicon-log-in"></span> Log in</a></li>
                <li><a href="CartController?action=view" class="rightMenu"><span class="glyphicon glyphicon-shopping-cart"></span> View Cart</a></li>
            </ul>
            <%
                }
            %>
        </div>
    </div>
</nav>

<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>-->
