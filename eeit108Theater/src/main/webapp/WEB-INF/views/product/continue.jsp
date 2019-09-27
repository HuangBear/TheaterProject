<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal-header">
	<h5 class="modal-title" id="exampleModalCenterTitle">上架/下架</h5>
	<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="outline-width: 0;">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
<div class="modal-body">
	<table class="table">
		<thead>
			<tr class="table-warning">
				<th>確定${continue == true? "重新上架":"下架"}此商品嗎？</th>
			<tr>
		</thead>
		<tbody>
			<tr>
				<td>${product.name}</td>
			</tr>
			<tr>
				<td>${product.price}</td>
			</tr>
			<tr>
				<td>${product.type}</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="modal-footer">
	<c:if test="${continue == true}">
		<button id="continue" type="button" class="btn btn-success">重新上架</button>
	</c:if>
	<c:if test="${continue == false}">
		<button id="continue" type="button" class="btn btn-warning">下架</button>
	</c:if>
	<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
</div>
<script>
	$("#continue").click(function(){
		
	});
</script>