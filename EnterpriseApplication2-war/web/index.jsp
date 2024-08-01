<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="head.jsp" />
    <title>Login</title>
</head>
<body class="account-page">

<div class="main-wrapper">
<div class="account-content">
<div class="login-wrapper">

<div class="login-content">
<div class="login-userset">
    <form method="post" action="Login">
<div class="login-logo">
<img src="assets/img/logo-06_4x.jpg" alt="img">
</div>
<div class="login-userheading">
<h3>Sign In</h3>
<h4>Please login to your account</h4>
</div>
<div class="form-login">
<label>Email</label>
<div class="form-addons">
    <input required id="email_login" name="email" type="text" placeholder="Enter your email address">
    <div class="alert-danger" role="alert" id="email_error"></div>
<img src="assets/img/icons/mail.svg" alt="img">
</div>
</div>
<div class="form-login">
<label>Password</label>
<div class="pass-group">
<input name="password" required id="password_login" type="password" class="pass-input" placeholder="Enter your password">
<div class="alert-danger" role="alert" id="password_error"></div>
<span class="fas toggle-password fa-eye-slash"></span>
</div>
</div>
<div class="form-login">
<input disabled id="submit" type="submit" style="color: #0000FF" value="Sign In" class="btn btn-login">
</div>
    </form>
<div class="signinform text-center">
<h4> <a href="register.jsp" class="hover-a">Sign Up</a></h4>
</div>
</div>
</div>

<div class="login-img">
<img src="assets/img/analysis-hospital-doctor-medical.jpg" alt="img">
</div>
</div>
</div>
</div>
<jsp:include page="scripts.jsp" />
<%
    String errorMessage;
    try{
        errorMessage = request.getParameter("e");
    }catch(Exception e){
        errorMessage = "";
    }
    
    if(errorMessage != null && errorMessage.equals("0")){
        %>
        <script>
                let timerInterval;
Swal.fire({
  title: "Invalid Credentials!",
  html: "The email or password entered<b></b> doesn't match our records.",
  timer: 1500,
  timerProgressBar: true,
  didOpen: () => {
    Swal.showLoading();
    const timer = Swal.getPopup().querySelector("b");
    timerInterval = setInterval(() => {
      timer.textContent = `${Swal.getTimerLeft()}`;
    }, 100);
  },
  willClose: () => {
    clearInterval(timerInterval);
  }
}).then((result) => {
  /* Read more about handling dismissals below */
  if (result.dismiss === Swal.DismissReason.timer) {
    console.log("I was closed by the timer");
  }
});
        </script>
        <%
    }else if (errorMessage != null && errorMessage.equals("1")){
        %>
        <script>
    let timerInterval;
Swal.fire({
  title: "Empty response!",
  html: "The password or email <b></b> are empty.",
  timer: 1500,
  timerProgressBar: true,
  didOpen: () => {
    Swal.showLoading();
    const timer = Swal.getPopup().querySelector("b");
    timerInterval = setInterval(() => {
      timer.textContent = `${Swal.getTimerLeft()}`;
    }, 100);
  },
  willClose: () => {
    clearInterval(timerInterval);
  }
}).then((result) => {
  /* Read more about handling dismissals below */
  if (result.dismiss === Swal.DismissReason.timer) {
    console.log("I was closed by the timer");
  }
});
        </script>
        <%
    }
%>

<%
    if(request.getParameter("m") != null){
        %>
        <script>
            let timerInterval;
Swal.fire({
  title: "Registered!",
  html: "You can now login with the registered details",
  timer: 1500,
  timerProgressBar: true,
  didOpen: () => {
    Swal.showLoading();
    const timer = Swal.getPopup().querySelector("b");
    timerInterval = setInterval(() => {
      timer.textContent = `${Swal.getTimerLeft()}`;
    }, 100);
  },
  willClose: () => {
    clearInterval(timerInterval);
  }
}).then((result) => {
  /* Read more about handling dismissals below */
  if (result.dismiss === Swal.DismissReason.timer) {
    console.log("I was closed by the timer");
  }
});
        </script>
        <%
    }
%>

</body>
</html>