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
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />	
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous">  
</script>

<style>
	.foo1:hover{color:#f5ad56;}

	.t1{width:600 ; height:480px ; text-align:center}
	.tr{width:300 ; height:240px ; text-align:center}
	.td{width:300 ; height:240px ; text-align:center}
	
	.img{
	height:150px;
	margin:auto;
	margin-left:10px;
}
	
	.center{	
	margin-left:0px;
	display: inline;
}
	
	.button{
	width:200px;
	height:40px;
	margin-left:20px;
	padding:0px;
	border: 2px solid #999999;
	background-color: #d0d0d0;
	font-size: 20px;
}

	.button1{
	width: 500px;
	height: 600px;
	margin:0px auto;

	margin-top:200px;
}

	.button2{
	width:200px;
	height:40px;
	margin:0px auto;
	border:2px solid #999999;
	padding:0px;
	background-color: #d0d0d0;
	font-size: 20px;
}

	.rigth1{
	margin-right:30px;
}

	.h11{
	text-align: center;
	margin:10px 0px 20px 0px;
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

button:focus{
	outline:0px;
	color:	#FF8800;
}

input::placeholder{
	text-align:center;
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
    
    .iconimg{
    	width:25px; 
    	height:25px;
    	vertical-align: middle;
    }

</style>

<script type="text/javascript">
  	$( function() {
    	$( "#speed" ).selectmenu();
 		$( "#files" ).selectmenu();
 		$( "#number" )
      		.selectmenu()
      		.selectmenu( "menuWidget" )
       		 .addClass( "overflow" );
		$( "#salutation" ).selectmenu();
 	 });
</script>

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
			<c:forEach var = 'releasedMovie' items = '${releasedMovies}'>
				<article>
					<a href = '#' class = 'image featured'>
						<img src = "<c:url value = '/getPicture/${releasedMovie.no}'/>" alt = '' style = "width: 336px; height: 480px;">
					</a>
					<header><h3><strong><a href = '#'>${releasedMovie.movieName}</a></strong></h3></header>
					<p>${releasedMovie.engMovieName}<br>
						<fmt:formatDate value="${releasedMovie.openingDate}" pattern='yyyy-MM-dd' />
					</p>
				</article>
			</c:forEach>		

		</div>
		</section>
		
		<artical>
			<center>
			<section style="margin:auto ;display:inline-block;">
			<div style="margin:auto ;display:inline-block;">							
				<section style="margin:auto ;display:inline-block; ">				
					<div style="border:1px solid gray; margin:auto ; border-radius:15px;padding:0px 30px 0px 30px; background-color:#c5c6c7">        <!--#106ecc #c5c6c7*-->      
						<p>
						<h4><a href="#" style="color:white;">快速訂票</a></h4>
						<p><p>
						<form action="#">
							<fieldset>								
									<img src="images/frontend/showmovie.png" class="iconimg" >
									<select name="請選擇電影名稱" id="speed">
										<option>請選擇電影名稱</option>
										<option>牠</option>
										<option>航海王：奪寶爭霸戰</option>
      									<option>全面攻佔3：天使救援</option>
      									<option>玩命關頭：特別行動</option>
    								</select><br><br>
 									
 									<img src="images/frontend/choosedate.png" class="iconimg">
    								<select name="請選擇查詢日期" id="files">
        								<option>請選擇查詢日期</option>
        								<option>09/21(六)</option>
        								<option>09/22(日)</option>
        								<option>09/23(一)</option>
        								<option>09/24(二)</option>
    								</select><br><br>
 									
 									<img src="images/frontend/theaterplace.png" class="iconimg">
    								<select name="請選擇查詢廳次" id="number">
      									<option>請選擇查詢廳次</option>
      									<option>IMAX</option>
      									<option>一般數位</option>
      									<option>3D</option>
      									<option>4DX</option>
    								</select><br><br>
 
 									<img src="images/frontend/timetable.png" class="iconimg" style="height:20px;width:25px;">
    								<select name="請選擇查詢場次" id="salutation">
      									<option>請選擇查詢場次</option>
      									<option>09:30</option>
      									<option>11:30</option>
      									<option>14:30</option>
      									<option>17:30</option>
    								</select><br>
    							</table>
  							</fieldset>
						</form>
						<p>			
							<center>
							<button class="" id="" onclick="ShowL()">前往訂票</button>
							<button class="" id="" onclick="ShowR()">查詢座位</button>			
							</center>
						<p>
					</div>
				</section>
							
				<section style="display:inline-block;vertical-align:top;">		
					<div style="border:1px solid gray;border-radius:15px;padding:0px 30px 0px 30px;">
						<p>
						<label style="text-align:left;"><h4>最新公告/<a href="news">MORE</a></h4></label>
						<p>
						<ul style="text-align:left;">
							<li><a href="news">2019/09/05 【大叔之愛】片尾告示</a></li>
							<li><a href="news">2019/08/29 【第九分局】片尾告示</a></li>
							<li><a href="news">2019/08/14 【驅魔使者】片尾公告</a></li>
							<li><a href="news">2019/04/30   信用卡優惠影城現場購票公告</a></li>
							<li><a href="news">2019/02/13   行動支付公告</a></li>							
						</ul>	
					</div>					
				</section>						
			</div>
			</section>
			</center>
		</artical>

		<hr>

		<!-- Main 		
		<div class="wrapper style2">

			<article id="main" class="container special"> <a href="#"
				class="image featured"><img src="images/now.jpg" alt="" /></a> <header>
			<h2>
				<a href="#">Sed massa imperdiet magnis</a>
			</h2>
			<p>Sociis aenean eu aenean mollis mollis facilisis primis ornare
				penatibus aenean. Cursus ac enim pulvinar curabitur morbi convallis.
				Lectus malesuada sed fermentum dolore amet.</p>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit. Curae
				suspendisse mauris posuere accumsan massa posuere lacus convallis
				tellus interdum. Amet nullam fringilla nibh nulla convallis ut
				venenatis purus sit arcu sociis. Nunc fermentum adipiscing tempor
				cursus nascetur adipiscing adipiscing. Primis aliquam mus lacinia
				lobortis phasellus suscipit. Fermentum lobortis non tristique ante
				proin sociis accumsan lobortis. Auctor etiam porttitor phasellus
				tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat
				integer interdum integer purus sapien. Nibh eleifend nulla nascetur
				pharetra commodo mi augue interdum tellus. Ornare cursus augue
				feugiat sodales velit lorem. Semper elementum ullamcorper lacinia
				natoque aenean scelerisque.</p>
			<footer> <a href="#" class="button">Continue Reading</a> </footer> </article>

		</div>-->

		<!-- Features 
		<div class="wrapper style1">

			<section id="features" class="container special"> <header>
			<h2>Morbi ullamcorper et varius leo lacus</h2>
			<p>Ipsum volutpat consectetur orci metus consequat imperdiet duis
				integer semper magna.</p>
			</header>
			<div class="row">
				<article class="col-4 col-12-mobile special"> <a href="#"
					class="image featured"><img src="images/pic07.jpg" alt="" /></a> <header>
				<h3>
					<a href="#">Gravida aliquam penatibus</a>
				</h3>
				</header>
				<p>Amet nullam fringilla nibh nulla convallis tique ante proin
					sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
					cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
					interdum.</p>
				</article>
				<article class="col-4 col-12-mobile special"> <a href="#"
					class="image featured"><img src="images/pic08.jpg" alt="" /></a> <header>
				<h3>
					<a href="#">Sed quis rhoncus placerat</a>
				</h3>
				</header>
				<p>Amet nullam fringilla nibh nulla convallis tique ante proin
					sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
					cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
					interdum.</p>
				</article>
				<article class="col-4 col-12-mobile special"> <a href="#"
					class="image featured"><img src="images/pic09.jpg" alt="" /></a> <header>
				<h3>
					<a href="#">Magna laoreet et aliquam</a>
				</h3>
				</header>
				<p>Amet nullam fringilla nibh nulla convallis tique ante proin
					sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
					cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
					interdum.</p>
				</article>
			</div>
			</section>

		</div>-->

		<!-- Footer -->
		
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
</body>

</html>