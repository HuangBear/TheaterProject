<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單確認</title>
<link rel="stylesheet" href="<c:url value='/css/order/bootstrap.min.css'/>" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css/order/jquery-ui.min.css'/>">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<style>
.previous {
	padding: 0.65em 3em;
	border-radius: 0.5em;
}

.form-control[readonly] {
	background: white;
	opacity: 0.6;
}

.ui-widget-header {
	background-color: white;
}
</style>
<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<script src="<c:url value='/js/order/jquery-1.12.4.min.js'/>"></script>
<script src="<c:url value='/js/order/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/js/order/popper.min.js'/>" crossorigin="anonymous"></script>
<script src="<c:url value='/js/order/bootstrap.min.js'/>" crossorigin="anonymous"></script>
<script>
	var guest = ${empty errMsg['guest']? "null": errMsg['guest'] == "true"? true :false};
	$(function() {
		$("#tab").tabs({
			show : true
		});
		if(guest != null){
			if(guest){
				$( "#tab" ).tabs( "option", "active", 1 );
			}
			$('html, body').animate({
			    scrollTop: ($('#scroll').offset().top)
			},500);
		}
		$("#sidebarOrderList").html("");
		if($("#memberPhone").val() == null || $("#memberPhone").val() == ""){
			$("#memberPhone").prop("readonly", false);
		}
	});
