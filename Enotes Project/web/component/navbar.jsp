<%@page import="com.user.UserDetail"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-custom">
    <a class="navbar-brand" href="#"><i class="fa fa-book" aria-hidden="true"></i> eNotes</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="./home.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./addNotes.jsp"><i class="fa fa-plus-circle" aria-hidden="true"></i> Add Notes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./showNotes.jsp"><i class="fa fa-address-book-o" aria-hidden="true"></i> Show Notes</a>
            </li>
        </ul>

        <% 
            UserDetail user = (UserDetail)session.getAttribute("userD");
            if(user!=null){
        %>
                <a class="btn btn-light my-2 my-sm-0 mr-2"  data-toggle="modal" data-target="#profileModal"><i class="fa fa-user-circle-o" aria-hidden="true"></i> <%= user.getName() %></a>
                <a href="./LogoutServlet" class="btn btn-light my-2 my-sm-0" ><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>

                <!-- Modal -->
                <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">User Details</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                     <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <table class="table">
                                    <tr>
                                        <td style="border: 0px;" class="display-3 text-center" colspan="2"><i class="fa fa-user" aria-hidden="true"></i></td>
                                    </tr>
                                    <tr>
                                        <td>User ID</td>
                                        <td><%=user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Name</td>
                                        <td><%=user.getName()%></td>
                                    </tr>
                                    <tr>
                                        <td>Email ID</td>
                                        <td><%=user.getEmail()%></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="text-center">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>                                    
                        </div>
                    </div>
                </div>      
        <%
            }
            else {
        %>
                <a class="btn btn-light my-2 my-sm-0 mr-2" data-toggle="modal" data-target="#loginModal"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Login</a>
                <a class="btn btn-light my-2 my-sm-0" data-toggle="modal" data-target="#registerModal" ><i class="fa fa-user-plus" aria-hidden="true"></i> Sign up</a>
        <%
            }
        %>
    </div>
</nav>