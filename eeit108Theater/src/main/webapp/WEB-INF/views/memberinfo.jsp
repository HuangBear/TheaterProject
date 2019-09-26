<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 會員資訊</title>
<meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
	

<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>  

<script type="text/javascript">
	$(document).ready(function() {         
		$("#button1").click(function() { 
		$("#memberInfo").show(); 
		$("#memberEdit").hide();      
		});

		$("#button2").click(function() { 
		$("#memberEdit").show(); 
		$("#memberInfo").hide();      
		});
	});
</script>

<style>
	.pclr{color:#ad8c80;
	}
	
	
</style>

</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">
		<div id="header">
			<!-- Header -->
			<jsp:include page="header.jsp" />
		</div>
		<!-- Main -->
		<div class="wrapper style1">

			<div class="container">
				<div class="row gtr-200">
					<div class="col-4 col-12-mobile" id="sidebar">
						<hr class="first" />
						
						<h3><a href="#" id="button1">會員資訊</a></h3>
						
						<p class="pclr">${LoginOK.name}您好</p>
						<div class="row gtr-50">
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/memberinfo.png" alt="" /></a>
							</div>
							<div class="col-8">
								<p>
								<h4>基本資料</h4>
								<p class="pclr" id="button2"><a href="#">個人資訊修改</a></p>
							</div>
							
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/order.png" alt="" /></a>
							</div>							
							<div class="col-8">
								<p>
								<h4>訂單查詢</h4>
								<p class="pclr"><a href="#">當前購票資訊</a></p>
							</div>
							
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/record.png" alt="" /></a>
							</div>							
							<div class="col-8">
								<p>
								<h4>消費紀錄</h4>
								<p class="pclr"><a href="#">歷史觀影紀錄</a></p>
							</div>
							
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/support.png" alt="" /></a>
							</div>
							<div class="col-8">
								<p>
								<h4>申訴進度</h4>
								<p class="pclr"><a href="#">客服答覆情況</a></p>
							</div>
							
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/favorite.png" alt="" /></a>
							</div>
							<div class="col-8">
								<p>
								<h4>個人收藏</h4>
								<p class="pclr"><a href="#">個人喜愛的電影或影評</a></p>
							</div>
						</div>
						
					</div>
					
					
					<div class="col-8 col-12-mobile imp-mobile" id="content">
<!-- 				---------------------------------------------------------	 -->
						<div id="memberInfo">
							<article id="main"> 						
								<h3><a href="#">◎ 個人資訊</a></h3>
								<br>
						    		<p>會員名稱：${LoginOK.name}</p>
								    <p>註冊時間：${LoginOK.registerTime}</p>
						   <a href="#" class="image featured"><img src="${pageContext.request.contextPath}/getMemberPicture/${LoginOK.no}" alt="" style="width:300px;"/></a>

					<div id="memberInfo">
					<article id="main"> 
						
						<header>
						 <h2>
							<a href="#">個人資訊</a>
						 </h2>
						    <p>會員名稱: ${LoginOK.name}</p>
						
						    <p>註冊時間: ${LoginOK.registerTime}</p>
						
						</header> 
						   <a href="#" class="image featured"><img src="${pageContext.request.contextPath}/getMemberPicture/${LoginOK.no}" alt="" width="200px"/></a>
						 
					
						
						<section> 
						<header>
						  <h3>關於我:</h3>
						</header>
						    <p>${LoginOK.aboutMe}</p>
						
						</section> 
						<section> 
								<header><h4>喜愛電影類型：</h4></header>
						    	<p>視情況輸入內文2</p>
							</section> 
						<section> 
						 <header>
						   <h3>標題2</h3>
						 </header>
						    <div id="websocketdiv">
								<textarea id="area" style="font-size: 20px; font-family: '微軟正黑體';
								 margin-top: 20px;" readonly="readonly" rows="10" cols="42"></textarea>
								<input type="text" id="text" size="53" />
								<input id="sendmsg" type="button" value="送出" />
							</div>
						</section> 
					</article>
					</div>

