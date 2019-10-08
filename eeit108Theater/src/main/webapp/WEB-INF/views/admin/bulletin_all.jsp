<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.hide {
	display: none;
}

.myMOUSE {
	cursor: pointer;
}

table {
	table-layout: fixed;
}

.title_width {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>

<script>
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

	//	context
	$(function() {
		//	context	imgbox button
		$("[name='context_box']").click(function() {
			var str = $(this).attr("id");
			// 			var str1 = str.substring(0, 11);
			// 			var targete = $("." + str1);
			// 			$(targete).removeClass('hide');
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
				url : " <c:url value='/admin/ajaxTitle' />",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data) {
					//将图片的Base64编码设置给src
					$(".AjaxTitle").text(data);
				},
				error : function(data) {
					alert('AJAX標題讀取失敗！');
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
					$(".AjaxContext").text(data);
				},
				error : function(data) {
					alert('AJAX內文讀取失敗！');
				}
			});

		});

		//	context	img effect with JavaScript
		$("img[name=context_box]").mouseover(
				function() {
					$(this).addClass("myMOUSE");
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
					$(this).removeClass("myMOUSE");
					var str = $(this).attr("src");
					var name = str.substring(str.lastIndexOf("/") + 1);
					var file_name = name.substring(0, name.length - 5);
					var photo_type = str.substring(str.lastIndexOf(".") + 1);
					var new_str = "${pageContext.request.contextPath}/images/icons/backstage/bulletin/"
							+ file_name + "." + photo_type;
					$(this).attr("src", new_str);
				});

	});
	//	edit and remove
	$(function() {

		//	img effect
		$("img[name=img_effect]").mouseover(
				function() {
					$(this).addClass("myMOUSE");
					var str = $(this).attr("src");
					var name = str.substring(str.lastIndexOf("/") + 1);
					var file_name = name.substring(0, name.length - 4);
					var attachment_name = str.substring(str.lastIndexOf(".") + 1);
					var new_str = "${pageContext.request.contextPath}/images/icons/backstage/bulletin/"
							+ file_name + "_." + attachment_name;
					$(this).attr("src", new_str);
				});
		$("img[name=img_effect]").mouseout(
				function() {
					$(this).removeClass("myMOUSE");
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
		// 		alert(str);
		var div_str = "#div_" + str;
		// 		alert(div_str);
		$(div_str).on("hidden.bs.modal", function() {
			var id = str.substring(str.lastIndexOf("_") + 1);
			// 			alert(id);
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
	});

	$("[name=deleteSstatus]").click(function() {
		var str = $(this).attr("id");
		// 		alert(str);
		var div_str = "#div_" + str;
		// 		alert(div_str);
		$(div_str).on("hidden.bs.modal", function() {
			var id = str.substring(str.lastIndexOf("_") + 1);
			// 			alert(id);
			$.ajax({
				url : "<c:url value='/admin/bulletin_all/deleteSstatus'/>",
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
	});

	$("[name=restore]").click(function() {
		var str = $(this).attr("id");
		// 		alert(str);
		var div_str = "#div_" + str;
		// 		alert(div_str);
		$(div_str).on("hidden.bs.modal", function() {
			var id = str.substring(str.lastIndexOf("_") + 1);
			// 			alert(id);
			$.ajax({
				url : "<c:url value='/admin/bulletin_all/restore'/>",
				data : {
					no : id,
				},
				cache : false,
				type : "GET",
				success : function(data) {
					$("#pageItems").html(data);
				}
			});
		});
	});


	//title length
// 	$(function () {
// 		var $len = 20;
// 		$(".title").each(function() {
// 			if ($(this).text().length > $len) {
// 				var $text = $(this).text().substring(0, $len - 1) + "...";
// 				$(this).text($text);
// 			}
// 		});
		
// 	});

	if (${changeMsg != null}){
		$("a.hide").trigger("click");
	}
</script>
<!-- load 視窗 -->

<a class="hide" data-toggle="modal" data-target="#changeMsgCenter"></a>
<div class="modal fade" id="changeMsgCenter" tabindex="-1" role="dialog" aria-labelledby="changeMsgCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="changeMsgCenterTitle">系統提示</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">${changeMsg}</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">返回</button>
			</div>
		</div>
	</div>
</div>
<!-- 詳情 -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">公告詳情</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div>
					<h4 class="AjaxTitle"></h4>
				</div>
				<div>
					<h5 class="AjaxContext"></h5>
				</div>
				<img id="ImagePic${sb.no}" alt="Base64 encoded image" width="250" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">返回</button>
				<!-- 				<button type="button" class="btn btn-primary">Save changes</button> -->
			</div>
		</div>
	</div>
</div>

<!--進行中 -->
<c:forEach var='sb' items='${statusBulletin[0]}'>
	<!-- 進行中修改 -->
	<div class="modal fade" id="div_stat_edit_${sb.no}" tabindex="-1" role="dialog" aria-labelledby="div_stat_edit_${sb.no}Title" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="div_stat_edit_${sb.no}Title">修改公告</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h4>確定要對"${sb.title}"編輯?</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="stat_edit_${sb.no}" name="edit" data-dismiss="modal">確定</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 進行中刪除 -->
	<div class="modal fade" id="div_stat_dele_${sb.no}" tabindex="-1" role="dialog" aria-labelledby="div_stat_dele_${sb.no}Title" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="div_stat_dele_${sb.no}Title">刪除公告</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h4>確定對"${sb.title}"刪除?</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="stat_dele_${sb.no}" name="deleteSstatus" data-dismiss="modal">確定</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
</c:forEach>



<!-- 過期區 -->
<c:forEach var='sb' items='${statusBulletin[1]}'>
	<!-- 過期 編輯 -->
	<div class="modal fade" id="div_unstat_edit_${sb.no}" tabindex="-1" role="dialog" aria-labelledby="div_unstat_edit_${sb.no}Title" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="div_unstat_edit_${sb.no}Title">修改公告</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h4>確定要對"${sb.title}"編輯?</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="unstat_edit_${sb.no}" name="edit" data-dismiss="modal">確定</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 過期 刪除 -->
	<div class="modal fade" id="div_unstat_dele_${sb.no}" tabindex="-1" role="dialog" aria-labelledby="div_unstat_dele_${sb.no}Title" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="div_unstat_dele_${sb.no}Title">刪除公告</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h4>確定對"${sb.title}"刪除?</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="unstat_dele_${sb.no}" name="deleteSstatus" data-dismiss="modal">確定</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

<!-- 刪除 -->
<c:forEach var='sb' items='${statusBulletin[2]}'>
	<!-- 刪除 復原 -->

	<div class="modal fade" id="div_unavai_dele_${sb.no}" tabindex="-1" role="dialog" aria-labelledby="div_unavai_dele_${sb.no}Title" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="div_unavai_dele_${sb.no}Title">恢復公告</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h4>確定對"${sb.title}"恢復?</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="unavai_dele_${sb.no}" name="restore" data-dismiss="modal">確定</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
				</div>
			</div>
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
					<a class="nav-item nav-link active" id="nav-status-tab" data-toggle="tab" href="#nav-status" role="tab" aria-controls="nav-status" aria-selected="true">進行中</a>
					<a class="nav-item nav-link" id="nav-expired-tab" data-toggle="tab" href="#nav-expired" role="tab" aria-controls="nav-expired" aria-selected="false">已過期</a>
					<a class="nav-item nav-link" id="nav-dead-tab" data-toggle="tab" href="#nav-dead" role="tab" aria-controls="nav-dead" aria-selected="false">已刪除</a>
				</div>
			</nav>
			<div class="tab-content " id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-status" role="tabpanel" aria-labelledby="nav-status-tab">
					<table class=' table table-hover' id='dataTable'>
						<thead>
							<tr>
								<th scope="col" width="5%">#</th>
								<th scope="col" width="15%">標題</th>
								<th scope="col" width="25%">內文</th>
								<th scope="col" width="10%">開始時間</th>
								<th scope="col" width="10%">結束時間</th>
								<th scope="col" width="5%">公告人</th>
								<th scope="col" width="15%">優惠方案</th>
								<th scope="col" width="5%">詳情</th>
								<th scope="col" width="5%">修改</th>
								<th scope="col" width="5%">刪除</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var='sb' items='${statusBulletin[0]}' varStatus="i">
								<tr>
									<td class="hide">${sb.no}</td>
									<th scope="row">${i.index+1}</th>
									<td class="title_width">${sb.title}</td>
									<td class="title_width">${sb.context}</td>
									<td>${sb.startDate}</td>
									<td>${sb.endDate}</td>
									<td>${sb.employee.no}</td>
									<td><img width="30px" src="${pageContext.request.contextPath}${sb.imgUrlString}">&emsp;${sb.pay}${sb.discountTicketBuy}${sb.discountPriceBuy}${sb.free}${sb.discountTicketFree}${sb.discountPriceFree}</td>
									<td><img name="context_box" id="context_box_${sb.no}" data-toggle="modal" data-target="#exampleModalCenter" width="30px"
										src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/context.png"></td>
									<c:choose>
										<c:when test="${(sb.employee.no eq employeeBean1.no) or (employeeBean1.permission gt sb.employee.permission)}">
											<td><img name="img_effect" data-toggle="modal" data-target="#div_stat_edit_${sb.no}" width="30px"
												src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/edit.png"></td>
											<td><img name="img_effect" data-toggle="modal" data-target="#div_stat_dele_${sb.no}" width="30px"
												src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/dele.png"></td>
										</c:when>
										<c:otherwise>
											<td></td>
											<td></td>
										</c:otherwise>
									</c:choose>
							</c:forEach>
							<tr>
								<th scope="col" width="5%">#</th>
								<th scope="col" width="15%">標題</th>
								<th scope="col" width="25%">內文</th>
								<th scope="col" width="10%">開始時間</th>
								<th scope="col" width="10%">結束時間</th>
								<th scope="col" width="5%">公告人</th>
								<th scope="col" width="15%">優惠方案</th>
								<th scope="col" width="5%">詳情</th>
								<th scope="col" width="5%">修改</th>
								<th scope="col" width="5%">刪除</th>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="tab-pane fade" id="nav-expired" role="tabpanel" aria-labelledby="nav-expired-tab">
					<table class=' table table-hover' id='dataTable'>
						<thead>
							<tr>
								<th scope="col" width="5%">#</th>
								<th scope="col" width="15%">標題</th>
								<th scope="col" width="25%">內文</th>
								<th scope="col" width="10%">開始時間</th>
								<th scope="col" width="10%">結束時間</th>
								<th scope="col" width="5%">公告人</th>
								<th scope="col" width="15%">優惠方案</th>
								<th scope="col" width="5%">詳情</th>
								<th scope="col" width="5%">修改</th>
								<th scope="col" width="5%">刪除</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var='sb' items='${statusBulletin[1]}' varStatus="i">
								<tr>
									<td class="hide">${sb.no}</td>
									<th scope="row">${i.index+1}</th>
									<td class="title_width">${sb.title}</td>
									<td class="title_width">${sb.context}</td>
									<td>${sb.startDate}</td>
									<td>${sb.endDate}</td>
									<td>${sb.employee.no}</td>
									<td><img width="30px" src="${pageContext.request.contextPath}${sb.imgUrlString}">&emsp;
										${sb.pay}${sb.discountTicketBuy}${sb.discountPriceBuy}${sb.free}${sb.discountTicketFree}${sb.discountPriceFree}</td>
									<td><img name="context_box" id="context_box_${sb.no}" data-toggle="modal" data-target="#exampleModalCenter" width="30px"
										src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/context.png"></td>
									<c:choose>
										<c:when test="${(sb.employee.no eq employeeBean1.no) or (employeeBean1.permission gt sb.employee.permission)}">
											<td><img name="img_effect" data-toggle="modal" data-target="#div_unstat_edit_${sb.no}" width="30px"
												src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/edit.png"></td>
											<td><img name="img_effect" data-toggle="modal" data-target="#div_unstat_dele_${sb.no}" width="30px"
												src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/dele.png"></td>
										</c:when>
										<c:otherwise>
											<td></td>
											<td></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
							<tr>
								<th scope="col" width="5%">#</th>
								<th scope="col" width="15%">標題</th>
								<th scope="col" width="25%">內文</th>
								<th scope="col" width="10%">開始時間</th>
								<th scope="col" width="10%">結束時間</th>
								<th scope="col" width="5%">公告人</th>
								<th scope="col" width="15%">優惠方案</th>
								<th scope="col" width="5%">詳情</th>
								<th scope="col" width="5%">修改</th>
								<th scope="col" width="5%">刪除</th>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="tab-pane fade" id="nav-dead" role="tabpanel" aria-labelledby="nav-dead-tab">
					<table class=' table table-hover' id='dataTable' >
						<thead>
							<tr>
								<th scope="col" width="5%">#</th>
								<th scope="col" width="15%">標題</th>
								<th scope="col" width="25%">內文</th>
								<th scope="col" width="10%">開始時間</th>
								<th scope="col" width="10%">結束時間</th>
								<th scope="col" width="5%">公告人</th>
								<th scope="col" width="15%">優惠方案</th>
								<th scope="col" width="5%">詳情</th>
								<th scope="col" width="5%">修改</th>
								<th scope="col" width="5%">刪除</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var='sb' items='${statusBulletin[2]}' varStatus="i" end="5">
								<tr>
									<td class="hide">${sb.no}</td>
									<th scope="row">${i.index+1}</th>
									<td class="title_width">${sb.title}</td>
									<td class="title_width">${sb.context}</td>
									<td>${sb.startDate}</td>
									<td>${sb.endDate}</td>
									<td>${sb.employee.no}</td>
									<td><img width="30px" src="${pageContext.request.contextPath}${sb.imgUrlString}">&emsp;${sb.pay}${sb.discountTicketBuy}${sb.discountPriceBuy}${sb.free}${sb.discountTicketFree}${sb.discountPriceFree}</td>
									<td><img name="context_box" id="context_box_${sb.no}" data-toggle="modal" data-target="#exampleModalCenter" width="30px"
										src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/context.png"></td>
									<td></td>
									<c:choose>
										<c:when test="${(sb.employee.no eq employeeBean1.no) or (employeeBean1.permission gt sb.employee.permission)}">
											<td><img name="img_effect" data-toggle="modal" data-target="#div_unavai_dele_${sb.no}" width="30px"
												src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/undo.png"></td>
										</c:when>
										<c:otherwise>
											<td></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
							<tr>
								<th scope="col" width="5%">#</th>
								<th scope="col" width="15%">標題</th>
								<th scope="col" width="25%">內文</th>
								<th scope="col" width="10%">開始時間</th>
								<th scope="col" width="10%">結束時間</th>
								<th scope="col" width="5%">公告人</th>
								<th scope="col" width="15%">優惠方案</th>
								<th scope="col" width="5%">詳情</th>
								<th scope="col" width="5%">修改</th>
								<th scope="col" width="5%">刪除</th>
							</tr>
						</tbody>
					</table>
					<samp style="float: right;">已刪除公告區只顯示 10 筆資料</samp>
				</div>
			</div>

		</div>
	</div>

	<div class="card-footer small text-muted">Updated at ${updatedTime}</div>
</div>