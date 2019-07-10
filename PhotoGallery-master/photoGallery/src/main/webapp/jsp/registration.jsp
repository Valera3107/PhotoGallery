<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<h2 class="form-title"><spring:message
								code="registration.signup" /></h2>


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

							<button class="form-submit" type="submit"><spring:message
								code="registration.submit" /></button>
						</form:form>
						
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
					</div>
					<div class="signup-image">
						<figure>
							<img src="registrLoginCSS/images/signup-image.jpg"
								alt="sing up image">
						</figure>
						<a href="${contextPath}/login" class="signup-image-link"><spring:message
								code="registration.text" /></a>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- JS -->
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
	<script src="registrLoginCSS/vendor/jquery/jquery.min.js"></script>
	<script src="registrLoginCSS/js/main.js"></script>
</body>
</html>