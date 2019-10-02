<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!-- Breadcrumbs-->

<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="#">Home</a></li>
	<li class="breadcrumb-item active">forumTable</li>
</ol>


<!-- DataTables Example -->
<div class="card mb-3">
	<div class="card-header">
		<i class="fas fa-table"></i> 討論版
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<div id="tabs-1">
				<table class="tbst">
					<tbody style="text-align: left;">
						<c:forEach var='Movie' items='${Movies}'>
							<button class="editBtn btn btn-info" id="${Movie.no}"
								style="font-size: 24px">${Movie.no}.${Movie.movieName}</button>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="card mb-3">
	<div class="card-header">
		<i class="fas fa-table"></i> 討論區清單
	</div>
	<div class="card-body">
		<div class="table-responsive">


			<c:if test='${not empty Articles}'>
				<c:forEach var='article' varStatus='vs' items='${Articles}'>
					<c:if test='${vs.first}'>
						<c:out
							value="<table class='table table-bordered' id='dataTable' width='100%' cellspacing='0'>"
							escapeXml='false' />
						<c:out
							value=" <thead><tr>
				<th>討論版編號</th>
				<th>討論版名稱</th>
				<th>Title</th>
				<th>發文者</th>
				<th>Tag</th>
				<th>發文時間</th>
				<th>like</th>
				<th>dislike</th>
				<th>封鎖狀態</th>
				<th>檢舉狀態</th>
				<th>封鎖</th>
				</tr> </thead>
				<tfoot><tr>
				<th>討論版編號</th>
				<th>討論版名稱</th>
				<th>Title</th>
				<th>發文者</th>
				<th>Tag</th>
				<th>發文時間</th>
				<th>like</th>
				<th>dislike</th>
				<th>封鎖狀態</th>
				<th>檢舉狀態</th>
				<th>封鎖</th>
				</tr> </tfoot><tbody>
				"
							escapeXml='false' />
					</c:if>

					<tr>
						<td>${article.movie.no}</td>
						<td>${article.movie.movieName}</td>
						<td>${article.title}</td>
						<td>${article.author.name}</td>
						<td>${article.tag}</td>
						<td>${article.postTime}</td>
						<td>${article.likeCount}</td>
						<td>${article.dislikeCount}</td>
						<td>
							<fieldset>
								<c:choose>
									<c:when test="${article.available==true}">

										<button class="btn btn-info" id="${article.no}"
											style="font-size: 24px">未封鎖</button>

									</c:when>
									<c:when test="${article.available==false}">

										<button class="btn btn-info" id="${article.no}"
											style="font-size: 24px">已封鎖</button>

									</c:when>
								</c:choose>
							</fieldset>
						</td>
						<td>
							<fieldset>
								<c:choose>
									<c:when test="${article.report==true}">

										<button class="reportBtn btn btn-info" id="${article.no}"
											style="font-size: 24px">有檢舉</button>

									</c:when>
									<c:when test="${article.report==false}">

										<button class="btn btn-info" id="${article.no}"
											style="font-size: 24px">無檢舉</button>

									</c:when>
								</c:choose>
							</fieldset>
						</td>
						<td>
							<fieldset>
								<c:choose>
									<c:when test="${article.available==true}">

										<button class="lockBtn btn btn-info" id="${article.no}"
											style="font-size: 24px">上鎖</button>

									</c:when>
									<c:when test="${article.available==false}">

										<button class="lockBtn btn btn-info" id="${article.no}"
											style="font-size: 24px">解鎖</button>

									</c:when>
								</c:choose>
							</fieldset>
						</td>


						<!-- 				<td><button class='btn btn-danger' -->
						<%--  				onclick='javascrtpt:window.location.href="EmpResign?pk=${emp.no}"'>離職</button></td>  --%>


					</tr>
					<c:if test='${vs.last }'>
						<c:out value="</tbody></table><hr>" escapeXml='false' />
					</c:if>
				</c:forEach>
			</c:if>

		</div>
	</div>
	<div class="card-footer small text-muted">Updated at 00:00 PM</div>
</div>

<script>
	$(".editBtn").click(function() {

		var no = $(this).attr("id");
		//var pquantity = $(this).val();
		$.ajax({
			url : "<c:url value='/admin/emp_Articles'/>",
			data : {
				no : no,
			//quantity : pquantity
			},
			type : "GET",
			success : function(data) {
				$("#pageItems").html(data);
			}
		});
	});

	$(".lockBtn").click(function() {

		var no = $(this).attr("id");
		//var pquantity = $(this).val();
		$.ajax({
			url : "<c:url value='/admin/LockArticle'/>",
			data : {
				no : no,
			//quantity : pquantity
			},
			type : "GET",
			success : function(data) {
				$("#pageItems").html(data);
			}
		});
	});

	$(".reportBtn").click(function() {

		var no = $(this).attr("id");
		//var pquantity = $(this).val();
		$.ajax({
			url : "<c:url value='/admin/ReportArticle'/>",
			data : {
				no : no,
			//quantity : pquantity
			},
			type : "GET",
			success : function(data) {
				$("#pageItems").html(data);
			}
		});
	});
</script>

