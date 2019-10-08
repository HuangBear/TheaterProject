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
label.preserve {
	background-color: rgb(255, 214, 78);
	border-color: rgb(255, 196, 0);
	opacity: 1;
}

.ui-state-active, ui-button:active {
	background-color: rgb(0, 0, 0) !important;
	border-color: rgb(0, 0, 0) !important;
	opacity: 1;
}

.ui-button:active {
	background-color: rgb(0, 0, 0) !important;
	border-color: rgb(0, 0, 0) !important;
}

.ui-state-active.ui-button:active {
	background-color: rgb(0, 0, 0);
	border-color: rgb(0, 0, 0);
	opacity: 1;
}

.ui-visual-focus {
	box-shadow: 0 0 3px 1px rgb(0, 0, 0);
}

label.sold {
	background-color: rgb(255, 78, 78);
	border-color: rgb(255, 0, 0);
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
				<i class="fas fa-table"></i> 7-1 Cinema Design ${theater}
			</div>
		</div>
		<div class="row mt-2">
			<div class="col">
				<button class="btn btn-primary back">回影廳管理</button>
			</div>
		</div>
	</div>
	<div class="card-body" id="available" style="padding: 2% 10%">
		<form id="modifyForm" class="row">
			<div class="col-9" id="theaterDisplay">
				<jsp:include page="/WEB-INF/views/order/theaterStatus.jsp" />
			</div>
			<div class="col-3 mt-5">
				<div class="form-group">
					<div class="form-label-group">
						<input id="theater" name="theater" type="text" class="form-control" required="required" autofocus="autofocus"
							value="${newTheater.theater}" />
						<label for="theater">影廳名稱</label>
						<p style="color: red">${errMsg.theater}</p>
					</div>
				</div>
				<div class="form-group">
					<div class="form-label-group">
						<p>區域配置</p>
						<select id="zone" name="zone" class="form-control" required="required">
							<option value="1">A</option>
							<option value="2">BA</option>
							<option value="-2">AB</option>
							<option value="3">BAB</option>
							<option value="5">CBABC</option>
						</select>

						<p style="color: red">${errMsg.zone}</p>
					</div>
				</div>
				<div class="form-group">
					<div class="form-label-group">
						<input id="rowCnt" name="rowCnt" type="text" class="form-control" required="required" value="${newTheater.rowCnt}" />
						<label for="rowCnt">排數</label>
						<p style="color: red">${errMsg.rowCnt}</p>
					</div>
				</div>
				<div class="form-group">
					<div class="form-label-group">
						<input id="middle" name="middle" type="text" class="form-control" required="required" value="${newTheater.middle}" />
						<label for="middle">A區大小</label>
						<p style="color: red">${errMsg.middle}</p>
					</div>
				</div>
				<div class="form-group">
					<div class="form-label-group">
						<input id="side" name="side" type="text" class="form-control" required="required" value="${newTheater.side}" />
						<label for="side">B區大小</label>
						<p style="color: red">${errMsg.side}</p>
					</div>
				</div>
				<div class="form-group">
					<div class="form-label-group">
						<input id="subside" name="subside" type="text" class="form-control" required="required" value="${newTheater.subside}" />
						<label for="subside">C區大小</label>
						<p style="color: red">${errMsg.subside}</p>
					</div>
				</div>
				<div class="form-group">
					<div class="form-label-group">
						<input id="capacity" name="capacity" type="text" class="form-control" value="${newTheater.capacity}" readonly />
						<label for="capacity">總容量</label>
						<p style="color: red">${errMsg.capacity}</p>
					</div>
				</div>
				<div class="form-group">
					<button class="btn btn-primary" id="submitNew" type="button">確認</button>
					<button class="btn btn-info" type="button" data-toggle="modal" data-target="#previewModal">預覽</button>
					<button class="btn btn-secondary back" type="button">回影廳管理</button>
				</div>
			</div>

		</form>
	</div>
	<div class="card-footer small text-muted">Updated at ${now}</div>
</div>
<div class="modal fade" id="previewModal" tabindex="-1" role="dialog" aria-labelledby="previewModalTitle" aria-hidden="true">
	<form method="POST" id="editForm" action="edit">
		<div class="modal-dialog modal-dialog-centered modal-xl" role="document">
			<div class="modal-content" id="modalContent">
				<div class="modal-header">
					<h5 class="modal-title" id="previewModalTitle">影廳預覽</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="outline-width: 0;">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body table-responsive" id="previewModalBody">
					<div class="d-flex justify-content-center">
						<div class="spinner-border text-info" role="status">
							<span class="sr-only">Loading...</span>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
function init(){
	$("input[type='checkbox']").checkboxradio({
		icon : false,
	});
	$("input.emptySeat").filter("[name='seat']").prop("checked", true)
			.change();
	$("input[name='seat-legend']").checkboxradio({
		icon : false,
		disabled : true,
	});
}
	$(function() {
		var zoneValue = ${newTheater.zone};
		$("#zone").val(zoneValue);
		init();
// 		$("input[type='checkbox']").checkboxradio({
// 			icon : false,
// 		});
// 		$("input.emptySeat").filter("[name='seat']").prop("checked", true)
// 				.change();
// 		$("input[name='seat-legend']").checkboxradio({
// 			icon : false,
// 			disabled : true,
// 		});
		$(".back").click(function() {
			$.ajax({
				type : "GET",
				url : "<c:url value='/admin/theaterManagement'/>",
				success : function(data) {
					$("#pageItems").html(data);
				}
			});
		});
		$("#submitNew").click(function() {
			var form = new FormData(document.getElementById("modifyForm"));
			$.ajax({
				url : "<c:url value='/theater/new'/>",
				type : "POST",
				data : form,
				datatype : "json",
				contentType : false,
				processData : false,
				success : function(data) {
					console.log("new theater confirm success");
					$("#pageItems").html(data);
				},
				error : function() {
					console.log("fail to confirm new theater");
				}
			});
		});
		$("#modifyForm").submit(function(event) {
			event.preventDefault();
			alert("submit form");
			var form = new FormData(this);
			$.ajax({
				url : "<c:url value='/theater/refresh'/>",
				type : "POST",
				data : form,
				datatype : "json",
				contentType : false,
				processData : false,
				success : function(data) {
					console.log("new theater confirm success");
					$("#theaterDisplay").html(data);
					init();
				},
				error : function() {
					console.log("fail to confirm new theater");
				}
			});
		});
		$(".form-control").change(function() {
			var form = new FormData(document.getElementById("modifyForm"));
			console.log(form);
			$.ajax({
				url : "<c:url value='/theater/refresh'/>",
				type : "POST",
				data : form,
				datatype : "json",
				contentType : false,
				processData : false,
				success : function(data) {
					console.log("refresh theater success");
					$("#theaterDisplay").html(data);
					init();
				},
				error : function() {
					console.log("fail to refresh theater");
				}
			});
		});
		$("#previewModal").on("shown.bs.modal",function(){
			var form = new FormData(document.getElementById("modifyForm"));
			console.log(form);
			$.ajax({
				url : "<c:url value='/theater/preview'/>",
				type : "POST",
				data : form,
				datatype : "json",
				contentType : false,
				processData : false,
				success : function(data) {
					console.log("refresh theater success");
					$("#previewModalBody").html(data);
				},
				error : function() {
					console.log("fail to refresh theater");
				}
			});
		});
		$("#previewModal").on("hidden.bs.modal",function(){
			$("#previewModalBody").html(
					"<div class='d-flex justify-content-center'><div class='spinner-border text-info' role='status'><span class='sr-only'>Loading...</span></div></div>"
					);
		});
	});
</script>