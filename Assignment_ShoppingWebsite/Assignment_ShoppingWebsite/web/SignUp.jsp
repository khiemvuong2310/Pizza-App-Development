<%-- 
    Document   : Login
    Created on : Mar 3, 2024, 8:54:04 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


        <style>
            body{
                background-color: #e5edff

            }
            /*            .inputBox {
                            border: 1px solid #ccc;
                            background-color: white
                        }*/

            .row {
                display: flex;
                justify-content: center;
                align-items: center
            }

            .loginElement {
                margin: 0px;
                padding: 0px
            }

        </style>
    </head>
    <body>
        <jsp:include page="NavigationBar.jsp"></jsp:include>

            <div class="container inputBox">    
                <div class="row">

                    <div id="signupbox" style="margin-right: 20px" class="mainbox  loginElement ">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="panel-title">Sign Up</div>
<!--                                <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="Login.jsp">Log In</a></div>-->
                            </div>  
                            <div class="panel-body" >
                                <form action="AccountController?action=add" id="signupform" class="form-horizontal" role="form" method="post">
                                    <div id="signupalert" style="display:none" class="alert alert-danger">
                                        <p>Error:</p>
                                        <span></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="col-md-3 control-label">UserName</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="txtUserName" placeholder="UserName">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="firstname" class="col-md-3 control-label">Password</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="txtPassword" placeholder="Password">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="lastname" class="col-md-3 control-label">Full Name</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="txtFullName" placeholder="Full Name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <!-- Button -->                                        
                                        <div class="col-md-offset-3 col-md-9">
                                            <button id="btn-signup" type="submit" class="btn btn-info"><i class="icon-hand-right"></i> Sign Up</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div> 
                </div>

            </div>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <jsp:include page="Footer.jsp"></jsp:include>

    </body>
</html>
