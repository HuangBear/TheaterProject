<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
.hide {
	display: none;
}

.shade {
	position: fixed;
	top: 0;
	right: 0;
	left: 0;
	bottom: 0;
	background: black;
	opacity: 0.6;
	z-index: 100;
}

.add-model {
	position: fixed;
	height: 300px;
	width: 400px;
	top: 100px;
	left: 50%;
	z-index: 101;
	border: 1px solid red;
	background: white;
	margin-left: -200px;
}
</style>

<!-- <script src="js/admin/demo/datatables-demo.js"></script> -->
<!-- <script src="js/admin/demo/chart-area-demo.js"></script> -->
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

<script>
	// 	//accordion
	// 	$(function() {
	// 		$("#accordion").accordion({
	// 			heightStyle : "content"
	// 		});
	// 	});

	//back button
	$(function() {
		$(":button[name=back]").click(function() {
			var str = $(this).attr("id");
			var targete = $("." + str);
			$(targete).addClass('hide');
		});
	});

	// change msg box
	$(function() {
		$("[name|=change]").click(function() {
			var str = $(this).attr("name");
			var targete = $("." + str);
			$(targete).addClass('hide');
		});
	});

	//	edit and remove
	$(function() {
		//	imgbox button
		$("[name='add_host']").click(function() {
			var str = $(this).attr("id");
			var targete = $("." + str);
			$(targete).removeClass('hide');
		});

		//	img effect
		$("img[name=add_host]").mouseover(
				function() {
					var str = $(this).attr("src");
					var name = str.substring(str.lastIndexOf("/") + 1);
					var file_name = name.substring(0, name.length - 4);
					var attachment_name = str.substring(str.lastIndexOf(".") + 1);
					var new_str = "${pageContext.request.contextPath}/images/icons/backstage/bulletin/"
							+ file_name + "_." + attachment_name;
					$(this).attr("src", new_str);
				});
		$("img[name=add_host]").mouseout(
				function() {
					var str = $(this).attr("src");
					var name = str.substring(str.lastIndexOf("/") + 1);
					var file_name = name.substring(0, name.length - 5);
					var photo_type = str.substring(str.lastIndexOf(".") + 1);
					var new_str = "${pageContext.request.contextPath}/images/icons/backstage/bulletin/"
							+ file_name + "." + photo_type;
					$(this).attr("src", new_str);
				});
	});

	//	context
	$(function() {
		//	context	imgbox button
		$("[name='context_box']").click(function() {
			var str = $(this).attr("id");
			var str1 = str.substring(0, 11);
			var targete = $("." + str1);
			$(targete).removeClass('hide');
			var inputId = str.substring(str.lastIndexOf("_") + 1);
			$.ajax({
				type : 'post',
				data : {
					"no" : inputId
				}, //参数
				dataType : 'json',
				url : " <c:url value='/admin/ajaxImg' />",
				success : function(data) {
					//将图片的Base64编码设置给src
					$("#ImagePic").attr("src", "data:image/png;base64," + data);
				},
				error : function(data) {
					alert('AJAX圖片讀取失敗！');
				}
			});

			$.ajax({
				type : 'post',
				data : {
					"no" : inputId
				}, //参数
				dataType : 'text',
				url : " <c:url value='/admin/ajaxContext' />",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data) {
					//将图片的Base64编码设置给src
					$("#ContextPic").text(data);
				},
				error : function(data) {
					alert('AJAX內文讀取失敗！');
				}
			});

		});

		//	context	img effect
		$("img[name=context_box]").mouseover(
				function() {
					var str = $(this).attr("src");
					var name = str.substring(str.lastIndexOf("/") + 1);
					var file_name = name.substring(0, name.length - 4);
					var attachment_name = str.substring(str.lastIndexOf(".") + 1);
					var new_str = "${pageContext.request.contextPath}/images/icons/backstage/bulletin/"
							+ file_name + "_." + attachment_name;
					$(this).attr("src", new_str);
				});
		$("img[name=context_box]").mouseout(
				function() {
					var str = $(this).attr("src");
					var name = str.substring(str.lastIndexOf("/") + 1);
					var file_name = name.substring(0, name.length - 5);
					var photo_type = str.substring(str.lastIndexOf(".") + 1);
					var new_str = "${pageContext.request.contextPath}/images/icons/backstage/bulletin/"
							+ file_name + "." + photo_type;
					$(this).attr("src", new_str);
				});
	});

	$("[name=edit]").click(function() {
		var str = $(this).attr("id");
		var id = str.substring(str.lastIndexOf("_") + 1);
		// 		alert(id);
		$.ajax({
			url : "<c:url value='/admin/bulletin_all/edit'/>",
			data : {
				no : id,
			},
			type : "GET",
			cache : false,
			success : function(data) {
				$("#pageItems").html(data);
			}
		});
	});

	$("[name=deleteSstatus]").click(function() {
		var str = $(this).attr("id");
		var id = str.substring(str.lastIndexOf("_") + 1);
		var fn = str.substring(0, 4);
		$.ajax({
			url : "<c:url value='/admin/bulletin_all/deleteSstatus'/>",
			data : {
				no : id,
				fn : fn,
			},
			type : "GET",
			cache : false,
			success : function(data) {
				$("#pageItems").html(data);
			}
		});
	});

	$("[name=restore]").click(function() {
		var str = $(this).attr("id");
		var id = str.substring(str.lastIndexOf("_") + 1);
		var fn = str.substring(0, 4);
		$.ajax({
			url : "<c:url value='/admin/bulletin_all/restore'/>",
			data : {
				no : id,
				fn : fn,
			},
			cache : false,
			type : "GET",
			success : function(data) {
				$("#pageItems").html(data);
			}
		});
	});
