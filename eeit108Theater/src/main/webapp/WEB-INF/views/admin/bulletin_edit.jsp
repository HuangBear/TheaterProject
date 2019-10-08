<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style type="text/css">
.hide {
	display: none;
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

.myMOUSE {
	cursor: pointer;
}
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<script>
	//    Datepicker
	$(function() {
		var dateFormat = "yy-mm-dd";
// 		from = $("#from").datepicker({
// 			monthNamesShort : [ "一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二" ],
// 			dayNamesMin : [ "日", "一", "二", "三", "四", "五", "六" ],
// 			defaultDate : "+1d",
// 			changeMonth : true,
// 			numberOfMonths : 1,
// 			dateFormat : "yy-mm-dd"
// 		}).on("change",
				
// 				function() {
// 			to.datepicker("option", "minDate", getDate(this));
// 			console.log(this)
// 		}), 
		$("#to").datepicker({
			monthNamesShort : [ "一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二" ],
			dayNamesMin : [ "日", "一", "二", "三", "四", "五", "六" ],
			defaultDate : "+1M",
			changeMonth : true,
			numberOfMonths : 1,
			dateFormat : "yy-mm-dd",
			minDate : "${bulletinBean.startDate}"
		});
		//$("#to").datepicker("option","minDate",${bulletinBean.startDate});
// 		alert("${bulletinBean.startDate}");

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

	//	img effect
	$(function() {
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

	//discount show box
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

	//edit loading radio_discount show box
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
		// 				$(".hide").not(targete).css("visibility", "hidden");
		// 				$(targete).css("visibility", "visible");
		$(".hide").not(targete).hide();
		$(targete).show();
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

	//form submit button
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

	//postTime length
	var $len = 11;
	$(".postTime").each(function() {
		if ($(this).text().length > $len) {
			var $text = $(this).text().substring(0, $len - 1);
			$(this).text($text);
		}
	});

	//title length
	var $len = 20;
	$(".title").each(function() {
		if ($(this).text().length > $len) {
			var $text = $(this).text().substring(0, $len - 1) + "...";
			$(this).text($text);
		}
	});
	

	if (${ErrMsg.changeMsg != null}){
		$("a.hide_but").trigger("click");
	}
	
	</script>



<!-- Breadcrumbs-->

<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="#">Home</a></li>
	<li class="breadcrumb-item active">bulletin_edit</li>
</ol>



<div class="card mb-3">
	<div class="card-header">
		<i class="fas fa-table"></i> 7-1 Cinema發布公告
	</div>

	<div class="card-body">

		<div class="table-responsive">
			<div class="accordion" id="accordionExample">





				<a class="hide_but" data-toggle="modal" data-target="#changeMsgCenter">sss</a>
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






				<div class="card">
					<div class="card-header " id="headingOne">
						<h2 class="mb-0">
							<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">編輯公告</button>
						</h2>
					</div>

					<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
						<div class="card-body">

							<div class="row">
								<div class="col-md-7">

									<form method='POST' id="bulletinBean" action="<c:url value='/admin/bulletin_edit/edit'/>" enctype="multipart/form-data">
										<div class="form-row mb-5 mt-1">
											<div class="col-md-2">
												<input type="hidden" name="no" value="${bulletinBean.no}">
												
												<label for="title">標題:</label> <br> <a style="color: red;">${ErrMsg.titleNull}${ErrMsg.titleOver}</a>
											</div>
											<div class="col-md-10">
										
												<input class="form-control " id="title" name="title" type="text" placeholder="輸入標題,請勿超過50字" maxlength="50" value="${bulletinBean.title}"
													class="form-control">
														</div>
										</div>

										<div class="form-row  mb-5 ">
											<div class="col-md-2">
												<label class="context">公告內容:</label> <br> <a style="color: red;">${ErrMsg.contextNull}${ErrMsg.contextOver}</a>
											</div>
											<div class="col-md-10">
												<textarea id="context" class="form-control " name="context" placeholder="輸入公告內容，字數請勿大於300字 " maxlength="300" class="form-control">${bulletinBean.context}</textarea>
																						</div>
										</div>

										<div class="form-row mb-5 ">
											<div class="col-md-2">
												<label>公告有效時間</label> <br> <a style="color: red;">${ErrMsg.dateChoice}${ErrMsg.datePassOver}</a>
											</div>
											<div class="col-md-1">
												<label for="from">開始</label>
											</div>
											<div class="col-md-4">
												<input type="text" id="from" name="from" class="form-control" id="startDate" value="${bulletinBean.startDate}" readonly>
												
											</div>
											<div class="col-md-1">
												<label for="to">結束</label>
											</div>
											<div class="col-md-4">
						
												<input type="text" id="to" name="to" class="form-control" id="endDate" value="${bulletinBean.endDate}" />

											</div>

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
													<br> <a style="color: red;">${ErrMsg.discountP}</a>
												</div>
											</div>


											<div class="col-md-1  discountP hide">
												<label for="discountPriceBuy">滿</label>
											</div>

											<div class="col-md-4  discountP hide">
													<input min="1" max="9999" maxlength="4" type="number" id="discountPriceBuy" name="discountPriceBuy" placeholder="消費金額"
													value="${bulletinBean.discountPriceBuy}" class="form-control" />
											
											</div>

											<div class="col-md-1  discountP hide">
												<label for="discountPriceFree">送</label>
											</div>

											<div class="col-md-4  discountP hide">
													<input min="1" max="9999" maxlength="4" type="number" id="discountPriceFree" name="discountPriceFree" placeholder="折扣金額"
													value="${bulletinBean.discountPriceFree}" class="form-control" />
												</div>
										</div>

										<div class="form-row mb-5 ">
											<div class="col-md-2 ">
												<div class="custom-control custom-radio">
													<input type="radio" class="custom-control-input" id="discount2" name="discount" value="2" /> <label class="custom-control-label" for="discount2">票券折扣</label>
													<br> <a style="color: red;">${ErrMsg.discountT}</a>
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

										<input id="employeeId" name="employeeId" type="hidden" value="${employeeBean1.no}" />

										<div class="form-row mb-3 mt-3">
											<div class="col-md-2 ">
												<label for="bulletinImage">活動圖檔</label>
											</div>
											<div class="col-md-10 mb-3">
												<div class="custom-file">
													<input type="file" class="custom-file-input" id="bulletinImage" name="bulletinImage"> <label class="custom-file-label" for="bulletinImage">只支援jpg/png/jpeg</label>
													<br> <a style="color: red;">${ErrMsg.photo}</a>
												</div>
											</div>
										</div>
										<div class="form-row mb-3">
											<div class="col-md-2 "></div>
											<div class="col-md-10 ">

												<div style="text-align: center">
													<input id="btnEdit" type="submit" class='btn btn-info btn-lg  ' value="編輯送出"> <input id="btnReset" type="button"
														class='btn btn-danger btn-lg' value="取消編輯">
												</div>
											</div>
										</div>



										<!-- button -->

									</form>
								</div>
								<div class="col-md-5">
									<img id="showPhoto" width="500px" src="<c:url value='/admin/getBulletinPicture/${bulletinBean.no}' />" />
								</div>
							</div>
						</div>
					</div>
					<!-- 				!!! -->
					<c:choose>
						<c:when test="${!empty sameBulletinBean[1]}">
							<div class="card">
								<div class="card-header" id="headingTwo">
									<h2 class="mb-0">
										<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false"
											aria-controls="collapseTwo">歷史紀錄</button>
									</h2>
								</div>


								<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
									<div class="card-body">
										<table class=' table table-hover' id='dataTable' >
											<thead>
												<tr>
													<th scope="col" width="5%">#</th>
													<th scope="col" width="15%">標題</th>
													<th scope="col" width="25%">內文</th>
													<th scope="col" width="10%">開始時間</th>
													<th scope="col" width="10%">結束時間</th>
													<th scope="col" width="10%">公告人</th>
													<th scope="col" width="20%" colspan="2">優惠方案</th>
													<th scope="col" width="5%">詳情</th>
													<th scope="col" width="5%"></th>
													<th scope="col" width="5%"></th>
												</tr>
											</thead>
											<tbody>

												<c:forEach var='sb' items='${sameBulletinBean}' begin="1" varStatus="i">
													<tr>
														<c:if test="${sb.available}">
															<td class="hide">${sb.no}</td>
															<th scope="row">${i.index}</th>
															<td class="title">${sb.title}</td>
															<td class="title">${sb.context}</td>
															<td>${sb.startDate}</td>
															<td>${sb.endDate}</td>
															<td>${sb.employee.no}</td>
															<td><img width="20px" src="${pageContext.request.contextPath}${sb.imgUrlString}"></td>
															<td>${sb.pay}${sb.discountTicketBuy}${sb.discountPriceBuy}${sb.free}${sb.discountTicketFree}${sb.discountPriceFree}</td>
															<td><img name="img_effect" data-toggle="modal" data-target="#div_unavai_cont_${sb.no}" width="30px"
																src="${pageContext.request.contextPath}/images/icons/backstage/bulletin/context.png"></td>
															<td></td>
															<td></td>
														</c:if>
													</tr>
													<div class="modal fade" id="div_unavai_cont_${sb.no}" tabindex="-1" role="dialog" aria-labelledby="div_unavai_cont_${sb.no}}Title"
														aria-hidden="true">
														<div class="modal-dialog modal-dialog-centered" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="div_unavai_cont_${sb.no}Title">公告修改</h5>
																	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<div>
																		<h4>${sb.title}</h4>
																	</div>
																	<div>
																		<h5>${sb.context}</h5>
																	</div>
																	<img id="showPhoto" width="250" src="<c:url value='/admin/getBulletinPicture/${sb.no}' />" />
																</div>

																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary" data-dismiss="modal">返回</button>
																</div>
															</div>
														</div>
													</div>

												</c:forEach>
											</tbody>
										</table>

										<!-- load 視窗 -->


									</div>
								</div>
							</div>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="card-footer small text-muted">Updated at ${updatedTime}</div>


	</div>
</div>