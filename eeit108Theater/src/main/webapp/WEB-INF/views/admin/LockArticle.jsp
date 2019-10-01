<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!-- Breadcrumbs-->

<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="#">Home</a></li>
	<li class="breadcrumb-item active">LockCheck</li>
</ol>


<!-- DataTables Example -->

<div class="card mb-3">
	
	<div class="card-body">
		<div class="table-responsive">
			<form:form method='POST' modelAttribute="Article"
				class='form-horizontal' enctype="multipart/form-data">
				<fieldset>
					<c:choose>
						<c:when test="${Article.available==true}">

							<form:input id="noString" readonly="true" path="noString"
								value='${Article.noString=Article.no}' type='hidden'
								class='form:input-large' />

							<div class="form-group">
								<button class="btn btn-info" type="submit" name="lockbutton" value="lock" style="font-size: 30px">確認上鎖</button>
							</div>
							<div class="form-group">
								<button class="cancelBtn btn btn-info"  id="${Article.no}" style="font-size: 30px">取消</button>
							</div>
						</c:when>
						<c:when test="${Article.available==false}">

							<form:input id="noString" readonly="true" path="noString"
								value='${Article.noString=Article.no}' type='hidden'
								class='form:input-large' />

							<div class="form-group">
								<button class="btn btn-info" type="submit" name="lockbutton" value="lock" style="font-size: 30px">確認解鎖</button>
							</div>
							<div class="form-group">
								<button class="cancelBtn btn btn-info"  id="${Article.no}" style="font-size: 30px">取消</button>
							</div>
						</c:when>
					</c:choose>
				</fieldset>
			</form:form>
		</div>
	</div>
	<div class="card-footer small text-muted">Updated at 00:00 PM</div>
</div>

<script>
	$(".cancelBtn").click(function() {

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

