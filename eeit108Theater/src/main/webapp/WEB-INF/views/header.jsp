<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<!-- Nav -->
<style>
	.foo1:hover{color:gold;}
	#prfilePic {border-radius: 50%;
				width:50px;
				height:50px}
    

</style>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="309951267841-3oupgh1elatdub7tc7f4iah7eorg5h31.apps.googleusercontent.com">

<nav id="nav">
	<ul>

		<li><a class="nav_logo" href="<c:url value='/'/>"><img src="<c:url value='/images/frontend/716logo.png'/>"style="width: 80px;"> </a>
		</li>
		<li style="display: none;"><a href="<c:url value='/index'/>" class="hide">716影城</a>
		<li class="foo1"><a href="<c:url value='/films'/>">電影介紹</a></li>
		<li class="foo1"><a href="<c:url value='/ticketing_1'/>">線上訂票</a>
			<ul>
				<li><a href="<c:url value='/ticketing_1'/>">時刻查詢</a></li>
				<li><a href="<c:url value='/visitorticket'/>">訂票查詢</a></li>
				<li><a href="<c:url value='/price'/>">票價說明</a></li>
			</ul></li>
		<li class="foo1"><a href="<c:url value='/news'/>">活動公告</a></li>
		<li class="foo1"><a href="<c:url value='/biz'/>">業務專區</a></li>
		<li class="foo1"><a href="<c:url value='/theater'/>">影城特色</a></li>
		<li class="foo1"><a href="<c:url value='/MoviesForum'/>">電影討論</a></li>	
		<li class="login foo1">

		
		 <c:choose> 
				<c:when test="${empty LoginOK.memberImage}">

					<c:choose>
						<c:when test="${empty LoginOK.googleUrl}">
						<img  src="<c:url value='/images/frontend/loginicon.png' />"  ></c:when>
						<c:when test="${!empty LoginOK.googleUrl}">
						<img  src="${LoginOK.googleUrl}"  ></c:when>
					</c:choose>
				
				</c:when>
				
				<c:when test="${!empty LoginOK.memberImage}">

				<img id="prfilePic" src="<c:url value='/getMemberPicture/${LoginOK.no}'/>">
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
				<li><a href="<c:url value='/memberinfo'/>">會員設定</a></li>
				<li><a href="<c:url value='/showticket'/>">訂票記錄</a></li>
				<li><a href="<c:url value='/qaservice'/>">客服中心</a></li>
				<li><a href="<c:url value='/memberLogout'/>" onclick="googleLogOut()">登出</a></li>
				
				</ul>
				
				
				</c:when>                        
		</c:choose>  
		<div class="g-signin2" data-onsuccess="onSignIn" id="myP"  style="visibility:hidden"></div>
		<script>
			function googleLogOut() {
			
			gapi.auth2.getAuthInstance().disconnect();
    		location.reload();
			}
			</script>
<!-- 		<a href="memberservice">會員中心</a> -->
		
		
<!-- 			<ul> -->
<%-- 			    <li><a href="showticket">${memberName}</a></li> --%>
<!-- 				<li><a href="showticket">訂票記錄</a></li> -->
<!-- 				<li><a href="memberinfo">會員設定</a></li></ul> -->
				
			<!-- 這個不要刪掉，平衡用--></li><!--這個不要刪掉，平衡用 -->

		<!-- 		<li></li> -->
	</ul>
</nav>