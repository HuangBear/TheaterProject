<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Breadcrumbs-->

<ol class="breadcrumb">
	<li class="breadcrumb-item">
		<a href="#">Home</a>
	</li>
	<li class="breadcrumb-item active" data-toggle="modal" data-target="#continueModal">影廳管理</li>
</ol>


<!-- DataTables Example -->
<div class="card mb-3">
	<div class="card-header">
		<div class="row">
			<div class="col">
				<i class="fas fa-table"></i> 7-1 Cinema 影廳管理
			</div>
		</div>
		<div class="row mt-2">
			<div class="col-1">
				<button id="new" class="btn btn-success">新增影廳</button>
			</div>
		</div>
	</div>
	<div class="card-body" id="available">
		<div class="table-responsive">
			<table class='table table-bordered table-striped table-hover' id='dataTable' width='100%' cellspacing='0'
				style="text-align: center">
				<thead>
					<tr>
						<th width='10%'>影廳</th>
						<th width='18%'>容量</th>
						<th width='18%'>詳情</th>
						<th width='18%'>修改保留位</th>
						<th width='18%'>重新規劃影廳</th>

					</tr>
				</thead>

				<tfoot>
					<tr>
						<th>影廳</th>
						<th>容量</th>
						<th>詳情</th>
						<th>修改保留位</th>
						<th>重新規劃影廳</th>
					</tr>
				</tfoot>
				<tbody>
					<c:if test='${empty theaters}'>
						<tr style="text-align: center">
							<th colspan="6">尚無資料</th>
						</tr>
					</c:if>
					<c:if test='${not empty theaters}'>
						<c:forEach var='theater' items='${theaters}'>
							<tr>
								<td id="name${theater.no}">${theater.theater}</td>
								<td>${theater.capacity}</td>
								<td>
									<button id="detail${theater.no}" type="button" class="detail btn btn-primary">詳情</button>
								</td>
								<td>
									<button id="modify${theater.no}" type="button" class="modify btn btn-info">修改</button>
								</td>
								<td>
									<button id="redesign${theater.no}" type="button" class="redesign btn btn-info">重新規劃</button>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<hr>
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
					<button type="button" class="btn" data-dismiss="modal">確認</button>
				</div>
			</div>
		</div>
	</form>
</div>
<script>
	var pid;
	$(".modal")
			.on(
					"hidden.bs.modal",
					function(e) { //to reset modal to spinner when dismiss
						$(".modal-body")
								.html(
										"<div class='d-flex justify-content-center'><div class='spinner-border text-info' role='status'><span class='sr-only'>Loading...</span></div></div>");
					});

	$(".detail").click(function() {
		//var type = $(this).attr("id");
		var tno = $(this).attr("id").substr("detail".length);
		$.ajax({
			url : "<c:url value='/theater/detail'/>",
			type : "GET",
			data : {
				theaterNo : tno,
			},
			success : function(data) {
				console.log("detail success");
				$("#pageItems").html(data);
			},
			error : function(data) {
				console.log("detail fail");
			}

		});
	});
	$(".redesign").click(function() {
		//var type = $(this).attr("id");
		var tno = $(this).attr("id").substr("redesign".length);
		$.ajax({
			url : "<c:url value='/theater/redesign'/>",
			type : "GET",
			data : {
				theaterNo : tno,
			},
			success : function(data) {
				console.log("redesign success");
				$("#pageItems").html(data);
			},
			error : function(data) {
				console.log("redesign fail");
			}

		});
	});
	$(".modify").click(function() {
		var tno = $(this).attr("id").substr("modify".length);
		$.ajax({
			url : "<c:url value='/theater/modify'/>",
			type : "GET",
			data : {
				theaterNo : tno
			},
			success : function(data) {
				console.log("modify success");
				$("#pageItems").html(data);
			},
			error : function() {
				console.log("modify fail");
			}
		});
	});

	$("#new").click(function() { //to go to add theater page
		$.ajax({
			url : "<c:url value='/theater/new'/>",
			type : "GET",
			success : function(data) {

				$("#pageItems").html(data);
			}
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