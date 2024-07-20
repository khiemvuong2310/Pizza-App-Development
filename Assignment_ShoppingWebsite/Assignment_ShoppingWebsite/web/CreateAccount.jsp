<%-- 
    Document   : CreateAccount
    Created on : Mar 3, 2024, 8:22:37 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <style>

        </style>
    </head>
    <body>
        <h1 style="border-bottom: 1px solid #b4aeae; width: 300px; padding-bottom: 30px">Sign Up</h1>

        <form action="AccountController?action=Add" method="post">
            Account ID:<br/>
            <input type="text" name="txtAcountId"/><br/>
            Username:<br/>
            <input type="text" name="txtUserName"/><br/>
            Password:<br/>
            <input type="password" name="txtPassword"/><br/>
            Full Name:<br/>
            <input type="text" name="txtFullName"/><br/>
            Type:<input type="checkbox" name="chkType"/><br/>
            <input type="submit" value="Sign Up" name="btnAction">
        </form>
    </body>
</html>
