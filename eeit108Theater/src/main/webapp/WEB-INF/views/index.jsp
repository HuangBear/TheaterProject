<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>

<head>
<title>716CINEMA</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous">
	
</script>

<style>

	.foo1:hover{color:#f5ad56;}

/* 	.t1{width:600 ; height:480px ; text-align:center} */
/* 	.tr{width:300 ; height:240px ; text-align:center} */
/* 	.td{width:300 ; height:240px ; text-align:center} */
	
/* 	.img{ */
/* 	height:150px; */
/* 	margin:auto; */
/* 	margin-left:10px; */

.t1 {
	width: 600;
	height: 480px;
	text-align: center
}

.tr {
	width: 300;
	height: 240px;
	text-align: center
}

.td {
	width: 300;
	height: 240px;
	text-align: center
}

.img {
	height: 150px;
	margin: auto;
	margin-left: 10px;
}

.center {
	margin-left: 0px;
	display: inline;
}

.button {
	width: 200px;
	height: 40px;
	margin-left: 20px;
	padding: 0px;
	border: 2px solid #999999;
	background-color: #d0d0d0;
	font-size: 20px;
}

.button1 {
	width: 500px;
	height: 600px;
	margin: 0px auto;
	margin-top: 200px;
}

.button2 {
	width: 200px;
	height: 40px;
	margin: 0px auto;
	border: 2px solid #999999;
	padding: 0px;
	background-color: #d0d0d0;
	font-size: 20px;
}

.rigth1 {
	margin-right: 30px;
}

.h11 {
	text-align: center;
	margin: 10px 0px 20px 0px;
}

.text {
	width: 450px;
	height: 30px;
	background: #fff;
}

form {
	margin: 0 auto;
	/* width: 1000px; */
}

table {
	margin: 0 auto;
	padding: 10px;
}

dd {
	text-align: center;
	vertical-align: middle;
}

dd.check {
	text-align: left;
	padding-left: 250px;
	display: inline;
}

#loginAcc {
	width: 450px;
	height: 3em;
}

input, input::-webkit-input-placeholder {
	font-size: 15px;
}

#setting {
	font-size: 10px;
}

#submit {
	background-color: #5599FF;
	color: white;
	border-radius: 10px;
	border: 0;
}

.form-submit-button {
	font-size: 50px !important;
}

button:focus {
	outline: 0px;
	color: #FF8800;
}

input::placeholder {
	text-align: center;
}

fieldset {
	border: 0;
}

label {
	display: block;
	margin: 30px 0 0 0;
}

.overflow {
	height: 200px;
}

.iconimg {
	width: 25px;
	height: 25px;
	vertical-align: middle;
}

.a {
	display: inline-block;
}

.b {
	display: inline-block;
}

.c {
	display: inline-block;
}

.d {
	display: inline-block;
}

.hello {
	width: 255.31px;
}

.divbox {
	text-align: center;
}

.fakeBox {
	display: inline-block;
	vertical-align: middle;
}

.trueBox {
	display: inline-block;
	margin: 0px auto; /*div對齊效果*/
	text-align: center; /*display: inline對齊效果*/
}

.div_le {
	display: inline-block; /*讓div並排*/
	vertical-align: top; /*就算個個div行數不同，也一律向上對齊*/
	height: 550px;
	border: 1px solid gray;
	border-radius: 15px;
	background-color: #c5c6c7;
	margin: 40px 20px;
	padding: 40px;
}

.title_width {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	/* 	white-space: nowrap; */
}

table {
	table-layout: fixed;
}
</style>


</head>

<body class="homepage is-preload">
	<div id="page-wrapper">
		<div id="header">
			<!-- header -->
			<jsp:include page="header.jsp" />
			<div class="inner" id="716">
