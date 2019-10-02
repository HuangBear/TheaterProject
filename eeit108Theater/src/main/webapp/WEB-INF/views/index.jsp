<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>

<head>
<title>716CINEMA</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous">
	
</script>

<style>
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
</style>

<script type="text/javascript">
	
</script>

</head>

<body class="homepage is-preload">
	<div id="page-wrapper">
		<div id="header">
			<!-- header -->
			<jsp:include page="header.jsp" />
			<div class="inner" id="716">
				<header>
					<h1>
						<a href="index" id="logo">歡迎進入<strong>716影城</strong>全新的觀影體驗
						</a>
					</h1>
					<hr />
					<p>
						以開創性概念打造的全新據點，<br> 為了給影迷最佳觀影體驗，本據點將採取全4K影廳規格，<br>
						讓影像投影畫質大幅提升，並透過優化程度使影像達到最清晰、栩栩如生效果。
					</p>
				</header>
				<footer>
					<a href="#" class="button circled scrolly" id="enjoy">ENJOY</a>
				</footer>
			</div>
		</div>
		<!-- Banner -->
		<!-- <section id="banner"> <header>
		<h2>
			歡迎進入<strong>716影城</strong>全新的觀影體驗。
		</h2>
		<p>
			A (free) responsive site template by <a href="http://html5up.net">HTML5
				UP</a>. Built with HTML5/CSS3 and released under the <a
				href="http://html5up.net/license">CCA</a> license.
		</p>
		
		<p>
			以開創性概念打造的全新據點，<br>
			為了給影迷最佳觀影體驗，本據點將採取全4K影廳規格，<br>
			讓影像投影畫質大幅提升，並透過優化程度使影像達到最清晰、栩栩如生效果。
		</p>
		</header> </section> -->

		<!-- Carousel -->
		<section class="carousel">
			<div class="reel">
				<c:forEach var='releasedMovie' items='${releasedMovies}'>
					<article>
						<a href='#' class='image featured'> <img
							src="<c:url value = '/getPicture/${releasedMovie.no}'/>" alt=''
							style="width: 336px; height: 480px;">
						</a>
						<header>
							<h3>
								<strong><a href='#'>${releasedMovie.movieName}</a></strong>
							</h3>
						</header>
						<p>${releasedMovie.engMovieName}<br>
							<fmt:formatDate value="${releasedMovie.openingDate}"
								pattern='yyyy-MM-dd' />
						</p>
					</article>
				</c:forEach>

			</div>
		</section>
		<article>
		<center>
			<section style="margin: auto; display: inline-block;">
				<div style="margin: auto; display: inline-block;">
					<section style="margin: auto; display: inline-block;">
						<div
							style="border: 1px solid gray; margin: auto; border-radius: 15px; padding: 0px 30px 0px 30px; background-color: #c5c6c7">
							<!--#106ecc #c5c6c7*-->
							<p>
							<h4>
								<a href="#" style="color: white;">快速訂票</a>
							</h4>
							<p>
							<p>
							<form action="#">
								<fieldset>
									<img src="images/frontend/showmovie.png" class="iconimg">
									<select name="請選擇電影名稱" id="speed">
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
									</select><br>
									<br> <img src="images/frontend/choosedate.png"
										class="iconimg"> <select name="請選擇查詢日期" id="files">
										<option>請選擇查詢日期</option>
										<option>${day1}</option>
										<option>${day2}</option>
										<option>${day3}</option>
										<option>${day4}</option>
										<option>${day5}</option>
									</select><br>
									<br> <img src="images/frontend/theaterplace.png"
										class="iconimg"> <select name="請選擇查詢廳次" id="number">
										<option>請選擇查詢廳次</option>
									</select><br>
									<br> <img src="images/frontend/timetable.png"
										class="iconimg" style="height: 20px; width: 25px;"> <select
										name="請選擇查詢場次" id="salutation">
										<option>請選擇查詢場次</option>
									</select><br>
								</fieldset>
							<p>
							<center>
								<a  id = 'ticketing' href = "<c:url value='/order/showProducts?time=${StartTime.no}'/>"><button type = 'button' id = 'submit'>前往訂票</button></a>
								<button class="" id="" onclick="ShowR()">查詢座位</button>
							</center>
							</form>
							<p>
						</div>
					</section>

					<section style="display: inline-block; vertical-align: top;">
						<div
							style="border: 1px solid gray; border-radius: 15px; padding: 0px 30px 0px 30px;">
							<p>
								<label style="text-align: left;"><h4>
										最新公告/<a href="news">MORE</a>
									</h4></label>
							<p>
							<ul style="text-align: left;">
								<li><a href="news">2019/09/05 【大叔之愛】片尾告示</a></li>
								<li><a href="news">2019/08/29 【第九分局】片尾告示</a></li>
								<li><a href="news">2019/08/14 【驅魔使者】片尾公告</a></li>
								<li><a href="news">2019/04/30 信用卡優惠影城現場購票公告</a></li>
								<li><a href="news">2019/02/13 行動支付公告</a></li>
							</ul>
						</div>
					</section>
				</div>
			</section>
		
		</center>
		</article>

		<hr>
		<jsp:include page="footer.jsp" />
	</div>
	<!-- Scripts -->
	<script	src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script>
	$(document).ready(function() {
		$("#speed").change(function() {
			var selectedMovie = $("#speed option:selected").text();
			$.ajax({
				url: "<c:url value = '/getVersion' />",
				data: {"movieName" : selectedMovie},
				dataType : 'json',
				type: "GET",
				success: function(data) {
					console.log(data);
				    if (data.length > 0) {
		                $('#number').empty();
		                $('#number').append($('<option></option>').val('').text('請選擇查詢廳次'));
		                $.each(data, function (i, item) {
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
				url: "<c:url value = '/getStartTimes' />",
				data: {"movieName" : selectedMovie, "version" : selectedVersion, "Date" : selectedDate},
				dataType : 'json',
				type: "GET", 
				success: function(data) {
					console.log(data);
				    if (data.length > 0) {
		                $('#salutation').empty();
		                $('#salutation').append($('<option></option>').val('').text('請選擇查詢時刻'));
		                $.each(data, function (i, item) {
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
				url: "<c:url value = '/getTimeNo' />",
				data: {"movieName" :selectedMovie, "version" : selectedVersion, "Date" : selectedDate, "Time" : selectedTime},
				dataType : 'json',
				type: "GET",
				success: function(data) {
						console.log(data[0]);
						$("#ticketing").attr("href","/eeit108Theater/order/showProducts?time=" + data[0]);
					}
				})
		});
	});
	</script>
</body>
</html>