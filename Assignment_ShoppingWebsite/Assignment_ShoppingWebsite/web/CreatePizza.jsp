<%-- 
    Document   : CreatePizza
    Created on : Mar 8, 2024, 3:14:46 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new Pizza</title>
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
            .createForm {
                margin-top: 50px;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
                max-width: 500px;
                margin-left: auto;
                margin-right: auto;
            }

            .createForm h1 {
                border-bottom: 1px solid #ddd;
                padding-bottom: 10px;
                margin-bottom: 20px;
                text-align: center;
            }

            .createForm h3 {
                margin-top: 20px;
            }

            .createForm label {
                display: block;
                margin-bottom: 5px;
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
            }

            .createForm input[type="submit"] {
                width: 100%;
                background-color: #28a745;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

            .createForm input[type="submit"]:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <jsp:include page="NavigationBar.jsp"></jsp:include>
            <div class="container createForm">
                <h1 style="border-bottom: 1px solid #ddd; width: 400px">Create New Pizza</h1>
                <h3>Pizza</h3>
                <form action="ProductController?action=add" method="post">
                    Product Name: <input type="text" name="txtProductName"><br/>
                    Choose Supplier: 
                    <select name="txtSupplierId" onchange="checkOtherOption(this)">
                        <option value="S001">Domino's Pizza</option>
                        <option value="S002">Pizza Hut</option>
                        <option value="S003">Papa John's Pizza</option>
                        <option value="S004">Little Caesars</option>
                        <option value="other">Chọn khác</option>
                    </select>
                    <input type="text" id="otherOption" name="otherOption" style="display: none;" placeholder="Nhập tên nhà cung cấp khác...">
                    <br/>
                    <script>
                        function checkOtherOption(select) {
                            var otherOptionInput = document.getElementById("otherOption");
                            if (select.value === "other") {
                                otherOptionInput.style.display = "block";
                                otherOptionInput.required = true;
                            } else {
                                otherOptionInput.style.display = "none";
                                otherOptionInput.required = false;
                            }
                            otherOptionInput.value = ''; // Clear the input value when changing options
                        }
                    </script>
                    Choose Category: 
                    <select name="txtCategoryId" onchange="checkOtherCategory(this)">
                        <option value="CAT001">Vegetarian</option>
                        <option value="CAT002">Beef</option>
                        <option value="CAT003">Seafood</option>
                        <option value="CAT004">Chicken</option>
                        <option value="CAT005">Pork</option>
                        <option value="other">Other</option>
                    </select>
                    <input type="text" id="otherCategory" name="otherCategory" style="display: none;" placeholder="Nhập danh mục khác...">
                    <br/>

                    <script>
                        function checkOtherCategory(select) {
                            var otherCategoryInput = document.getElementById("otherCategory");
                            if (select.value === "other") {
                                otherCategoryInput.style.display = "block";
                                otherCategoryInput.required = true;
                            } else {
                                otherCategoryInput.style.display = "none";
                                otherCategoryInput.required = false;
                            }
                        }
                    </script>
                    Quantity Per Unit: <input type="number" name="txtQuantityPerUnit"><br/>
                    Unit Price: <input type="text" name="txtUnitPrice"><br/>
                    Product Image: <input type="text" name="txtProductImage"><br/>
                    <input type="submit" value="Create" class="btn btn-success"> 
                </form>
            </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    </body>
</html>
