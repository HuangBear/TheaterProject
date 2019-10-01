<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<div class="float-right"><b>${order.totalPrice}</b></div>
	</td>
</tr>