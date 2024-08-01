<%
    response.sendRedirect("GetUsers");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="head.jsp" />
    <title>Admin DashBoard</title>
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
<li class="active">
<a href="admin.jsp"><img src="assets/img/icons/dashboard.svg" alt="img"><span> Admin</span> </a>
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
<li><a href="Show">View Calendar</a></li>
</ul>
</li>
</ul>
</div>
</div>
</div>

<div class="page-wrapper">
<div class="content">
<div class="row">
<div class="col-lg-3 col-sm-6 col-12 d-flex">
<div class="dash-count">
<div class="dash-counts">
<h4>100</h4>
<h5>Customers</h5>
</div>
<div class="dash-imgs">
<i data-feather="user"></i>
</div>
</div>
</div>
<div class="col-lg-3 col-sm-6 col-12 d-flex">
<div class="dash-count das1">
<div class="dash-counts">
<h4>8</h4>
<h5>Vetinary Doctors</h5>
</div>
<div class="dash-imgs">
<i data-feather="user-check"></i>
</div>
</div>
</div>
<div class="col-lg-3 col-sm-6 col-12 d-flex">
<div class="dash-count das2">
<div class="dash-counts">
<h4>10</h4>
<h5>Receptionists</h5>
</div>
<div class="dash-imgs">
<i data-feather="award"></i>
</div>
</div>
</div>
<div class="col-lg-3 col-sm-6 col-12 d-flex">
<div class="dash-count das3">
<div class="dash-counts">
<h4>1</h4>
<h5>Admins</h5>
</div>
<div class="dash-imgs">
<i data-feather="shield"></i>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-lg-7 col-sm-12 col-12 d-flex">
<div class="card flex-fill">
<div class="card-header pb-0 d-flex justify-content-between align-items-center">
<h5 class="card-title mb-0">Appointments & Vets</h5>
<div class="graph-sets">
<ul>
<li>
<span>Vets</span>
</li>
<li>
<span>Appointments</span>
</li>
</ul>
</div>
</div>
<div class="card-body">
<div id="sales_charts"></div>
</div>
</div>
</div>
<div class="col-lg-5 col-sm-12 col-12 d-flex">
<div class="card flex-fill">
<div class="card-header pb-0 d-flex justify-content-between align-items-center">
<h4 class="card-title mb-0">Recent clients</h4>
<div class="dropdown">
<a href="javascript:void(0);" data-bs-toggle="dropdown" aria-expanded="false" class="dropset">
<i class="fa fa-ellipsis-v"></i>
</a>
<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
<li>
<a href="users.jsp" class="dropdown-item">Users List</a>
</li>
<li>
<a href="addUser.jsp" class="dropdown-item">Add User</a>
</li>
</ul>
</div>
</div>
<div class="card-body">
<div class="table-responsive dataview">
<table class="table datatable ">
<thead>
<tr>
<th>ID</th>
<th>Name</th>
<th>Pet Condition</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td class="productimgname">
<a href="users.jsp" class="product-img">
</a>
<a href="users.jsp">Johan Rodriguez</a>
</td>
<td>Cat won't stop attacking and biting</td>
</tr>
<tr>
<td>2</td>
<td class="productimgname">
<a href="users.jsp" class="product-img">
</a>
<a href="users.jsp">Jo Mama</a>
</td>
<td>My iguana keeps spitting up blood</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
</div>
</div>
<div class="card mb-0">
<div class="card-body">
<h4 class="card-title">Recent Appointments</h4>
<div class="table-responsive dataview">
<table class="table datatable ">
<thead>
<tr>
<th>ID</th>
<th>Client</th>
<th>Reason</th>
<th>Vet</th>
<th>Date</th>
<th>Diagnosis</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td><a href="javascript:void(0);">John Miller</a></td>
<td class="productimgname">
<a class="product-img">
<i data-feather="activity"></i>
</a>
<a>cat cannot swallow any solid oods</a>
</td>
<td>Jake Zuma</td>
<td>12/04/2024</td>
<td>The cat had a serious condition o malnutrition</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
</div>
</div>
</div>

<jsp:include page="scripts.jsp" />

</body>
</html>