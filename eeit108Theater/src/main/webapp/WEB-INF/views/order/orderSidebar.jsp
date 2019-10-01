<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="sidebarMember">
	<table class="table border rounded" style="text-align: center">
		<thead>
			<tr class="table-secondary">
				<th scope="col">會員資訊</th>
			</tr>
		</thead>
		<tbody>
			<%-- 									if no login --%>
			<c:if test="${empty LoginOK}">
				<tr>
					<td>
						<div>尚未登入</div>
						<div style="opacity: 0.6;">
							趕快登入會員<br>來享有會員專屬優惠吧！
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" data-toggle="modal" data-target="#loginModal">登入</button>
					</td>
				</tr>
			</c:if>
			<%-- 									if login --%>
			<c:if test="${not empty LoginOK}">
				<tr style="text-align: left">
					<td id="LoginOK">${LoginOK.name}，您好</td>
				</tr>

				<%-- 									if no available discount --%>
				<c:if test="${empty discounts}">
					<tr>
						<td style="opacity: 0.6;">此場次尚無優惠</td>
					</tr>
				</c:if>
				<%-- 									if there are available discounts --%>
				<c:if test="${not empty discounts}">
					<tr>
						<td>
							<form>
								<label for="chosenDiscount">請選擇優惠方案</label>
								<select id="chosenDiscount" name="chosenDiscount">
									<c:if test="${empty chosenDiscount}">
										<option id="discount0" value="0" selected>無</option>
										<c:forEach var="discount" items="${discounts}">
											<option id="discount${discount.no}" value="${discount.no}">${discount.pay}${discount.discountTickBuy}${discount.discountPriceBuy}${discount.free}${discount.discountTickFree}${discount.discountPriceFree}</option>
										</c:forEach>

									</c:if>
									<c:if test="${not empty chosenDiscount}">
										<option id="discount0" value="0">無</option>
										<c:forEach var="discount" items="${discounts}">
											<c:if test="${discount.no == chosenDiscount.no}">
												<option id="discount${discount.no}" value="${discount.no}" selected>${discount.pay}${discount.discountTickBuy}${discount.discountPriceBuy}${discount.free}${discount.discountTickFree}${discount.discountPriceFree}</option>
											</c:if>
											<c:if test="${discount.no != chosenDiscount.no}">
												<option id="discount${discount.no}" value="${discount.no}">${discount.pay}${discount.discountTickBuy}${discount.discountPriceBuy}${discount.free}${discount.discountTickFree}${discount.discountPriceFree}</option>
											</c:if>
										</c:forEach>
									</c:if>
								</select>
							</form>
						</td>
					</tr>
				</c:if>
			</c:if>
		</tbody>
	</table>
</div>
<div id="sidebarOrderList" class="mt-5">
	<table class="table border rounded" id="orderList">
		<thead>
			<tr style="text-align: center" class="table-secondary">
				<th>購物清單</th>
			</tr>
		</thead>
		<tbody id="orderItems" class="orderItems">
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
						<strong>總計</strong>
					</div>
					<div class="float-right">${order.totalPrice == null ? 0:order.totalPrice}</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalTitle" aria-hidden="true">
	<form id="loginModalForm" action="">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginModalTitle">會員登入</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<label for="account">帳號</label>
					<input id="account" name="account" type="text" placeholder="請輸入會員帳號">
					<label for="password">密碼</label>
					<input id="password" name="password" type="password" placeholder="請輸入密碼">
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">登入</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</form>
</div>
<script>
	$(function() {
		$("#chosenDiscount").change(function() {
			$.ajax({
				url : "<c:url value='/order/calDiscount'/>",
				data : {
					chosenDiscount : $("#chosenDiscount").val()
				},
				type : "POST",
				success : function() {
					console.log("cal success");
				},
				error : function() {
					console.log("cal fail");
				}
			});
		});
		$("#loginModalForm").submit(function(event) {
			event.preventDefault();
			console.log("trigger");
			var loginForm = new FormData(this);
			$.ajax({
				type : "POST",
				data : loginForm,
				url : "<c:url value='/memberLoginModal'/>",
				datatype : "json",
				contentType : false,
				processData : false,
				statusCode : {
					205 : function(data) {
						console.log("it's 205");
						alert("登入成功");
						$("#loginModal").modal("hide");
						location.reload();
					},
					200 : function(data) {
						console.log("it's 200");
						$("#loginModalForm").html(data);
					}
				},
				success : function(data, status) {
					console.log(data);
					console.log(status);
				},
				error : function(data, status) {
					console.log(data);
					console.log(status);
				}
			});
		});
	});
</script>