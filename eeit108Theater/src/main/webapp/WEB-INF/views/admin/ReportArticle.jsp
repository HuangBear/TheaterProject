<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!-- Breadcrumbs-->

<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="#">Home</a></li>
	<li class="breadcrumb-item active">ReportCheck</li>
</ol>


<!-- DataTables Example -->

<div class="card mb-3">

	<div class="card-body">
		<div class="table-responsive">
			<div class="wrapper style1">
				<div class="container">
					<article id="main" class="special">
						<div class="row gtr-200"
							style="width: 1500px; height: 500px; border: 1px solid gray; border-radius: 25px;">
							<h3 style="font-size: 36px">${Article.title}</h3>
							<div style="width: 800px; height: 50px; font-size: 20px;">
								<p
									style="border: 1px solid gray; border-radius: 25px; text-align: center;">No.:${Article.no}
									發文者: ${Article.author.name} 分類: ${Article.tag} 發文時間:
									${Article.postTime}</p>
							</div>

							<div style="width: 900px; height: 450px; font-size: 30px">
								<p>${Article.content}</p>
							</div>
						</div>
					</article>
				</div>
				<a style="font-size: 34px">檢舉原因</a>
			</div>

			<div class="row">
			<br>
	
				<c:forEach var='report' items='${Article.reports}'>
					<div
						style="width: 1080px; height: 50px; font-size: 26px; margin: auto; padding: 15px 20px;">
						<p>${report.author.name}檢舉時間:${report.postTime}</p>
					</div>
					<div
						style="width: 1080px; height: 150px; font-size: 26px; border: 1px solid gray; border-radius: 25px; margin: auto; padding: 15px 20px;">
						<p>${report.content}</p>
					</div>
				</c:forEach>
			</div>
			<button class="backBtn btn btn-info" id="${article.no}"
											style="font-size: 24px">回列表</button>
		</div>
	</div>
	<div class="card-footer small text-muted">Updated at 00:00 PM</div>
</div>

<script>
	$(".backBtn").click(function() {

		var no = $(this).attr("id");
		//var pquantity = $(this).val();
		$.ajax({
			url : "<c:url value='/admin/emp_Forum'/>",
			type : "GET",
			success : function(data) {
				$("#pageItems").html(data);
			}
		});
	});
</script>

