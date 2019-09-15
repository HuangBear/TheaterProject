<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增員工資料</title>
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/flashcanvas.js"></script>
<script src="../js/jSignature.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/iEdit.min.css">

<style type="text/css">
#DIV2 {
	margin-top: 35px;
	width: 1400px;
	padding: 20px;
	margin-right: 10px;
	float: right;
}
</style>
</head>
<body>
	<jsp:include page="/fragment/index_include3.jsp" />
	<div id="main">


		<div class="container" style="width: 600px;">



			<ol class="breadcrumb">

				<li class="breadcrumb-item active">新增員工</li>
			</ol>

			<!-- Contact Form -->
			<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
			<div style="text-align: center; color: red;">
				<h4>${error}</h4>
			</div>
			<form:form method="POST" modelAttribute="employeeBean">
				<div class="form-group">
					<label for="email">員工信箱</label>
					<form:input type="email" class="form-control" id="email"
						name="email" placeholder="Email" path="email"
						style="max-width:400px;" />
				</div>
				<div class="form-group">
					<label for="employeeId">員工身分證號碼</label>
					<form:input type="employeeId" class="form-control" id="employeeId"
						name="employeeId" placeholder="EmployeeId" path="employeeId"
						style="max-width:400px;" />
				</div>

				<div class="form-group">
					<label for="name">員工姓名</label>
					<form:input type="text" class="form-control" id="name" name="name"
						placeholder="Name" path="name" style="max-width:400px;" />
				</div>

				<div class="form-group">
					<label for="phoneNum">員工電話</label>
					<form:input type="text" class="form-control" id="phoneNum"
						name="phoneNum" placeholder="Phone" path="phoneNum"
						style="max-width:400px;" />
				</div>

				<div class="form-group">
					<label for="password">員工密碼</label>
					<form:input type="password" class="form-control" id="password"
						placeholder="Password" path="password" style="max-width:400px;" />
				</div>

				<div class="form-group">
					<label for="gender">員工性別</label><br> <label> <form:radiobutton
							name="gender" value="1" path="gender" checked="true" /> 男
					</label> <label> <form:radiobutton name="gender" value="2"
							path="gender" /> 女
					</label>
				</div>

				<div class="form-group">
					<label for="birthdayString">員工生日</label><br>
					<form:input class="form-control" type="date" id="birthdayString"
						name="birthdayString" path="birthdayString" />
				</div>
				<div class="form-group">
					<label for="salary">薪水</label>
					<form:input type="salary" class="form-control" id="salary"
						value="0" name="salary" path="salary" style="max-width:400px;" />
				</div>


				<!--   照片上傳 -->
				<!--   <div class="form-group"> -->
				<!--     <label for="memberImage">照片上傳</label> -->
				<%--     <form:input type='file' path="memberImage" id="memberImage" class='form:input-large'/> --%>
				<!--   </div> -->

				<%-- 				<form:input type="hidden" value="0" name="logins" id="logins" --%>
				<%-- 					path="logins" /> --%>
				<%-- 				<form:input type="hidden" value="false" name="certificationStatus" --%>
				<%-- 					id="certificationStatus" path="certificationStatus" /> --%>
				<%-- 					<form:input type="hidden" value="" nama="certificationHash" id="certificationHash" path="certificationHash"/> --%>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<button type="submit" class="btn btn-primary">送出</button>
				<button type="reset" class="btn btn-primary">重填</button>
				<hr>
			</form:form>
			<button type="button" id="oneSet" class="btn btn-success">一鍵填入</button>
		</div>

	</div>


	<footer class="w3-bottom w3-black container-fluid text-center">
		<div>
			<ul class="nav nav-pills w3-centered "
				style="display: flex; font-size: 13px; justify-content: center; position: static">
				<li role="presentation"><a
					href="<%=request.getContextPath()%>/index2.jsp">關於我們</a></li>
				<li role="presentation"><a
					href="<%=request.getContextPath()%>/index2.jsp">免責聲明</a></li>
				<li role="presentation"><a
					href="<%=request.getContextPath()%>/index2.jsp">服務條款</a></li>
				<li role="presentation"><a
					href="<%=request.getContextPath()%>/index2.jsp">隱私權聲明</a></li>
			</ul>
		</div>
		<span class="text-center"><p style="font-size: 10px">7-1
				MOVIE 後台管理系統</p></span>

	</footer>
	<script>
		$('#oneSet').click(function() {

			$('#email').val('Tom@gmail.com');
			$('#employeeId').val('A123009876');
			$('#name').val('湯姆貓');
			$('#phoneNum').val('66316666');
			$('#password').val('Do!ng123');
			$('#gender').val('1');
			$('#birthdayString').val('1990-01-01');

		})
	</script>
	<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/iEdit.min.js"></script>

</body>
</html>