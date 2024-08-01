<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="head.jsp" />
    <title>Managing Staff | Add user</title>
</head>
<body>


<div class="main-wrapper">

<div class="header">

<div class="header-left active">
<a href="admin.jsp" class="logo">
<img src="assets/img/logo-06_4x.jpg" alt="">
</a>
<a href="index.html" class="logo-small">
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
<h5>Managing Staff</h5>
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


<div class="sidebar" id="sidebar">
<div class="sidebar-inner slimscroll">
<div id="sidebar-menu" class="sidebar-menu">
<ul>
<li>
<a href="admin.jsp"><img src="assets/img/icons/dashboard.svg" alt="img"><span> Managing Staff</span> </a>
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
<li><a class="active" href="addUser.jsp">Add User</a></li>
</ul>
</li>
<li class="submenu">
<a href="javascript:void(0);"><img src="assets/img/icons/purchase1.svg" alt="img"><span> Schedule</span> <span class="menu-arrow"></span></a>
<ul>
<li><a href="Show">View Calendar</a></li>
</ul>
</li>
</ul>
</div>
</div>
</div>

<div class="page-wrapper">
<div class="content">
    <form method="post" action="AddUser">
<div class="card">
<div class="card-body">
<div class="row">
<div class="col-lg-3 col-sm-6 col-12">
<div class="form-group">
<label>Full Name</label>
<input type="text" required name="name" minlength="10">
</div>
</div>
<div class="col-lg-3 col-sm-6 col-12">
<div class="form-group">
<label>Email</label>
<input type="text" name="email" required>
</div>
</div>
<div class="col-lg-3 col-sm-6 col-12">
<div class="form-group">
<label>Phone</label>
<input type="text" name="phone" required>
</div>
</div>
<div class="col-lg-3 col-sm-6 col-12">
<div class="form-group">
<label>User Type</label>
<select required class="select" name="role">
    <option value="1">Receptionist</option>
    <option value="2">Vet</option>
<option value="0">Admin</option>
</select>
</div>
</div>
<div class="col-lg-3 col-sm-6 col-12">
<div class="form-group">
<label>Password</label>
<input type="password" name="password" required>
</div>
</div>
<div class="col-lg-9 col-12">
<div class="form-group">
<label>Specialism</label>
<select required class="select" name="profession">
    <option>Aquatic Life</option>
    <option>Cat and Dog</option>
    <option>Insect</option>
    <option>Mammals</option>
    <option>Reptiles</option>
</select>
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
<%
    if(request.getParameter("r") != null && request.getParameter("r").equals("0")){
        %>
        <script>
            Swal.fire({
              title: "Sweet!",
              text: "user added",
              imageUrl: "https://icons.veryicon.com/png/o/miscellaneous/batch-editor/success-38.png",
              imageWidth: 200,
              imageHeight: 100,
              imageAlt: "success image"
            });
        </script>
        <%
    }
%>
</body>
</html>