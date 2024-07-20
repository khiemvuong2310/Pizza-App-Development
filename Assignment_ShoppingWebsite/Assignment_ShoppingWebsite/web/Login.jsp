<%-- 
    Document   : Login
    Created on : Mar 10, 2024, 1:55:06 PM
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="Models.DAO.CategoryDAO"%>
<%@page import="Models.Entity.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Login</title>
<link href="css/login.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
    /* CSS ?? t?o thanh màu xanh ngang full màn hình */
    .top-bar {
        background-color: #204AC9; /* Màu xanh */
        width: 100%; /* Chi?u r?ng full */
        height: 80px; /* Chi?u cao c?a thanh */
        display: flex; /* Hi?n th? theo ki?u flexbox */
        align-items: center; /* C?n ch?nh các ph?n t? theo chi?u d?c */
        justify-content:flex-start; /* C?n ch?nh các ph?n t? theo chi?u ngang */
        color: white; /* Màu ch? tr?ng */
        font-size: 18px; /* Kích th??c ch? */
        justify-content: space-between; /* Đảm bảo phần tử con nằm ở hai phía */
        padding: 0 20px; /* Khoảng cách giữa các phần tử và mép của top-bar */
    }
    .register-link {
        margin-left: auto; /* Di chuyển thẻ sang phải cùng */
        color: white;
    }
    .register-link a {
        color: white; /* Đặt màu chữ của liên kết thành trắng */
    }
    .the{
        margin-right: 40px;

    }
    .top-bar.menu{
        margin-right: 40px; /* Kho?ng cách gi?a các th? */
    }
    .menu {
        display: flex;
        justify-content: flex-end;
        align-items: center;
    }
    .review
    {
        margin-right: 40px;
        color: white;
        text-decoration: none;
    }

    .menu span {
        display: flex;
        align-items: center;
        margin-right: 10px;
    }

    .menu span .arrow {
        font-size: 10px;
        margin-right: 5px;
    }

    .sidenav {
        height: 100%;
        width: 0;
        position: fixed;
        z-index: 1;
        top: 0;
        right: 0;
        background-color: #111;
        overflow-x: hidden;
        transition: 0.5s;
        padding-top: 60px;
    }

    .sidenav a {
        padding: 8px 8px 8px 32px;
        text-decoration: none;
        font-size: 25px;
        color: #818181;
        display: block;
        transition: 0.3s;
    }

    .sidenav a:hover {
        color: #f1f1f1;
    }

    .sidenav .closebtn {
        position: absolute;
        top: 0;
        right: 25px;
        font-size: 36px;
        margin-left: 50px;
    }

    @media screen and (max-height: 450px) {
        .sidenav {padding-top: 15px;}
        .sidenav a {font-size: 18px;}
    }

    html {
        position: relative;
        min-height: 100%;
    }

    body {
        margin: 0;
        margin-bottom: 250px;
        background-color: #F2F6F9
    }
