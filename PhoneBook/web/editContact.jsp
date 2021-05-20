<%-- 
    Document   : editContact
    Created on : 19-May-2021, 6:51:22 PM
    Author     : chetan
--%>

<%@page import="com.dao.ContactDAO"%>
<%@page import="com.detail.ContactDetail"%>
<%
    try{
    int id;
    ContactDetail cd = null;
    
    if(session.getAttribute("userD")!=null) {
        UserDetail ud = (UserDetail)session.getAttribute("userD");
        if(!ud.getActivate()) {
            response.sendRedirect("./home.jsp");
        } else {
            id = Integer.parseInt(request.getParameter("id"));
            ContactDAO dao = new ContactDAO();
            cd = dao.getContactDetail(id, ud.getId());
        }
    } else{
        response.sendRedirect("./home.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./component/head.jsp" %>
        <title>Edit Contact | Phone Book</title>
        <style>
            .content-contact{
                margin-top: 35px;
                border: 1px solid #ccccff;
                padding: 25px;
                border-radius: 20px;
            }
        </style>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        <div class="container-md">
            <div class="row">
                <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-md-12 col-sm-12 col-12">
                    <div class="content-contact">
                        <div class="alert" id="status" style="display:none;" role="alert"></div>
                        <form id="addContact">
                            
                            <input name="id" type="text" hidden value="<%= cd.getId() %>" />
                            
                            <label for="name" class="font-weight-bold">
                                <i class="fa fa-user" aria-hidden="true"></i> Name
                            </label>
                            <input name="name" id="name" class="form-control" placeholder="John Smith" type="text" maxlength="30" required="required" value="<%= cd.getName() %>" />
                            
                            <label class="mt-3 font-weight-bold">
                                <i class="fa fa-phone" aria-hidden="true"></i> Phone
                            </label>
                            <div class="row">
                                <div class="col-xl-8 col-lg-8 col-md-12 col-sm-12 col-12 mt-1" >
                                    <input name="phone" id="phone" class="form-control" placeholder="+91 987654215" type="text" maxlength="20" value="<%= cd.getPhone() %>" />
                                </div>
                                <div class="col-xl-4 col-lg-4 col-md-5 col-sm-6 col-6 mt-1" >
                                    <select id="phoneName" name="phoneName" class="form-control" >
                                        <option value="Mobile" >Mobile</option>
                                        <option value="Home" >Home</option>
                                        <option value="Work" >Work</option>
                                        <option value="Main" >Main</option>
                                        <option value="Office" >Office</option>
                                        <option value="Other" >Other</option>
                                    </select>
                                </div>
                            </div>
                                
                            <label class="mt-3 font-weight-bold">
                              <i class="fa fa-envelope" aria-hidden="true"></i> Email
                            </label>
                            <div class="row">
                                <div class="col-xl-8 col-lg-8 col-md-12 col-sm-12 col-12 mt-1" >
                                    <input name="email" id="email" class="form-control" type="email" placeholder="john@example.com" maxlength="50" value="<%= cd.getEmail() %>" />
                                </div>
                                <div class="col-xl-4 col-lg-4 col-md-5 col-sm-6 col-6 mt-1" >
                                    <select id="emailName" name="emailName" class="form-control">
                                        <option value="Mobile" >Mobile</option>
                                        <option value="Home" >Home</option>
                                        <option value="Work" >Work</option>
                                        <option value="Main" >Main</option>
                                        <option value="Office" >Office</option>
                                        <option value="Other" >Other</option>
                                    </select>
                                </div>
                            </div>
                                
                            <label for="occp" class="mt-3 font-weight-bold">
                                <i class="fa fa-user-secret" aria-hidden="true"></i> Occupation
                            </label>
                            <input name="occp" id="occp" class="form-control" placeholder="For eg: Doctor, Engineer etc" type="text" maxlength="30" value="<%= cd.getOccupation() %>"/>
                            
                            <div class="mt-3 text-center">
                                <button type="submit" class="btn btn-success" >Update</button>
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <script>
            $(document).ready(function(){
                $("#phoneName").val("<%= cd.getPhoneName() %>");
                $("#emailName").val("<%= cd.getEmailName() %>");
            });
        </script>
        <script src="./js/editContact.js"></script>
    </body>
</html>
<%
    }
    catch(Exception e){}
%>