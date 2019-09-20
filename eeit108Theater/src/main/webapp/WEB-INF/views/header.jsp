<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%>
<!-- Nav -->
<nav id="nav">
	<ul>

		<li><a class="nav_logo" href="index"><img
				src="images/frontend/716logo.png" style="width: 80px;">
		</a></li>
		<li style="display: none;"><a href="index" class="hide">716影城</a>
		<li><a href="films">電影介紹</a></li>			
		<li><a href="ticketing">時刻查詢</a></li>
		<li><a href="price">票價說明</a></li>
		<li><a href="news">活動公告</a></li>
		<li><a href="biz">業務專區</a></li>
		<li><a href="theater">影城特色</a></li>
		<li><a href="forums">電影討論</a></li>		
		<li class="login"><img src="images/frontend/coustom.png"> <a href="memberservice">會員中心</a>
			<ul>
				<li>${memberName}</li>
				<li><a href="showticket">訂票記錄</a></li>
				<li><a href="memberinfo">會員設定</a></li>
			<!-- 這個不要刪掉，平衡用--></ul></li><!--這個不要刪掉，平衡用 -->

<!-- 		<li></li> -->
	</ul>

</nav>

