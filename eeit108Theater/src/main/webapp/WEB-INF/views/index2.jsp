<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7-1 MOVIE</title>
<jsp:include page="/fragment/index_include3.jsp" />
<script src="<%=request.getContextPath()%>/js/jquery.scrolling-tabs.min.js"></script>
<script type="text/javascript" src="js/jquery-equal-height.min.js"></script>
<style>
	body{
		background-color: white;
	}
</style>
</head>
<body id="body">

	<div class="container" style="margin-bottom: 150px;">
		<div >
<%-- 			<jsp:include page="/admanager/index.jsp" /> --%>
		</div>
		<hr style="visibility: hidden;">
		<hr style="visibility: hidden;">
		<div>

		  <!-- Nav tabs -->
		  <ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="active"><a style="color:#555" href="" aria-controls="" role="tab" data-toggle="tab">TAB1 電影</a></li>
		    <li role="presentation"><a href="" style="color:#555" aria-controls="" role="tab" data-toggle="tab">TAB2 商品</a></li>
		    <li role="presentation"><a href="#HouseMovie" style="color:#555" aria-controls="HouseMovie" role="tab" data-toggle="tab">TAB3 預告</a></li>
		  </ul>
		
		  <!-- Tab panes -->
		  <div class="tab-content">
		    <div role="tabpanel" class="tab-pane active" style="margin-bottom:20px;" id="">
		    </div>
		    <div role="tabpanel" class="tab-pane"  style="margin-bottom:20px;"  id="">
		    </div>
		     <div role="tabpanel" class="tab-pane"  style="margin-bottom:20px;"  id="HouseMovie">
		     	<div class="row">
		     		<div class="col-md-8 col-md-offset-2" style="margin-top:40px">
<!--  					<iframe  id="youtube" class="embed-responsive-item" width="800" height="600" src="https://www.youtube.com/watch?v=Eoook2Ee6q0"></iframe> -->
					<iframe width="900" height="506" src="https://www.youtube.com/embed/Eoook2Ee6q0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</div>
				</div>
		    </div>
		  </div>
		</div>
		
	<div>
		<form id="modify" method="get" action="ADManagerServlet">
			<input type="hidden" name="action" value="getOneADManager"> <input
				type="hidden" id="adNO" name="adNO">
		</form>
	</div>
	</div>
	<footer class="w3-bottom w3-black container-fluid text-center">
	<div>
		<ul class="nav nav-pills w3-centered " style="display: flex;font-size:13px;justify-content: center; position: static">
		  <li role="presentation"><a href="<%=request.getContextPath()%>/index.jsp">關於我們</a></li>
		  <li role="presentation"><a href="<%=request.getContextPath()%>/index.jsp">免責聲明</a></li>
		  <li role="presentation"><a href="<%=request.getContextPath()%>/index.jsp">服務條款</a></li>
		  <li role="presentation"><a href="<%=request.getContextPath()%>/index.jsp">隱私權聲明</a></li>
		</ul>
	</div>
    <span class="text-center"><p style="font-size:10px">7-1 MOVIE 後台管理系統</p></span>
	</div>
</footer>

<script>
	
						
	
</script>
</body>
</html>