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
            table {
                width: 100%;
                border-collapse: collapse;
            }

            /* Style table header */
            th {
                background-color: #f2f2f2;
                text-align: left;
                padding: 15px;
            }

            /* Style table rows */
            td {
                border-bottom: 1px solid #ddd;
                padding: 15px;
            }

            /* Alternate row background color */
            tr{
                background-color: white;
            }

            /* Hover effect on rows */
            tr:hover {
                background-color: #ddd;
            }

            /* Style the action links */
            .action-links a {
                color: blue;
                text-decoration: none;
                margin-right: 5px;
            }

            /* Add margin to buttons */
            .btn {
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="NavigationBar.jsp"></jsp:include>
            <div class="container">
                <h1>Orders</h1>
                <table>
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
                        List<Order> orderList = orderDao.getOrderList();
                        for (Order p : orderList) {
                    %>
                    <tr>
                        <td><%=p.getOrderId()%></td>
                        <td><%=p.getCustomerId()%></td>
                        <td><%=p.getOrderDate()%></td>
                        <td><%=p.getRequiredDate()%></td>
                        <td><%=p.getShippedDate()%></td>
                        <td>
                            <!--<a href="OrderController?action=view&action1=update&orderId=<%=p.getOrderId()%>">Edit</a>|-->
                            <a href="OrderController?action=view&orderId=<%=p.getOrderId()%>&customerId=<%=p.getCustomerId()%>">Details</a>
                            <!--<a href="OrderController?action=delete&orderId=<%=p.getOrderId()%>">Delete</a>-->
                        </td>
                    </tr>
                    <%
                        }
                    %>

                </tbody>
            </table>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    </body>
</html>
