<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>員工資料</title>
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/flashcanvas.js"></script>
<script src="../js/jSignature.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/iEdit.min.css">

<style type="text/css">
#DIV2{
margin-top:35px;
width:1400px;
padding:20px;

margin-right:10px;
float:right;
}
</style>
</head>
<body>
<jsp:include page="/fragment/index_include3.jsp" />
<div id="main">
		<div class="container" style="width: 600px;">
			<ol class="breadcrumb">
			
				<li class="breadcrumb-item active">員工編輯</li>
			</ol>
			<div style="text-align: center; color: red;">
				<h4>${error}</h4>
			</div>
			<form:form method="POST" modelAttribute="employeeBean">
				<div class="form-group">
					<label for="email">員工信箱</label>
					<form:input type="email" class="form-control" id="email"
 						name="email" value="${eEmail}" path="email" 
 						style="max-width:400px;" /> 
				</div>
				<div class="form-group">
					<label for="employeeId">員工身分證號碼</label>
					<form:input type="employeeId" class="form-control" id="employeeId"
 						name="employeeId" value="${eId}" path="employeeId" 
 						style="max-width:400px;" /> 
				</div>

				<div class="form-group">
					<label for="name">員工姓名</label>
					<form:input type="text" class="form-control" id="name"
 						name="name" value="${eName}" path="name" 
 						style="max-width:400px;" /> 
				</div>

				<div class="form-group"> 
					<label for="phoneNum">員工電話</label> 
 					<form:input type="text" class="form-control" id="phoneNum" 
						name="phoneNum" value="${ePhone}" placeholder="${ePhone}"  path="phoneNum" 
						style="max-width:400px;" /> 
 				</div> 

				<div class="form-group">
					<label for="password">員工密碼</label>
					<form:input type="password" class="form-control" id="password"
 						value="${ePwd}" path="password" style="max-width:400px;" /> 
				</div>

				<div class="form-group">
					<label for="gender">員工性別</label><br>
					 <label> <form:radiobutton name="gender"
 							value="1" path="gender" checked="true" /> 男 
					</label> 
					<label> <form:radiobutton name="gender" value="2"
 							path="gender" /> 女 
					</label>
				</div>

<!-- 				<div class="form-group"> -->
<!-- 					<label for="birthdayString">員工生日</label><br> -->
<%-- 					<form:input class="form-control" type="date" id="birthdayString" --%>
<%--  						name="birthdayString" path="birthdayString" />  --%>
<!-- 				</div> -->


				<button type="submit" class="btn btn-primary">送出</button>
				<button type="reset" class="btn btn-primary">重填</button>

			</form:form>
<!-- 			<button type="button" id="oneSet" class="btn btn-success">一鍵填入</button> -->
		</div>
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
	</div>


<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/js/iEdit.min.js"></script>

</body>
</html>