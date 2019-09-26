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
	
	//	discount by jQuery
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
	//message box
	$(function() {
		$("[name|=change]").click(function() {
			var str = $(this).attr("name");
			var targete = $("." + str);
			$(targete).addClass('hide');
		});
	});
	//accordion
	$(function() {
		$("#accordion").accordion({
			heightStyle : "content"
		});
	});

// 	$(function() {
// 		$("[name='add_host']").click(function() {
// 			var str = $(this).attr("id");
// 			var targete = $("." + str);
// 			$(targete).removeClass('hide');
// 		});
// 	});

	$(function() {
		$("[name|=back]").click(function() {
			var str = $(this).attr("id");
			var targete = $("." + str);
			$(targete).addClass('hide');
		});
	});

	$('#oneSet').click(function() {
		$('#title').val('測試測試');
		$('#context').val('測試測試測試測試測試測試測試');
		$('#from').val('2019-10-10');
		$('#to').val('2019-11-11');
		$('[name=disount]').val('2');
		$('#discountTickBuy').val('7');
		$('#discountTickFree').val('2');
		$('#employeeId').val('2');
	});

	$("#bulletinBean").submit(function(event) {
		console.log("to preventDefault");
		event.preventDefault();
		console.log("preventDefault success");
		var formdata = new FormData(this);
		$.ajax({
			url : "<c:url value='/admin/bulletin_add/add'/>",
			type : "POST",
			data : formdata,
			datatype : "json",
			contentType : false,
			processData : false,
			success : function(data) {
				$("#pageItems").html(data);
			},
			error : function() {
				$("#pageItems").html("ajax add bulletin gg");
			}
		});
	});
</script>


<!-- Breadcrumbs-->

<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="#">Home</a></li>
	<li class="breadcrumb-item active">bulletin_add</li>
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
				<h3>新增公告</h3>
				<div>
					<form method='POST' id="bulletinBean" action="<c:url value='/admin/bulletin_add/add'/>" enctype="multipart/form-data">
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">標題:</label>
							<div class="col-sm-10">

								<input id="title" name="title" type="text" placeholder="輸入標題,請勿超過50字" maxlength="50" value="${param.title}" class="form-control" />
								<div>
									<a style="color: red;">${ErrMsg.titleNull}${ErrMsg.titleOver}</a>
								</div>
							</div>
						</div>

						<div class="form-group row">
							<label class="context" class="col-sm-2 col-form-label">公告內容:</label>
							<div class="col-sm-10">
								<textarea id="context" name="context" placeholder="輸入公告內容，字數請勿大於300字 " maxlength="300" class="form-control">${param.context}</textarea>
								<div>
									<a style="color: red;">${ErrMsg.contextNull}${ErrMsg.contextOver}</a>
								</div>
							</div>
						</div>

						<div class="form-group row">
							<label for="from" class="col-sm-2 col-form-label ">startDate</label> <input type="text" id="from" name="from" id="startDate"
								class="col-sm-4 col-form-label " /> <label for="to" class="col-sm-2 col-form-label ">endDate</label> <input type="text" id="to" name="to" id="endDate"
								class="col-sm-4 col-form-label " />
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
									<td><input type="radio" id="discount0" name="discount" value="0" checked="checked"> 單純公告，無任何優惠</td>
									<td><input type="radio" id="discount1" name="discount" value="1"> 現金折扣<a style="color: red;">${ErrMsg.discountP}</a></td>
									<td><input type="radio" id="discount2" name="discount" value="2"> 票券折扣<a style="color: red;">${ErrMsg.discountT}</a></td>
								</tr>
							</table>
						</div>

						<div class="form-row pr-3 pl-5">
							<div class="col-md-1 pr-1 discountP hide">
								<label for="validationTextarea">滿</label>
							</div>
							<div class="col-md-3 pr-1 discountP hide">
								<input style="border-radius: 5px" type="number" id="discountPriceBuy" name="discountPriceBuy" placeholder="消費金額" maxlength="4"
									value="${param.discountPriceBuy}" />
							</div>
							<div class="col-md-1 pr-1 discountP hide">
								<label for="validationTextarea">送</label>
							</div>
							<div class="col-md-3 pr-1 discountP hide">
								<input style="border-radius: 5px" type="number" id="discountPriceFree" name="discountPriceFree" placeholder="折扣金額" maxlength="4"
									value="${param.discountPriceFree}" />
							</div>
						</div>

						<div class="form-row pr-3 pl-5">
							<div class=" col-md-1 pr-1 discountT hide">
								<label>買</label>
							</div>
							<div class=" col-md-3 pr-1 discountT hide">
								<select class="custom-select " id="discountTickBuy" name="discountTickBuy" value="${param.discountTickBuy}">
									<option value="0">購買票數</option>
									<c:forEach begin="1" end="10" var="inputTB">
										<option value="${inputTB}">${inputTB}</option>
									</c:forEach>
								</select>
							</div>
							<div class=" col-md-1 pr-1 discountT hide">
								<label>送</label>
							</div>
							<div class=" col-md-3 pr-1 discountT hide">
								<select class="custom-select " id="discountTickFree" name="discountTickFree" value="${param.discountTickFree}">
									<option value="0">贈送票數</option>
									<c:forEach begin="1" end="5" var="inputTF">
										<option value="${inputTF}">${inputTF}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-row pr-3 pl-5">
							<div class=" col-md pr-1 ">EmployeeId</div>
							<div class=" col-md pr-1 ">
								<input id="employeeId" name="employeeId" type="text" value="2" />
							</div>
						</div>

						<div>
							<input id="bulletinImage" style="border-radius: 5px" type="file" name="bulletinImage" /> <label>文宣上傳</label> <a style="color: red;">${ErrMsg.photo}</a>

						</div>

						<!-- button -->

						<div>
							<img id="showPhoto" />
						</div>
						<div>
							<input id="oneSet" type="button" value="一鍵輸入" class='btn btn-primary'>
						</div>
						<div>
							<input id="btnAdd" type='submit' class='btn btn-primary'>
						</div>


					</form>

				</div>

			</div>

		</div>
	</div>
	<div class="card-footer small text-muted">Updated at 00:00 PM</div>

</div>



