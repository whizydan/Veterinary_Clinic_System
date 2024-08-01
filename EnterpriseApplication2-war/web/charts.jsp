<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="head.jsp" />
    <title>Managing Staff DashBoard</title>
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
<li><a class="active" href="charts.jsp">Graphical</a></li>
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
    <div class="card p-2">
        <div class="card-header">
            <h3>Additional Report (Managing Staff Only)</h3>
        </div>
        <div class="card-body">
            <div class="row small w-100">
                <canvas id="chart1" style="height: 400px"></canvas>
            </div>
            <div class="row small w-100">
                <canvas id="chart2" style="height: 400px"></canvas>
            </div>
        </div>
    </div>
</div>
</div>
</div>

<jsp:include page="scripts.jsp" />
<script>
        var inputObject = '<%=request.getAttribute("record")%>';
        var xxValues = ["1 nov", "2 nov", "3 nov", "4 nov", "5 nov"];
        var yyValues = [55, 49, 44, 24, 15];
        
        const jsonObject = JSON.parse(inputObject);
        const keysArray = Object.keys(jsonObject);
        const valuesArray = Object.values(jsonObject);
        
        var pieXValues = <%=request.getAttribute("vets")%>;
        
        
        console.log(extractValues(inputObject));
        
        var pieYValues = Array.from({ length: pieXValues.length }, () => 1);
        var pieColors = ["red", "green","blue","orange","brown"];
        var barColors = [
            "rgba(0,0,255,1.0)",
            "rgba(0,255,255,10.8)",
            "rgba(0,0,255,3.6)",
            "rgba(0,0,255,0.4)",
            "rgba(0,0,255,0.2)"
          ];

        new Chart("chart1", {
          type: "pie",
          data: {
            labels: keysArray,
            datasets: [{
              backgroundColor: pieColors,
              data: valuesArray
            }]
          },
          options: {
            title: {
              display: true,
              text: "Total Case This Week"
            }
          }
        });
        
        new Chart("chart2", {
        type: "pie",
        data: {
          labels: pieXValues,
          datasets: [{
            backgroundColor: pieColors,
            data: pieYValues
          }]
        },
        options: {
          title: {
            display: true,
            text: "registered Vets"
          }
        }
      });
      
      function extractValues(inputObject) {
            const dates = [];
            const values = [];

            for (const key in inputObject) {
                if (Object.prototype.hasOwnProperty.call(inputObject, key)) {
                    // Assuming keys are in the format 'DD-MM-YYYY', you may need to adjust accordingly
                    const date = key.split('=')[0];
                    const value = inputObject[key];

                    dates.push(date);
                    values.push(value);
                }
            }

            return { dates, values };
        }
      
      function convertDateFormat(dateString) {
        const [date, value] = dateString.split('=');
        const [day, month, year] = date.split('-');
        const months = ['jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec'];
        const monthAbbreviation = months[parseInt(month, 10) - 1];
        return `${day} ${monthAbbreviation}`;
    }
</script>
</body>
</html>