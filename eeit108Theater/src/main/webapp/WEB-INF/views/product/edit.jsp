<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal-header">
	<h5 class="modal-title" id="modifyModalTitle">更新商品</h5>
	<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="outline-width: 0;">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
<div class="modal-body" id="modifyModalBody">
	<c:if test="${empty product}">
		<h3 style="color: red">取得${not empty pno? "編號 #"+pno : ""}商品資料失敗</h3>
	</c:if>
	<c:if test="${not empty product}">
		<p>商品名稱</p>
		<p style="color: red">${errMsg.notFound}${errMsg.duplicate}</p>
		<div class="form-group">
			<div class="form-label-group">
				<input id="editName" name="editName" type="text" class="form-control" required="required" autofocus="autofocus"
					value="${product.name}" />
				<label for="editName">商品名稱</label>
				<p style="color: red">${errMsg.name}</p>
			</div>
		</div>
		<p>價格</p>
		<div class="form-group">
			<div class="form-label-group">
				<input id="editPrice" name="editPrice" type="number" class="form-control" required="required" value="${product.price}" />
				<label for="editPrice">價格</label>
				<p style="color: red">${errMsg.price}</p>
			</div>
		</div>
		<input type="text" id="pno" name="pno" value="${pno}" hidden="true">

	</c:if>
</div>
<div class="modal-footer">
	<c:if test="${not empty product}">
		<button id="modify" type="submit" class="btn btn-primary">確認</button>
	</c:if>
	<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
</div>