</script>
</head>
<body class="right-sidebar is-preload">
	<div id="page-wrapper">
		<div id="header1">
			<!-- Header -->
			<jsp:include page="../header.jsp" />

		</div>
		<!-- Main -->
		<div class="wrapper style1">
			<div class="container" style="width: 80%">
				<div class="row">
					<div class="col-md-4 order-md-2 order-sm-1">
						<jsp:include page="orderSidebar.jsp" />
					</div>
					<div class="col-md-8 order-md-1 order-sm-2">
						<div id="movie-info" class="row mb-2">
							<div class="col-md-2 col-xs-4">
								<div class="border rounded overflow-hidden">
									<c:choose>
										<c:when test="${order.timeTable.movie.rating == '普遍級'}">
											<div style="text-align: center; color: white" class="bg-success">G 0+</div>
										</c:when>
										<c:when test="${order.timeTable.movie.rating == '保護級'}">
											<div style="text-align: center; color: white" class="bg-primary">P 6+</div>
										</c:when>
										<c:when test="${order.timeTable.movie.rating == '輔導級'}">
											<div style="text-align: center; color: white" class="bg-warning">PG 12+</div>
										</c:when>
										<c:when test="${order.timeTable.movie.rating == '限制級'}">
											<div style="text-align: center; color: white" class="bg-warning">R 18+</div>
										</c:when>
									</c:choose>
									<div style="text-align: center;">${order.timeTable.movie.rating}</div>
								</div>
							</div>
							<div class="col-md-6 h3 col-xs-8">
								<div><c:out value="(${order.timeTable.version})" /> ${order.timeTable.movieName}</div>
								<div style="opacity: 0.6;"><c:out value="(${order.timeTable.version})" /> ${order.timeTable.movie.engMovieName}</div>
							</div>
							<div class="col-md-4 col-xs-12">
								<div>時間 ${order.timeTable.startDate} ${order.timeTable.startTime}</div>
								<div>影廳 ${order.timeTable.theater}</div>
								<div>座位 ${order.seatsString}</div>
							</div>
						</div>
						<div style="color: white; background-color: grey;" class="my-3 py-2">
							<div class="h2" style="text-align: center">確認訂單內容</div>
							<p style="text-align: center">請再次確認所選座位及以下商品名稱、價格及數量</p>
						</div>
						<div>
							<table class="table border px-10">
								<thead>
									<tr style="text-align: center" class="table-secondary">
										<th>購物清單</th>
									</tr>
								</thead>
								<tbody class="orderItems">
									<c:forEach var='item' items="${order.orderItems}">
										<tr>
											<td>
												<div>${item.itemName}</div>
												<div class="float-right">${item.priceDetail}</div>
											</td>
										</tr>
									</c:forEach>
									<tr>
										<td>
											<div>
												<b>總計</b>
											</div>
											<div class="float-right">
												<b>${order.totalPrice}</b>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div style="color: white; background-color: grey;" class="my-3 py-2" id="scroll">
							<div class="h2" style="text-align: center">請選擇付款身份</div>
							<p style="text-align: center">欲以會員身份付款請先登入</p>
						</div>
						<div>
							<div id="tab">
								<div>
									<ul>
										<li style="border-top-left-radius: 20px;">
											<a href="#member">會員</a>
										</li>
										<li style="border-top-right-radius: 20px;">
											<a href="#guest">非會員</a>
										</li>
									</ul>
								</div>

								<form method="POST" action="<spring:url value='/order/pay?idType=0'/>">
									<div id="member">
										<c:if test="${empty LoginOK}">
											<div class="form-group" style="text-align: center">
												<div>尚未登入</div>
											</div>
											<div class="form-group" style="text-align: center">
												<button type="button" data-toggle="modal" data-target="#loginModal">登入</button>
											</div>


										</c:if>
										<c:if test="${not empty LoginOK}">
											<div class="form-group">
												<label for="memberName">Name</label>
												<input type="text" class="form-control" id="memberName" name="memberName" aria-describedby="m-nameHelp"
													value="${LoginOK.name}" readonly>
												<small id="m-nameHelp" class="form-text text-muted">會員姓名</small>
											</div>
											<div class="form-group">
												<label for="memberEmail">Email address</label>
												<input type="email" class="form-control" id="memberEmail" name="memberEmail" aria-describedby="m-emailHelp"
													value="${LoginOK.email}" readonly>
												<small id="m-emailHelp" class="form-text text-muted">訂單完成後將寄送至此信箱</small>
											</div>
											
											<div class="form-group">
												<label for="memberPhone">Phone number</label>
												<input type="text" class="form-control" id="memberPhone" name="memberPhone" aria-describedby="m-phoneHelp"
													value="${LoginOK.phoneNum}" readonly>
												<small id="m-phoneHelp" class="form-text text-muted">作為查詢訂單時之驗證資訊</small><span style="color: red">${errMsg['memberPhone']}</span>
											</div>
											<div class="form-group" style="text-align: center">
												<button id="btn-submit" class="btn-primary" type="submit">確認付款</button>
											</div>
										</c:if>
									</div>
								</form>
								<form method="POST" action="<spring:url value='/order/pay?idType=1'/>">
									<div id="guest">
										<div class="form-group">
											<label for="guestName">Name</label>
											<input type="text" class="form-control" id="guestName" name="guestName" aria-describedby="g-nameHelp"
												placeholder="Enter your name, please">
											<small id="g-nameHelp" class="form-text text-muted">請輸入訂購人姓名</small><span style="color: red">${errMsg['guestName']}</span>
										</div>
										<div class="form-group">
											<label for="guestEmail">Email address</label>
											<input type="email" class="form-control" id="guestEmail" name="guestEmail" aria-describedby="g-emailHelp"
												placeholder="Enter your email, please">
											<small id="g-emailHelp" class="form-text text-muted">訂單完成後將寄送至此信箱</small><span style="color: red">${errMsg['guestEmail']}</span>
										</div>
										<div class="form-group">
											<label for="guestPhone">Phone number</label>
											<input type="text" class="form-control" id="guestPhone" name="guestPhone" aria-describedby="g-phoneHelp"
												placeholder="Enter your phone, please">
											<small id="g-phoneHelp" class="form-text text-muted">作為查詢訂單時之驗證資訊</small><span style="color: red">${errMsg['guestPhone']}</span>
										</div>
										<div class="form-group" style="text-align: center">
											<button id="btn-submit" class="btn-primary" type="submit">確認付款</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="row justify-content-between mt-5">
					<div class="col-md-auto col-12-mobile">
						<a href="<c:url value='/order/seat'/>">
							<button class="btn btn-secondary previous" type="button">上一步</button>
						</a>
					</div>
					<div class="col-md-auto col-12-mobile">
						<a href="<c:url value='/order/cancel'/>"><button class="btn-danger rounded">取消</button></a>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<jsp:include page="../footer.jsp" />
	</div>
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