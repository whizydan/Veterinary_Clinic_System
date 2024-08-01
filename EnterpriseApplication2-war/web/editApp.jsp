<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="head.jsp" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String date = request.getParameter("d");
    String appId = request.getParameter("apid");
%>
    <title>Receptionist | Edit Appointment</title>
</head>
<body>


<div class="main-wrapper">

<div class="header">

<div class="header-left active">
<a href="rec.jsp" class="logo">
<img src="assets/img/logo-06_4x.jpg" alt="">
</a>
<a href="rec.jsp" class="logo-small">
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
    <c:if test="${not empty animal}">
        <form method="post" action="ProcessUpdate?apid=<%=request.getParameter("apid") %>">
<div class="card">
<div class="card-body">
<div class="row">
<div class="col-lg-3 col-sm-6 col-12">
<div class="form-group">
<label>Name</label>
<input disabled value="${animal.name}" type="text" required name="name" minlength="3">
</div>
</div>
<div class="col-lg-3 col-sm-6 col-12">
<div class="form-group">
<label>Age</label>
<input disabled value="${animal.age}" type="text" name="age" required>
</div>
</div>
<div class="col-lg-3 col-sm-6 col-12">
<div class="form-group">
<label>Condition</label>
<input disabled value="${animal.condition}" type="text" name="condition" required>
</div>
</div>
<div class="col-lg-3 col-sm-6 col-12">
<div class="form-group">
<label>Date </label>
<div class="input-groupicon">
    <input value="<%=date %>" required type="text" placeholder="DD-MM-YYYY" name="date" class="datetimepicker">
<div class="addonset">
<img src="assets/img/icons/calendars.svg" alt="img">
</div>
</div>
</div>
</div>
<div class="col-lg-12">
<input type="submit" class="btn btn-submit" value="Submit">
</div>
</div>
</div>
</div>
   </form> 
</c:if>
    <c:if test="${empty animal}">
        <p>Could not find animal</p>
    </c:if>
</div>
</div>
</div>

<jsp:include page="scripts.jsp" />
<%
    if(request.getParameter("e") != null){
        %>
        <script>
            Swal.fire({
                title: "Warning!",
                text: "The vet has no free openings on the selected date!",
              });
        </script>
        <%
    }
%>
</body>
</html>