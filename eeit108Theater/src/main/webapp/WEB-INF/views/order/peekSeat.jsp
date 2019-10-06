<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢座位</title>
<link rel="stylesheet" href="<c:url value='/css/order/bootstrap.min.css'/>" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css/order/jquery-ui.min.css'/>">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<style>
/* .sold-label { */
/* 	background-color: rgb(255, 78, 78); */
/* 	border-color: rgb(255, 0, 0); */
/* 	opacity: 1; */
/* } */
label.sold {
	background-color: rgb(255, 78, 78);
	border-color: rgb(255, 0, 0);
	opacity: 1;
}

label.preserve {
	background-color: rgb(255, 214, 78);
	border-color: rgb(255, 196, 0);
	opacity: 1;
}

.table-seat tr {
	line-height: 30px;
}
td{
	width:25px;
}
.table-seat label {
	padding: 10px;
}
.ui-state-disabled{
	opacity:1;
}
form label {
	margin: auto;
}
</style>
<script src="<c:url value='/js/order/jquery-1.12.4.min.js'/>"></script>
<script src="<c:url value='/js/order/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/js/order/popper.min.js'/>" crossorigin="anonymous"></script>
<script src="<c:url value='/js/order/bootstrap.min.js'/>" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function() {
		$("input").checkboxradio({
			icon : false,
			disabled : true
		});
	});
</script>
</head>
<body>
	<div id="page-wrapper">
		<div id="header1">
			<!-- Header -->
			<jsp:include page="../header.jsp" />
		</div>
		<!-- Main -->
		<div class="wrapper style1">

			<div class="container">
				<div class="row">
					<div class="col-12">
						<div id="movie-info" class="row mb-10">
							<div class="col-md-2 col-xs-4">
								<div class="border rounded overflow-hidden">
									<c:choose>
										<c:when test="${timeTable.movie.rating == '普遍級'}">
											<div style="text-align: center; color: white" class="bg-success">G 0+</div>
										</c:when>
										<c:when test="${timeTable.movie.rating == '保護級'}">
											<div style="text-align: center; color: white" class="bg-primary">P 6+</div>
										</c:when>
										<c:when test="${timeTable.movie.rating == '輔導級'}">
											<div style="text-align: center; color: white" class="bg-warning">PG 12+</div>
										</c:when>
										<c:when test="${timeTable.movie.rating == '限制級'}">
											<div style="text-align: center; color: white" class="bg-warning">R 18+</div>
										</c:when>
									</c:choose>
									<div style="text-align: center;">${timeTable.movie.rating}</div>
								</div>
							</div>
							<div class="col-md-7 h2 col-xs-8">
								<div>
									<c:out value="(${timeTable.version})" />
									${timeTable.movieName}
								</div>
								<div style="opacity: 0.6;">
									<c:out value="(${timeTable.version})" />
									${timeTable.movie.engMovieName}
								</div>
							</div>
							<div class="col-md-3 col-xs-12">
								<div>時間 ${timeTable.startDate} ${timeTable.startTime}</div>
								<div>影廳 ${timeTable.theater}</div>
							</div>

						</div>
<!-- 						<div class="overflow-auto"> -->
							<jsp:include page="theaterStatus.jsp" />
<!-- 						</div> -->
					</div>
				</div>
				<div class="row justify-content-end px-20">
					<div class="col-md-auto col-12-mobile">
						<a href="<c:url value='/order/showProducts?time=${timeTable.no}'/>">
							<button class="">前往訂票</button>
						</a>
					</div>
					<div class="col-md-auto col-12-mobile">
						<a href="<c:url value='/index'/>">
							<button onclick="window.opener=null;window.close();">關閉</button>
						</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<jsp:include page="../footer.jsp" />
	</div>

	<!-- Scripts -->
	<%-- 	<script src="<c:url value='/assets/js/jquery.min.js'/>"></script> --%>
	<script src="<c:url value='/assets/js/jquery.dropotron.min.js'/>"></script>
	<script src="<c:url value='/assets/js/jquery.scrolly.min.js'/>"></script>
	<script src="<c:url value='/assets/js/jquery.scrollex.min.js'/>"></script>
	<script src="<c:url value='/assets/js/browser.min.js'/>"></script>
	<script src="<c:url value='/assets/js/breakpoints.min.js'/>"></script>
	<script src="<c:url value='/assets/js/util.js'/>"></script>
	<script src="<c:url value='/assets/js/main.js'/>"></script>
</body>
</html>