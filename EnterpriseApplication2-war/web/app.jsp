<%
    if(request.getParameter("n") == null){
        response.sendRedirect("GetApps");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="head.jsp" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <title>Receptionist | Appointments</title>
</head>
<body>

<div class="main-wrapper">

<div class="header">

<div class="header-left active">
<a href="rec.jsp" class="logo">
<img src="assets/img/logo-06_4x.jpg" alt="">
</a>
<a href="rec.jsp" class="logo-small">
<img src="assets/img/logo-06_4x.jpg" alt="">
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
<h5>Receptionist</h5>
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
<a href="rec.jsp"><img src="assets/img/icons/dashboard.svg" alt="img"><span> Receptionist</span> </a>
</li>
<li class="submenu">
<a href="javascript:void(0);"><img src="assets/img/icons/product.svg" alt="img"><span> Clients</span> <span class="menu-arrow"></span></a>
<ul>
<li><a class="active" href="app.jsp">Appointments</a></li>
<li><a href="recClients.jsp">Client list</a></li>
<li><a href="addClient.jsp">Add Client</a></li>
</ul>
</li>
</ul>
</div>
</div>
</div>

<div class="page-wrapper">
<div class="content">
    <div class="page-header">
<div class="page-title">
<h4>Appointment List</h4>
<h6>Manage appointments</h6>
</div>
<div class="page-btn">
<a href="recClients.jsp" class="btn btn-added"><img src="assets/img/icons/plus.svg" alt="img" class="me-2">Add Appointment</a>
</div>
</div>

<div class="card">
<div class="card-body">
<div class="table-top">
<div class="search-set">
<div class="search-input">
<a class="btn btn-searchset">
<img src="assets/img/icons/search-white.svg" alt="img">
</a>
</div>
</div>
<div class="wordset">
<ul>
<li>
<a data-bs-toggle="tooltip" data-bs-placement="top" title="pdf"><img src="assets/img/icons/pdf.svg" alt="img"></a>
</li>
<li>
<a data-bs-toggle="tooltip" data-bs-placement="top" title="excel"><img src="assets/img/icons/excel.svg" alt="img"></a>
</li>
<li>
<a data-bs-toggle="tooltip" onClick="printData();" data-bs-placement="top" title="print"><img src="assets/img/icons/printer.svg" alt="img"></a>
</li>
</ul>
</div>
</div>

<div class="table-responsive">
<table class="table  datanew">
<thead>
<tr>
<th>
<label class="checkboxs">
<input type="checkbox">
<span class="checkmarks"></span>
</label>
</th>
<th>ID</th>
<th>Animal</th>
<th>Date </th>
<th>Customer</th>
<th>Diagnosis</th>
<th>Vet</th>
<th>Action</th>
</tr>
</thead>
<tbody>
    <c:forEach var="appointment" items="${allApps}">
            <tr>
<td>
<label class="checkboxs">
<input type="checkbox">
<span class="checkmarks"></span>
</label>
</td>
<td>
${appointment.id}
</td>
<td>${appointment.animalName}</td>
<td>${appointment.appointmentDate}</td>
<td>${appointment.customerName}</td>
<td>${appointment.diagnosis}</td>
<td>${appointment.vetName}</td>
<td>
<a class="me-3" href="EditApp?id=${appointment.animalId}&d=${appointment.appointmentDate}&apid=${appointment.id}">
<img src="assets/img/icons/edit.svg" alt="img">
</a>
<a class="me-3" href="DeleteApp?id=${appointment.id}">
<img src="assets/img/icons/delete.svg" alt="img">
</a>
</td>
</tr>
        </c:forEach>
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