<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<ol class="breadcrumb">
	<li class="breadcrumb-item">
		<a href="empIndexA">Home</a>
	</li>
	<li class="breadcrumb-item">票務管理</li>
	<li class="breadcrumb-item active">查詢訂單</li>
</ol>

<!-- DataTables Example -->
<div class="container">
	<div class="card card-register mx-auto my-5">
		<div class="card-header">7-1 Cinema 查詢訂單</div>
		<div class="card-body">
			<form method="POST" action="searchOrder" id="searchOrder">
			<span style="color:red">${errMsg['error']}${errMsg['notFound']}${errMsg['wrongPhone']}</span>
				<div class="form-group">
					<div class="form-label-group">
						<input type="text" id="orderId" name="orderId" class="form-control" placeholder="取票序號" required="required" autofocus="autofocus" value="${oid}" />
						<label for="orderId">取票序號（9 碼）</label>
						<p></p>
					</div>
				</div>

				<div class="form-group">
					<div class="form-label-group">
						<input type="text" id="phone" name="phone" class="form-control" placeholder="手機末四碼" required="required" />
						<label for="phone">手機末四碼</label>
					</div>
				</div>
				<div class="justify-content-end">
					<button type="submit" class="btn btn-primary">查詢</button>
					<button type="reset" class="btn btn-secondary">重填</button>
					
				</div>
				<hr>
			</form>
		</div>

	</div>
</div>
<script>
	$("#searchOrder").submit(function(event){
		event.preventDefault();
		var form = new FormData(this);
		//alert("prevent default");
		$.ajax({
			url : "<c:url value='/backOrder/queryOrder'/>",
			type : "POST",
			data : form,
			datatype : "json",
			contentType : false,
			processData : false,
			success : function(data){
				$("#pageItems").html(data);
			},
			error : function(data){
				alert("search fail");
			}
			
		});
	});

</script>




