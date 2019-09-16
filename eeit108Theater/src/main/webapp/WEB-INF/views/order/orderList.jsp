<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var='item' items="${order.orderItems}">
	<tr>
		<td>
			<div>${item.itemName}</div>
			<div class="float-right">${item.unitPrice} x ${item.quantity} = ${item.unitPrice * item.quantity}</div>
		</td>
	</tr>
</c:forEach>
<tr>
	<td>
		<div>
			<b>Total</b>
		</div>
		<div class="float-right">${order.totalPrice}</div>
	</td>
</tr>