<%@page import="com.detail.UserDetail"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="#"><i class="fa fa-address-book" aria-hidden="true"></i> Phone Book</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="./home.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
            </li>
            <%
                if(session.getAttribute("userD")!=null) {
                    UserDetail ud = (UserDetail)session.getAttribute("userD");
                    if(ud.getActivate()) {
            %>
                        <li class="nav-item">
                            <a class="nav-link" href="./addContact.jsp"><i class="fa fa-plus" aria-hidden="true"></i> Add Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./showContact.jsp"><i class="fa fa-address-card" aria-hidden="true"></i> View Contact</a>
                        </li>
            <%
                    } else {
            %>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fa fa-plus" aria-hidden="true"></i> Add Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fa fa-address-card" aria-hidden="true"></i> View Contact</a>
                        </li>                    
            <%          
                    }
                }
            %>
        </ul>
        <div class="nav-item">
            <%
                if(session.getAttribute("userD")==null) {
            %>
                    <button type="button" data-toggle="modal" data-target="#loginModal" class="btn btn-outline-light mr-2">
                        <i class="fa fa-sign-in" aria-hidden="true"></i> Login
                    </button>
                    <button type="button" data-toggle="modal" data-target="#registerModal" class="btn btn-outline-light">
                        <i class="fa fa-user-plus" aria-hidden="true"></i> Registration
                    </button>
            <%
                } else {
                    UserDetail ud = (UserDetail)session.getAttribute("userD");
            %>
                        <a class="nav-link btn-outline-light profile"  tabindex="0" data-toggle="popover" data-trigger="focus">
                            <img class="img-fluid profile-image" src="<%= ud.getProfilePic() %>" />
                        </a>
                        <script>
                            $('.profile').popover({
                                trigger: 'focus',
                                html: true,
                                title:"<%= ud.getName() %>",
                                content:"<a href='./profile.jsp' class='btn btn-primary mb-3' ><i class='fa fa-user' aria-hidden='true'></i> Profile</a><br/>"+
                                        "<a href='./logOutUser.jsp' class='btn btn-danger' ><i class='fa fa-sign-out' aria-hidden='true'></i> Logout</a>",
                                placement: 'bottom'
                            });
                        </script>
            <%
                }
            %>
        </div>
    </div>
</nav>

<%
    if(session.getAttribute("userD")==null) {
%>
        <!-- Modal -->
        <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Login</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form id="loginForm">
                        <div class="modal-body">
                            <div id="loginStatus" style="display: none" class="alert alert-danger" role="alert"></div>
                            <label for="loginEmail">Email Address</label>
                            <input type="text" id="loginEmail" name="loginEmail" class="form-control" placeholder="john@example.com" value="" required="required" />
                            <label for="loginPassword" class="mt-3">Password</label>
                            <input type="password" id="loginPassword" name="loginPassword" class="form-control" placeholder="Password" minlength="6" value="" required="required" />
                            <div class="text-center mt-3">
                                <a href="./forgotPassword.jsp" class="mt">Forgot Password?</a>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">
                                <i class="fa fa-sign-in" aria-hidden="true"></i> Login
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Registration</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form id="registerForm">
                        <div class="modal-body">
                            <div id="registerStatus" style="display: none" class="alert alert-danger" role="alert"></div>
                            <label for="registerName">Name</label>
                            <input type="text" id="registerName" name="registerName" class="form-control" placeholder="John Smith" value="" required="required" />
                            <label for="registerEmail" class="mt-3">Email Address</label>
                            <input type="text" id="registerEmail" name="registerEmail" class="form-control" placeholder="john@example.com" value="" required="required" />
                            <label for="registerPassword" class="mt-3">Password</label>
                            <input type="password" id="registerPassword" name="registerPassword" class="form-control" placeholder="Password" minlength="6" value="" required="required" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">
                                <i class="fa fa-user-plus" aria-hidden="true"></i> Sign Up
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
<%
    }
%>