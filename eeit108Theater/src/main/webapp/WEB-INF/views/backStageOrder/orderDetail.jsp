<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ol class="breadcrumb">
	<li class="breadcrumb-item">
		<a href="empIndexA">Home</a>
	</li>
	<li class="breadcrumb-item">票務管理</li>
	<li class="breadcrumb-item">訂單查詢</li>
	<li class="breadcrumb-item active">訂單細節</li>
</ol>

<!-- DataTables Example -->
<div class="container">
	<div class="card card-register mx-auto my-5">
		<div class="card-header">7-1 Cinema 訂單細節</div>
		<div class="card-body">

			<div class="table-responsive">
				<table class='table table-bordered table-striped table-hover' id='dataTable' width='100%' cellspacing='0'
					style="text-align: center">


					<tbody>
						<tr>
							<th width='40%'>取票序號</th>
							<th id="orderId" width='60%'>${order.orderId}</th>
						</tr>
						<tr>
							<th>訂單狀態</th>
							<c:if test="${order.checked}">
								<td style="color: green">已取票</td>
							</c:if>
							<c:if test="${!order.checked}">
								<td style="color: red">未取票</td>
							</c:if>
						</tr>
						<tr>
							<th>電影</th>
							<td>
								<div>
									<c:out value="(${order.timeTable.version})" />
									${order.timeTable.movieName}
								</div>
								<div>
									<c:out value="(${order.timeTable.version})" />
									${order.timeTable.movie.engMovieName}
								</div>
							</td>
						</tr>
						<tr>
							<th>場次</th>
							<td><c:out value="${order.timeTable.startDate} ${order.timeTable.startTime}"/></td>
						</tr>
						<tr>
							<th>人數</th>
							<td>${order.seatCnt}</td>
						</tr>
						<tr>
							<th>座位</th>
							<td>${order.seatsString}</td>
						</tr>
						<tr>
							<th>票種及餐點</th>
							<td>
								<c:forEach var="item" items="${order.orderItems}">
									<div>${item.detail}</div>
								</c:forEach>
							</td>
						</tr>
						<tr>
							<th>總計金額</th>
							<td>${order.totalPrice}</td>
						</tr>
					</tbody>
				</table>
				<hr>

			</div>
			<div class="row">
				<c:if test="${!order.checked}">
					<div class="col" align="center">
						<button id="checkOrder" class="btn btn-danger w-50">取票</button>
					</div>
				</c:if>
				<div class="col" align="center">
					<button id="queryOrder" class="btn btn-secondary choose-btn w-50" style="">回查詢</button>
				</div>
			</div>

		</div>

	</div>
</div>

<script>

	$("#queryOrder").click(function() {
		var choose = $(this).attr("id");
		console.log(choose);
		console.log("<c:url value='/backOrder/" + choose + "'/>");
		$.ajax({
			url : "<c:url value='/backOrder/" + choose + "'/>",
			type : "GET",
			success : function(data) {
				$("#pageItems").html(data);
			}
		});
	});
	$("#checkOrder").click(function() {
		var oid = $("#orderId").text();
		console.log(orderId);
		console.log("<c:url value='/backOrder/checkOrder'/>");
		$.ajax({
			url : "<c:url value='/backOrder/checkOrder'/>",
			type : "POST",
			data: {
				orderId : oid
			},
			success : function(data) {
				$("#pageItems").html(data);
			},
			fail :function(){
				alert("check ticket fail");
			}
		});
	});
</script>