<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
${success}
<!-- Breadcrumbs-->

<ol class="breadcrumb">
	<li class="breadcrumb-item">
		<a href="#">Home</a>
	</li>
	<li class="breadcrumb-item active" data-toggle="modal" data-target="#continueModal">商品</li>
</ol>


<!-- DataTables Example -->
<div class="card mb-3">
	<div class="card-header">
		<div class="row">
			<div class="col-2">
				<i class="fas fa-table"></i> 7-1 Cinema 商品清單
			</div>
			<div class="col-2">
				<p style="color: green">${sysMsg}</p>
				<p style="color: red">${errMsg}</p>
			</div>
		</div>
		<div class="row mt-2">
			<div class="col-1">
				<button id="new" class="btn btn-success">新增</button>
			</div>
			<div class="col">
				<button id="change" class="btn btn-primary changeFlag">查看已下架商品</button>
			</div>
		</div>
	</div>
	<div class="card-body" id="available">
		<div class="table-responsive">
			<table class='table table-bordered table-striped table-hover' id='dataTable' width='100%' cellspacing='0'
				style="text-align: center">
				<thead>
					<tr>
						<th width='5%'>編號</th>
						<th width='35%'>名稱</th>
						<th width='15%'>價格</th>
						<th width='15%'>種類</th>
						<th width='15%'>修改</th>
						<th width='15%'>下架</th>
					</tr>
				</thead>

				<tfoot>
					<tr>
						<th>編號</th>
						<th>名稱</th>
						<th>價格</th>
						<th>種類</th>
						<th>修改</th>
						<th>下架</th>
					</tr>
				</tfoot>
				<tbody>
					<c:if test='${empty products}'>
						<tr style="text-align: center">
							<th colspan="6">尚無資料</th>
						</tr>
					</c:if>
					<c:if test='${not empty products}'>
						<c:forEach var='product' items='${products}'>
							<tr>
								<td>${product.no}</td>
								<td id="name${product.no}">${product.name}</td>
								<td>${product.price}</td>
								<td>${product.type}</td>
								<td>
									<button id="edit${product.no}" type="button" class="edit btn btn-info" data-toggle="modal" data-target="#modifyModal">修改</button>
								</td>
								<td>
									<button id="continue${product.no}" type="button" class="continue btn btn-secondary" data-toggle="modal"
										data-target="#continueModal">下架</button>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<hr>
		</div>
	</div>
	<div class="card-body" id="unavailable">
		<div class="table-responsive">
			<table class='table table-bordered table-striped table-hover' id='dataTable2' width='100%' cellspacing='0'
				style="text-align: center">
				<thead>
					<tr>
						<th width='5%'>編號</th>
						<th width='35%'>名稱</th>
						<th width='15%'>價格</th>
						<th width='15%'>種類</th>
						<th width='15%'>重新上架</th>
						<th width='15%'>刪除</th>

					</tr>
				</thead>

				<tfoot>
					<tr>
						<th>編號</th>
						<th>名稱</th>
						<th>價格</th>
						<th>種類</th>
						<th>重新上架</th>
						<th>刪除</th>
					</tr>
				</tfoot>
				<tbody>
					<c:if test='${empty unproducts}'>
						<tr style="text-align: center">
							<th colspan="6">尚無資料</th>
						</tr>
					</c:if>
					<c:if test='${not empty unproducts}'>
						<c:forEach var='product' items='${unproducts}'>
							<tr>
								<td>${product.no}</td>
								<td id="name${product.no}">${product.name}</td>
								<td>${product.price}</td>
								<td>${product.type}</td>
								<td>
									<button id="continue${product.no}" type="button" class="continue btn btn-success" data-toggle="modal"
										data-target="#continueModal">重新上架</button>
								</td>
								<td>
									<button id="del${product.no}" class="delete btn btn-danger "data-toggle="modal"
										data-target="#deleteModal">刪除</button>
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
<!-- Modal -->
<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="modifyModalTitle" aria-hidden="true">
	<form method="POST" id="editForm" action="edit">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content" id="modalContent">
				<div class="modal-header">
					<h5 class="modal-title" id="modifyModalTitle">更新商品</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="outline-width: 0;">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body table-responsive" id="modifyModalBody">
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
<div class="modal fade" id="continueModal" tabindex="-1" role="dialog" aria-labelledby="continueModalTitle" aria-hidden="true">
	<form method="POST" id="continueForm" action="continue">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content" id="continueModalContent">
				<div class="modal-header">
					<h5 class="modal-title" id="continueModalTitle">上架/下架商品</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="outline-width: 0;">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body table-responsive" id="continueModalBody">
					<div class="d-flex justify-content-center">
						<div class="spinner-border text-info" role="status">
							<span class="sr-only">Loading...</span>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="toContinue" class="btn btn-primary" data-dismiss="modal">確認</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</form>
</div>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalTitle" aria-hidden="true">
	<form method="POST" id="deleteForm" action="delete">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content" id="deleteModalContent">
				<div class="modal-header bg-danger">
					<h5 class="modal-title" id="deleteModalTitle"><b>刪除商品</b></h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="outline-width: 0;">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body table-responsive" id="deleteModalBody">
					<div class="d-flex justify-content-center">
						<div class="spinner-border text-info" role="status">
							<span class="sr-only">Loading...</span>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="toDelete" class="btn btn-danger" data-dismiss="modal">確定刪除</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</form>
