<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.List" %>
<%@ page import="model.AppointmentDTO" %>
<!DOCTYPE html>
<html lang="en">
    <%
    
%>
<head>
<jsp:include page="head.jsp" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/evo-calendar@1.1.2/evo-calendar/css/evo-calendar.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/evo-calendar@1.1.2/evo-calendar/css/evo-calendar.midnight-blue.css">
<title>Vet DashBoard</title>
</head>
<body>


<div class="main-wrapper">

<div class="header">

<div class="header-left active">
<a href="vet.jsp" class="logo">
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
<h5>Vet</h5>
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
<a href="vet.jsp"><img src="assets/img/icons/dashboard.svg" alt="img"><span> Vet</span> </a>
</li>
<li class="submenu">
<a href="javascript:void(0);"><img src="assets/img/icons/product.svg" alt="img"><span> Diagnosis</span> <span class="menu-arrow"></span></a>
<ul>
<li><a class="active" href="Show">My Schedule</a></li>
<li><a href="patients.jsp">Add Diagnosis</a></li>
</ul>
</li>
</ul>
</div>
</div>
</div>

<div class="page-wrapper">
<div class="content">
<div class="card mb-3">
        <div class="card-header">
            
        </div>
        <div class="card-body">
            <div id="calendar"></div>
        </div>
    </div>
</div>
</div>
</div>

<jsp:include page="scripts.jsp" />
<script src="https://cdn.jsdelivr.net/npm/evo-calendar@1.1.2/evo-calendar/js/evo-calendar.min.js"></script>
<script>
$("#calendar").evoCalendar({
    calendarEvents: <%=request.getAttribute("allApps") %>,
    theme:'Midnight Blue'  
});

var bodyContent = document.getElementById('page-content');
    if (bodyContent && bodyContent.innerHTML.includes('No event for this day')) {
        console.log("Take a rest! :)");
        var updatedContent = bodyContent.innerHTML.replace('There is no appointment for today', 'Enjoy your day!');
        bodyContent.innerHTML = updatedContent;
    }

function onDeleteClick() {
    removeCalendarEvent(id);
}
</script>
</body>
</html>