</script>


<!-- 詳情 -->
<div class="context_box add-model hide">
	<div id="ContextPic"></div>
	<div>
		<img id="ImagePic${sb.no}" alt="Base64 encoded image" width="250" />
	</div>
	<div>
		<button id="context_box" name="back" class="btn btn-danger">返回</button>
	</div>
</div>


<!--進行中 -->
<c:forEach var='sb' items='${statusBulletin[0]}'>

	<!-- 進行中修改 -->
	<div class="status_edit_${sb.no} add-model hide">
		<h4>對"${sb.title}""編輯?</h4>
		<div>
			<button id="status_edit_${sb.no} " name="back" class="btn btn-danger">返回</button>
		</div>
		<div>
			<button class=" btn btn-info" id="stat_edit_${sb.no}" name="edit">確定</button>
			<%-- 			<input class=" btn btn-info" type="button" value="確定" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/bulletin_all/${sb.no}'"> --%>


		</div>
	</div>
	<!-- 進行中刪除 -->
	<div class="status_dele_${sb.no} add-model hide">
		<h4>對"${sb.title}"刪除?</h4>
		<div>
			<button id="status_dele_${sb.no} " name="back" class="btn btn-danger">返回</button>
		</div>
		<div>
			<button class=" btn btn-info" name="deleteSstatus" id="stat_deleteSstatus_${sb.no}">確定</button>
		</div>
	</div>
</c:forEach>



<!-- 過期區 -->
<c:forEach var='sb' items='${statusBulletin[1]}'>
	<!-- 過期 編輯 -->
	<div class="unstat_edit_${sb.no} add-model hide">
		<h4>對"${sb.title}""編輯?</h4>
		<div>
			<button id="unstat_edit_${sb.no} " name="back" class="btn btn-danger">返回</button>
		</div>
		<div>
			<button class=" btn btn-info" id="edit_${sb.no}" name="edit">確定</button>
		</div>
	</div>

	<!-- 過期 刪除 -->
	<div class="unstat_dele_${sb.no} add-model hide">
		<h4>對"${sb.title}"刪除?</h4>
		<div>
			<button id="unstat_dele_${sb.no}" name="back" class=" btn btn-danger">返回</button>
		</div>
		<div>
			<button class=" btn btn-info" name="deleteSstatus" id="pass_deleteSstatus_${sb.no}">確定</button>
		</div>
	</div>
</c:forEach>

<!-- 刪除 -->
<c:forEach var='sb' items='${statusBulletin[2]}'>
	<!-- 刪除 復原 -->
	<div class="unavai_dele_${sb.no} add-model hide">
		<h4>對"${sb.title}"復原?</h4>
		<div>
			<button id="unavai_dele_${sb.no}" name="back" class=" btn btn-danger">返回</button>
		</div>
		<div>
			<button class=" btn btn-info" name="restore" id="dead_restore_${sb.no}">確定</button>
		</div>
	</div>
</c:forEach>


<!-- Breadcrumbs-->

