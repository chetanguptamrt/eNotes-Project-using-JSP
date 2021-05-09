<%-- 
    Document   : showNotes
    Created on : 30-Apr-2021, 11:50:52 AM
    Author     : chetan
--%>

<%@page import="java.util.List"%>
<%@page import="com.user.PostDetail"%>
<%@page import="com.dao.PostDAO"%>
<%@page import="com.database.DBConnect"%>
<%
    int uid = 0;
    if(session.getAttribute("userD")==null){
        response.sendRedirect("./index.jsp");
    }
    else{
        UserDetail user1 = (UserDetail)session.getAttribute("userD");
        uid=user1.getId();
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="./component/css.jsp" %>
        <title>Show Notes</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>

        <div class="container">
            <%
                PostDAO postdao = new PostDAO(DBConnect.getConn());
                List<PostDetail> post = postdao.getAllPost(uid);
                int i = 1;
                for(PostDetail po:post){
                %>
                    <br/>
                    <div class="card text-center">
                        <div class="card-header">
                            <i class="fa fa-book" aria-hidden="true"></i> Notes <%=i++%>
                        </div>
                        <div class="card-body">
                          <h5 class="card-title"> <%= po.getTitle() %> </h5>
                          <pre class="card-text"> <%=po.getContent()%> </pre>
                          
                          <a href="./DeleteServlet?noteId=<%=po.getId()%>&uid=<%=uid%>" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>
                          <a href="./edit.jsp?noteId=<%=po.getId()%>" class="btn btn-primary"><i class="fa fa-pencil" aria-hidden="true"></i> Edit</a>                          
                        </div>
                        <div class="card-footer text-muted">
                            Time: <%=po.getDate()%>
                        </div>
                    </div>
                <%
                }
                if(post.isEmpty()){
                %>
                <br/>
                <div class="card">
                    <img class="card-img-top text-center img-fluid" src="./img/notFound.jpg" alt="result not found">
                    <div class="card-header text-center">No notes found...</div>
                    <div class="card-body text-center">
                        <h2>Start Taking Your Notes</h2>
                        <a href="./addNotes.jsp" class="btn btn-outline-primary">Start Here</a>
                    </div>
                </div>
                <%
                }
            %>
        </div>
        <br/>
        <%@include file="./component/footer.jsp" %>
        <%@include file="./component/script.jsp" %>
        
    </body>
</html>
