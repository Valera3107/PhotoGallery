<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<!-- Font Icon -->
<link rel="stylesheet"
	href="registrLoginCSS/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="registrLoginCSS/css/style.css">
<body>

	<div class="main">
		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="registrLoginCSS/images/signin-image.jpg"
								alt="sing up image">
						</figure>
						<a href="${contextPath}/registration" class="signup-image-link">Create
							an account</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Sign up</h2>
						<form method="POST" action="${contextPath}/login"
							class="register-form" id="login-form">
							<div class="form-group">
								<label for="your_name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="email" name="email" placeholder="Your email" />
							</div>
							<div class="form-group">
								<label for="your_pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="your_pass"
									placeholder="Password" />
							</div>

							<span>${error}</span> <input type="hidden"
								name="${_csrf.parameterName}" value="${_csrf.token}" />

							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>

						<div class="social-login">
							<span class="social-label">Or login with</span>
							<ul class="socials">
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-facebook"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-twitter"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-google"></i></a></li>

							</ul>
						</div>
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