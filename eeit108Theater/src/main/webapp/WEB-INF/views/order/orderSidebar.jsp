<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="sidebarMember">
	<table class="table border" style="text-align: center">
		<thead>
			<tr class="table-secondary">
				<th scope="col">會員</th>
			</tr>
		</thead>
		<tbody>
			<%-- 									if no login --%>
			<c:if test="${empty LoginOK}">
				<tr>
					<td>
						<div>尚未登入</div>
						<div style="opacity: 0.6;">
							趕快加入/登入會員<br>來享有會員專屬優惠吧！
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<a href="<c:url value='/memberservice'/>">
							<button type="button">登入/註冊</button>
						</a>
					</td>
				</tr>
			</c:if>
			<%-- 									if login --%>
			<c:if test="${not empty LoginOK}">
				<tr style="text-align: left">
					<td id="LoginOK">您好: ${LoginOK.name}</td>
				</tr>

				<%-- 									if no available discount --%>
				<c:if test="${empty discounts}">
					<tr>
						<td style="opacity: 0.6;">現在尚無優惠</td>
					</tr>
				</c:if>
				<%-- 									if there are available discounts --%>
				<c:if test="${not empty discounts}">
					<tr>
						<td>
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
						</td>
					</tr>
				</c:if>
			</c:if>
		</tbody>
	</table>
</div>
<div id="sidebarOrderList" class="mt-5">
	<table class="table border" id="orderList">
		<thead>
			<tr style="text-align: center" class="table-secondary">
				<th>Order List</th>
			</tr>
		</thead>
		<tbody id="orderItems">
			<c:forEach var='item' items="${order.orderItems}">
				<tr>
					<td>
						<div>${item.itemName}</div>
						<div class="float-right">${item.unitPrice}x${item.quantity}=${item.sumPrice}</div>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td>
					<div>
						<strong>Total</strong>
					</div>
					<div class="float-right">${order.totalPrice == null ? 0:order.totalPrice}</div>
				</td>
			</tr>
		</tbody>
	</table>
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
	});
</script>