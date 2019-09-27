<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style type="text/css">
.hide {
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


<!-- <script src="js/admin/demo/datatables-demo.js"></script> -->
<!-- <script src="js/admin/demo/chart-area-demo.js"></script> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">


<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" -->
<!-- 	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> -->
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" -->
<!-- 	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

<script>
	//    Datepicker
	$(function() {
		var dateFormat = "yy-mm-dd", from = $("#from").datepicker({
			monthNamesShort : [ "一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二" ],
			dayNamesMin : [ "日", "一", "二", "三", "四", "五", "六" ],
			defaultDate : "+1d",
			changeMonth : true,
			numberOfMonths : 1,
			dateFormat : "yy-mm-dd"
		}).on("change", function() {
			to.datepicker("option", "minDate", getDate(this));
			console.log(this)
		}), to = $("#to").datepicker({
			monthNamesShort : [ "一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二" ],
			dayNamesMin : [ "日", "一", "二", "三", "四", "五", "六" ],
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

	//	    discount by jQuery
	$(document).ready(function() {
		$("input[type='radio']").click(function() {
			var i = $(this).attr("value");
			// alert(i);
			switch (i) {
			case "1":
				var o = "discountP";
				break;
			case "2":
				var o = "discountT";
				break;
			default:
				break;
			}
			// 				alert(o);
			var targete = $("." + o);
			// 				$(".hide").not(targete).css("visibility", "hidden");
			// 				$(targete).css("visibility", "visible");
			$(".hide").not(targete).hide();
			$(targete).show();
		});
	});

	//file image showPhoto
	$('#bulletinImage').change(function() {
		var file = $(this)[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#showPhoto').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	})

	//accordion
	$(function() {
		$("#accordion").accordion({
			heightStyle : "content"
		});
	});
	//accordion
	$(function() {
		$("[name='add_host']").click(function() {
			var str = $(this).attr("id");
			var targete = $("." + str);
			$(targete).removeClass('hide');
		});
	});

	//edit loading discount show box
	$(function() {
		var str = '${bulletinBean.discount}';
		// 		alert(str);
		switch (str) {
		case "1":
			// 			alert("1");
			var i = "discount1";
			var o = "discountP";
			break;

		case "2":
			// 			alert("2");
			var i = "discount2";
			var o = "discountT";
			break;

		default:
			// 			alert("0");
			var i = "discount0";
			break;
		}
		document.getElementById(i).setAttribute("checked", "checked");
		if (str != 0) {
			var targete = $("." + o);
			// 				$(".hide").not(targete).css("visibility", "hidden");
			// 				$(targete).css("visibility", "visible");
			$(".hide").not(targete).hide();
			$(targete).show();
		} else {

		}

	});

	//form back button
	$(function() {
		$("#btnReset").click(function() {
			$.ajax({
				url : "<c:url value='/admin/updatePage?url=bulletin_all'/>",
				type : "GET",
				success : function(data) {
					$("#pageItems").html(data);
				},
			});
		});
	});

	$("#bulletinBean").submit(function(event) {
		console.log("to preventDefault");
		event.preventDefault();
		console.log("preventDefault success");
		var formdata = new FormData(this);
		$.ajax({
			url : "<c:url value='/admin/bulletin_edit/edit'/>",
			type : "POST",
			data : formdata,
			datatype : "json",
			contentType : false,
			processData : false,
			success : function(data) {
				$("#pageItems").html(data);
			},
			error : function() {
				$("#pageItems").html("ajax edit bulletin gg");
			}
		});
	});

	$(function() {
		$("[name|=back]").click(function() {
			var str = $(this).attr("id");
			var targete = $("." + str);
			$(targete).addClass('hide');
		});
	});
</script>
<!-- <script src="/js/script.js"></script> -->


<!-- Breadcrumbs-->

<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="#">Home</a></li>
	<li class="breadcrumb-item active">bulletin_edit</li>
</ol>


<!-- DataTables Example -->
<div class="card mb-3">
	<div class="card-header">
		<i class="fas fa-table"></i> 7-1 Cinema發布公告
	</div>

	<div class="card-body">
		<div class="table-responsive">
			<!-- load視窗 -->
			<c:if test="${ErrMsg.changeMsg!=null}">
				<div class="change add-model">
					<div>${ErrMsg.changeMsg}</div>
					<div>
						<input id="change" type="button" value="返回" name="back" class="btn btn-info">
					</div>
				</div>
			</c:if>


			<div id="accordion">
				<h3>編輯公告</h3>
				<div>
					<form method='POST' id="bulletinBean" action="<c:url value='/admin/bulletin_edit/edit'/>" enctype="multipart/form-data">
						<div class="form-row mb-3 mt-1">
							<div class="col-md-2">
								<c:choose>
									<c:when test="${!empty bulletinBean.no}">
										<input type="hidden" name="no" value="${bulletinBean.no}">
									</c:when>
									<c:when test="${!empty param.no}">
										<input type="hidden" name="no" value="${param.no}">
									</c:when>
								</c:choose>
								<label for="title">標題:</label>
							</div>
							<div class="col-md-6">
								<c:choose>
									<c:when test="${!empty bulletinBean.title}">
										<input class="form-control " id="title" name="title" type="text" placeholder="輸入標題,請勿超過50字" maxlength="50" value="${bulletinBean.title}"
											class="form-control">
									</c:when>
									<c:when test="${!empty param.title}">
										<input class="form-control " id="title" name="title" type="text" placeholder="輸入標題,請勿超過50字" maxlength="50" value="${param.title}" class="form-control">
									</c:when>
								</c:choose>
							</div>
							<a style="color: red;">${ErrMsg.titleNull}${ErrMsg.titleOver}</a>
						</div>

						<div class="form-row mb-3">
							<div class="col-md-2">
								<label class="context">公告內容:</label>
							</div>
							<div class="col-md-6">
								<c:choose>
									<c:when test="${!empty bulletinBean.context}">
										<textarea id="context" class="form-control " name="context" placeholder="輸入公告內容，字數請勿大於300字 " maxlength="300" class="form-control">${bulletinBean.context}</textarea>
									</c:when>
									<c:when test="${!empty param.context}">
										<textarea id="context" class="form-control " name="context" placeholder="輸入公告內容，字數請勿大於300字 " maxlength="300" class="form-control">${param.context}</textarea>
									</c:when>
								</c:choose>


							</div>
							<a style="color: red;">${ErrMsg.contextNull}${ErrMsg.contextOver}</a>
						</div>

						<div class="form-row mb-3">
							<div class="col-md-2">
								<label>公告有效時間</label>
							</div>
							<div class="col-md-1">
								<label for="from">開始</label>
							</div>
							<div class="col-md-2">
								<c:choose>
									<c:when test="${!empty bulletinBean.startDate}">
										<input type="text" id="from" name="from" class="form-control" id="startDate" value="${bulletinBean.startDate}" />
									</c:when>
									<c:when test="${!empty param.startDate}">
										<input type="text" id="from" name="from" class="form-control" id="startDate" value="${param.startDate}" />
									</c:when>
								</c:choose>
							</div>
							<div class="col-md-1">
								<label for="to">結束</label>
							</div>
							<div class="col-md-2">
								<c:choose>
									<c:when test="${!empty bulletinBean.endDate}">
										<input type="text" id="to" name="to" class="form-control" id="endDate" value="${bulletinBean.endDate}" />
									</c:when>
									<c:when test="${!empty param.endDate}">
										<input type="text" id="to" name="to" class="form-control" id="endDate" value="${param.endDate}" />
									</c:when>
								</c:choose>
							</div>
							<a style="color: red;">${ErrMsg.dateChoice}${ErrMsg.datePassOver}</a>

						</div>


						<div class="form-row">
							<div class="col-md-2 mb-1 mt-1">
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" id="discount0" name="discount" checked="checked" value="0"> <label
										class="custom-control-label" for="discount0">單純公告，無任何優惠</label>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-2 mb-1 mt-1">
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" id="discount1" name="discount" value="1" /> <label class="custom-control-label" for="discount1">現金折扣</label>
									<a style="color: red;">${ErrMsg.discountP}</a>
								</div>
							</div>


							<div class="col-md-1  discountP hide">
								<label for="discountPriceBuy">滿</label>
							</div>

							<div class="col-md-2  discountP hide">
								<c:choose>
									<c:when test="${!empty bulletinBean.discountPriceBuy}">
										<input min="1" max="9999" type="number" id="discountPriceBuy" name="discountPriceBuy" placeholder="消費金額" value="${bulletinBean.discountPriceBuy}"
											class="form-control" />
									</c:when>
									<c:when test="${!empty param.discountPriceBuy}">
										<input min="1" max="9999" type="number" id="discountPriceBuy" name="discountPriceBuy" placeholder="消費金額" value="${param.discountPriceBuy}"
											class="form-control" />
									</c:when>
								</c:choose>
							</div>

							<div class="col-md-1  discountP hide">
								<label for="discountPriceFree">送</label>
							</div>

							<div class="col-md-2  discountP hide">
								<c:choose>
									<c:when test="${!empty bulletinBean.discountPriceFree}">
										<input min="1" max="9999" type="number" id="discountPriceFree" name="discountPriceFree" placeholder="折扣金額" value="${bulletinBean.discountPriceFree}"
											class="form-control" />
									</c:when>
									<c:when test="${!empty param.discountPriceFree}">
										<input min="1" max="9999" type="number" id="discountPriceFree" name="discountPriceFree" placeholder="折扣金額" value="${param.discountPriceFree}"
											class="form-control" />
									</c:when>
								</c:choose>
							</div>
						</div>

						<div class="form-row mb-3 mt-1">
							<div class="col-md-2 ">
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" id="discount2" name="discount" value="2" /> <label class="custom-control-label" for="discount2">票券折扣</label>
									<a style="color: red;">${ErrMsg.discountT}</a>
								</div>
							</div>

							<div class=" col-md-1  discountT hide">
								<label for="discountTickBuy">買</label>
							</div>

							<div class=" col-md-2  discountT hide">
								<c:choose>
									<c:when test="${!empty bulletinBean.discountTickBuy}">
										<select class="custom-select " id="discountTickBuy" name="discountTickBuy" value="${bulletinBean.discountTickBuy}">
									</c:when>
									<c:when test="${!empty param.discountTickBuy}">
										<select class="custom-select " id="discountTickBuy" name="discountTickBuy" value="${param.discountTickBuy}">
									</c:when>
								</c:choose>
								<option value="0">購買票數</option>
								<c:forEach begin="1" end="10" var="inputTB">
									<option value="${inputTB}">${inputTB}</option>
								</c:forEach>
								</select>
							</div>

							<div class=" col-md-1  discountT hide">
								<label for="discountTickFree">送</label>
							</div>

							<div class=" col-md-2  discountT hide">
								<c:choose>
									<c:when test="${!empty bulletinBean.discountTickFree}">
										<select class="custom-select " id="discountTickFree" name="discountTickFree" value="${bulletinBean.discountTickFree}">
									</c:when>
									<c:when test="${!empty param.discountTickFree}">
										<select class="custom-select " id="discountTickFree" name="discountTickFree" value="${param.discountTickFree}">
									</c:when>
								</c:choose>
								<option value="0">贈送票數</option>
								<c:forEach begin="1" end="5" var="inputTF">
									<option value="${inputTF}">${inputTF}</option>
								</c:forEach>
								</select>

							</div>
						</div>

						<input id="employeeId" name="employeeId" type="hidden" value="${employeeBean1.no}" />

						<div class="form-row">
							<div class="col-md-2 ">
								<label for="bulletinImage">活動圖檔</label>
							</div>
							<div class="col-md-6 mb-3">
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="bulletinImage" name="bulletinImage"> <label class="custom-file-label" for="bulletinImage">只支援jpg/png/jpeg</label>
									<a style="color: red;">${ErrMsg.photo}</a>
								</div>
							</div>
						</div>



						<!-- button -->
						<div>
							<img id="showPhoto" src="<c:url value='/admin/getBulletinPicture/${bulletinBean.no}' />" />
						</div>
						<div>
							<input id="btnEdit" type="submit" class='btn btn-info' value="編輯送出"> <input id="btnReset" type="button" class='btn btn-danger' value="取消編輯">
						</div>
					</form>

				</div>
				<c:choose>
					<c:when test="${!empty sameBulletinBean[1]}">
						<h3>歷史紀錄</h3>
						<div>
							<table class=' table table-hover' id='dataTable' width='70%' cellspacing='0'>
								<thead>
									<tr>
										<th scope="col" class="col-1">#</th>
										<th scope="col" class="col-5">標題</th>
										<th scope="col" class="col-3" colspan="2">優惠方案</th>
										<th scope="col" class="col-3">詳情</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var='sb' items='${sameBulletinBean}' begin="1" varStatus="i">
										<tr>
											<c:if test="${sb.available}">
												<td class="hide">${sb.no}</td>
												<td>${i.index}</td>
												<td>${sb.title}</td>
												<td><img width="20px" src="${pageContext.request.contextPath}${sb.imgUrlString}"></td>
												<td>${sb.pay}${sb.discountTickBuy}${sb.discountPriceBuy}${sb.free}${sb.discountTickFree}${sb.discountPriceFree}</td>
												<td><img name="add_host" id="unavai_cont_${sb.no}" width="20px"
													src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/context.png"></td>
											</c:if>
										</tr>
										<div class="unavai_cont_${sb.no} add-model hide">
											<div>${sb.context}
												<img id="showPhoto" src="<c:url value='/admin/getBulletinPicture/${sb.no}' />" />
											</div>
											<div>
												<input id="unavai_cont_${sb.no}" type="button" value="返回" name="back" class=" btn btn-danger">
											</div>
										</div>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:when>
				</c:choose>

			</div>

		</div>
	</div>
	<div class="card-footer small text-muted">Updated at 00:00 PM</div>

</div>
