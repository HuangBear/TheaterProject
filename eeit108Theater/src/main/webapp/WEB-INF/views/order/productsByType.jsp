<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products By Type</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#tabs").tabs();
	});
	$(function() {
		$("td>input").spinner({
			spin : function(event, ui) {
				if (ui.value > 10) {
					$(this).spinner("value", 0);
					return false;
				} else if (ui.value < 0) {
					$(this).spinner("value", 10);
					return false;
				}
			}
		});
	});
</script>
</head>
<body>
	<div class="container" style="width: 80%">
		<div class="row">
			<div class="col-md-3 order-md-2 order-sm-1">
				<table class="table border">
					<thead>
						<tr style="text-align: center">
							<th scope="col">會員資料</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Member Name: ${loginMember.name}</td>
						</tr>
						<tr>
							<td>Member Email: ${loginMember.email}</td>
						</tr>
						<tr>
							<td>Member Id: ${loginMember.memberId}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-9 order-md-1 order-sm-2">
				<form action="<c:url value='/order/makeOrder'/>" method="POST">
					<div id="tabs">
						<ul>
							<li><a href="#tabs-1">票種</a></li>
							<li><a href="#tabs-2">食物</a></li>
							<li><a href="#tabs-3">飲料</a></li>
						</ul>
						<div id="tabs-1">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">票種</th>
										<th scope="col">價格</th>
										<th scope="col">數量</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="ticket" items="${tickets}">
										<tr>
											<td>${ticket.name}</td>
											<td>$ ${ticket.price}</td>
											<td>
												<input name="${ticket.name}">
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="tabs-2">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">品項</th>
										<th scope="col">價格</th>
										<th scope="col">數量</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="food" items="${foods}">
										<tr>
											<td>${food.name}</td>
											<td>$ ${food.price}</td>
											<td>
												<input name="${food.name}">
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="tabs-3">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">品項</th>
										<th scope="col">價格</th>
										<th scope="col">數量</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="drink" items="${drinks}">
										<tr>
											<td>${drink.name}</td>
											<td>$ ${drink.price}</td>
											<td>
												<input name="${drink.name}">
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<input type="submit" value="確認">
				</form>
			</div>
		</div>
	</div>
</body>
</html>