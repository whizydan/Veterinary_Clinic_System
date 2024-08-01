<%@page import="controller.CookieHelper"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="head.jsp" />
    <title>Profile</title>
</head>
<body>


<div class="main-wrapper">

<div class="header">
<%
String link = "";
String role = CookieHelper.getCookieValue(request, "role");
if(role.equals("0")){
                    //admin
                    link = "admin.jsp";
                }else if(role.equals("1")){
                    //receptionist
                    link = "rec.jsp";
                }else if(role.equals("2")){
                    //vet
                    link = "vet.jsp";
                }
%>

<div class="header-left active">
<a href="<%=link %>" class="logo">
<img src="assets/img/logo-06_4x.jpg" alt="">
</a>
<a href="<%=link %>" class="logo-small">
<img src="assets/img/logo-small.png" alt="">
</a>
<a id="toggle_btn" href="javascript:void(0);">
</a>
</div>

<a id="mobile_btn" class="mobile_btn" href="#sidebar">
<span class="bar-icon">
<span></span>
<span></span>
<span></span>
</span>
</a>

<ul class="nav user-menu">


<li class="nav-item dropdown has-arrow main-drop">
<a href="javascript:void(0);" class="dropdown-toggle nav-link userset" data-bs-toggle="dropdown">
<span class="user-img"><img src="assets/img/logo-06_4x.jpg" alt="">
<span class="status online"></span></span>
</a>
<div class="dropdown-menu menu-drop-user">
<div class="profilename">
<div class="profileset">
<span class="user-img"><img src="assets/img/logo-06_4x.jpg" alt="">
<span class="status online"></span></span>
<div class="profilesets">
<h5>User: xxx</h5>
</div>
</div>
<hr class="m-0">
<a class="dropdown-item" href="profile.jsp"> <i class="me-2" data-feather="user"></i> My Profile</a>
<hr class="m-0">
<a class="dropdown-item logout pb-0" href="logout.jsp"><img src="assets/img/icons/log-out.svg" class="me-2" alt="img">Logout</a>
</div>
</div>
</li>
</ul>


<div class="dropdown mobile-user-menu">
<a href="javascript:void(0);" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
<div class="dropdown-menu dropdown-menu-right">
<a class="dropdown-item" href="profile.jsp">My Profile</a>
<a class="dropdown-item" href="logout.jsp">Logout</a>
</div>
</div>

</div>


<div hidden class="sidebar" id="sidebar">
<div class="sidebar-inner slimscroll">
<div id="sidebar-menu" class="sidebar-menu">
<ul>
<li class="active">
<a href="admin.jsp"><img src="assets/img/icons/dashboard.svg" alt="img"><span> Dashboard</span> </a>
</li>
<li class="submenu">
<a href="javascript:void(0);"><img src="assets/img/icons/product.svg" alt="img"><span> Reports</span> <span class="menu-arrow"></span></a>
<ul>
<li><a href="charts.jsp">Graphical</a></li>
<li><a href="vets.jsp">Vet List</a></li>
</ul>
</li>
<li class="submenu">
<a href="javascript:void(0);"><img src="assets/img/icons/sales1.svg" alt="img"><span> Users</span> <span class="menu-arrow"></span></a>
<ul>
<li><a href="users.jsp">Users List</a></li>
<li><a href="addUser.jsp">Add User</a></li>
</ul>
</li>
<li class="submenu">
<a href="javascript:void(0);"><img src="assets/img/icons/purchase1.svg" alt="img"><span> Schedule</span> <span class="menu-arrow"></span></a>
<ul>
<li><a href="diary.jsp">View Calendar</a></li>
</ul>
</li>
</ul>
</div>
</div>
</div>

<div class="page-wrapper">
<div class="content">
<form method="post" action="UpdateProfile">
<div class="card">
<div class="card-body">
<div class="row">
<div class="col-lg-3 col-sm-6 col-12">
<div class="form-group">
<label>Full Name</label>
<input value="<%=CookieHelper.getCookieValue(request, "name")%>" type="text" required name="name" minlength="10">
</div>
</div>
<div class="col-lg-3 col-sm-6 col-12">
<div class="form-group">
<label>Email</label>
<input value="<%=CookieHelper.getCookieValue(request, "email")%>" type="text" name="email" required>
</div>
</div>
<div class="col-lg-3 col-sm-6 col-12">
<div class="form-group">
<label>Phone</label>
<input value="<%=CookieHelper.getCookieValue(request, "phone")%>" type="text" name="phone" required>
</div>
</div>
<div class="col-lg-3 col-sm-6 col-12">
<div class="form-group">
<label>Password</label>
<input type="password" name="password" required>
</div>
</div>
<div class="col-lg-12">
<input type="submit" class="btn btn-submit" value="Submit">
</div>
</div>
</div>
</div>
   </form> 
</div>
</div>
</div>

<jsp:include page="scripts.jsp" />

</body>
</html>