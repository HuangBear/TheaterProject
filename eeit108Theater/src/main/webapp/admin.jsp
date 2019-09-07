<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<style>
#main {
	width: 1200px;
	margin: auto;
	position: relative;
	top: 120px;
}
</style>


<script src="<c:url value='/resources/js/admin/backstage.js'/> "></script>

<title>後台管理系統</title>
</head>
<body style="background-color:#f5f5f5;">
	<jsp:include page="${request.contextPath}/navbar" />
	<!-- 請把所有內容寫在此div內 -->
	<div id="main" class="container">
	<h1 class="mt-4 mb-3 font-weight-bold">7-1後台管理系統
        <small>Backstage</small>
      </h1> 
      <div class="row">
        <div class="col-md-11">
        </div>

      </div>
      <ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">首頁</a></li>
        <li class="breadcrumb-item active">7-1後台管理系統</li>
      </ol>
      <!-- 分割線 -->
      
      <div class="row">
        <div class="col-lg-2 mb-4">
          <div class="list-group"> 
            <a class="list-group-item pointer text-primary memberManage">員工管理</a>
            <a class="list-group-item pointer text-primary groupsManage">電影管理</a>
            <a class="list-group-item pointer text-primary eventManage">公告管理</a>
            <a class="list-group-item pointer text-primary reportManage">檢舉管理</a>
            <a class="list-group-item pointer text-primary websiteReport">報表</a>
     
    
          </div>
        </div>
        <div class="col-lg-10 mb-4" id="content">
          <h2>後台首頁</h2>
          <p>請從左側列表中選擇功能</p>
        </div>
      </div>
      
      <!--  -->

	</div>
	<!-- 請把所有內容寫在此div內 -->
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/offline-exporting.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highcharts/7.0.3/modules/cylinder.js"></script>
</body>
</html>