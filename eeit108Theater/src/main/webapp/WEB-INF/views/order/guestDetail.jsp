<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 購票記錄</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="<c:url value='/css/order/jquery-ui.min.css'/>">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />


<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<script src="<c:url value='/js/order/jquery-1.12.4.min.js'/>"></script>
<script src="<c:url value='/js/order/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/js/order/popper.min.js'/>" crossorigin="anonymous"></script>
<script src="<c:url value='/js/order/bootstrap.min.js'/>" crossorigin="anonymous"></script>




<script>
	$(function() {
		$("#uncheckedTab").accordion({
			collapsible : true
		});
		
		$(".checked").click(function(){
			
		});
	});
</script>


<style>
.tbst {
	border: 0;
	border-radius: 10px;
	background-color: #F5F5F5;
}

.p {
	vertical-align: center;
}

.iconimg {
	height: 25px;
	width: 28px;
	vertical-align: middle;
}

.container a {
	cursor: pointer;
}

.acc>p {
	border: #ad8c80;
	background-color: #ad8c80;
}

.acc h3 {
	border: #ad8c80;
	background-color: #ad8c80;
}
</style>

</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">
		<div id="header1">
			<!-- Header -->
			<jsp:include page="../header.jsp" />
		</div>
		<!-- Main -->
		<div class="wrapper style1">

			<div class="container" style="min-height: 800px;">
				<div class="row gtr-200">
					<div class="col-4 col-12-mobile" id="sidebar">
						<hr class="first" />

						<section>
							<header>
								<h3>
									<a>購票記錄</a>
								</h3>
							</header>
							<p>您好</p>
							<div class="row gtr-50">
								<div class="col-4">
									<a class="image fit"><img src="<c:url value='/images/frontend/ticket.png'/>" title="未取票" /></a>
								</div>
								<div class="col-8" id="notdone">
									<br />
									<h4>
										<a>未取票</a>
									</h4>

								</div>				
							</div>						
						</section>
					</div>



					<div class="col-8 col-12-mobile imp-mobile" id="content">
						<article id="main">
							<h3>
								<a>訂單清單</a>
							</h3>

							<div id="uncheckedTab" class="acc">
								<c:if test="${empty uncheckedOrders}">
									<h3 style="text-align: center">還沒有紀錄哦～</h3>
									<div style="text-align: center">
										<a href="<c:url value='/ticketing_1'/>"><button>去訂票</button></a>
									</div>
								</c:if>
								<c:if test="${not empty uncheckedOrders}">
									<c:forEach var="order" varStatus="index" items="${uncheckedOrders}">
<%-- 										<fmt:formatDate var="date" value="${order.timeTable.startTime}" pattern="yyyy/MM/dd HH:mm" /> --%>
										<fmt:formatDate var="orderTime" value="${order.orderTime}" pattern="yyyy/MM/dd HH:mm" />
										<h3 style="border: #ad8c80; background-color: #ad8c80;">${index.index + 1}. ${order.timeTable.startDate} ${order.timeTable.startTime}-${order.timeTable.movieName}</h3>
										<div>
											<table class="tbst">
												<thead style="background-color: #AAAAAA; text-align: left; height: 10px;">
													<tr>
														<th style="width: 200px;">訂單狀態：</th>
														<th style="width: 800px;">訂單內容：</th>
													</tr>
												</thead>
												<tbody style="padding: 10px;">
													<tr>
														<td style="text-align: center;">
															<p style="color: red">未取票</p>
														</td>
														<td>
															<P>取票序號：${order.orderId}</P>
															<p>訂票時間：${orderTime}</p>
															<p>
																<img src="<c:url value='/images/frontend/iconplace.png'/>" class="iconimg" />影廳：${order.timeTable.theater}
															</p>
															<p>
																<img src="<c:url value='/images/frontend/iconfilm.png'/>" class="iconimg" />電影：<c:out value="(${order.timeTable.version})"/> ${order.timeTable.movieName}
															</p>
															<p>
																<img src="<c:url value='/images/frontend/icontime.png'/>" class="iconimg" />場次：${order.timeTable.startDate} ${order.timeTable.startTime}
															</p>
															<p>
																<img src="<c:url value='/images/frontend/iconpeople.png'/>" class="iconimg" style="width: 25px; height: 25px;" />人數：${order.seatCnt} <c:out value="(${order.seatsString})"/>
															</p>
															<p>
																<img src="<c:url value='/images/frontend/iconmeal.png'/>" class="iconimg" /> 票種及餐點：
																<c:forEach var="item" items="${order.orderItems}">
																	<br />${item.detail}
															</c:forEach>
															</p>
															<p>
																<img src="<c:url value='/images/frontend/iconprice.png'/>" class="iconimg" />總計金額：${order.totalPrice}
															</p>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</c:forEach>
								</c:if>

							</div>
						</article>
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