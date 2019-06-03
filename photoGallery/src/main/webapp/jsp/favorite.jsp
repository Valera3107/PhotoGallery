<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Favorite</title>
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
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
						<li class="active"><a href="${contextPath}/favorite">Favorite</a></li>
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
		<div class="page-section gallery-page">
			<ul class="portfolio-filter">
				<li class="filter all active" data-filter="*">All</li>
				<li class="filter" data-filter=".photo">Photography</li>
				<li class="filter" data-filter=".nature">Nature</li>
				<li class="filter" data-filter=".love">Love</li>
				<li class="filter" data-filter=".animals">Animals</li>
				<li class="filter" data-filter=".city">City</li>
			</ul>


			<div class="portfolio-gallery">
				<c:if test="${not empty favorites}">
					<c:forEach items="${favorites}" var="photo">
						<div class="gallery-item ${photo.marker}">
							<img src="data:image/jpg;base64, ${photo.image}" alt="image">
							<div class="hover-links">
								<a href="photo?id=${photo.id}" class="site-btn sb-light">Download</a>
								<a href="deleteFavorite?id=${photo.id}"
									class="btn btn-brand btn-tumblr""><i class="material-icons"
									style="color: white; padding: 8px; font-size: 60px; margin-left: -17px;">cancel</i></a>
							</div>
						</div>

					</c:forEach>
				</c:if>
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
</body>
</html>