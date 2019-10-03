<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<!-- Breadcrumbs-->

<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="empIndexA">Home</a></li>
	<li class="breadcrumb-item active">會員清單</li>
</ol>


<!-- DataTables Example -->
<div class="card mb-3">
	<div class="card-header">
		<i class="fas fa-table"></i> 7-1 Cinema會員清單
	</div>
	<div class="card-body">
		<div class="table-responsive">

			<c:if test='${empty members}'>

			</c:if>
			<c:if test='${not empty members}'>
				<c:forEach var='mem' varStatus='vs' items='${members}'>
					<c:if test='${vs.first }'>

						<table class='table table-bordered' id='dataTable' width='100%' cellspacing='0'>
							
							<thead>
								<tr>
									<th width='5%'>會員編號</th>
									<th width='10%'>姓名</th>
									<th width='10%'>會員ID</th>
									<th width='15%'>會員email</th>
									<th width='8%'>會員電話</th>
									<th width='5%'>被BAN文章數</th>
									<th width='5%'>狀態</th>
									<th width='5%'>發言狀態</th>
								    <sec:authorize access="hasAuthority('2') or hasAuthority('3')">	
									<th width='8%'>管理</th>
									
								    </sec:authorize>	
								</tr>
							</thead>

							<tfoot>
								<tr>
									<th>會員編號</th>
									<th>姓名</th>
									<th>會員ID</th>
									<th>會員email</th>
									<th>會員電話</th>
									<th>被BAN文章數</th>
									<th>狀態</th>
									<th>發言狀態</th>
									<sec:authorize access="hasAuthority('2') or hasAuthority('3')">	
									<th>管理</th>
									
									</sec:authorize>	
								</tr>
							</tfoot>

							<tbody>

					</c:if>

								<tr>
									<td>${mem.no}</td>
									<td>${mem.name}</td>
									<td>${mem.memberId}</td>
									<td>${mem.email}</td>
									<td>${mem.phoneNum}</td>
									<td>${mem.banCounter}</td>

									<c:choose>
										<c:when test="${mem.available == true}">
											<td>一般會員</td> 
									</c:when>

										<c:otherwise>
											<td>停權會員</td>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${mem.commentPermission == true}">
											<td>正常</td>
										</c:when>
										<c:when test="${mem.commentPermission == false}">
											<td>禁言中</td>
										</c:when>

									</c:choose>
									<sec:authorize access="hasAuthority('2') or hasAuthority('3')">	
									<td>
										<button class="itemTag2 btn btn-info" id="${mem.no}">
											管理會員</button>
										
									</td>

<!-- 									<td><button class='btn btn-danger' -->
<%-- 											onclick='javascrtpt:window.location.href="BanMember?pk=${mem.no}"'>禁言</button> --%>
<!-- 									</td> -->
									</sec:authorize>

								</tr>
								<c:if test='${vs.last }'>
							</tbody>
						</table>
						<hr>
					</c:if>
				</c:forEach>
			</c:if>

		</div>
	</div>
	<div class="card-footer small text-muted">Updated at ${now}</div>
</div>

<script>
	$(".itemTag2").click(function() {

		var pk = $(this).attr("id");
		//var pquantity = $(this).val();
		$.ajax({
			url : "<c:url value='/admin/updateMem'/>",
			data : {
				pk : pk,
			//quantity : pquantity
			},
			type : "GET",
			success : function(data) {
				$("#pageItems").html(data);
			}
		});
	});
</script>

