<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 票價說明</title>
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
	.t1{border-top:2px solid gray;
		border-bottom:2px solid gray;
	    text-align:center;
	   }
	.td{width:400px;
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

			<div class="container">
				<article id="main" class="special">

				<section> 
					<header>
						<h3>票價說明</h3>
						Price
					</header>
					<table class="t1">
						<thead>
							<tr class="tr">
								<th>放映廳</th><th>全票</th><th>優待票</th><th>早場票</th><th>愛心票</th>
							</tr>
						</thead>
			
						<tbody>
							<tr class="tr">
								<td>2D數位電影</td><td>NT $290</td><td>NT $250</td><td>NT $200</td><td>NT $145</td>		
							</tr>
							<tr class="tr">
								<td>3D數位電影</td><td>NT $340</td><td>NT $310</td><td>NT $280</td><td>NT $170</td>		
							</tr>
							<tr class="tr">
								<td>2D數位電影</td><td>NT $600</td><td>--</td><td>--</td><td>--</td>		
							</tr>
						</tbody>
					</table>
				</section> 
				<hr />
				<section> 
					<header>
						<h3>套票優惠</h3>
						PACKAGE
					</header>
					<table class="t2">
						<tr class="tr">
							<td class="td"><a class="image featured"><img src="images/frontend/package1.jpg" alt="" /></a></td>
						</tr>			
						<tr class="tr">
							<td class="td"><a class="image featured"><img src="images/frontend/package2.jpg" alt="" /></a></td>
						</tr>
						<tr class="tr">
							<td class="td"><a class="image featured"><img src="images/frontend/package3.jpg" alt="" /></a></td>
						</tr>
					</table>
				</section>
				<hr />
				<section> 
					<header>
						<h3>優惠購票注意事項</h3>
						NOTICE
					</header>
					<p>註: 優待票的種類包括學生票、軍警票、愛心票，欲購買優待票時購票及進場皆需出示相關有效證件供服務人員核對 <br>
					        ◎購買愛心票需於購票/進場/取票時出示您的身心障礙手冊(證件)做確認 <br>
					        持有新版身心障礙證明(粉紅色)之民眾與陪同者一位，身心障礙證明背面之必要陪伴者優惠措施欄位須註記有進入公民營風景區、康樂場所與文教設施字樣，始提供必要陪伴者一人愛心票價的優惠。 <br>
					        舊版身心障礙相關手冊與證件(綠色)自2019年7月11日起逾期失效不再受理。 <br>
					       ◎敬老票資格為年滿65歲以上之老年人，票價如同愛心票。 (但不適用於同價位加購優惠) <br>
					       ◎秀泰影城早場優惠時間一律為中午12: 00前,例如：上午11:59的電影即可享早場優惠，中午12:00整的電影則以正常票價計算。 <br>
					       ◎午夜場優惠與早場票價相同，午夜場時間於午夜12點過後的電影場次為準。（今日秀泰/東南亞秀泰/台東秀泰午夜場時間為晚間11點過後之場次）<br>
					       ◎二歲以上且未滿十二歲之兒童，需購買優待票進場。 <br>
					       ◎兒童未滿二歲，無需購票可入場觀賞【普遍級】影片，每位購票者限免費攜帶一名未滿二歲兒童入場。(未購票之兒童恕不提供座位)
				</section> </article>
				
				
				
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