</style>
</head>
<body>
    <div class="top-bar">
        <img src="image/pizza.jpg" width="60px" style="border-radius: 50%;margin-right: 30px" > 
        <h3 class="the">PizzaStore</h3>
        <h3 class="the">Pizza</h3>
        <h3><a href="Review.jsp" class="review">Review</a></h3>
        <div class="menu the">
            <div id="mySidenav" class="sidenav">
                <%
                    Category category = new Category();
                    CategoryDAO c = new CategoryDAO();
                    List<Category> categoryList = c.getCategoryList();
                    if (categoryList != null) {
                        for (Category cl : categoryList) {
                %>
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <a href="SearchProductByCategoryController?category=<%=cl.getCategoryName()%>">
                    <%=cl.getCategoryName()%></a>
                    <%         }
                        }
                    %>
            </div>
            <span style="cursor:pointer;padding-top: 5px;
                  font-size: 150%;" onclick="openNav()">
                Categories
                <span class="arrow">&#9660;</span>
            </span>
        </div>
        <!-- Thẻ register -->
        <div class="register-link">
            <a href="SignUp.jsp">Register</a>
        </div>
    </div>

    <script>
        function openNav() {
            document.getElementById("mySidenav").style.width = "300px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }
    </script>
    <br/>
    <br/>

    <div>
        <form
            class="form_container"
            action="LoginController" 
            id="loginform" r
            ole="form" method="post"
            autocomplete="off"
            >
            <div class="row title_container ">
                <div class="col-md-6 "><h1 class="title">Login to Pizza WebSite</h1></div>
                <div class="col-md-6 "><img src="image/logoPizza.jpg" style="    height: 100%;
                                            width: 78%;"></div>
            </div>
            <br />
            <div class="input_container">
                <label class="input_label" for="email_field">UserName</label>
                <svg
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                    class="icon"
                    >
                <circle
                    cx="12"
                    cy="6"
                    r="4"
                    stroke="#1C274C"
                    stroke-width="1.5"
                    />
                <path
                    d="M19.9975 18C20 17.8358 20 17.669 20 17.5C20 15.0147 16.4183 13 12 13C7.58172 13 4 15.0147 4 17.5C4 19.9853 4 22 12 22C14.231 22 15.8398 21.8433 17 21.5634"
                    stroke="#1C274C"
                    stroke-width="1.5"
                    stroke-linecap="round"
                    />
                </svg>
                <input
                    placeholder="UserName"
                    name="txtUsername"
                    type="text"
                    class="input_field"
                    id="email_field"
                    />
            </div>
            <div class="input_container">
                <label class="input_label" for="password_field">Password</label>
                <svg
                    fill="none"
                    viewBox="0 0 24 24"
                    height="24"
                    width="24"
                    xmlns="http://www.w3.org/2000/svg"
                    class="icon"
                    >
                <path
                    stroke-linecap="round"
                    stroke-width="1.5"
                    stroke="#141B34"
                    d="M18 11.0041C17.4166 9.91704 16.273 9.15775 14.9519 9.0993C13.477 9.03404 11.9788 9 10.329 9C8.67911 9 7.18091 9.03404 5.70604 9.0993C3.95328 9.17685 2.51295 10.4881 2.27882 12.1618C2.12602 13.2541 2 14.3734 2 15.5134C2 16.6534 2.12602 17.7727 2.27882 18.865C2.51295 20.5387 3.95328 21.8499 5.70604 21.9275C6.42013 21.9591 7.26041 21.9834 8 22"
                    ></path>
                <path
                    stroke-linejoin="round"
                    stroke-linecap="round"
                    stroke-width="1.5"
                    stroke="#141B34"
                    d="M6 9V6.5C6 4.01472 8.01472 2 10.5 2C12.9853 2 15 4.01472 15 6.5V9"
                    ></path>
                <path
                    fill="#141B34"
                    d="M21.2046 15.1045L20.6242 15.6956V15.6956L21.2046 15.1045ZM21.4196 16.4767C21.7461 16.7972 22.2706 16.7924 22.5911 16.466C22.9116 16.1395 22.9068 15.615 22.5804 15.2945L21.4196 16.4767ZM18.0228 15.1045L17.4424 14.5134V14.5134L18.0228 15.1045ZM18.2379 18.0387C18.5643 18.3593 19.0888 18.3545 19.4094 18.028C19.7299 17.7016 19.7251 17.1771 19.3987 16.8565L18.2379 18.0387ZM14.2603 20.7619C13.7039 21.3082 12.7957 21.3082 12.2394 20.7619L11.0786 21.9441C12.2794 23.1232 14.2202 23.1232 15.4211 21.9441L14.2603 20.7619ZM12.2394 20.7619C11.6914 20.2239 11.6914 19.358 12.2394 18.82L11.0786 17.6378C9.86927 18.8252 9.86927 20.7567 11.0786 21.9441L12.2394 20.7619ZM12.2394 18.82C12.7957 18.2737 13.7039 18.2737 14.2603 18.82L15.4211 17.6378C14.2202 16.4587 12.2794 16.4587 11.0786 17.6378L12.2394 18.82ZM14.2603 18.82C14.8082 19.358 14.8082 20.2239 14.2603 20.7619L15.4211 21.9441C16.6304 20.7567 16.6304 18.8252 15.4211 17.6378L14.2603 18.82ZM20.6242 15.6956L21.4196 16.4767L22.5804 15.2945L21.785 14.5134L20.6242 15.6956ZM15.4211 18.82L17.8078 16.4767L16.647 15.2944L14.2603 17.6377L15.4211 18.82ZM17.8078 16.4767L18.6032 15.6956L17.4424 14.5134L16.647 15.2945L17.8078 16.4767ZM16.647 16.4767L18.2379 18.0387L19.3987 16.8565L17.8078 15.2945L16.647 16.4767ZM21.785 14.5134C21.4266 14.1616 21.0998 13.8383 20.7993 13.6131C20.4791 13.3732 20.096 13.1716 19.6137 13.1716V14.8284C19.6145 14.8284 19.619 14.8273 19.6395 14.8357C19.6663 14.8466 19.7183 14.8735 19.806 14.9391C19.9969 15.0822 20.2326 15.3112 20.6242 15.6956L21.785 14.5134ZM18.6032 15.6956C18.9948 15.3112 19.2305 15.0822 19.4215 14.9391C19.5091 14.8735 19.5611 14.8466 19.5879 14.8357C19.6084 14.8273 19.6129 14.8284 19.6137 14.8284V13.1716C19.1314 13.1716 18.7483 13.3732 18.4281 13.6131C18.1276 13.8383 17.8008 14.1616 17.4424 14.5134L18.6032 15.6956Z"
                    ></path>
                </svg>
                <input
                    placeholder="Password"
                    name="txtPassword"
                    type="password"
                    class="input_field"
                    id="password_field"
                    />
            </div>       
            <input type="submit" name="btAction" value="Login" class="sign-in_btn"/>
            <%
                String message = (String) request.getAttribute("message");
                if (message != null) {
            %>
            <h4 style="color: red"><%=message%></h4>
            <%
                }
            %>
        </form> 
    </div>
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>
