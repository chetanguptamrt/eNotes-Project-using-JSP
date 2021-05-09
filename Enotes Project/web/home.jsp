<%-- 
    Document   : home
    Created on : 28-Apr-2021, 4:13:42 PM
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
        <title>Home | eNotes</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        
        <div class="container p-0">
            <div class="card p-3" style="border: 0px;">
                <div class="card-body text-center">
                    <img class="img-fluid" src="./img/notes.jpg" alt="notes"><br/>
                    <h2>Start Taking Your Notes</h2>
                    <a href="./addNotes.jsp" class="btn btn-outline-primary">Start Here</a>
                </div>
            </div>
        </div>
        
        <%@include file="./component/footer.jsp" %>        
        <%@include file="./component/script.jsp" %>
    </body>
</html>
