<%-- 
    Document   : profile
    Created on : 19-May-2021, 7:34:20 PM
    Author     : chetan
--%>
<%
    try{
    UserDetail udd = (UserDetail) session.getAttribute("userD");
    if(udd==null) {
        response.sendRedirect("./home.jsp");
    }

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
        
        <div class="container-sm mt-4 mb-4">
            <div class="row mt-5 mb-4" >
                <div class="col-md-4 col-12">
                    <h5>Profile pic avatar:</h5>
                </div>
                <div class="col-md-8 col-12" >
                    <div style="display:flex;">
                    <%
                        for(int i=1; i<=4; i++){
                    %>
                        <img src="./profile/p<%=i%>.jpg" alt="avatar" onclick="setPic(<%=i%>)" id="avatar<%=i%>" class="avatar"/>
                    <%
                        }
                    %>
                    </div>
                    <div style="display:flex;">
                    <%
                        for(int i=5; i<=8; i++){
                    %>
                        <img src="./profile/p<%=i%>.jpg" alt="avatar" onclick="setPic(<%=i%>)" id="avatar<%=i%>" class="avatar"/>
                    <%
                        }
                    %>
                    </div>
                    <form id="changeAvatar">
                        <input type="submit" value="Update" class="btn btn-success mt-2" />                        
                    </form>
                </div>
            </div>
            <hr/>
            <div class="row mt-4">
                <div class="col-12">
                    <h5 class="text-center">Change Password</h5>
                    <div class="text-center">
                        <small id="updateStatus" style="display:none"></small>    
                    </div>
                </div>
            </div>
            <form id="uPassword">
                <div class="row mt-2 mb-2">
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 col-12 mt-2">
                        <input type="password" class="form-control" placeholder="Old Password" id="oPassword" name="oPassword" required="required" minlength="6"/>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 col-12 mt-2">
                        <input type="password" class="form-control" placeholder="New Password" id="nPassword" name="nPassword" required="required" minlength="6"/>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 col-12 mt-2">
                        <input type="password" class="form-control" placeholder="Confirm Password" id="cPassword" name="cPassword" required="required" minlength="6"/>
                    </div>                    
                </div>    
                <div class="row mt-2">
                    <div class="col-12 text-center">
                        <input type="submit" class="btn btn-success" value="Update Password" />
                    </div>
                </div>
            </form>
        </div>
        <div class="container-sm mb-5 delete-account">
            <div class="row">
                <div class="col-12 text-center mb-3">
                    <h5 class="text-dark mb">Danger Zone</h5>
                </div>
                <div class="col-12 text-center">
                    <button id="delete" class="btn btn-danger">
                        <i class="fa fa-trash" aria-hidden="true"></i> Delete Account
                    </button>
                </div>
            </div>
        </div>
        <script src="./js/profile.js"></script>
    </body>
</html>
<%
    }
    catch(Exception e){

    }
%>