<!-- 			    ---------------------------------------------------------- -->
						<div id="memberEdit" style="display:none">
							<article id="main"> 
								<header><h3><a href="#">◎ 會員資料修改</a></h3></header> 
							<section> 
								<form:form method='POST' modelAttribute="memberBean" action="memberUpdateX" enctype="multipart/form-data">							                                                                           
								${error}
								<form:input id="no" path="no" class="text" type="hidden"
									value="${LoginOK.no}" />     
							<dl>
							<dd>
								<label for="name" style="text-align:left">*您的姓名：</label>
								<form:input id="name" path="name" class="text" type="text"
									value="${LoginOK.name}" tabindex="1" autocomplete="off"
									maxlength="50"  />     
							</dl>
							
							<dl>
							<dd>
								<label for="email" style="text-align:left">*電子信箱：</label>
								<form:input id="email" path="email" class="text"
									type="text" value="${LoginOK.email}" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>
							
							<dl>
							<dd>
								<label for="phoneNum" style="text-align:left">*行動電話：</label>
								<form:input id="phoneNum" path="phoneNum" class="text"
									type="text" value="${LoginOK.phoneNum}" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>
														
							<dl>
							<dd>
								<label for="password" style="text-align:left">*密碼：</label>
								<form:input id="password" path="password" class="text"
									type="password" value="${LoginOK.password}" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>

							<dl>
							<dd>
								<label for="memberId" style="text-align:left">*身分證字號：</label>
								<form:input id="memberId" path="memberId" class="text"
									type="text" value="${LoginOK.memberId}" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>

							<dl>
							<dd>
								<label for="gender" style="text-align:left">*性別：</label>
								<form:select  id="gender"   required="required" path="gender">
        	                    <form:option value="1" selected="selected">男</form:option>
					            <form:option value="2" >女</form:option>
                	            </form:select>							
							</dl>
							<dl>
							<dd>

							<label for="aboutMe" style="text-align:left">關於我：</label>
							
                             <form:input type="text" id="aboutMe" class="form-control" 
                               value="${LoginOK.aboutMe}" path="aboutMe"/> 
							
							</dl>
							
							<dl>
							<dd>
								<label for="uploadImage" style="text-align:left">上傳照片：</label>							
                            	<form:input type="file" id="uploadImage" class="form-control" 
                                	path="uploadImage"/> 							
							</dl>									

							<dl>
							<dd>
								<a><form:button  type="submit" 
									style="font-size: 20px; width: 450px; height: 60px;">送出</form:button></a>
							</dd>
							</dl>
<!-- 								<input id="type" name="form" type='hidden' value='true' /> -->
							</form:form>						
						</section> 					
						</article>
					</div>
<!-- 			    ---------------------------------------------------------- -->
					</div>
				</div>
				
 				
 				<br><br><br><br><br>
 				<hr />   <!--下方電影收藏分隔線 -->
				
				<h3>個人收藏</h3>
				<div class="row">
					<article class="col-4 col-12-mobile special"> <a href="#"
						class="image featured"><img src="images/frontend/now05.jpg" alt="" /></a>
					<header>
					<h3>
						<a href="#">大叔之愛電影版</a>
					</h3>
					</header>
					<p>OSSANS LOVE THE MOVIE <br>
					        上映日期：2019/09/06</p>
					</article>
					
					<article class="col-4 col-12-mobile special"> <a href="#"
						class="image featured"><img src="images/frontend/coming02.jpg" alt="" /></a>
					<header>
					<h3>
						<a href="#">我家有個開心農場</a>
					</h3>
					</header>
					<p>THE BIGGEST LITTLE FARM <br>
					        上映日期：2019/09/12</p>
					</article>
					
					<article class="col-4 col-12-mobile special"> <a href="#"
						class="image featured"><img src="images/frontend/coming04.jpg" alt="" /></a>
					<header>
					<h3>
						<a href="#">星際救援</a>
					</h3>
					</header>
					<p>Ad Astra <br>
					        上映日期：2019/09/20</p>
					</article>
				</div>
			</div>

		</div>

		<!-- Footer -->
		<jsp:include page="footer.jsp" />

		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/jquery.scrollex.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>



	<script>
		var websocket = new WebSocket("ws://" + location.host
				+ "/eeit108Theater/websocket.do");

		websocket.onopen = function processOpen() {
		};

		websocket.onmessage = function(message) {
			var jsonData = JSON.parse(message.data);
			if (jsonData.message != null) {
				area.value += jsonData.message + "\n";
			}
		};

		websocket.onclose = function (evt) {
	        websocket.close();
	    };
	    
		websocket.onerror = function(evt) {
			websocket.close();
		};

		$(function() {
			$('#sendmsg').click(function() {
				websocket.send(text.value);
				text.value = "";
			});
		});
	</script>

</body>
</html>