<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<link rel="stylesheet"
	href="registrLoginCSS/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="registrLoginCSS/css/style.css">
<body>
	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>


						<form:form method="POST" modelAttribute="modelUser"
							class="register-form">

							<spring:bind path="name">
								<div class="form-group ${status.error ? 'has-error' : ''}">
									<label for="name"><i
										class="zmdi zmdi-account material-icons-name"></i></label>
									<form:input type="text" path="name" class="form-control"
										placeholder="Name" autofocus="true"></form:input>
									<form:errors path="name"></form:errors>
								</div>
							</spring:bind>

							<spring:bind path="email">
								<div class="form-group ${status.error ? 'has-error' : ''}">
									<label for="email"><i class="zmdi zmdi-email"></i></label>
									<form:input type="email" path="email" class="form-control"
										placeholder="Email" autofocus="true"></form:input>
									<form:errors path="email"></form:errors>
								</div>
							</spring:bind>

							<spring:bind path="password">
								<div class="form-group ${status.error ? 'has-error' : ''}">
									<label for="pass"><i class="zmdi zmdi-lock"></i></label>
									<form:input type="password" path="password"
										class="form-control" placeholder="Password"></form:input>
									<form:errors path="password"></form:errors>
								</div>
							</spring:bind>

							<spring:bind path="confirmPassword">
								<div class="form-group ${status.error ? 'has-error' : ''}">
									<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
										<form:input type="password" path="confirmPassword"
											class="form-control" placeholder="Confirm your password"></form:input>
										<form:errors path="confirmPassword"></form:errors>
								</div>
							</spring:bind>

							<button class="form-submit" type="submit">Submit</button>
						</form:form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="registrLoginCSS/images/signup-image.jpg"
								alt="sing up image">
						</figure>
						<a href="${contextPath}/login" class="signup-image-link">I am
							already member</a>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- JS -->
	<script src="registrLoginCSS/vendor/jquery/jquery.min.js"></script>
	<script src="registrLoginCSS/js/main.js"></script>
</body>
</html>