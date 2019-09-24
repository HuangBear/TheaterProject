<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>

<head>
<title>Left Sidebar - Helios by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<!-- 順序不要調動 -->
<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>

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

</head>

<body class="left-sidebar is-preload">

	<div id="page-wrapper">
		<div id="header">
			<!--Header-->
			<jsp:include page="../header.jsp" />
		</div>
		<!-- Main-->
		<div class="wrapper style1">

			<div class="container">

				<div class="row gtr-200">
					<div class="col-4 col-12-mobile" id="sidebar">

						<p>後台測試頁</p>


						<div class="row gtr-50">

							<div class="col-8">
								<h4>Nibh sed cubilia</h4>

							</div>

							<div class="col-8">
								<h4>Proin sed adipiscing</h4>

							</div>

							<div class="col-8">
								<h4>公告</h4>

							</div>

							<div class="col-8">
								<h4>Sed tempus fringilla</h4>

							</div>

							<div class="col-8">
								<h4>Malesuada fermentum</h4>

							</div>
						</div>


					</div>
					<div class="col-8 col-12-mobile imp-mobile" id="content">
						<article id="main">
							<header>
								<h2>
									<a href="#">AllBulletin</a>
								</h2>
							</header>
						</article>

						<!-- load視窗 -->
						<c:if test="${changeMsg!=null}">
							<div class="change shade">
								<div>${changeMsg}</div>
								<div>
									<input type="button" value="返回" name="change">
								</div>
							</div>
						</c:if>


						<!-- 詳情 -->
						<div class="context_box add-model hide">
							<div id="ContextPic"></div>
							<div>
								<img id="ImagePic${sb.no}" alt="Base64 encoded image" width="100" height="100" />
							</div>
							<div>
								<input type="button" value="返回" name="cont_box_back" class="context_box">
							</div>
						</div>


						<!--進行中 -->
						<c:forEach var='sb' items='${statusBulletin[0]}'>

							<!-- 進行中修改 -->
							<div class="status_edit_${sb.no} add-model hide">
								<h4>對"${sb.title}""編輯?</h4>
								<div>
									<input type="button" value="返回" name="back" class="status_edit_${sb.no}">
								</div>
								<div>
									<input type="button" value="確定" onclick="javascript:location.href='${pageContext.request.contextPath}/allBulletin/${sb.no}'">
								</div>
							</div>
							<!-- 進行中刪除 -->
							<div class="status_dele_${sb.no} add-model hide">
								<h4>對"${sb.title}"刪除?</h4>
								<div>
									<input type="button" value="返回" name="back" class="status_dele_${sb.no}">
								</div>
								<div>
									<input type="button" value="確定" onclick="javascript:location.href='${pageContext.request.contextPath}/allBulletin/deleteSstatus/${sb.no}'">
								</div>
							</div>
						</c:forEach>

						<!-- 過期區 -->
						<c:forEach var='sb' items='${statusBulletin[1]}'>
							<!-- 過期 編輯 -->
							<div class="unstat_edit_${sb.no} add-model hide">
								<h4>對"${sb.title}""編輯?</h4>
								<div>
									<input type="button" value="返回" name="back" class="unstat_edit_${sb.no}">
								</div>
								<div>
									<input type="button" value="確定" onclick="javascript:location.href='${pageContext.request.contextPath}/allBulletin/${sb.no}'">
								</div>
							</div>

							<!-- 過期 刪除 -->
							<div class="unstat_dele_${sb.no} add-model hide">
								<h4>對"${sb.title}"刪除?</h4>
								<div>
									<input type="button" value="返回" name="back" class="unstat_dele_${sb.no}">
								</div>
								<div>
									<input type="button" value="確定" onclick="javascript:location.href='${pageContext.request.contextPath}/allBulletin/deleteUnSstatus/${sb.no}'">
								</div>
							</div>
						</c:forEach>

						<!-- 刪除 -->
						<c:forEach var='sb' items='${statusBulletin[2]}'>
							<!-- 刪除 復原 -->
							<div class="unavai_dele_${sb.no} add-model hide">
								<h4>對"${sb.title}"復原?</h4>
								<div>
									<input type="button" value="返回" name="back" class="unavai_dele_${sb.no}">
								</div>
								<div>
									<input type="button" value="確定" onclick="javascript:location.href='${pageContext.request.contextPath}/allBulletin/restore/${sb.no}'">
								</div>
							</div>
						</c:forEach>



						<div id="accordion">

							<h3>進行中</h3>
							<div>
								<table>
									<thead>
										<tr>
											<th>標題</th>
											<th colspan="2">優惠方案</th>
											<th>詳情</th>
											<th>修改</th>
											<th>刪除</th>
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
												<td><img name="add_host" id="status_edit_${sb.no}" width="20px"
													src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/edit.png"></td>
												<td><img name="add_host" id="status_dele_${sb.no}" width="20px"
													src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/dele.png"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

							<h3>已過期</h3>
							<div>
								<table>
									<thead>
										<tr>
											<th>標題</th>
											<th colspan="2">優惠方案</th>
											<th>詳情</th>
											<th>加期</th>
											<th>刪除</th>
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
												<td><img name="add_host" id="unstat_edit_${sb.no}" width="20px"
													src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/edit.png"></td>
												<td><img name="add_host" id="unstat_dele_${sb.no}" width="20px"
													src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/dele.png"></td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

							<h3>已刪除</h3>
							<div>
								<table>
									<thead>
										<tr>
											<th>標題</th>
											<th colspan="2">優惠方案</th>
											<th>詳情</th>

											<th>復原</th>
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
												<td><img name="add_host" id="unavai_dele_${sb.no}" width="20px"
													src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/undo.png"></td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="../footer.jsp" />

	<!-- Scripts -->


	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


	<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
	<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="jqueryui/style.css">
	<script>
		//accordion
		$(function() {
			$("#accordion").accordion({
				heightStyle : "content"
			});
		});

		//back button
		$(function() {
			$("[name=back]").click(function() {
				var str = $(this).attr("class");
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
					url : " <c:url value='/ajaxImg' />",
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
					url : " <c:url value='/ajaxContext' />",
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data) {
						//将图片的Base64编码设置给src
						$("#ContextPic").text(data);
					},
					error : function(data) {
						alert('AJAX內文讀取失敗！');
					}
				});

			});
			//	back
			$("[name=cont_box_back]").click(function() {
				var str = $(this).attr("class");
				var targete = $("." + str);
				$(targete).addClass('hide');
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
	</script>
</body>

</html>