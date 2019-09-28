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
				<article id="main" class="special"> <header>
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
						    
								
								<!--用戶一鍵Google登入或綁定Google帳戶時使用↓-->
<!--     							<button type="button" href="memberservice2" id="google">Google登入</button> -->
    						
								<a href="memberservice2">Google登入</a>
								

								
							</dd>
							</dl>
							
								<input id="remember" name="remember" type='checkbox' class="icon" 
								style="-webkit-appearance: checkbox;" ${cookie.flag.value}/>Remember Me
 								
								
						</form:form>
											
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
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<p>Morbi convallis lectus malesuada sed fermentum dolore amet</p>
				</header> <a href="#" class="image featured"><img src="images/frontend/pic06.jpg"
					alt="" /></a>
				<p>Commodo id natoque malesuada sollicitudin elit suscipit.
					Curae suspendisse mauris posuere accumsan massa posuere lacus
					convallis tellus interdum. Amet nullam fringilla nibh nulla
					convallis ut venenatis purus lobortis. Auctor etiam porttitor
					phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum
					consequat integer interdum integer purus sapien. Nibh eleifend
					nulla nascetur pharetra commodo mi augue interdum tellus. Ornare
					cursus augue feugiat sodales velit lorem. Semper elementum
					ullamcorper lacinia natoque aenean scelerisque vel lacinia mollis
					quam sodales congue.</p>
				<section> <header>
				<h3>Ultrices tempor sagittis nisl</h3>
				</header>
				<p>Nascetur volutpat nibh ullamcorper vivamus at purus. Cursus
					ultrices porttitor sollicitudin imperdiet at pretium tellus in
					euismod a integer sodales neque. Nibh quis dui quis mattis eget
					imperdiet venenatis feugiat. Neque primis ligula cum erat aenean
					tristique luctus risus ipsum praesent iaculis. Fermentum elit
					fringilla consequat dis arcu. Pellentesque mus tempor vitae pretium
					sodales porttitor lacus. Phasellus egestas odio nisl duis sociis
					purus faucibus morbi. Eget massa mus etiam sociis pharetra magna.</p>
				<p>Eleifend auctor turpis magnis sed porta nisl pretium. Aenean
					suspendisse nulla eget sed etiam parturient orci cursus nibh.
					Quisque eu nec neque felis laoreet diam morbi egestas. Dignissim
					cras rutrum consectetur ut penatibus fermentum nibh erat malesuada
					varius.</p>
				</section> <section> <header>
				<h3>Augue euismod feugiat tempus</h3>
				</header>
				<p>Pretium tellus in euismod a integer sodales neque. Nibh quis
					dui quis mattis eget imperdiet venenatis feugiat. Neque primis
					ligula cum erat aenean tristique luctus risus ipsum praesent
					iaculis. Fermentum elit ut nunc urna volutpat donec cubilia commodo
					risus morbi. Lobortis vestibulum velit malesuada ante egestas odio
					nisl duis sociis purus faucibus morbi. Eget massa mus etiam sociis
					pharetra magna.</p>
				</section> </article>
				<hr />
				<div class="row">
					<article class="col-4 col-12-mobile special"> <a href="#"
						class="image featured"><img src="images/frontend/pic07.jpg" alt="" /></a>
					<header>
					<h3>
						<a href="#">Gravida aliquam penatibus</a>
					</h3>
					</header>
					<p>Amet nullam fringilla nibh nulla convallis tique ante proin
						sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
						cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
						interdum.</p>
					</article>
					<article class="col-4 col-12-mobile special"> <a href="#"
						class="image featured"><img src="images/frontend/pic08.jpg" alt="" /></a>
					<header>
					<h3>
						<a href="#">Sed quis rhoncus placerat</a>
					</h3>
					</header>
					<p>Amet nullam fringilla nibh nulla convallis tique ante proin
						sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
						cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
						interdum.</p>
					</article>
					<article class="col-4 col-12-mobile special"> <a href="#"
						class="image featured"><img src="images/frontend/pic09.jpg" alt="" /></a>
					<header>
					<h3>
						<a href="#">Magna laoreet et aliquam</a>
					</h3>
					</header>
					<p>Amet nullam fringilla nibh nulla convallis tique ante proin
						sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
						cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
						interdum.</p>
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