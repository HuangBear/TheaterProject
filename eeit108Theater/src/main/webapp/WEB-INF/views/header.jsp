<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<!-- Nav -->
<nav id="nav">
	<ul>

		<li><a class="nav_logo" href="<c:url value='/index'/>"><img src="<c:url value='/images/frontend/716logo.png'/>"style="width: 80px;"> </a>
		</li>
		<li style="display: none;"><a href="<c:url value='/index'/>" class="hide">716影城</a>
		<li><a href="<c:url value='/films'/>">電影介紹</a></li>
		<li><a href="<c:url value='/ticketing'/>">時刻查詢</a></li>
		<li><a href="<c:url value='/price'/>">票價說明</a></li>
		<li><a href="<c:url value='/news'/>">活動公告</a></li>
		<li><a href="<c:url value='/biz'/>">業務專區</a></li>
		<li><a href="<c:url value='/theater'/>">影城特色</a></li>

        <li><a href="<c:url value='/MoviesForum'/>">討論版</a></li>
		<li><a href="<c:url value='/forums'/>">電影討論</a></li>	
		<li class="login">
		
		 <c:choose> 
				<c:when test="${empty LoginOK.memberImage}">
				<img src="<c:url value='/images/frontend/coustom.png'/>">
				</c:when>
				
				<c:when test="${!empty LoginOK.memberImage}">

				<img src="<c:url value='/getMemberPicture/${LoginOK.no}'/>">
				</c:when>
				                        
		</c:choose>  
		
	
		 
		 
		 <c:choose> 
				<c:when test="${empty LoginOK}">
				<a href="<c:url value='/memberservice'/>">會員中心</a>
				</c:when>
				
				<c:when test="${!empty LoginOK}">
				<a href="<c:url value='/memberinfo'/>">${LoginOK.name}</a>
				
				<ul>
			    
			    <li><a href="<c:url value='/memberinfo'/>">歡迎您 ${LoginOK.name}</a></li>
				<li><a href="<c:url value='/showticket'/>">訂票記錄</a></li>
				<li><a href="<c:url value='/memberinfo'/>">會員設定</a></li>
				<li><a href="<c:url value='/memberLogout'/>">登出</a></li>

				</ul>
				
				</c:when>                        
		</c:choose>  
		
<!-- 		<a href="memberservice">會員中心</a> -->
		
		
<!-- 			<ul> -->
<%-- 			    <li><a href="showticket">${memberName}</a></li> --%>
<!-- 				<li><a href="showticket">訂票記錄</a></li> -->
<!-- 				<li><a href="memberinfo">會員設定</a></li></ul> -->
				
			<!-- 這個不要刪掉，平衡用--></li><!--這個不要刪掉，平衡用 -->

		<!-- 		<li></li> -->
	</ul>
</nav>