<%-- 
    Document   : addNotes
    Created on : 29-Apr-2021, 3:49:57 PM
    Author     : chetan
--%>
<%@page import="com.user.PostDetail"%>
<%@page import="com.dao.PostDAO"%>
<%@page import="com.database.DBConnect"%>
<%
    int noteId = 0;
    int uid = 0;
    PostDetail post = null;
    String postTitle = null;
    String postContent = null;
    if(session.getAttribute("userD")==null){
       response.sendRedirect("./index.jsp");
    }
    else{
        UserDetail user1 = (UserDetail)session.getAttribute("userD");
        uid=user1.getId();
        noteId=Integer.parseInt(request.getParameter("noteId"));
        PostDAO dao = new PostDAO(DBConnect.getConn());
        post = dao.editNotes(noteId ,uid);
        try{
            postTitle = post.getTitle();
            postContent = post.getContent();
        }
        catch(Exception e){
            response.sendRedirect("./error404.jsp");
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="./component/css.jsp" %>
        <title>Edit Notes | eNotes</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        <br/>
        <div class="container p-0">
            <h1 class="text-center">Add Your Notes</h1>
            <div class="alert" id="postStatus" style="visibility: hidden; display: none;" role="alert"></div>
            <form id="postForm">
                <input type="hidden" name="id" value="<%=noteId%>" />
                <input type="hidden" name="uid" value="<%=uid%>" />
                <div class="form-group">
                    <label for="inputTitle">Enter Title</label>
                    <input value="<%=postTitle%>" maxlength="100" type="text" class="form-control" name="postTitle" id="postTitle" placeholder="Title (max length: 100 character)" required>
                </div>
                <div class="form-group">
                    <label for="inputContent">Enter Content</label>
                    <textarea rows="8" class="form-control" name="postContent" id="postContent" required placeholder="Enter your Content"><%=postContent%></textarea>
                </div>
                <button type="submit" class="btn btn-outline-dark">Update</button>
            </form>
        </div>
        <br/>
        <div class="mt-5">
            <%@include file="./component/footer.jsp" %>            
        </div>
        <%@include file="./component/script.jsp" %>
        <script>
            $(document).ready(function(){
                $("#postForm").on("submit",function(event){
                    event.preventDefault();
                    var f = $(this).serialize();
                    $.ajax({
                        url: "./EditServlet",
                        data: f,
                        method: "post",
                        success: function(data,textStatus,jqXHR){
                            if(data.trim()==="done"){
                                document.getElementById("postStatus").style.visibility = "visible";
                                document.getElementById("postStatus").style.display = "block";
                                $("#postStatus").removeClass("alert-warning");                                 
                                $("#postStatus").addClass("alert-primary");                                
                                document.getElementById("postStatus").innerHTML = "Update successfully!";                            
                            }
                            else{
                                document.getElementById("postStatus").style.visibility = "visible";
                                document.getElementById("postStatus").style.display = "block";
                                $("#postStatus").addClass("alert-warning");                                
                                document.getElementById("postStatus").innerHTML = "Something Went Wrong!";
                            }
                        },
                        error: function(exception,jqXHR){
                                document.getElementById("postStatus").style.visibility = "visible";
                                document.getElementById("postStatus").style.display = "block";
                                $("#postStatus").addClass("alert-warning");                                
                                document.getElementById("postStatus").innerHTML = "Something Went Wrong!";
                        }
                    });
                });
            });
        </script>
    </body>
</html>
