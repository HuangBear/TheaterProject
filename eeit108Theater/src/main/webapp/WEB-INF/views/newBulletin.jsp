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

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<style type="text/css">
.hid {
	/* 	visibility: hidden; */
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
						<!-- load視窗 -->
						<c:if test="${ErrMsg.changeMsg!=null}">
							<div class="change shade">
								<div>${ErrMsg.changeMsg}</div>
								<div>
									<input type="button" value="返回" name="change">
								</div>
							</div>
						</c:if>
						<header>
							<h2>
								<a href="#">NewBulletin</a>
							</h2>
						</header>
						<div>${ErrMsg.changeMsg}</div>

						<div id="accordion">

							<h3>新增/編輯</h3>
							<div>
								<form:form method='POST' modelAttribute="bulletinBean" enctype="multipart/form-data">
									<form:hidden path="no" value="${param.no}" />
									<label>title</label>
									<form:input path="title" type="text" placeholder="輸入標題,請勿超過50字" maxlength="50" value="${param.title}" />
									<div>
										<a style="color: red;">${ErrMsg.titleNull}${ErrMsg.titleOver}</a>
									</div>

									<div>
										<label>context</label>
										<form:textarea path="context" placeholder="輸入公告內容，字數請勿大於300字 " maxlength="300" value="${param.context}" />
										<div>
											<a style="color: red;">${ErrMsg.contextNull}${ErrMsg.contextOver}</a>
										</div>
									</div>

									<div>
										<label for="from">startDate</label>
										<form:input type="text" id="from" path="startDate" />
										<label for="to">endDate</label>
										<form:input type="text" id="to" path="endDate" />
										<div>
											<a style="color: red;">${ErrMsg.dateChoice}${ErrMsg.datePassOver}</a>
										</div>
									</div>
									<div>
										<a style="color: red;">${ErrMsg.radio}</a>
									</div>

									<div>
										<table>
											<tr>
												<td><form:radiobutton style="-webkit-appearance:radio" path="discount" label="單純公告，無任何優惠" value="0" /></td>
												<td><form:radiobutton style="-webkit-appearance:radio" path="discount" label="現金折扣" value="1" /><a style="color: red;">${ErrMsg.discountP}</a></td>
												<td><form:radiobutton style="-webkit-appearance:radio" path="discount" label="票券折扣" value="2" /><a style="color: red;">${ErrMsg.discountT}</a></td>
											</tr>
										</table>
									</div>

									<div class="form-row pr-3 pl-5">
										<div class="col-md-1 pr-1 discountP hid">
											<label for="validationTextarea">滿</label>
										</div>
										<div class="col-md-3 pr-1 discountP hid">
											<form:input style="border-radius: 5px" type="text" path="discountPriceBuy" placeholder="消費金額" maxlength="4" value="${param.discountPriceBuy}" />
										</div>
										<div class="col-md-1 pr-1 discountP hid">
											<label for="validationTextarea">送</label>
										</div>
										<div class="col-md-3 pr-1 discountP hid">
											<form:input style="border-radius: 5px" type="text" path="discountPriceFree" placeholder="折扣金額" maxlength="4" value="${param.discountPriceFree}" />
										</div>
									</div>

									<div class="form-row pr-3 pl-5">
										<div class=" col-md-1 pr-1 discountT hid">
											<label>買</label>
										</div>
										<div class=" col-md-3 pr-1 discountT hid">
											<form:select class="custom-select " path="discountTickBuy" value="${param.discountTickBuy}">
												<form:option value="0">購買票數</form:option>
												<c:forEach begin="1" end="10" var="inputTB">
													<form:option value="${inputTB}">${inputTB}</form:option>
												</c:forEach>
											</form:select>
										</div>
										<div class=" col-md-1 pr-1 discountT hid">
											<label>送</label>
										</div>
										<div class=" col-md-3 pr-1 discountT hid">
											<form:select class="custom-select " path="discountTickFree" value="${param.discountTickFree}">
												<form:option value="0">贈送票數</form:option>
												<c:forEach begin="1" end="5" var="inputTF">
													<form:option value="${inputTF}">${inputTF}</form:option>
												</c:forEach>
											</form:select>
										</div>
									</div>

									<div class="form-row pr-3 pl-5">
										<div class=" col-md pr-1 ">EmployeeId</div>
										<div class=" col-md pr-1 ">
											<form:input path="employeeId" type="text" value="2" />
										</div>
									</div>

									<div>
										<form:input id="file" style="border-radius: 5px" type="file" path="bulletinImage" />
										<label>文宣上傳</label>
									</div>

									<c:choose>
										<c:when test="${empty bulletinBean.no}">
											<div>
												<img id="showPhoto" />
											</div>
											<div>
												<input id="btnAdd" type='submit' class='btn btn-primary'>
											</div>
										</c:when>
										<c:when test="${!empty bulletinBean.no}">
											<div>
												<img id="showPhoto" src="<c:url value='/getBulletinPicture/${bulletinBean.no}' />" />
											</div>
											<div>
												<input id="btnEdit" type='submit' class='btn btn-primary'> <a href='<c:url value="/allBulletin"/>'><input id="btnReset" type="button"
													class='btn btn-primary' value="取消編輯"></a>
											</div>
										</c:when>
									</c:choose>
								</form:form>
							</div>
							<h3>編輯紀錄</h3>
							<div>
								<table>
									<thead>
										<tr>
											<th>#</th>
											<th>標題</th>
											<th colspan="2">優惠方案</th>
											<th>詳情</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var='sb' items='${sameBulletinBean}'>
											<tr>
												<c:if test="${sb.available}">
													<td>${sb.no}</td>
													<td>${sb.title}</td>
													<td><img width="20px" src="${pageContext.request.contextPath}${sb.imgUrlString}"></td>
													<td>${sb.pay}${sb.discountTickBuy}${sb.discountPriceBuy}${sb.free}${sb.discountTickFree}${sb.discountPriceFree}</td>
													<td><img name="add_host" id="unavai_cont_${sb.no}" width="20px"
														src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/context.png"></td>
												</c:if>
											</tr>
											<div class="unavai_cont_${sb.no} add-model hide">
												<div>${sb.context}
													<img id="showPhoto" src="<c:url value='/getBulletinPicture/${sb.no}' />" />
												</div>
												<div>
													<input type="button" value="返回" name="back" class="unavai_cont_${sb.no}">
												</div>
											</div>
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
	<jsp:include page="footer.jsp" />
	<!-- Scripts -->
	<!-- 	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" -->
	<!-- 		crossorigin="anonymous"></script> -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" -->
	<!-- 		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script> -->
	<!-- 	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" -->
	<!-- 		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script> -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		//    Datepicker
		$(function() {
			var dateFormat = "yy-mm-dd", from = $("#from").datepicker(
					{
						monthNamesShort : ["一", "二", "三", "四", "五", "六", "七",
								"八", "九", "十", "十一", "十二"],
						dayNamesMin : ["日", "一", "二", "三", "四", "五", "六"],
						defaultDate : "+1d",
						changeMonth : true,
						numberOfMonths : 1,
						dateFormat : "yy-mm-dd"
					}).on("change", function() {
				to.datepicker("option", "minDate", getDate(this));
				console.log(this)
			}), to = $("#to").datepicker(
					{
						monthNamesShort : ["一", "二", "三", "四", "五", "六", "七",
								"八", "九", "十", "十一", "十二"],
						dayNamesMin : ["日", "一", "二", "三", "四", "五", "六"],
						defaultDate : "+1M",
						changeMonth : true,
						numberOfMonths : 1,
						dateFormat : "yy-mm-dd"
					}).on("change", function() {
				from.datepicker("option", "maxDate", getDate(this));
			});

			function getDate(element) {
				var date;
				try {
					date = $.datepicker.parseDate(dateFormat, element.value);
				} catch (error) {
					date = null;
				}

				return date;
			}
		});
		//	    discount by jQuery

		$(document).ready(function() {
			$("input[type='radio']").click(function() {
				var i = $(this).attr("value");
				// 				alert(i);
				switch (i) {
					case "0" :
						var o = "discount";
						break;
					case "1" :
						var o = "discountP";
						break;
					case "2" :
						var o = "discountT";
						break;
				}
				// 				alert(o);
				var targete = $("." + o);
				// 				$(".hid").not(targete).css("visibility", "hidden");
				// 				$(targete).css("visibility", "visible");
				$(".hid").not(targete).hide();
				$(targete).show();
			});
		});

		//file image showPhoto
		$('#file').change(function() {
			var file = $(this)[0].files[0];
			var reader = new FileReader;
			reader.onload = function(e) {
				$('#showPhoto').attr('src', e.target.result);
			};
			reader.readAsDataURL(file);
		})
		//message box
		$(function() {
			$("[name|=change]").click(function() {
				var str = $(this).attr("name");
				var targete = $("." + str);
				$(targete).addClass('hide');
			});
		});
		$( function() {
		    $( "#accordion" ).accordion({
		      heightStyle: "content"
		    });
		  } );

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
	</script>
</body>

</html>