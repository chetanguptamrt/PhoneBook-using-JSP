<%-- 
    Document   : showContact
    Created on : 17-May-2021, 2:25:59 PM
    Author     : chetan
--%>
<%@page import="com.dao.ContactDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.detail.ContactList"%>
<%
    List<ContactList> list = null;
    if(session.getAttribute("userD")!=null) {
        UserDetail ud = (UserDetail)session.getAttribute("userD");
        if(!ud.getActivate()) {
            response.sendRedirect("./home.jsp");
        }else{
            ContactDAO dao = new ContactDAO();
            list = dao.getContactList(ud.getId());
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
        <title>Show Contact | Phone Book</title>
     
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        
        <div class="container-md">
            <div class="row">
                <div class="col-12 text-center mt-3 mb-2">
                    <h3>Your Contact</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <table class="table">
                        <thead>
                            <tr>
                                <th style="border-top: none; border-bottom-color: black;" scope="col">Name</th>
                                <th style="border-top: none; border-bottom-color: black;" scope="col">Phone</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try{
                                    for(ContactList cl : list) {
                            %>
                                        <tr>
                                            <td data-toggle="modal" onclick="showModal(<%= cl.getId() %>)" data-target="#exampleModal" style="cursor: pointer"><%= cl.getName() %></td>
                                            <td>
                                                <a href="tel:<%= cl.getPhone() %>">
                                                    <%= cl.getPhone() %>
                                                </a>
                                            </td>
                                        </tr>
                            <%
                                    }
                                } catch(Exception ex){}
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="name"></h5>
                        
                        <a href="" id="editLink" class="ml-2 mt-1" style="color: black;">
                            <i class="fa fa-pencil" aria-hidden="true"></i>
                        </a>
                        <button class="close" data-dismiss="modal" aria-label="Close">
                            <i class="fa fa-times" aria-hidden="true"></i>
                        </button>
                        
                    </div>
                    <div id="detail" class="modal-body">
                        
                    </div>
              </div>
            </div>
        </div>
        
        <script src="./js/showContact.js"></script>
    </body>
</html>
