<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<title>Left Sidebar - Helios by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<!-- 順序不要調動 -->
<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>

</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">
		<div id="header">
			<!-- Header -->
			<jsp:include page="header.jsp" />
		</div>
		<!-- Main -->
		<div class="wrapper style1">

			<div class="container">

				<div class="row gtr-200">
					<div class="col-4 col-12-mobile" id="sidebar">


						<p>後台測試頁</p>


						<div class="row gtr-50">
							<!-- 							<div class="col-4"> -->
							<!-- 								<a href="#" class="image fit"><img src="images/pic10.jpg" -->
							<!-- 									alt="" /></a> -->
							<!-- 							</div> -->
							<div class="col-8">
								<h4>Nibh sed cubilia</h4>
								<!-- 								<p>Amet nullam fringilla nibh nulla convallis tique ante -->
								<!-- 									proin.</p> -->
							</div>
							<!-- 							<div class="col-4"> -->
							<!-- 								<a href="#" class="image fit"><img src="images/pic11.jpg" -->
							<!-- 									alt="" /></a> -->
							<!-- 							</div> -->
							<div class="col-8">
								<h4>Proin sed adipiscing</h4>
								<!-- 								<p>Amet nullam fringilla nibh nulla convallis tique ante -->
								<!-- 									proin.</p> -->
							</div>
							<!-- 							<div class="col-4"> -->
							<!-- 								<a href="#" class="image fit"><img src="images/pic12.jpg" -->
							<!-- 									alt="" /></a> -->
							<!-- 							</div> -->
							<div class="col-8">
								<h4>公告</h4>
								<!-- 								<p>Amet nullam fringilla nibh nulla convallis tique ante -->
								<!-- 									proin.</p> -->
							</div>
							<!-- 							<div class="col-4"> -->
							<!-- 								<a href="#" class="image fit"><img src="images/pic13.jpg" -->
							<!-- 									alt="" /></a> -->
							<!-- 							</div> -->
							<div class="col-8">
								<h4>Sed tempus fringilla</h4>
								<!-- 								<p>Amet nullam fringilla nibh nulla convallis tique ante -->
								<!-- 									proin.</p> -->
							</div>
							<!-- 							<div class="col-4"> -->
							<!-- 								<a href="#" class="image fit"><img src="images/pic14.jpg" -->
							<!-- 									alt="" /></a> -->
							<!-- 							</div> -->
							<div class="col-8">
								<h4>Malesuada fermentum</h4>
								<!-- 								<p>Amet nullam fringilla nibh nulla convallis tique ante -->
								<!-- 									proin.</p> -->
							</div>
						</div>
						<!-- 						<footer> <a href="#" class="button">Magna Adipiscing</a> -->
						<!-- 						</footer> -->
						</section>
					</div>
					<div class="col-8 col-12-mobile imp-mobile" id="content">
						<article id="main">
							<header>
								<h2>
									<a href="#">公告</a>
								</h2>
							</header>
						</article>
						<div>
							<table class="table table-striped  table-hover table-sm  table-responsive">
								<thead>
									<tr>
										<th scope="col" class="col-1">#</th>
										<th scope="col" class="col-4">標題</th>
										<th scope="col" colspan="2" class="col-4">優惠方案</th>
										<th scope="col" class="col-1">詳情</th>
										<th scope="col" class="col-1">修改</th>
										<th scope="col" class="col-1">刪除</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var='allBulletin' items='${allBulletin}'>
										<tr>
											<th scope="row">${allBulletin.no}</th>
											<th scope="row">${allBulletin.tittle}</th>
											<td><img width="20px" src="${pageContext.request.contextPath}${allBulletin.imgUrlString}"></td>
											<th scope="row">${allBulletin.context}</th>
											<td><a href=""><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-document-50.png"></a></td>
											<td><a href=""><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-edit-50.png"></a></td>
											<td><a href=""><img width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/icons8-trash-50.png"></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>
		</div>


	</div>
	<!-- Footer -->
	<jsp:include page="footer.jsp" />

	<!-- Scripts -->


	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

</body>
</html>