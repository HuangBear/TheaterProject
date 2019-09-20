<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 場次查詢</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<style>
	.logo{width:15%;
		 }
		 
	.content {overflow: center;
              width: 800px;
              padding-bottom: 20px;
              border: 3px solid #797777;
              border-radius: 20px;
        	 }
        
    .title {background-color: rgb(186, 187, 187);
            line-height: 2.5em;
            color: #F0F0F0;
            /* padding-left: 20px; */
            text-align: center;
            border-radius: 20px;
           }
        
    .div1 {width: 720px;
           margin:2% 0%;
           text-align: center;
           }      

    .div2 {width: 720px;
           text-align: center;
           }

</style>
</head>
<body class="no-sidebar is-preload">
	<div id="page-wrapper">
<div id="header1">
		<!-- Header -->
		<jsp:include page="header.jsp" />
</div>
		<!-- Main -->
		<div class="wrapper style1">

			<center>
			<div class="container">
				<article id="main" class="special"> <header>

				</header> <a href="#" class="logo"><img src="images/frontend/716logo.png" alt="" /></a>
				
	
					<div class="content">
                	<article>
                   		<h2 class="title">場次查詢</h2>
							<hr>                 	
                        	<div class="div1" id="links">
                        		請選擇電影：
                            	<select name="請選擇電影名稱" length="10">
									<option value="0">--請選擇電影--</option>
									<option value="1">牠</option>
									<option value="2">航海王：奪寶爭霸戰</option>
									<option value="3">全面攻佔3：天使救援</option>
								</select>
                        		<br>
                        		<br>
                        		<br>
                        		請選擇廳次：
                            	<select name="請選擇查詢廳次" length="10">
									<option value="0">--請選擇影廳--</option>
									<option value="1">喔氣氣氣氣廳</option>
									<option value="2">高雄發大財廳</option>
									<option value="3">為什麼說謊廳</option>
								</select>	
                        	</div>
							<hr>
						<div class="div2">
							<a href="showtimes2"><input type="submit" value="送出"></a>
                           	<input type="reset" value="清除">	
                    	</div>
                    </div>
                	</article>
            	</div>
				</center>
					
				<section> <header>
				<h3>訂票注意事項</h3>
				</header>
				<p>1.「團體優待票券/愛心票/敬老票」無法與「一般/銀行優惠/iShow會員票種」同時訂票，請分次訂購。<br>
					EX：要訂1張團體優待票券與1張全票。須於『團體優待票券/愛心票/敬老票』訂票系統先訂團體優待票券後，再使用『一般/銀行優惠/iShow會員票種.線上即時付款』訂票系統訂全票，唯兩筆訂票無法保證座位。<br>
					2.銀行優惠票種與iShow會員票種無法於同筆訂單中，請分次訂購，唯兩筆訂票無法保證座位。<br>
					3.銀行購票優惠即日起可於網路訂票系統進行預訂。網路預訂以電影播放日期為準，而非以刷卡日計算，每卡每日購買張數限制依影片類型、單日購票張數相關規定限制。<br>
					4.未滿２歲且不佔位之兒童無需購票可免費入場觀賞【普遍級】影片，每位兒童需由至少一位已購票之成人陪伴。<br>
					5.需佔位或２歲以上未滿１２歲之兒童；需購買優待票。<br>
					6.購票完成可至超商進行取票，若交易內含餐飲品項，須至購票影城臨櫃領取電影票與餐點。<br>
					7.網路訂票每張票需加收 NT$20 手續費。<br>
					8.片長 150分鐘(含)以上之電影需加價NT$10，每增加30分鐘需另再加價NT$10。</p>
				</section> <section> <header>
				<h3>場次開放時間說明</h3>
				</header>
				<p>1.週五上映之電影，新場次公布於每週三中午12:00~下午18:00，開放未來一週(即當週的星期五至下週星期四為止)之場次。<br>
					2.週三上映之電影，新場次公布於每週一晚上20:00~22:00，開放週三、週四之場次。<br>
					3.週四上映之電影，新場次公布於每週二晚上20:00~22:00，開放週四之場次。<br>
					4.其他因預售活動或特殊假期、特殊開片日之電影，將另行公告場次開放時間。</p>
				</section> </article>
				<hr />
				<div class="row">
					<article class="col-4 col-12-mobile special"> <a href="#"
						class="image featured"><img src="images/frontend/pic07.jpg" alt="" /></a>
					<header>
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
						class="image featured"><img src="images/frontend/pic08.jpg" alt="" /></a>
					<header>
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
						class="image featured"><img src="images/frontend/pic09.jpg" alt="" /></a>
					<header>
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