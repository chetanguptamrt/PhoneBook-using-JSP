<%-- 
    Document   : forgotPassword
    Created on : 20-May-2021, 4:26:36 PM
    Author     : chetan
--%>
<%
   
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./component/head.jsp" %>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>

        <div class="container-sm">
            <div class="row mt-5 mb-3">
                <div class="col-12 text-center">
                    <h3>Forgot Password</h3>
                    <div class="text-center">
                        <small style="display: none" id="status"></small>
                    </div>
                </div>
            </div>
            <form id="getOTP">
                <div class="row">
                    <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-lg-2 col-sm-10 offset-sm-1 col-12">
                        <input id="email" placeholder="Enter your Email Address" text="email" class="form-control mb-3" name="email" required="required"/>
                        <div class="text-center">
                            <input type="submit" class="btn btn-primary" value="Get otp">
                        </div>
                    </div>
                </div>                
            </form>
            <form id="save">
                <div class="row mt-3">
                    <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-lg-2 col-sm-10 offset-sm-1 col-12">
                        <input id="email2" hidden name="email"/>
                        <input placeholder="Enter OTP" text="text" minlength="6" maxlength="6" class="form-control mb-3" name="otp" required="required"/>
                        <input placeholder="Enter your Password" text="password" class="form-control mb-3" minlength="6" name="password" required="required"/>
                        <div class="text-center">
                            <input type="submit" class="btn btn-primary" value="Save">
                        </div>
                    </div>
                </div>                
            </form>
        </div>
        <script src="./js/forgotPassword.js"></script>
        <script src="./js/home.js"></script>
    </body>
</html>
