<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
	//	    discount by jQuery

	$(document).ready(function() {
		$("input[type='radio']").click(function() {
			var i = $(this).attr("value");
			// 				alert(i);
			switch (i) {
			case "0":
				var o = "discount";
				break;
			case "1":
				var o = "discountP";
				break;
			case "2":
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
	$(function() {
		$("#accordion").accordion({
			heightStyle : "content"
		});
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
			var str = $(this).attr("id");
			var targete = $("." + str);
			$(targete).addClass('hide');
		});
	});
</script>


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
				<div class="change shade">
					<div>${ErrMsg.changeMsg}</div>
					<div>
						<input type="button" value="返回" name="change" class="btn btn-info">
					</div>
				</div>
			</c:if>

			<div id="accordion">

				<h3>編輯公告</h3>

				<div>

					<form:form method='POST' commandName="myEntryForm" action="bulletin_all/add" modelAttribute="bulletinBean" enctype="multipart/form-data">
						<form:hidden path="no" value="${param.no}" />
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">標題:</label>
							<div class="col-sm-10">
								<form:input path="title" type="text" placeholder="輸入標題,請勿超過50字" maxlength="50" value="${param.title}" class="form-control" />
								<div>
									<a style="color: red;">${ErrMsg.titleNull}${ErrMsg.titleOver}</a>
								</div>
							</div>
						</div>

						<div class="form-group row">
							<label class="context" class="col-sm-2 col-form-label">公告內容:</label>
							<div class="col-sm-10">
								<form:textarea path="context" placeholder="輸入公告內容，字數請勿大於300字 " maxlength="300" value="${param.context}" class="form-control" />
								<div>
									<a style="color: red;">${ErrMsg.contextNull}${ErrMsg.contextOver}</a>
								</div>
							</div>
						</div>

						<div class="form-group row">
							<label for="from" class="col-sm-2 col-form-label ">startDate</label>
							<form:input type="text" id="from" path="startDate" class="col-sm-4 col-form-label " />
							<label for="to" class="col-sm-2 col-form-label ">endDate</label>
							<form:input type="text" id="to" path="endDate" class="col-sm-4 col-form-label " />
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
							<label>文宣上傳</label> <a style="color: red;">${ErrMsg.photo}</a>

						</div>

						<!-- button -->
					
						
								<div>
									<img id="showPhoto" src="<c:url value='/admin/getBulletinPicture/${bulletinBean.no}' />" />
								</div>
								<div>
									<input id="btnEdit" type="submit" class='btn btn-info' value="編輯送出"> <input id="btnReset" type="button" class='btn btn-danger' value="取消編輯">
								</div>
						
					</form:form>
					<script>
						//Spring Form 中的button
						$("#btnReset").click(function() {
							$.ajax({
								url : "<c:url value='/admin/updatePage?url=bulletin_all'/>",
								type : "GET",
								success : function(data) {
									$("#pageItems").html(data);
								},
								error : function() {
									console.log("?????????????????");
									alert("????????????????????????????????????");
								}
							});
						});
						
					</script>
				</div>
				<c:choose>
					<c:when test="${!empty sameBulletinBean[1]}">
						<h3>歷史紀錄</h3>
						<div>
							<table>
								<thead>
									<tr>
										<!-- 													<th>#</th> -->
										<th>標題</th>
										<th colspan="2">優惠方案</th>
										<th>詳情</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var='sb' items='${sameBulletinBean}' begin="1">
										<tr>
											<c:if test="${sb.available}">
												<%-- 															<td>${sb.no}</td> --%>
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