</div>
<script>
	var changeSpeed = 300;
	var changeFlag = "changeFlag";
	$("#unavailable").slideUp(0);
	$("#change").click(function() {
		$(this).prop("disabled", true);
		if ($(this).attr("class").indexOf(changeFlag) != -1) {
			$(this).text("查看架上商品");
			$(this).toggleClass(changeFlag);
			//$(this).addClass("btn-info");
			$("#available").slideUp(changeSpeed, function() {
				$("#unavailable").slideDown(changeSpeed, function() {
					$("#change").prop("disabled", false);
				});
			});
		} else {
			$(this).text("查看已下架商品");
			$(this).toggleClass(changeFlag);
			//$(this).addClass("btn-info");
			$("#unavailable").slideUp(changeSpeed, function() {
				$("#available").slideDown(changeSpeed, function() {
					$("#change").prop("disabled", false);
				});
			});
		}
	});
	var pid;
	$(".modal")
			.on(
					"hidden.bs.modal",
					function(e) { //to reset modal to spinner when dismiss
						$(".modal-body")
								.html(
										"<div class='d-flex justify-content-center'><div class='spinner-border text-info' role='status'><span class='sr-only'>Loading...</span></div></div>");
					});
	$(".edit").click(
			function() { //to show edit modal
				pid = $(this).attr("id");
				$.ajax({
					url : "<c:url value='/product/editProduct'/>",
					type : "GET",
					data : {
						edit : pid
					},
					success : function(data) {
						$("#modalContent").html(data);
					},
					error : function() {
						$("#modifyModalBody").html(
								"<h2 style='color : red;'>獲得商品資料失敗<h2>")
						console.log("fail to get edit form");
					}
				});
			});
	var pno;
	var pname;
	$(".continue").click(
			function() { //to show continue modal
				var type = $(this).attr("class");
				pno = $(this).attr("id").substr("continue".length);
				pname = $("#name" + pno).text();
				if (type.indexOf("btn-secondary") != -1) { //to discontinue
					$("#continueModalTitle").html("下架商品");
					$("#continueModalBody").html(
							"<h3 style='text-align: center'>確定要下架 <b>" + pname
									+ "</b> 嗎？</h3>");
				} else { //to continue
					$("#continueModalTitle").html("重新上架商品");
					$("#continueModalBody").html(
							"<h3 style='text-align: center'>確定要重新上架 <b>"
									+ pname + "</b> 嗎？</h3>");
				}
			});

	$(".delete").click(
			function() { //to show delete modal
				var type = $(this).attr("class");
				pno = $(this).attr("id").substr("del".length);
				console.log(pno);
				pname = $("#name" + pno).text();
				$("#deleteModalBody").html(
						"<h3 style='text-align: center'>確定要刪除 <b>" + pname
								+ "</b> 嗎？</h3>");

			});
	$("#new").click(function() { //to go to add product page
		$.ajax({
			url : "<c:url value='/product/addProduct'/>",
			type : "GET",
			success : function(data) {

				$("#pageItems").html(data);
			}
		});
	});
	var temp;
	var judgeString = "EDITproductSUCCESS";
	var toDelete;
	$("#editForm").submit(function(event) { //confirm edit
		event.preventDefault();
		console.log("prevent submit");
		var form = new FormData(this);
		$.ajax({
			url : "<c:url value='/product/editProduct'/>",
			type : "POST",
			data : form,
			datatype : "json",
			contentType : false,
			processData : false,
			success : function(data) {
				temp = data;

				toDelete = temp.indexOf(judgeString);
				temp = temp.substr(toDelete + judgeString.length);

				if (toDelete == -1) {
					$("#modalContent").html(data);
				} else {
					$("#modifyModal").on("hidden.bs.modal", function() {
						$("#pageItems").html(temp);
						console.log("temp in funciton :\n" + temp);
					});
					$('#modifyModal').modal('hide');
					console.log("hide?");
				}
			},
			error : function() {
				console.log("fail to get edit form");
			}
		});
	});
	$("#toContinue").click(function() { //to confirm continue/discontinue product
		$("#continueModal").on("hidden.bs.modal", function() {
			$.ajax({
				url : "<c:url value='/product/continueProduct'/>",
				type : "POST",
				data : {
					pno : pno,
				},
				success : function(data) {
					$("#pageItems").html(data);
				},
				error : function() {
					$("#pageItems").html("continue ajax fail");
				}
			});
		});
	});
	$("#toDelete").click(function() { //to confirm to delete product
		$("#deleteModal").on("hidden.bs.modal", function() {
			$.ajax({
				url : "<c:url value='/product/deleteProduct'/>",
				type : "POST",
				data : {
					pno : pno,
				},
				success : function(data) {
					$("#pageItems").html(data);
				},
				error : function() {
					$("#pageItems").html("continue ajax fail");
				}
			});
		});
	});
</script>

