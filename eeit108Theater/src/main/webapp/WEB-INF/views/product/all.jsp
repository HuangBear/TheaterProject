<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!-- Breadcrumbs-->

<ol class="breadcrumb">
	<li class="breadcrumb-item">
		<a href="#">Home</a>
	</li>
	<li class="breadcrumb-item active">商品</li>
</ol>


<!-- DataTables Example -->
<div class="card mb-3">
	<div class="card-header">
		<div class="row">
		<div class="col-4"><i class="fas fa-table"></i> 7-1 Cinema 商品清單</div>
		<div class="col-4">${addMsg}</div>
		<div class="col-4"><button id="new" class="btn btn-success">新增</button></div>
		</div>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class='table table-bordered' id='dataTable' width='100%' cellspacing='0'>
				<thead>
					<tr>
						<th>編號</th>
						<th>名稱</th>
						<th>價格</th>
						<th>種類</th>
						<th>修改</th>
						<th>刪除</th>
					</tr>
				</thead>

				<tfoot>
					<tr>
						<th>編號</th>
						<th>名稱</th>
						<th>價格</th>
						<th>種類</th>
						<th>修改</th>
						<th>刪除</th>
					</tr>
				</tfoot>
				<tbody>
					<c:if test='${empty products}'>
						<tr style="text-align: center">
							<th style="rowspan: 6">尚無資料</th>
						</tr>
					</c:if>
					<c:if test='${not empty products}'>
						<c:forEach var='product' items='${products}'>
							<tr>
								<td>${product.no}</td>
								<td>${product.name}</td>
								<td>${product.price}</td>
								<td>${product.type}</td>
								<td>
									<button id="edit${product.no}" class="edit btn btn-info">修改</button>
								</td>
								<td>
									<button id="del${product.no}" class="delete btn btn-danger">刪除</button>
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
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content" id="modelContent">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">修改</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">修改</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
<script>
	$(".edit").click(function() {

		var pk = $(this).attr("id");
		$.ajax({
			url : "<c:url value='/product/editProduct'/>",
			data : {
				pid : pk,
			},
			type : "GET",
			success : function(data) {
				$("#pageItems").html(data);
			}
		});
	});
	$(".delete").click(function() {

		var pk = $(this).attr("id");
		$.ajax({
			url : "<c:url value='/product/deleteProduct'/>",
			data : {
				pid : pk,
			},
			type : "GET",
			success : function(data) {
				$("#pageItems").html(data);
			}
		});
	});
	$("#new").click(function(){
		$.ajax({
			url : "<c:url value='/product/addProduct'/>",
			type : "GET",
			success : function(data) {
				$("#pageItems").html(data);
			}
		});
	});
</script>

