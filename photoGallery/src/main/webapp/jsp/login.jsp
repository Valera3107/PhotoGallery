<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link
	href="https://fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i"
	rel="stylesheet">
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
						<a href="${contextPath}/registration" class="signup-image-link"><spring:message
								code="login.createaccount" /></a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">
							<spring:message code="login.signin" />
						</h2>
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

						<div>
							<fieldset style="border: 0; padding: 10px 11px;">
								<label style="position: inherit;"><spring:message
										code="login.choose_language" /></label> <select id="locales"
									style="border: 1px solid black; border-radius: 4px; padding: 2px 42px;">
									<option value="en"><spring:message
											code='login.english' /></option>
									<option value="ua"><spring:message
											code='login.ukrainian' /></option>

								</select>
							</fieldset>
						</div>

						<div class="social-login">
							<span class="social-label"><spring:message
									code="login.logwith" /></span>
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
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var selItem = localStorage.getItem("locales");
			$('#locales').val(selItem ? selItem : 'en');
			$("#locales").change(function() {
				var selectedOption = $('#locales').val();
				if (selectedOption) {
					window.location.replace('?lang=' + selectedOption);
					localStorage.setItem("locales", selectedOption);
				}
			});
		});
	</script>
	<!-- JS -->
	<script src="registrLoginCSS/vendor/jquery/jquery.min.js"></script>
	<script src="registrLoginCSS/js/main.js"></script>
</body>
</html>