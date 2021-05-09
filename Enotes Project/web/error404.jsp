<%-- 
    Document   : error404
    Created on : 30-Apr-2021, 2:36:21 PM
    Author     : chetan
--%>
<%
    if(session.getAttribute("userD")==null){
        response.sendRedirect("./index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="./component/css.jsp" %>
        <title>Error 404 | eNotes</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        <div class="card text-center">
            <img class="card-img-top img-fluid mx-auto" src="./img/error404.png" style="max-width: 450px" alt="error 404">
            <div class="card-body text-center">
                <a href="./home.jsp" class="btn btn-outline-primary">Home Page</a>
            </div>
        </div>
        <%@include file="./component/footer.jsp" %>
        <%@include file="./component/script.jsp" %>        
    </body>
</html>
