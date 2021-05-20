<%-- 
    Document   : logOutUser
    Created on : 19-May-2021, 12:01:08 PM
    Author     : chetan
--%>

<%
    session.invalidate();
    response.sendRedirect("./home.jsp");
%>