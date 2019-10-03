<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 會員中心</title>
<meta charset="utf-8" />
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
    crossorigin="anonymous">  
    </script>
	
<script type="text/javascript">

	$(document).ready(function() {         
		$("#login").click(function() { 
		$("#loginview").show(); 
		$("#signinview").hide();      
		});

		$("#signin").click(function() { 
		$("#signinview").show(); 
		$("#loginview").hide();      
		});
	});	
</script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="309951267841-3oupgh1elatdub7tc7f4iah7eorg5h31.apps.googleusercontent.com">

	
<style>
	.sv1{width:800px;
		border:3px solid	#AAAAAA;
		border-radius:20px;
		margin:auto;
	}
	.sv3{width:640px;
		margin:auto;
	}
</style>
    
    
</head>
<body class="no-sidebar is-preload">
	<div id="page-wrapper">
<div id="header1">
		<!-- Header -->
		<jsp:include page="header.jsp" />
</div>
		<!-- Main -->
		<div class="wrapper style1">

			<div class="container">
				<article id="main" class="special"> 
				<header>
				<h2>
					<a href="#">會員中心</a>
				</h2>
				
				<div class="sv1">
					<div class="sv2">
						<button class="button1" id="login" onclick="ShowL()">會員登入</button>
						<button class="button2" id="signin" onclick="ShowR()">訪客註冊</button>
					</div>
					<hr>

					<div class="sv3" id="loginview">
						
						<form:form method='POST' modelAttribute="memberBean" action="memberLogin" enctype="multipart/form-data">
							<h3>會員登入</h3>
							<em>${error}${errMsg}</em>
							<em>${name}${welcome}${logout}</em>
							<dl>
							<dd>
								<label for="email" style="text-align:left">會員email：</label>
								<form:input id="email" path="email" class="text" type="text"
									placeholder="請輸入會員email" tabindex="1" autocomplete="off"
									value="${cookie.account.value}" maxlength="50"  />  
									   <!-- autofocus="autofocus" --></dd>
							</dl>
							<dl>
							<dd>
								<label for="pwd" style="text-align:left">密碼：</label>
								<form:input id="password" path="password" class="text"
									type="password" placeholder="請輸入密碼 ( 英文大小寫有差別 )" tabindex="2"
									value="${cookie.pwd.value}" autocomplete="off" maxlength="50" /></dd>
									
							</dl>
							
							<dl>
							<dd>
								
				            	
								
								<form:button  type="submit"  style="font-size: 20px;width: 450px; height: 60px;">
									 登入</form:button><br></dd></dl>
									 
								<dl><dd><form:button  type="reset" style="font-size: 20px;width: 450px; height: 60px;">
									 重填</form:button><br>	
						        <button type="button" id="oneSet" >一鍵填入 會員:Azure</button>
				
								
							</dd>
							</dl>
							
								<input id="remember" name="remember" type='checkbox' class="icon" 
								style="-webkit-appearance: checkbox;" ${cookie.flag.value}/>Remember Me
 								
								
						</form:form>
							
								<center>
								<div class="g-signin2" style="margin:auto;" data-onsuccess="onSignIn" id="myP"/>
								</center>
								 <form action="googleMember" id="myGoogleform" method="POST">
                 						<input type=hidden id=registGoogleName name="registGoogleName" value="">
                 						<input type=hidden id=registGoogleEmail name="registGoogleEmail" value="">
                						<input type=hidden id=registGoogleImg name="registGoogleImg" value="">
                
                						
                 				</form>
                 				<button onclick="myFunction()" id="myO" style="visibility:hidden">Google Sign Out</button>
                 				
		
			<script type="text/javascript">
			function onSignIn(googleUser) {
			// window.location.href='success.jsp';
				  var profile = googleUser.getBasicProfile();
				  var imagurl=profile.getImageUrl();
				  var name=profile.getName();
				  var email=profile.getEmail();
				
				  //document.getElementById("myO").style.visibility = "visible";
				  document.getElementById("myP").style.visibility = "hidden";
				
				  
				  document.getElementById("registGoogleName").value = name;
				  document.getElementById("registGoogleEmail").value = email;
				  document.getElementById("registGoogleImg").value = imagurl;
				  document.getElementById("myGoogleform").submit();  
			 }
				
			</script>
			
			<script>
			$('#oneSet').click(function() {

			$('#email').val('eeit10806@gmail.com');
		
			$('#password').val('Do!ng123');
		
			})
			</script>
		
			<script>
			function myFunction() {
			document.getElementById("myO").style.visibility = "hidden";
			gapi.auth2.getAuthInstance().disconnect();
    		location.reload();
			}
			</script>				
					</div>

				
					<div class="sv3" id="signinview" style="display:none">
						<form:form method='POST' modelAttribute="memberBean" action="memberAdd" acenctype="multipart/form-data">
							<h3>訪客註冊</h3>
							${error}
							${name}${welcome}
							
							<dl>
							<dd>
								<label for="name" style="text-align:left">*您的姓名：</label>
								<form:input id="name" path="name" class="text" type="text"
									placeholder="請輸入姓名" tabindex="1" autocomplete="off"
									maxlength="50"  />     
							</dl>
							<dl>
							<dd>
								<label for="email" style="text-align:left">*電子信箱：</label>
								<form:input id="email" path="email" class="text"
									type="text" placeholder="請輸入e-mail" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>
							<dl>
							<dd>
								<label for="phoneNum" style="text-align:left">*行動電話：</label>
								<form:input id="phoneNum" path="phoneNum" class="text"
									type="text" placeholder="請輸入行動電話號碼" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>
							
							<dl>
							<dd>
								<label for="account" style="text-align:left">*密碼：</label>
								<form:input id="password" path="password" class="text"
									type="password" placeholder="請輸入密碼 (英文大小寫有差別 )" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>



							<dl>
							<dd>
								<label for="memberId" style="text-align:left">*身分證字號：</label>
								<form:input id="memberId" path="memberId" class="text"
									type="text" placeholder="請輸入身分證字號" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>
							<dl>
							<dd>
								<label for="birthday" style="text-align:left">*生日：</label>
								<form:input id="birthdayString" path="birthdayString" class="text"
									type="date" placeholder="請輸入出生年月日" tabindex="2"
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
								<a><input id="submit" type="submit" value="註冊"
									style="font-size: 20px; width: 450px; height: 60px;"></a>
							</dd>
							</dl>
								<input id="type" name="form" type='hidden' value='true' />
								
								
							
					            
						</form:form>
					</div>
				    </div>

				</header> 
				
	
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
		
		<!-- 引用jQuery-->
    
    
    <!--以下請放置到*.js檔-->
    <script type="text/javascript">
    
$(function(){
		
		var G_CLIENT_ID = "309951267841-3oupgh1elatdub7tc7f4iah7eorg5h31.apps.googleusercontent.com";
// 		var G_REDIRECT_URL = "http://localhost:8080/eeit108Theater/identity.do?action=google_login_Action";
		var G_REDIRECT_URL = "http://localhost:8080/eeit108Theater/GoogleIdentity?action=google_login_Action";
		var G_SCOPE = 'https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile';
		
		

		
		
	
	})

      
    </script>
</body>
</html>