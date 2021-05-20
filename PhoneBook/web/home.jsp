<%-- 
    Document   : home
    Created on : 16-May-2021, 3:32:01 PM
    Author     : chetan 
--%>
<%@page import="com.dao.UserDAO"%>
<%
    if(session.getAttribute("userD")!=null) {
        UserDetail ud = (UserDetail)session.getAttribute("userD");
        if(!ud.getActivate()) {
            UserDAO dao = new UserDAO();
            session.setAttribute("userD", dao.getDetail(ud.getEmail()));
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./component/head.jsp" %>
        <title>Home | Phone Book</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        <%
            if(session.getAttribute("userD")!=null) {
                UserDetail ud = (UserDetail)session.getAttribute("userD");
                if(!ud.getActivate()) {
        %>
                <div class="container">
                    <div class="row">
                        <div class="col-12 account-warning">
                            <p>Your account is not Activate. <a href="./ResendLinkServlet">Resent link</a></p>
                            <p>Please check your email (<%=ud.getEmail()%>) to activate your account.</p>
                        </div>
                    </div>
                </div>
        <%
                }
            }
        %>
        
        <div class="container">
            <div class="row">
                <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-md-10 offset-md-1 col-sm-12 col-12">
                    <%
                        if(session.getAttribute("userD")!=null) {
                    %>
                                <div class="card" style="margin-top: 25px; margin-bottom: 25px;">
                                    <img src="./img/cover.jpg" class="card-img-top" alt="cover image">
                                    <div class="card-body">
                                        <h5 class="card-title">Add your contact</h5>
                                        <div class="text-center">
                                            <a href="./addContact.jsp" class="btn btn-outline-primary">
                                                <i class="fa fa-plus" aria-hidden="true"></i> Add Contact
                                            </a>
                                        </div>
                                    </div>
                                </div>
                    <%
                        } else {
                    %>
                                <div class="card" style="margin-top: 25px; margin-bottom: 25px;">
                                    <img src="./img/cover.jpg" class="card-img-top" alt="cover image">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-6 text-center">
                                                <button type="button" data-toggle="modal" data-target="#loginModal" class="btn btn-outline-primary">
                                                    <i class="fa fa-sign-in" aria-hidden="true"></i> Login
                                                </button>                                                
                                            </div>
                                            <div class="col-6 text-center">
                                                <button type="button" data-toggle="modal" data-target="#registerModal" class="btn btn-outline-primary">
                                                    <i class="fa fa-user-plus" aria-hidden="true"></i> Registration
                                                </button>                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                    
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        
        <footer class="text-center bg-primary text-light pt-2 pb-1">
            <p>This project designed by Chetan Gupta <br/>
               Copyright &copy; 2021 | All Rights Reserved</p>
        </footer>
        <script src="./js/home.js"></script>
    </body>
</html>