<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="#">Home</a></li>
	<li class="breadcrumb-item active">bulletin_all</li>
</ol>


<!-- DataTables Example -->
<div class="card mb-3">
	<div class="card-header">
		<i class="fas fa-table"></i> 7-1 Cinema歷史公告
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<!-- 				<div id="accordion" class="table-responsive"> -->

			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">進行中</a> <a
						class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">已過期</a>
					<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">已刪除</a>
				</div>
			</nav>
			<div class="tab-content " id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					<table class=' table table-hover' id='dataTable' width='70%' cellspacing='0'>
						<thead>
							<tr>
								<th scope="col">標題</th>
								<th scope="col" colspan="2">優惠方案</th>
								<th scope="col">詳情</th>
								<th scope="col">修改</th>
								<th scope="col">刪除</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var='sb' items='${statusBulletin[0]}'>
								<tr>
									<td class="hide">${sb.no}</td>
									<td>${sb.title}</td>
									<td><img width="20px" src="${pageContext.request.contextPath}${sb.imgUrlString}"></td>
									<td>${sb.pay}${sb.discountTickBuy}${sb.discountPriceBuy}${sb.free}${sb.discountTickFree}${sb.discountPriceFree}</td>
									<td><img name="context_box" id="context_box_${sb.no}" width="20px"
										src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/context.png"></td>
									<td><img name="add_host" id="status_edit_${sb.no}" width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/edit.png"></td>
									<td><img name="add_host" id="status_dele_${sb.no}" width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/dele.png"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
					<table class=' table table-hover' id='dataTable' width='70%' cellspacing='0'>
						<thead>
							<tr>
								<th scope="col">標題</th>
								<th scope="col" colspan="2">優惠方案</th>
								<th scope="col">詳情</th>
								<th scope="col">修改</th>
								<th scope="col">刪除</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var='sb' items='${statusBulletin[1]}'>
								<tr>
									<td class="hide">${sb.no}</td>
									<td>${sb.title}</td>
									<td><img width="20px" src="${pageContext.request.contextPath}${sb.imgUrlString}"></td>
									<td>${sb.pay}${sb.discountTickBuy}${sb.discountPriceBuy}${sb.free}${sb.discountTickFree}${sb.discountPriceFree}</td>
									<td><img name="context_box" id="context_box_${sb.no}" width="20px"
										src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/context.png"></td>
									<td><img name="add_host" id="unstat_edit_${sb.no}" width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/edit.png"></td>
									<td><img name="add_host" id="unstat_dele_${sb.no}" width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/dele.png"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
					<table class=' table table-hover' id='dataTable' width='70%' cellspacing='0'>
						<thead>
							<tr>
								<th scope="col">標題</th>
								<th scope="col" colspan="2">優惠方案</th>
								<th scope="col">詳情</th>
								<th scope="col">復原</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var='sb' items='${statusBulletin[2]}'>
								<tr>
									<td class="hide">${sb.no}</td>
									<td>${sb.title}</td>
									<td><img width="20px" src="${pageContext.request.contextPath}${sb.imgUrlString}"></td>
									<td>${sb.pay}${sb.discountTickBuy}${sb.discountPriceBuy}${sb.free}${sb.discountTickFree}${sb.discountPriceFree}</td>
									<td><img name="context_box" id="context_box_${sb.no}" width="20px"
										src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/context.png"></td>
									<td><img name="add_host" id="unavai_dele_${sb.no}" width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/undo.png"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<!-- -------------------------------------------- -->
			<!-- 			<h3>進行中</h3> -->
			<!-- 			<div> -->
			<!-- 				<table class='table table-bordered' id='dataTable' width='70%' cellspacing='0'> -->
			<!-- 					<thead> -->
			<!-- 						<tr> -->
			<!-- 							<th>標題</th> -->
			<!-- 							<th colspan="2">優惠方案</th> -->
			<!-- 							<th>詳情</th> -->
			<!-- 							<th>修改</th> -->
			<!-- 							<th>刪除</th> -->
			<!-- 						</tr> -->
			<!-- 					</thead> -->
			<!-- 					<tbody> -->
			<%-- 						<c:forEach var='sb' items='${statusBulletin[0]}'> --%>
			<!-- 							<tr> -->
			<%-- 								<td class="hide">${sb.no}</td> --%>
			<%-- 								<td>${sb.title}</td> --%>
			<%-- 								<td><img width="20px" src="${pageContext.request.contextPath}${sb.imgUrlString}"></td> --%>
			<%-- 								<td>${sb.pay}${sb.discountTickBuy}${sb.discountPriceBuy}${sb.free}${sb.discountTickFree}${sb.discountPriceFree}</td> --%>
			<%-- 								<td><img name="context_box" id="context_box_${sb.no}" width="20px" --%>
			<%-- 									src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/context.png"></td> --%>
			<%-- 								<td><img name="add_host" id="status_edit_${sb.no}" width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/edit.png"></td> --%>
			<%-- 								<td><img name="add_host" id="status_dele_${sb.no}" width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/dele.png"></td> --%>
			<!-- 							</tr> -->
			<%-- 						</c:forEach> --%>
			<!-- 					</tbody> -->
			<!-- 				</table> -->
			<!-- 			</div> -->

			<!-- 			<h3>已過期</h3> -->
			<!-- 			<div> -->
			<!-- 				<table class='table table-bordered' id='dataTable' width='70%' cellspacing='0'> -->
			<!-- 					<thead> -->
			<!-- 						<tr> -->
			<!-- 							<th>標題</th> -->
			<!-- 							<th colspan="2">優惠方案</th> -->
			<!-- 							<th>詳情</th> -->
			<!-- 							<th>加期</th> -->
			<!-- 							<th>刪除</th> -->
			<!-- 						</tr> -->
			<!-- 					</thead> -->
			<!-- 					<tbody> -->

			<%-- 						<c:forEach var='sb' items='${statusBulletin[1]}'> --%>
			<!-- 							<tr> -->
			<%-- 								<td class="hide">${sb.no}</td> --%>
			<%-- 								<td>${sb.title}</td> --%>
			<%-- 								<td><img width="20px" src="${pageContext.request.contextPath}${sb.imgUrlString}"></td> --%>
			<%-- 								<td>${sb.pay}${sb.discountTickBuy}${sb.discountPriceBuy}${sb.free}${sb.discountTickFree}${sb.discountPriceFree}</td> --%>
			<%-- 								<td><img name="context_box" id="context_box_${sb.no}" width="20px" --%>
			<%-- 									src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/context.png"></td> --%>
			<%-- 								<td><img name="add_host" id="unstat_edit_${sb.no}" width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/edit.png"></td> --%>
			<%-- 								<td><img name="add_host" id="unstat_dele_${sb.no}" width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/dele.png"></td> --%>

			<!-- 							</tr> -->
			<%-- 						</c:forEach> --%>
			<!-- 					</tbody> -->
			<!-- 				</table> -->
			<!-- 			</div> -->

			<!-- 			<h3>已刪除</h3> -->
			<!-- 			<div> -->
			<!-- 				<table class='table table-bordered' id='dataTable' width='70%' cellspacing='0'> -->
			<!-- 					<thead> -->
			<!-- 						<tr> -->
			<!-- 							<th>標題</th> -->
			<!-- 							<th colspan="2">優惠方案</th> -->
			<!-- 							<th>詳情</th> -->

			<!-- 							<th>復原</th> -->
			<!-- 						</tr> -->
			<!-- 					</thead> -->
			<!-- 					<tbody> -->
			<%-- 						<c:forEach var='sb' items='${statusBulletin[2]}'> --%>
			<!-- 							<tr> -->

			<%-- 								<td class="hide">${sb.no}</td> --%>
			<%-- 								<td>${sb.title}</td> --%>
			<%-- 								<td><img width="20px" src="${pageContext.request.contextPath}${sb.imgUrlString}"></td> --%>
			<%-- 								<td>${sb.pay}${sb.discountTickBuy}${sb.discountPriceBuy}${sb.free}${sb.discountTickFree}${sb.discountPriceFree}</td> --%>
			<%-- 								<td><img name="context_box" id="context_box_${sb.no}" width="20px" --%>
			<%-- 									src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/context.png"></td> --%>
			<%-- 								<td><img name="add_host" id="unavai_dele_${sb.no}" width="20px" src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/undo.png"></td> --%>

			<!-- 							</tr> -->
			<%-- 						</c:forEach> --%>
			<!-- 					</tbody> -->
			<!-- 				</table> -->
			<!-- 			</div> -->
		</div>
	</div>

	<div class="card-footer small text-muted">Updated at 00:00 PM</div>
</div>
