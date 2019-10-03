<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城公告</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>

<style>
.p {
	text-color: red;
}

.hide {
	display: none;
}

span {
	display: inline-block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 240px;
}
</style>
<!-- <script src="jquery-1.11.2.min.js"></script>-->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>


<script>


	$(function() {
		$("[name='bb']").click(function() {
			var str = $(this).attr("id");
			var targete = "#" + str.substring(str.lastIndexOf("_") + 1);
// 			alert(targete)
			$(".hide").not(targete).hide();
			$(targete).show();
		});
	});
	$(function() {
		var str =${bulletin_no};
		var id="#tn_" +str;
		$(id).trigger("click");
	});
</script>
</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">
		<div id="header1">
			<!-- Header -->
			<jsp:include page="header.jsp" />
		</div>
		<!-- Main -->
		<div class="wrapper style1">

			<div class="container">
				<div class="row gtr-200">
					<div class="col-4 col-12-mobile" id="sidebar">
						<hr class="first" />
						<section>
							<header>
								<h3>
									<a>影城公告</a>
								</h3>
							</header>
							<div class="row gtr-50 mb-2 mt-3">
								<c:forEach var='sb' items='${statusBulletin}' varStatus="i" >
									<div class="col-4 ">
										<a href="#" class="fit" name="bb" id="tn_${sb.no}">${sb.startDate}</a>
									</div>
									<div class="col-8 ">
										<span><a href="#" name="bb" id="cn_${sb.no}">${sb.title}</a></span>
									</div>
								</c:forEach>
							</div>
						</section>
					</div>

					<c:forEach var='sb' items='${statusBulletin}' varStatus="i" end="15">
						<div class="col-8 col-12-mobile imp-mobile hide" id="${sb.no}" name="n_${i.index+1}">
							<article id="main_${sb.no}">
								<header>
									<h2>
										<a href="#">${sb.title }</a>
									</h2>
									<p>活動期間&ensp; :&ensp;${sb.startDate }&ensp;到&ensp;${sb.endDate}</p>
									<p>${sb.context }</p>
								</header>
								<img id="showPhoto_${sb.no}" src="<c:url value='/getBulletinPicture/${sb.no}' />" />
							</article>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>