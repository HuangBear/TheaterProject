<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Nav -->
<nav id="nav">
	<ul>

		<li><a class="nav_logo" href="<c:url value='/index'/>"><img src="<c:url value='/images/frontend/716logo.png'/>"
				style="width: 80px;"> </a></li>
		<li style="display: none;"><a href="<c:url value='/index'/>" class="hide">716影城</a>
		<li><a href="<c:url value='/films'/>">電影介紹</a></li>
		<li><a href="<c:url value='/ticketing'/>">時刻查詢</a></li>
		<li><a href="<c:url value='/price'/>">票價說明</a></li>
		<li><a href="<c:url value='/news'/>">活動公告</a></li>
		<li><a href="<c:url value='/biz'/>">業務專區</a></li>
		<li><a href="<c:url value='/theater'/>">影城特色</a></li>
		<li><a href='<c:url value='/MoviesForum'/>'>討論版</a></li>
		<li><a href="<c:url value='/forums'/>">電影討論</a></li>
		<li class="login"><img src="<c:url value='/images/frontend/coustom.png'/>"> <a href="<c:url value='/memberservice'/>">會員中心</a>
			<ul>
				<li><a href="<c:url value='/showticket'/>">訂票記錄</a></li>
				<li><a href="<c:url value='/memberinfo'/>">會員設定</a></li>
				<!-- 這個不要刪掉，平衡用-->
			</ul></li>
		<!--這個不要刪掉，平衡用 -->

		<!-- 		<li></li> -->
	</ul>

</nav>