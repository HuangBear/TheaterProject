<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/css/order/bootstrap.min.css'/>" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css/order/jquery-ui.min.css'/>">
<style>
/* .sold-label { */
/* 	background-color: rgb(255, 78, 78); */
/* 	border-color: rgb(255, 0, 0); */
/* 	opacity: 1; */
/* } */
label.sold {
	background-color: rgb(255, 78, 78);
	border-color: rgb(255, 0, 0);
	opacity: 1;
}

label.preserve {
	background-color: rgb(255, 214, 78);
	border-color: rgb(255, 196, 0);
	opacity: 1;
}

.table-seat tr {
	line-height: 30px;
}

td {
	width: 25px;
}

.table-seat label {
	padding: 10px;
}

.ui-state-disabled {
	opacity: 1;
}

form label {
	margin: auto;
}
</style>
<ol class="breadcrumb">
	<li class="breadcrumb-item">
		<a href="#">Home</a>
	</li>
	<li class="breadcrumb-item active" data-toggle="modal" data-target="#continueModal">影廳管理</li>
</ol>
<div class="card mb-3">
	<div class="card-header">
		<div class="row">
			<div class="col-2">
				<i class="fas fa-table"></i> 7-1 Cinema ${theater}
			</div>
		</div>
		<div class="row mt-2">
			<div class="col">
				<button class="btn btn-primary back">回影廳管理</button>
			</div>
		</div>
	</div>
	<div class="card-body" id="available" style="padding:2% 10%">
		<div>
			<h3>${theater}</h3>
		</div>
		<div>
			<jsp:include page="/WEB-INF/views/order/theaterStatus.jsp" />
		</div>
		<div align="right">
			<button class="btn btn-primary back">回影廳管理</button>
		</div>
	</div>
	<div class="card-footer small text-muted">Updated at ${now}</div>
</div>
<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModalTitle" aria-hidden="true">
	<form method="POST" id="deleteForm" action="delete">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content" id="messageModalContent">
				<div class="modal-header">
					<h5 class="modal-title" id="messageModalTitle">
						<b>系統訊息</b>
					</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="outline-width: 0;">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body table-responsive" id="messageModalBody" style="text-align:center">
					<p style="color: green"><b>${sysMsg}</b></p>
					<p style="color: red"><b>${errMsg}</b></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">確認</button>
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	$(function() {
		$(".nullSeat").html("");
		$(".nullSeat").attr("title", "");
		$("input").checkboxradio({
			icon : false,
			disabled : true
		});
		$(".back").click(function(){
			$.ajax({
				type : "GET",
				url : "<c:url value='/admin/theaterManagement'/>",
				success : function(data){
					$("#pageItems").html(data);
				}
			});
		});
	});
</script>
<c:if test="${not empty message}">
<script>
$(function(){
	$("#messageModal").modal('show');
	
});
</script>
</c:if>