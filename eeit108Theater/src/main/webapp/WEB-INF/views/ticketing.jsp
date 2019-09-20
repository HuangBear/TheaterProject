<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 線上訂票系統</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous">  
    </script>
	
	<script type="text/javascript">
	$(document).ready(function() {         
		$("#movie01").click(function() { 
		$("#minfo01").show(); 
		$("#minfo02").hide();      
		});

		$("#movie02").click(function() { 
		$("#minfo02").show(); 
		$("#minfo01").hide();      
		});
	});
</script>
<style type="text/css">

	#B ul li {display:inline;
			}

</style>


</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">
		<div id="header">
			<!-- Header -->
			<jsp:include page="header.jsp" />
		</div>
		<!-- Main -->
		<div id="B">
			<center>
			<ul>
				<li><a href="#" id="movie01">牠 第二章</a></li>
				<li><a href="#" id="movie02">航海王：奪寶爭霸戰</a></li>
				<li><a href="#" id="movie03">全面攻佔 3：天使救援</a></li>
				<li><a href="#" id="movie04">玩命關頭：特別行動</a></li>
				<li><a href="#" id="movie05">大叔之愛電影版</a></li>
				<li><a href="#" id="movie06">極限逃生</a></li>
				<li><a href="#" id="movie07">NG你的人生</a></li>
				<li><a href="#" id="movie08">我家有個開心農場</a></li>
				<li><a href="#" id="movie08">天氣之子</a></li>
				<li><a href="#" id="movie08">星際救援</a></li>
				<li><a href="#" id="movie08">返校</a></li>
				<li><a href="#" id="movie08">小丑</a></li>			
			</ul>
			</center>		
		</div>
		<hr>

		
		<div class="wrapper style1" id="minfo01" style="display:none">
			<div class="container">
				<div class="row gtr-200">
					<div class="col-4 col-12-mobile" id="sidebar">						
						<section> <header>
						<h3>
							<a href="#">Sed lorem etiam consequat</a>
						</h3>
						</header>
						<p>Tempus cubilia ultrices tempor sagittis. Nisl fermentum
							consequat integer interdum.</p>
						<div class="row gtr-50">
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/now01.jpg"
									alt="" /></a>
							</div>
							<div class="col-8">
								<h4>Nibh sed cubilia</h4>
								<p>Amet nullam fringilla nibh nulla convallis tique ante
									proin.</p>
							</div>
						</div>
						<footer> <a href="detail" class="button">電影介紹</a>
						</footer> </section>
					</div>
					<div class="col-8 col-12-mobile imp-mobile" id="content">
						<article id="main"> <header>
						<h2>
							<a href="#">牠 第二章</a>
						</h2>
						<p>Morbi convallis lectus malesuada sed fermentum dolore amet
						</p>
						</header>
						<section>
							<div id="B">
							<header><h3>請選擇日期：</h3></header>
							<ul>
								<li><a href="#" >9/11(三)</a></li>
								<li><a href="#" >9/12(四)</a></li>
								<li><a href="#" >9/13(五)</a></li>
								<li><a href="#" >9/14(六)</a></li>
								<li><a href="#" >9/15(日)</a></li>
								<li><a href="#" >9/16(一)</a></li>
								<li><a href="#" >9/17(二)</a></li>
								<li><a href="#" >9/18(三)</a></li>
							</ul>
							</div> 
						</section> 
						
						<section>
							<div id="B">
							<header><h3>請選擇廳別場次：</h3></header>
							<ul><h6>IMAX：</h6>
								<li><a href="#" >08:00</a></li>
								<li><a href="#" >10:00</a></li>
								<li><a href="#" >12:00</a></li>
								<li><a href="#" >14:00</a></li>
								<li><a href="#" >16:00</a></li>
								<li><a href="#" >18:00</a></li>
								<li><a href="#" >20:00</a></li>
								<li><a href="#" >22:00</a></li>
							</ul>
							
							<ul><h6>一般數位：</h6>
								<li><a href="#" >09:00</a></li>
								<li><a href="#" >11:00</a></li>
								<li><a href="#" >13:00</a></li>
								<li><a href="#" >15:00</a></li>
								<li><a href="#" >17:00</a></li>
								<li><a href="#" >19:00</a></li>
								<li><a href="#" >21:00</a></li>
								<li><a href="#" >23:00</a></li>
							</ul>
							</div>
						<footer> 
							<a href="seatbear" class="button">選擇座位</a>
						</footer> 
						
						</section> </article>
					</div>
				</div>
			</div>

		</div>
		
		
		
				<div class="wrapper style1" id="minfo02" style="display:none">
			<div class="container">
				<div class="row gtr-200">
					<div class="col-4 col-12-mobile" id="sidebar">
						<hr class="first" />
					
						<section> <header>
						<h3>
							<a href="#">Sed lorem etiam consequat</a>
						</h3>
						</header>
						<p>Tempus cubilia ultrices tempor sagittis. Nisl fermentum
							consequat integer interdum.</p>
						<div class="row gtr-50">
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/movie5.jpg"
									alt="" /></a>
							</div>
							<div class="col-8">
								<h4>Nibh sed cubilia</h4>
								<p>Amet nullam fringilla nibh nulla convallis tique ante
									proin.</p>
							</div>
						</div>
						<footer> <a href="detail" class="button">電影介紹</a>
						</footer> </section>
					</div>
					<div class="col-8 col-12-mobile imp-mobile" id="content">
						<article id="main"> <header>
						<h2>
							<a href="#">航海王：奪寶爭霸戰</a>
						</h2>
						<p>Morbi convallis lectus malesuada sed fermentum dolore amet
						</p>
						</header>
						<section> 
						<div id="B">
							<header><h3>請選擇日期：</h3></header>
							<ul>
								<li><a href="#" >9/11(三)</a></li>
								<li><a href="#" >9/12(四)</a></li>
								<li><a href="#" >9/13(五)</a></li>
								<li><a href="#" >9/14(六)</a></li>
								<li><a href="#" >9/15(日)</a></li>
								<li><a href="#" >9/16(一)</a></li>
								<li><a href="#" >9/17(二)</a></li>
								<li><a href="#" >9/18(三)</a></li>
							</ul>
							</div>
						</section> 
						
						<section>
							<div id="B">
							<header><h3>請選擇廳別場次：</h3></header>
							<ul><h6>IMAX：</h6>
								<li><a href="#" >08:00</a></li>
								<li><a href="#" >10:00</a></li>
								<li><a href="#" >12:00</a></li>
								<li><a href="#" >14:00</a></li>
								<li><a href="#" >16:00</a></li>
								<li><a href="#" >18:00</a></li>
								<li><a href="#" >20:00</a></li>
								<li><a href="#" >22:00</a></li>
							</ul>
							
							<ul><h6>一般數位：</h6>
								<li><a href="#" >09:00</a></li>
								<li><a href="#" >11:00</a></li>
								<li><a href="#" >13:00</a></li>
								<li><a href="#" >15:00</a></li>
								<li><a href="#" >17:00</a></li>
								<li><a href="#" >19:00</a></li>
								<li><a href="#" >21:00</a></li>
								<li><a href="#" >23:00</a></li>
							</ul>
							</div>
						<footer> 
							<a href="seat" class="button">選擇座位</a>
						</footer> 
						
						</section> </article>
					</div>
				</div>
			</div>

		</div>
		
		<hr>
		<center>
			<div style="width:1280px ; margin:auto;">
				<section> 
					<header><h3>訂票注意事項</h3></header>
						<p>1.「團體優待票券/愛心票/敬老票」無法與「一般/銀行優惠/iShow會員票種」同時訂票，請分次訂購。<br>
						EX：要訂1張團體優待票券與1張全票。須於『團體優待票券/愛心票/敬老票』訂票系統先訂團體優待票券後，再使用『一般/銀行優惠/iShow會員票種.線上即時付款』訂票系統訂全票，唯兩筆訂票無法保證座位。<br>
						2.銀行優惠票種與iShow會員票種無法於同筆訂單中，請分次訂購，唯兩筆訂票無法保證座位。<br>
						3.銀行購票優惠即日起可於網路訂票系統進行預訂。網路預訂以電影播放日期為準，而非以刷卡日計算，每卡每日購買張數限制依影片類型、單日購票張數相關規定限制。<br>
						4.未滿２歲且不佔位之兒童無需購票可免費入場觀賞【普遍級】影片，每位兒童需由至少一位已購票之成人陪伴。<br>
						5.需佔位或２歲以上未滿１２歲之兒童；需購買優待票。<br>
						6.購票完成可至超商進行取票，若交易內含餐飲品項，須至購票影城臨櫃領取電影票與餐點。<br>
						7.網路訂票每張票需加收 NT$20 手續費。<br>
						8.片長 150分鐘(含)以上之電影需加價NT$10，每增加30分鐘需另再加價NT$10。</p>
				</section> 
				<section> 
					<header><h3>場次開放時間說明</h3></header>
						<p>1.週五上映之電影，新場次公布於每週三中午12:00~下午18:00，開放未來一週(即當週的星期五至下週星期四為止)之場次。<br>
							2.週三上映之電影，新場次公布於每週一晚上20:00~22:00，開放週三、週四之場次。<br>
							3.週四上映之電影，新場次公布於每週二晚上20:00~22:00，開放週四之場次。<br>
							4.其他因預售活動或特殊假期、特殊開片日之電影，將另行公告場次開放時間。</p>
				</section>
			</div>
		</center>
		

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