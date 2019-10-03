<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ol class="breadcrumb">
	<li class="breadcrumb-item">
		<a href="empIndexA">Home</a>
	</li>
	<li class="breadcrumb-item active">票務管理</li>
</ol>

<style>
.choose-btn {
	padding-top: 20%;
	padding-bottom: 20%;
	left:0;
	right:0;
	margin: auto;
	white-space: nowrap;
	font-size: 24px;
}
</style>
<!-- DataTables Example -->
<div class="container">
	<div class="card mx-auto my-5">
		<div class="card-header">7-1 Cinema 票務管理</div>
		<div class="card-body">
			<div class="row">
				<div class="col-6" align="center">
					<button id="bookingTicket" class="btn btn-primary choose-btn w-50">訂 票</button>
				</div>
				<div class="col-6" align="center">
					<button id="queryOrder" class="btn btn-success choose-btn w-50" style="">查詢 / 取票</button>
				</div>
			</div>


		</div>

	</div>
</div>
<script>
	$(".choose-btn").click(function(){
		var choose = $(this).attr("id");
		console.log(choose);
		console.log("<c:url value='/backOrder/" + choose + "'/>");
		$.ajax({
			url:"<c:url value='/backOrder/" + choose + "'/>",
			type : "GET",
			success : function(data){
				$("#pageItems").html(data);
			}
		});
	});
</script>