<!-- 				<header> -->
<!-- 				<h1> -->
<!-- 					<a href="index" id="logo">歡迎進入<strong class="foo1">716影城</strong>全新的觀影體驗</a> -->
<!-- 				</h1> -->
<!-- 				<hr /> -->
<!-- 				<p> 以開創性概念打造的全新據點，<br> -->
<!-- 					為了給影迷最佳觀影體驗，本據點將採取全4K影廳規格，<br> -->
<!-- 					讓影像投影畫質大幅提升，並透過優化程度使影像達到最清晰、栩栩如生效果。</p> -->
<!-- 				</header> -->
<!-- 				<footer> <a href="#" class="button circled scrolly" id="enjoy">ENJOY</a> -->
<!-- 				</footer> -->
					<header id="header" style="height:850px;margin-top:-200px;"><img src="images/frontend/mgmwhitelionlogo.png"></header>
			</div> 			
		</div>

		<!-- Carousel -->
		<section class="carousel">
			<div class="reel">
				<c:forEach var='releasedMovie' items='${releasedMovies}'>
					<article>
						<a href='#' class='image featured'> <img src="<c:url value = '/getPicture/${releasedMovie.no}'/>" alt='' style="width: 336px; height: 480px;">
						</a>
						<header>
							<h3>
								<strong><a href='#'>${releasedMovie.movieName}</a></strong>
							</h3>
						</header>
						<p>${releasedMovie.engMovieName}<br>
							<fmt:formatDate value="${releasedMovie.openingDate}" pattern='yyyy-MM-dd' />
						</p>
					</article>
				</c:forEach>

			</div>
		</section>
		<hr>

		<div class="divbox">
			<div class="fakeBox"></div>
			<div class="trueBox">

				<div class="div_le">
					<h3 style="text-align: left; margin: 10px 5px; padding-left: 22px">
						<a>快速訂票</a>
					</h3>
					<form action="#">
						<fieldset>
							<div class='a'>
								<img src="images/frontend/showmovie.png" class="iconimg">
							</div>
							<div class='a'>
								<select name="請選擇電影名稱" id="speed" class='hello'>
									<option>請選擇電影名稱</option>
									<c:forEach var='i' begin='0' end='20'>
										<c:choose>
											<c:when test='${!empty releasedMovies[i]}'>
												<option>${releasedMovies[i].movieName}</option>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
							<br> <br>
							<div class='b'>
								<img src="images/frontend/choosedate.png" class="iconimg">
							</div>
							<div class='b'>
								<select name="請選擇查詢日期" id="files" class='hello'>
									<option>請選擇查詢日期</option>
									<option>${day1}</option>
									<option>${day2}</option>
									<option>${day3}</option>
									<option>${day4}</option>
									<option>${day5}</option>
								</select>
							</div>
							<br> <br>
							<div class='c'>
								<img src="images/frontend/theaterplace.png" class="iconimg">
							</div>
							<div class='c'>
								<select name="請選擇查詢廳次" id="number" class='hello'>
									<option>請選擇查詢廳次</option>
								</select>
							</div>
							<br> <br>
							<div class='d'>
								<img src="images/frontend/timetable.png" class="iconimg">
							</div>
							<div class='d'>
								<select name="請選擇查詢場次" id="salutation" class='hello'>
									<option>請選擇查詢場次</option>
								</select>
							</div>
						</fieldset>
						<p>
						<div style="margin: 0px auto">
							<a id='ticketing' href="<c:url value='/order/showProducts?time=${StartTime.no}'/>"><button type='button' id='submit'>前往訂票</button></a>
							<button class="" id="" onclick="ShowR()">查詢座位</button>
						</div>
					</form>
					<p>
				</div>

				<div class="div_le" style="width: 400px;">
					<table>
						<thead>
							<tr>
								<td>
									<h3 style="text-align: left; margin: 10px 5px; padding-left: 22px">
										最新公告/<a href="news">MORE</a>
									</h3>
								</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${BulletinBean}" var="bb" end="9">
								<tr>
									<td class="title_width">
										<ul style="text-align: left; margin-bottom: 0px;padding-bottom: 5px;">
											<li><a  href='<c:url value="/news/${bb.no}" />'>${bb.startDate}&emsp;${bb.title}</a></li>
										</ul>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
			<div class="fakeBox"></div>
		</div>

		<jsp:include page="footer.jsp" />
	</div>
	<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script>
		$(document).ready(function() {
			$("#speed").change(function() {
				var selectedMovie = $("#speed option:selected").text();
				$.ajax({
					url : "<c:url value = '/getVersion' />",
					data : {
						"movieName" : selectedMovie
					},
					dataType : 'json',
					type : "GET",
					success : function(data) {
						console.log(data);
						if (data.length > 0) {
							$('#number').empty();
							$('#number').append($('<option></option>').val('').text('請選擇查詢廳次'));
							$.each(data, function(i, item) {
								$('#number').append($('<option></option>').text(data[i]));
							});
						}
					}
				})
			});
			$("#number").change(function() {
				var selectedMovie = $("#speed option:selected").text();
				var selectedVersion = $("#number option:selected").text();
				var selectedDate = $("#files option:selected").text();
				$.ajax({
					url : "<c:url value = '/getStartTimes' />",
					data : {
						"movieName" : selectedMovie,
						"version" : selectedVersion,
						"Date" : selectedDate
					},
					dataType : 'json',
					type : "GET",
					success : function(data) {
						console.log(data);
						if (data.length > 0) {
							$('#salutation').empty();
							$('#salutation').append($('<option></option>').val('').text('請選擇查詢時刻'));
							$.each(data, function(i, item) {
								$('#salutation').append($('<option></option>').text(data[i]));
							});
						}
					}
				})
			});
			$("#salutation").change(function() {
				var selectedMovie = $("#speed option:selected").text();
				var selectedVersion = $("#number option:selected").text();
				var selectedDate = $("#files option:selected").text();
				var selectedTime = $("#salutation option:selected").text();
				$.ajax({
					url : "<c:url value = '/getTimeNo' />",
					data : {
						"movieName" : selectedMovie,
						"version" : selectedVersion,
						"Date" : selectedDate,
						"Time" : selectedTime
					},
					dataType : 'json',
					type : "GET",
					success : function(data) {
						console.log(data[0]);
						$("#ticketing").attr("href", "/eeit108Theater/order/showProducts?time=" + data[0]);
					}
				})
			});
		});
	</script>
</body>
</html>