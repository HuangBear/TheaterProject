<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ol class="breadcrumb">
	<li class="breadcrumb-item">
		<a href="empIndexA">Home</a>
	</li>
	<li id="product" class="breadcrumb-item">
		<a>商品</a>
	</li>
	<li id="addProduct" class="breadcrumb-item active">新增商品</li>
</ol>


<!-- DataTables Example -->
<div class="container">
	<div class="card card-register mx-auto mt-5">
		<div class="card-header">7-1 Cinema 新增商品</div>
		<div class="card-body">
			<form id="newProduct" method="POST" action="<c:url value='/product/addProduct'/>">
				<p style="color: red">${errMsg.save}</p>
				<div class="form-group">
					<div class="form-label-group">
						<input id="name" name="name" type="text" class="form-control" placeholder="name" required="required" autofocus="autofocus" />
						<label for="name">商品名稱</label>
						<p style="color: red">${errMsg.name}</p>
					</div>
				</div>

				<div class="form-group">
					<div class="form-label-group">
						<input id="price" name="price" type="number" class="form-control" placeholder="price" required="required" />
						<label for="price">商品價格</label>
						<p style="color: red">${errMsg.price}</p>
					</div>
				</div>

				<div class="form-group">
					<div class="form-label-group">
						<select id="type" name="type" class="form-control" required="required">
							<option value="ticket" selected="selected">票</option>
							<option value="food">食物</option>
							<option value="drink">飲料</option>
						</select>
						<p style="color: red">${errMsg.type}</p>
						<!--               <label for="gender">員工性別</label> -->
					</div>
				</div>


				<button type="submit" class="btn btn-primary">送出</button>
				<button type="reset" class="btn btn-primary">重填</button>
				<br>
				<hr>
				<button type="button" id="oneSet" class="btn btn-success">一鍵填入</button>



			</form>
		</div>

	</div>
</div>

<script>
	$('#oneSet').click(function() {

		$('#name').val('更好喝的奶茶');
		$('#price').val('80');
		$('#type').val('drink');
	})
</script>

<script>
	$("#newProduct").submit(function(event) {
		console.log("to preventDefault");
		event.preventDefault();
		console.log("preventDefault success");
		var productData = new FormData(this);
		$.ajax({
			url : "<c:url value='/product/addProduct'/>",
			type : "POST",
			data : productData,
			datatype : "json",
			contentType : false,
			processData : false,
			success : function(data) {
				$("#pageItems").html(data);
			},
			error : function() {
				$("#pageItems").html("ajax new product gg");
			}
		});
	});
</script>



