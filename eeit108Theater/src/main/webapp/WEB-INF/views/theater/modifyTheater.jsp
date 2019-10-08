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
div#legend label.preserve {
	background-color: rgb(255, 214, 78);
	border-color: rgb(255, 196, 0);
	opacity: 1;
}

.ui-state-active, ui-button:active {
	background-color: rgb(255, 214, 78) !important;
	border-color: rgb(255, 196, 0) !important;
	opacity: 1;
}

.ui-button:active {
	background-color: rgb(255, 214, 78) !important;
	border-color: rgb(255, 196, 0) !important;
}

.ui-state-active.ui-button:active {
	background-color: rgb(255, 214, 78);
	border-color: rgb(255, 196, 0);
	opacity: 1;
}

.ui-visual-focus {
	box-shadow: 0 0 3px 1px rgb(255, 214, 78);
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
				<i class="fas fa-table"></i> 7-1 Cinema ${theater}
			</div>
		</div>
		<div class="row mt-2">
			<div class="col">
				<button class="btn btn-primary back">回影廳管理</button>
			</div>
		</div>
	</div>
	<div class="card-body" id="available" style="padding: 2% 10%">
		<div>
			<h3>${theater}</h3>
		</div>
		<form id="modifyForm">
			<input type="text" name="theaterNo" value="${theaterNo}" hidden>
			<div>
				<jsp:include page="/WEB-INF/views/order/theaterStatus.jsp" />
			</div>
			<div align="right">
				<button class="btn btn-primary" type="submit">確認</button>
				<button class="btn btn-secondary back" type="button">回影廳管理</button>
			</div>
		</form>
	</div>
	<div class="card-footer small text-muted">Updated at ${now}</div>
</div>
<script type="text/javascript">
	$(function() {
		$(".nullSeat").html("");
		$(".nullSeat").attr("title", "");
		$("input[type='checkbox']").checkboxradio({
			icon : false,
		});
		$("input.preserve").filter("[name='seat']").prop("checked", true)
				.change();
		$("input[name='seat-legend']").checkboxradio({
			icon : false,
			disabled : true,
		});
		$(".back").click(function() {
			$.ajax({
				type : "GET",
				url : "<c:url value='/admin/theaterManagement'/>",
				success : function(data) {
					$("#pageItems").html(data);
				}
			});
		});
		$("#modifyForm").submit(function(event) {
			event.preventDefault();
			var form = new FormData(this);
			$.ajax({
				url : "<c:url value='/theater/modify'/>",
				type : "POST",
				data : form,
				datatype : "json",
				contentType : false,
				processData : false,
				success : function(data) {
					console.log("modify theater confirm success");
					$("#pageItems").html(data);
				},
				error : function() {
					console.log("fail to confirm modify theater");
				}
			});
		});
	});
</script>