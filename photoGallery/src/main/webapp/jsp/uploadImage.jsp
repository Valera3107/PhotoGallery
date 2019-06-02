<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upload image</title>
<meta name="description" content="Photo Gallery HTML Template">
<meta name="keywords" content="endGam,gGaming, magazine, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link href="main/img/favicon.ico" rel="shortcut icon" />

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i"
	rel="stylesheet">


<!-- Stylesheets -->
<link rel="stylesheet" href="main/css/bootstrap.min.css" />
<link rel="stylesheet" href="main/css/font-awesome.min.css" />
<link rel="stylesheet" href="main/css/owl.carousel.min.css" />
<link rel="stylesheet" href="main/css/animate.css" />

<!-- Main Stylesheets -->
<link rel="stylesheet" href="main/css/style.css" />

<!--===============================================================================================-->
<link rel="icon" type="image/png" href="upload/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="upload/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="upload/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="upload/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="upload/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="upload/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="upload/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="upload/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="upload/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="upload/css/util.css">
<link rel="stylesheet" type="text/css" href="upload/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<div class="main-warp">
		<!-- header section -->
		<header class="header-section">
			<div class="header-close">
				<i class="fa fa-times"></i>
			</div>
			<div class="header-warp">
				<a href="" class="site-logo"> <img src="main/img/logo.png"
					alt="">
				</a> <img src="main/img/menu-icon.png" alt="" class="menu-icon">
				<ul class="main-menu">
					<li><a href="${contextPath}/home">Gallery</a></li>
						<security:authorize access="hasRole('ROLE_ADMIN')">
						<li><a href="${contextPath}/uploadImage">Upload image</a></li>
					</security:authorize>

					<security:authorize access="hasRole('ROLE_USER')">
						<li><a href="${contextPath}/favorite">Favorite</a></li>
					</security:authorize>
					<li><c:if
							test="${pageContext.request.userPrincipal.name != null}">
							<form id="logoutForm" method="POST"
								action="${contextPath}/logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>

							<button class="logout">
								<a onclick="document.forms['logoutForm'].submit()">Logout</a>
							</button>

						</c:if></li>
				</ul>
				<div class="social-links-warp">
					<div class="social-links">
						<a href=""><i class="fa fa-behance"></i></a> <a href=""><i
							class="fa fa-dribbble"></i></a> <a href=""><i
							class="fa fa-twitter"></i></a> <a href=""><i
							class="fa fa-facebook"></i></a> <a href=""><i
							class="fa fa-pinterest"></i></a>
					</div>
					<div class="social-text">Find us on</div>
				</div>
			</div>
			<div class="copyright">Colorlib 2018 @ All rights reserved</div>
		</header>
		<!-- header section end -->

		<!-- Page section -->
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<form:form method="POST" action="${contextPath}/uploadImage"
					enctype="multipart/form-data"
					class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-32"> Upload Image </span>
					<span class="txt1 p-b-11"> Name </span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="name"> <span
							class="focus-input100"></span>
					</div>

					<span class="txt1 p-b-11"> Marker </span>
					<div class="wrap-input100 validate-input m-b-12">
						<input class="input100" type="text" name="marker" placeholder="love/amimals/photo/nature/city"> <span
							class="focus-input100"></span>
					</div>

					<span class="txt1 p-b-11"> Author </span>
					<div class="wrap-input100 validate-input m-b-12">
						<input class="input100" type="text" name="author"> <span
							class="focus-input100"></span>
					</div>

					<span class="txt1 p-b-11"> Image </span>
					<div class="wrap-input100 validate-input m-b-12">
						<input class="input100" type="file" name="image"> <span
							class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">Upload</button>
					</div>

				</form:form>
			</div>
		</div>
		<!-- Page section end-->
	</div>
	<!-- Search model -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">x</div>
			<form class="search-moderl-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>

	<!--====== Javascripts & Jquery ======-->
	<script src="main/js/jquery-3.2.1.min.js"></script>
	<script src="main/js/bootstrap.min.js"></script>
	<script src="main/js/owl.carousel.min.js"></script>
	<script src="main/js/jquery.nicescroll.min.js"></script>
	<script src="main/js/isotope.pkgd.min.js"></script>
	<script src="main/js/imagesloaded.pkgd.min.js"></script>
	<script src="main/js/circle-progress.min.js"></script>
	<script src="main/js/main.js"></script>

	<!--===============================================================================================-->
	<script src="upload/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="upload/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="upload/vendor/bootstrap/js/popper.js"></script>
	<script src="upload/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="upload/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="upload/vendor/daterangepicker/moment.min.js"></script>
	<script src="upload/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="upload/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="upload/js/main.js"></script>
</body>
</html>