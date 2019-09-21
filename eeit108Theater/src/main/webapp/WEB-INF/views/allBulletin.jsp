<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<jsp:include page="header.jsp" />
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
						<!--進行中 -->
						<c:forEach var='sb' items='${statusBulletin[0]}'>
							<!-- 進行中內文 -->
							<div class="stat_avai_cont_${sb.no} add-model hide">
								<div>${sb.context}
									<img id="showPhoto" src="<c:url value='/getBulletinPicture/${sb.no}' />" />
								</div>
								<div>
									<input type="button" value="返回" name="back" class="stat_avai_cont_${sb.no}">
								</div>
							</div>
							<!-- 進行中修改 -->
							<div class="stat_avai_edit_${sb.no} add-model hide">
								<h4>對"${sb.title}""編輯?</h4>
								<div>
									<input type="button" value="返回" name="back" class="stat_avai_edit_${sb.no}">
								</div>
								<div>
									<input type="button" value="確定" onclick="javascript:location.href='${pageContext.request.contextPath}/allBulletin/${sb.no}'">
								</div>
							</div>
							<!-- 進行中刪除 -->
							<div class="stat_avai_dele_${sb.no} add-model hide">
								<h4>對"${sb.title}"刪除?</h4>
								<div>
									<input type="button" value="返回" name="back" class="stat_avai_dele_${sb.no}">
								</div>
								<div>
									<input type="button" value="確定" onclick="javascript:location.href='${pageContext.request.contextPath}/allBulletin/deleteSstatus/${sb.no}'">
								</div>
							</div>
						</c:forEach>

						<!-- 過期區 -->
						<c:forEach var='sb' items='${statusBulletin[1]}'>
							<!-- 過期 內文 -->
							<div class="unstat_avai_cont_${sb.no} add-model hide">
								<div>${sb.context}
									<img id="showPhoto" src="<c:url value='/getBulletinPicture/${sb.no}' />" />
								</div>
								<div>
									<input type="button" value="返回" name="back" class="unstat_avai_cont_${sb.no}">
								</div>
							</div>

							<!-- 過期 編輯 -->
							<div class="unstat_avai_edit_${sb.no} add-model hide">
								<h4>對"${sb.title}""編輯?</h4>
								<div>
									<input type="button" value="返回" name="back" class="unstat_avai_edit_${sb.no}">
								</div>
								<div>
									<input type="button" value="確定" onclick="javascript:location.href='${pageContext.request.contextPath}/allBulletin/${sb.no}'">
								</div>
							</div>

							<!-- 過期 刪除 -->
							<div class="unstat_avai_dele_${sb.no} add-model hide">
								<h4>對"${sb.title}"刪除?</h4>
								<div>
									<input type="button" value="返回" name="back" class="unstat_avai_dele_${sb.no}">
								</div>
								<div>
									<input type="button" value="確定" onclick="javascript:location.href='${pageContext.request.contextPath}/allBulletin/deleteUnSstatus/${sb.no}'">
								</div>
							</div>
						</c:forEach>

						<!-- 刪除 -->
						<c:forEach var='sb' items='${statusBulletin[2]}'>
							<div class="unstat_unavai_cont_${sb.no} add-model hide">
								<div>${sb.context}
									<img id="showPhoto" src="<c:url value='/getBulletinPicture/${sb.no}' />" />
								</div>
								<div>
									<input type="button" value="返回" name="back" class="unstat_unavai_cont_${sb.no}">
								</div>
							</div>
						
							<!-- 刪除 復原 -->
							<div class="unstat_unavai_dele_${sb.no} add-model hide">
								<h4>對"${sb.title}"復原?</h4>
								<div>
									<input type="button" value="返回" name="back" class="unstat_unavai_dele_${sb.no}">
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
											<th>#</th>
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
												<c:if test="${ sb.available}">
													<td>${sb.no}</td>
													<td>${sb.title}</td>
													<td><img width="20px" src="${pageContext.request.contextPath}${sb.imgUrlString}"></td>
													<td>${sb.pay}${sb.discountTickBuy}${sb.discountPriceBuy}${sb.free}${sb.discountTickFree}${sb.discountPriceFree}</td>
													<td><img name="add_host" id="stat_avai_cont_${sb.no}" width="20px"
														src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/context.png"></td>
													<td><img name="add_host" id="stat_avai_edit_${sb.no}" width="20px"
														src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/edit.png"></td>
													<td><img name="add_host" id="stat_avai_dele_${sb.no}" width="20px"
														src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/dele.png"></td>
												</c:if>
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
											<th>#</th>
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
												<c:if test="${sb.available}">
													<td>${sb.no}</td>
													<td>${sb.title}</td>
													<td><img width="20px" src="${pageContext.request.contextPath}${sb.imgUrlString}"></td>
													<td>${sb.pay}${sb.discountTickBuy}${sb.discountPriceBuy}${sb.free}${sb.discountTickFree}${sb.discountPriceFree}</td>
													<td><img name="add_host" id="unstat_avai_cont_${sb.no}" width="20px"
														src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/context.png"></td>
													<td><img name="add_host" id="unstat_avai_edit_${sb.no}" width="20px"
														src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/edit.png"></td>
													<td><img name="add_host" id="unstat_avai_dele_${sb.no}" width="20px"
														src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/dele.png"></td>
												</c:if>
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
											<th>#</th>
											<th>標題</th>
											<th colspan="2">優惠方案</th>
											<th>詳情</th>

											<th>復原</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var='sb' items='${statusBulletin[2]}'>
											<tr>
												<c:if test="${!sb.available}">
													<td>${sb.no}</td>
													<td>${sb.title}</td>
													<td><img width="20px" src="${pageContext.request.contextPath}${sb.imgUrlString}"></td>
													<td>${sb.pay}${sb.discountTickBuy}${sb.discountPriceBuy}${sb.free}${sb.discountTickFree}${sb.discountPriceFree}</td>
													<td><img name="add_host" id="unstat_unavai_cont_${sb.no}" width="20px"
														src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/context.png"></td>
													<td><img name="add_host" id="unstat_unavai_dele_${sb.no}" width="20px"
														src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/undo.png"></td>
												</c:if>
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
		<!-- Footer -->
		<jsp:include page="footer.jsp" />

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
			$(function() {
				$("#accordion").accordion();
			});

			$(function() {
				$("[name='add_host']").click(function() {
					var str = $(this).attr("id");
					var targete = $("." + str);
					$(targete).removeClass('hide');
				});
			});

			$(function() {
				$("[name|=back]").click(function() {
					var str = $(this).attr("class");
					var targete = $("." + str);
					$(targete).addClass('hide');
				});
			});

			$(function() {
				$("[name|=change]").click(function() {
					var str = $(this).attr("name");
					var targete = $("." + str);
					$(targete).addClass('hide');
				});
			});

			// 			$(function () {
			// 				$("img[name=add_host]").mouseover
			// 				{
			// 				}
			// 			});

			// 			$(function () {
			// 				$("[name='change_back']").click(function () {
			// 					$(this).addClass('hide');
			// 				});
			// 			});
		</script>
</body>

</html>