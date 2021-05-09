<%-- 
    Document   : index
    Created on : 26-Apr-2021, 12:53:45 PM
    Author     : chetan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
        <%@include file="./component/css.jsp" %>
        <style type="text/css">
            .back-img{
                background: url("./img/cover.jpg");
                width: 100%;
                height: 80vh;
                background-repeat: no-repeat;
                background-size: cover;
                /*position: fixed;*/ 
            }
            
        </style>
        
        <title>eNotes</title>
    </head>
    <body>

        <%@include file="./component/navbar.jsp" %>
        <%@include file="./component/login.jsp" %>
        <%@include file="./component/register.jsp" %>

        
        <div class="container-fluid back-img text-center">
            <br/>
            <h1><i class="fa fa-book" aria-hidden="true"></i> E-Notes: Save Your Notes</h1>
            <a class="btn btn-dark text-light mr-4"  data-toggle="modal" data-target="#loginModal"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Login</a>
            <a class="btn btn-dark text-light" data-toggle="modal" data-target="#registerModal"><i class="fa fa-user-plus" aria-hidden="true"></i> Sign up</a>
        </div>
        
        <%@include file="./component/footer.jsp" %>
        <%@include file="./component/script.jsp" %>

        <script type="text/javascript">
            $(document).ready(function(){
                $("#loginForm").on("submit",function(event){
                    event.preventDefault();
                    if(document.loginForm.loginEmail.value===""){
                        document.getElementById("loginStatus").style.visibility = "visible";
                        document.getElementById("loginStatus").style.display = "block";
                        document.getElementById("loginStatus").innerHTML = "Please write Email!";
                    }
                    else if(document.loginForm.loginPassword.value===""){
                        document.getElementById("loginStatus").style.visibility = "visible";
                        document.getElementById("loginStatus").style.display = "block";
                        document.getElementById("loginStatus").innerHTML = "Please write Password!";
                    }
                    else {
                        var f = $(this).serialize();
                        $.ajax({
                            url: "./LoginServlet",
                            data: f,
                            method: "POST",
                            success:function(data,textStatus,jqXHR){
                                if(data.trim()==="done"){
                                    location.href="./home.jsp";
                                }
                                else if(data.trim()==="invalid"){
                                    document.getElementById("loginStatus").style.visibility = "visible";
                                    document.getElementById("loginStatus").style.display = "block";
                                    document.getElementById("loginStatus").innerHTML = "Wrong Email or Password!";
                                }
                                else{
                                    document.getElementById("loginStatus").style.visibility = "visible";
                                    document.getElementById("loginStatus").style.display = "block";
                                    document.getElementById("loginStatus").innerHTML = "Something went wrong!";                                
                                }
                            },
                            error:function(jqXHR,exception){
                                document.getElementById("loginStatus").style.visibility = "visible";
                                document.getElementById("loginStatus").style.display = "block";
                                document.getElementById("loginStatus").innerHTML = "Something went wrong!";
                            }
                        });                        
                    }
                });
                
                $("#registerForm").on("submit",function(event){
                    event.preventDefault();
                    if (document.registerForm.registerName.value===""){
                        document.getElementById("registerStatus").style.visibility = "visible";
                        document.getElementById("registerStatus").style.display = "block";
                        document.getElementById("registerStatus").innerHTML = "Please Write Name!";
                    }
                    else if (document.registerForm.registerEmail.value===""){
                        document.getElementById("registerStatus").style.visibility = "visible";
                        document.getElementById("registerStatus").style.display = "block";
                        document.getElementById("registerStatus").innerHTML = "Please Write Email!";                        
                    }
                    else if (document.registerForm.registerPassword.value===""){
                        document.getElementById("registerStatus").style.visibility = "visible";
                        document.getElementById("registerStatus").style.display = "block";
                        document.getElementById("registerStatus").innerHTML = "Please Write Password!";                        
                    }
                    else{
                        var f = $(this).serialize();
                        $.ajax({
                            url: "./UserServlet",
                            data: f,
                            method: "post",
                            success:function(data,textStatus,jqXHR){
                                if(data.trim()==="done"){
                                    location.href = "./home.jsp";
                                }
                                else if(data.trim()==="alreadyEmail"){
                                    document.getElementById("registerStatus").style.visibility = "visible";
                                    document.getElementById("registerStatus").style.display = "block";
                                    document.getElementById("registerStatus").innerHTML = "Email Already Registered!";                                
                                }
                                else{
                                    document.getElementById("registerStatus").style.visibility = "visible";
                                    document.getElementById("registerStatus").style.display = "block";
                                    document.getElementById("registerStatus").innerHTML = "Something Went Wrong!"; 
                                }
                            },
                            error:function(jqXHR, exception){
                                document.getElementById("registerStatus").style.visibility = "visible";
                                document.getElementById("registerStatus").style.display = "block";
                                document.getElementById("registerStatus").innerHTML = "Something Went Wrong!"; 
                            }
                        });
                    }
                });
            });
        </script>
    </body>
</html>