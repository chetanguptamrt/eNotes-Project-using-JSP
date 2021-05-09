<%-- 
    Document   : addNotes
    Created on : 29-Apr-2021, 3:49:57 PM
    Author     : chetan
--%>
<%
    int userId = 0;
    if(session.getAttribute("userD")==null){
       response.sendRedirect("./index.jsp");
    }
    else{
        UserDetail user1 = (UserDetail)session.getAttribute("userD");
        userId=user1.getId();
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="./component/css.jsp" %>
        <title>Add Notes | eNotes</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        <br/>
        <div class="container p-0">
            <h1 class="text-center">Add Your Notes</h1>
            <div class="alert" id="postStatus" style="visibility: hidden; display: none;" role="alert"></div>
            <form id="postForm">
                <input type="hidden" name="uid" value="<%=userId%>" />
                <div class="form-group">
                    <label for="inputTitle">Enter Title</label>
                    <input maxlength="100" type="text" class="form-control" name="postTitle" id="postTitle" placeholder="Title (max length: 100 character)" required>
                </div>
                <div class="form-group">
                    <label for="inputContent">Enter Content</label>
                    <textarea rows="8" class="form-control" name="postContent" id="postContent" required placeholder="Enter your Content"></textarea>
                </div>
                <button type="reset" class="btn btn-outline-dark mr-3">Reset</button>
                <button type="submit" class="btn btn-outline-dark">Add</button>
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
                        url: "./AddNotesServlet",
                        data: f,
                        method: "post",
                        success: function(data,textStatus,jqXHR){
                            if(data.trim()==="done"){
                                document.getElementById("postStatus").style.visibility = "visible";
                                document.getElementById("postStatus").style.display = "block";
                                $("#postStatus").removeClass("alert-warning");                                 
                                $("#postStatus").addClass("alert-primary");                                
                                document.getElementById("postStatus").innerHTML = "Notes successfully added!";
                                $("#postTitle").val("");
                                $("#postContent").val("");                                
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
