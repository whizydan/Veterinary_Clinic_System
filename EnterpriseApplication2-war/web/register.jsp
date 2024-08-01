<!DOCTYPE html>
<html lang="en">
<head>
<title>Register</title>
<jsp:include page="head.jsp" />
</head>
<body class="account-page">

<div class="main-wrapper">
<div class="account-content">
        <form method="post" action="Register">
<div class="login-wrapper">

<div class="login-content">
<div class="login-userset">
<div class="login-logo">
<img src="assets/img/logo-06_4x.jpg" alt="img">
</div>
<div class="login-userheading">
<h3>Create an Account</h3>
<h4>Make sure you remember your password</h4>
</div>
<div class="form-login">
<label>Full Name</label>
<div class="form-addons">
<input name="name" required type="text" placeholder="Enter your full name">
<img src="assets/img/icons/users1.svg" alt="img">
</div>
</div>
<div class="form-login">
<label>Email</label>
<div class="form-addons">
<input required name="email" type="email" placeholder="Enter your email address">
<div class="alert-danger" role="alert" id="email_error"></div>
<img src="assets/img/icons/mail.svg" alt="img">
</div>
</div>
<div class="form-login">
<label>Password</label>
<div class="pass-group">
<input id="password_login" required name="password" type="password" class="pass-input" placeholder="Enter your password">
<span class="fas toggle-password fa-eye-slash"></span>
<div class="alert-danger" role="alert" id="password_error"></div>
</div>
</div>
<div class="form-login">
<div class="form-group">
<label>Account Type</label>
<select required class="select" name="role">
    <option value="1">Receptionist</option>
    <option value="2">Vet</option>
</select>
</div>
</div>
<div class="form-login">
<input id="submit" type="submit" value="Sign Up" class="btn btn-login">
</div>
<div class="signinform text-center">
<h4>Already a user? <a href="index.jsp" class="hover-a">Sign In</a></h4>
</div>
</div>
</div>
    
    </form>
<div class="login-img">
<img src="assets/img/analysis-hospital-doctor-medical.jpg" alt="img">
</div>
</div>
</div>
</div>

<jsp:include page="scripts.jsp" />
</body>
</html>