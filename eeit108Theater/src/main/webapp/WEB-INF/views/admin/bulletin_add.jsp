<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style type="text/css">
.hide {
	display: none;
}
</style>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">


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
	//一鍵輸入
	$('#oneSet1').click(function() {
		$('#title').val('2019/10/09 純公告測試，雙十連假特殊活動');
		$('#context').val('告急告急!!!\n雙十連假慶開幕，開幕優惠期間到716電影院看電影，兩人同行沒有優惠，五人同行還是沒有，不管來幾個都沒有!!!');
		$('#from').val('2019-10-10');
		$('#to').val('2019-11-11');
		$('[name=disount]').val('0');
		$('#discountTicketBuy').val('');
		$('#discountTicketFree').val('');
	});
	
	$('#oneSet2').click(function() {
		$('#title').val('2019/10/09 現金折扣公告測試，雙十連假優惠活動');
		$('#context').val('來了來了終於有優惠了!!!\n千呼喚換終於有折扣，消費滿兩千送兩百!!!\n兩千送兩百!!!');
		$('#from').val('2019-10-10');
		$('#to').val('2019-11-11');
		$('[name=disount]').val('1');
		document.getElementById('discount1').setAttribute("checked", "checked");
		var targete = $('.discountP');
		$(".hide").not(targete).hide();
		$(targete).show();
		$('#discountPriceBuy').val('2000');
		$('#discountPriceFree').val('200');
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

	//add reload radio_discount show box
	$(function() {
		var str = '${bulletinBean.discount}';
		// 		alert(str);
		switch (str) {
		case "1":
			// 			alert("1");
			var i = "discount1";
			var o = "discountP";
			var buy = '${bulletinBean.discountPriceBuy}';
			var free = '${bulletinBean.discountPriceFree}';
			$("#discountTicketBuy").val(buy);
			$("#discountTicketFree").val(free);
			break;

		case "2":
			// 			alert("2");
			var i = "discount2";
			var o = "discountT";
			var buy = '${bulletinBean.discountTicketBuy}';
			var free = '${bulletinBean.discountTicketFree}';
			$("#discountTicketBuy").val(buy);
			$("#discountTicketFree").val(free);
			break;

		default:
			// 			alert("0");
			var i = "discount0";
			break;
		}
		document.getElementById(i).setAttribute("checked", "checked");
		var targete = $("." + o);
		$(".hide").not(targete).hide();
		$(targete).show();
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
			<div class="accordion" id="accordionExample">

				<div class="card">
					<div class="card-header " id="headingOne">
						<h2 class="mb-0">
							<a class="btn btn-link" aria-expanded="true" aria-controls="collapseOne"> 新增公告</a>
						</h2>
					</div>

					<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
						<div class="card-body">
							<div class="row">
								<div class="col-md-7">

									<form method='POST' id="bulletinBean" action="<c:url value='/admin/bulletin_add/add'/>" enctype="multipart/form-data">
										<div class="form-row mb-5 mt-1">
											<div class="col-md-2">
												<label for="title">標題:</label>
											</div>
											<div class="col-md-10">
												<input class="form-control " id="title" name="title" type="text" placeholder="輸入標題,請勿超過50字" maxlength="50" value="${bulletinBean.title}"
													class="form-control">
											</div>
											<a style="color: red;">${ErrMsg.titleNull}${ErrMsg.titleOver}</a>
										</div>

										<div class="form-row  mb-5 ">
											<div class="col-md-2">
												<label class="context">公告內容:</label>
											</div>
											<div class="col-md-10">
												<textarea id="context" class="form-control " name="context" placeholder="輸入公告內容，字數請勿大於300字 " maxlength="300" class="form-control">${bulletinBean.context}</textarea>
											</div>
											<a style="color: red;">${ErrMsg.contextNull}${ErrMsg.contextOver}</a>
										</div>

										<div class="form-row mb-5 ">
											<div class="col-md-2">
												<label>公告有效時間</label>
											</div>
											<div class="col-md-1">
												<label for="from">開始</label>
											</div>
											<div class="col-md-4">
												<input type="text" id="from" name="from" class="form-control" id="startDate" value="${bulletinBean.startDate}" />
											</div>
											<div class="col-md-1">
												<label for="to">結束</label>
											</div>
											<div class="col-md-4">
												<input type="text" id="to" name="to" class="form-control" id="endDate" value="${bulletinBean.endDate}" />
											</div>
											<a style="color: red;">${ErrMsg.dateChoice}${ErrMsg.datePassOver}</a>
										</div>

										<div class="form-row  mb-5 mt-3 ">
											<div class="col-md-5  ">
												<div class="custom-control custom-radio">
													<input type="radio" class="custom-control-input" id="discount0" name="discount" checked="checked" value="0"> <label
														class="custom-control-label" for="discount0">單純公告，無任何優惠</label>
												</div>
											</div>
										</div>
										
										<div class="form-row mb-5">
											<div class="col-md-2  ">
												<div class="custom-control custom-radio">
													<input type="radio" class="custom-control-input" id="discount1" name="discount" value="1" /> <label class="custom-control-label" for="discount1">現金折扣</label>
													<a style="color: red;">${ErrMsg.discountP}</a>
												</div>
											</div>


											<div class="col-md-1  discountP hide">
												<label for="discountPriceBuy">滿</label>
											</div>

											<div class="col-md-4  discountP hide">
												<input min="1" max="9999" type="number" id="discountPriceBuy" name="discountPriceBuy" placeholder="消費金額" maxlength="4"
													value="${bulletinBean.discountPriceBuy}" class="form-control" />
											</div>

											<div class="col-md-1  discountP hide">
												<label for="discountPriceFree">送</label>
											</div>

											<div class="col-md-4  discountP hide">
												<input min="1" max="9999" type="number" id="discountPriceFree" name="discountPriceFree" placeholder="折扣金額" maxlength="4"
													value="${bulletinBean.discountPriceFree}" class="form-control" />
											</div>
										</div>

										<div class="form-row mb-5 ">
											<div class="col-md-2 ">
												<div class="custom-control custom-radio">
													<input type="radio" class="custom-control-input" id="discount2" name="discount" value="2" /> <label class="custom-control-label" for="discount2">票券折扣</label>
													<a style="color: red;">${ErrMsg.discountT}</a>
												</div>
											</div>

											<div class=" col-md-1  discountT hide">
												<label for="discountTicketBuy">買</label>
											</div>

											<div class=" col-md-4  discountT hide">
												<select class="custom-select " id="discountTicketBuy" name="discountTicketBuy">
													<option value="0">購買票數</option>
													<c:forEach begin="1" end="5" var="inputTB">
														<option value="${inputTB}">${inputTB}</option>
													</c:forEach>
												</select>
											</div>

											<div class=" col-md-1  discountT hide">
												<label for="discountTicketFree">送</label>
											</div>

											<div class=" col-md-4  discountT hide">
												<select class="custom-select " id="discountTicketFree" name="discountTicketFree">
													<option value="0">贈送票數</option>
													<c:forEach begin="1" end="4" var="inputTF">
														<option value="${inputTF}">${inputTF}</option>
													</c:forEach>
												</select>
											</div>
										</div>

										<div class="form-row mb-3 mt-3">
											<div class="col-md-2 ">
												<label for="bulletinImage">活動圖檔</label>
											</div>
											<div class="col-md-10 mb-3">
												<div class="custom-file">
													<input type="file" class="custom-file-input" id="bulletinImage" name="bulletinImage"> <label class="custom-file-label" for="bulletinImage">只支援jpg/png/jpeg。使用者不上傳時會有預設圖片</label>
													<a style="color: red;">${ErrMsg.photo}</a>
												</div>
											</div>
										</div>

										<!-- button -->

										<div class="form-row mb-3">
											<div class="col-md-2 "></div>
											<div class="col-md-10 ">

												<div style="text-align: center">
													<input id="oneSet1" type="button" value="純公告" class='btn btn-secondary'> <input id="oneSet2" type="button" value="優惠公告" class='btn btn-secondary'> <input id="btnAdd" type='submit' value="新增公告"
														class='btn btn-primary'>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="col-md-5">
									<img id="showPhoto"  width="500px" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card-footer small text-muted">Updated at ${updatedTime}</div>
	</div>
</div>
<script>
	if (${ErrMsg.changeMsg != null}) {
		$("a.hide").trigger("click")
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
			<div class="modal-body">${ErrMsg.changeMsg}</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">返回</button>
			</div>
		</div>
	</div>
</div>