<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gallery</title>
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
					<li class="active"><a href="#"><spring:message code="home.gallery" /></a></li>
					<security:authorize access="hasRole('ROLE_ADMIN')">
						<li><a href="${contextPath}/uploadImage"><spring:message code="home.uploadimage" /></a></li>
					</security:authorize>

					<security:authorize access="hasRole('ROLE_USER')">
						<li><a href="${contextPath}/favorite"><spring:message code="home.favorite" /></a></li>
					</security:authorize>

					<li><c:if
							test="${pageContext.request.userPrincipal.name != null}">
							<form id="logoutForm" method="POST"
								action="${contextPath}/logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>

							<button class="logout">
								<a onclick="document.forms['logoutForm'].submit()"><spring:message code="home.logout" /></a>
							</button>

						</c:if></li>
					<li>
					
						<fieldset style="border: 0; padding: 10px 11px;">
							<label style="position: inherit;"><spring:message
									code="login.choose_language" /></label> <select id="locales"
								style="border: 1px solid black; border-radius: 4px; padding: 2px 42px;">
								<option value="en"><spring:message code='login.english' /></option>
								<option value="ua"><spring:message
										code='login.ukrainian' /></option>

							</select>
						</fieldset>

					</li>
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
				<li class="filter all active" data-filter="*"><spring:message code="home.all" /></li>
				<li class="filter" data-filter=".photo"><spring:message code="home.photo" /></li>
				<li class="filter" data-filter=".nature"><spring:message code="home.nature" /></li>
				<li class="filter" data-filter=".love"><spring:message code="home.love" /></li>
				<li class="filter" data-filter=".animals"><spring:message code="home.animals" /></li>
				<li class="filter" data-filter=".city"><spring:message code="home.city" /></li>
			</ul>


			<div class="portfolio-gallery">
				<c:if test="${not empty photos}">
					<c:forEach items="${photos}" var="photo">
						<div class="gallery-item ${photo.marker}">
							<img src="data:image/jpg;base64, ${photo.image}" alt="image">
							<div class="hover-links">
								<security:authorize access="hasRole('ROLE_USER')">
									<a href="photo?id=${photo.id}" class="site-btn sb-light"><spring:message code="home.download" /></a>
									<a href="addToFavorite?id=${photo.id}"
										style="margin-left: 10px;" target="_blank"
										class="btn-social btn-bitbucket"><i
										class="fa fa-bitbucket"></i></a>
								</security:authorize>
								<security:authorize access="hasRole('ROLE_ADMIN')">
									<a href="delete?id=${photo.id}"
										class="btn btn-brand btn-tumblr""><i
										class="material-icons"
										style="color: white; padding: 8px; font-size: 60px; margin-left: -17px;">cancel</i></a>
								</security:authorize>
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