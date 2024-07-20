<%@page import="Models.Entity.Account"%>
<%@page import="Models.Entity.Category"%>
<%@page import="Models.DAO.CategoryDAO"%>
<%@page import="Models.Entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="Models.DAO.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Order</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <style>
            html {
                position: relative;
                min-height: 100%;
            }

            body {
                margin: 0;
                margin-bottom: 250px;
                background-color: #e5edff
            }

            /* Style the action links */
            .action-links a {
                color: blue;
                text-decoration: none;
                margin-right: 5px;
            }
            .btn-back {
                display: inline-block;
                background-color: #007bff;
                color: #fff;
                font-size: 16px;
                font-weight: bold;
                text-decoration: none;
                padding: 10px 20px;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .btn-back span {
                position: relative;
                z-index: 1;
            }

            .btn-back::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(255, 255, 255, 0.2);
                border-radius: 5px;
                transition: opacity 0.3s ease;
                z-index: 0;
            }

            .btn-back:hover::before {
                opacity: 0.5;
            }

            .btn-back:hover {
                background-color: bisque;
            }
            /* Add border hover effect for buttons */
            .btn-with-border {
                position: relative;
                overflow: hidden;
            }

            .btn-with-border::after {
                content: '';
                position: absolute;
                top: 0;
                left: 50%;
                width: 0;
                height: 100%;
                background-color: rgba(255, 255, 255, 0.3);
                transition: width 0.3s ease-out, left 0.3s ease-out;
                z-index: 1;
            }

            .btn-with-border:hover::after {
                width: 100%;
                left: 0;
            }
            .a{
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <jsp:include page="NavigationBar.jsp"></jsp:include>
            <div class="container">
                <h1>Orders</h1>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer ID</th>
                            <th>Order Date</th>
                            <th>Required Date</th>
                            <th>Shipped Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        OrderDAO orderDao = new OrderDAO();
                        Account a = (Account) session.getAttribute("account");
                        List<Order> orderList = orderDao.getOrderByCustomerId(a.getAccountId());
                        for (Order p : orderList) {
                    %>
                    <tr>
                        <td><%=p.getOrderId()%></td>
                        <td><%=p.getCustomerId()%></td>
                        <td><%=p.getOrderDate()%></td>
                        <td><%=p.getRequiredDate()%></td>
                        <td><%=p.getShippedDate()%></td>
                        <td>
                            <a href="OrderController?action=view&orderId=<%=p.getOrderId()%>&customerId=<%=p.getCustomerId()%>" class="btn btn-primary btn-with-border">Details</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <a href="Menu.jsp" class="btn-back">
                <span>Back to Menu</span>
            </a>

        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </body>
</html>
