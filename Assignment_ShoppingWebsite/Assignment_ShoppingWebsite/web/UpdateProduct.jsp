<%-- 
    Document   : CreatePizza
    Created on : Mar 8, 2024, 3:14:46 PM
    Author     : admin
--%>

<%@page import="Models.Entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Pizza</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <style>
            .createForm {
                margin-top: 50px;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #ffffff; /* Màu nền trắng */
                max-width: 800px; /* Tăng kích thước container */
                margin-left: auto;
                margin-right: auto;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Thêm shadow */
            }

            .createForm h1 {
                border-bottom: 1px solid #ddd;
                padding-bottom: 10px;
                margin-bottom: 20px;
                text-align: center;
                font-size: 24px; /* Tăng kích thước tiêu đề */
                color: #333; /* Màu chữ đậm */
            }

            .createForm h3 {
                margin-top: 20px;
                font-size: 18px; /* Tăng kích thước tiêu đề phụ */
                color: #666; /* Màu chữ nhạt */
            }

            .createForm label {
                display: block;
                margin-bottom: 5px;
                font-size: 16px; /* Kích thước chữ cho nhãn */
            }

            .createForm input[type="text"],
            .createForm input[type="number"],
            .createForm select {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 16px; /* Kích thước chữ cho input */
            }

            .createForm input[type="submit"] {
                width: 100%;
                background-color: #007bff; /* Màu nút chính là màu xanh dương */
                color: #ffffff; /* Màu chữ trắng */
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

            .createForm input[type="submit"]:hover {
                background-color: #0056b3; /* Màu nền khi hover */
            }
        </style>
    </head>
    <body>
        <jsp:include page="NavigationBar.jsp"></jsp:include>
            <div class="container createForm">
                <h1 style="border-bottom: 1px solid #ddd; width: 400px">Update Pizza</h1>
                <h3>Pizza</h3>
            <%
                Product product = (Product) request.getAttribute("productDetails");
            %>
            <form action="ProductController?action=update" method="post">
                Product ID: <input type="text" name="txtProductId" value="<%=product.getProductId()%>" readonly=""><br/>
                Product Name: <input type="text" name="txtProductName" value="<%=product.getProductName()%>"><br/>
                Supplier:
                <select name="txtSupplierId">
                    <option value="S001" <%if (product.getSupplierId().equalsIgnoreCase("S001")) {
                            %>selected=""<%
                                }
                            %>>Fresh Ingredients Inc</option>
                    <option value="S002" <%if (product.getSupplierId().equalsIgnoreCase("S002")) {
                            %>selected=""<%
                                }
                            %>>Farm to Table Foods</option>
                    <option value="S003" <%if (product.getSupplierId().equalsIgnoreCase("S003")) {
                            %>selected=""<%
                                }
                            %>>Local Farms Co-op</option>
                    <option value="S004" <%if (product.getSupplierId().equalsIgnoreCase("S004")) {
                            %>selected=""<%
                                }
                            %>>Artisan Bakers LLC</option>
                </select><br/>
                Category:
                <select name="txtCategoryId">
                    <option value="CAT001" <%if (product.getCategoryId().equalsIgnoreCase("CAT001")) {
                            %>selected=""<%
                                }
                            %>>Vegetarian</option>
                    <option value="CAT002" <%if (product.getCategoryId().equalsIgnoreCase("CAT002")) {
                            %>selected=""<%
                                }
                            %>>Beef</option>
                    <option value="CAT003" <%if (product.getCategoryId().equalsIgnoreCase("CAT003")) {
                            %>selected=""<%
                                }
                            %>>Seafood</option>
                    <option value="CAT004" <%if (product.getCategoryId().equalsIgnoreCase("CAT004")) {
                            %>selected=""<%
                                }
                            %>>Chicken</option>
                    <option value="CAT005" <%if (product.getCategoryId().equalsIgnoreCase("CAT005")) {
                            %>selected=""<%
                                }
                            %>>Pork</option>
                </select><br>
                Quantity Per Unit: <input type="number" name="txtQuantityPerUnit" value="<%=product.getQuantityPerUnit()%>"><br/>
                Unit Price: <input type="text" name="txtUnitPrice" value="<%=product.getUnitPrice()%>"><br/>
                Product Image URL: <input type="text" name="txtProductImage" value="<%=product.getProductImage()%>"><br/>
                <input type="submit" value="Save" class="btn btn-success">
            </form>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    </body>
</html>
