<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						
						<form method='POST' modelAttribute="managerBean" enctype="multipart/form-data">
							<h3>會員登入</h3>
							<dl>
							<dd>
								<label for="account" style="text-align:left">會員帳號(手機號碼/e-mail)：</label>
								<input id="account" path="account" class="text" type="text"
									placeholder="請輸入會員帳號" tabindex="1" autocomplete="off"
									maxlength="50"  />     <!-- autofocus="autofocus" -->
							</dl>
							<dl>
							<dd>
								<label for="pwd" style="text-align:left">密碼：</label>
								<input id="password" path="password" class="text"
									type="password" placeholder="請輸入密碼 ( 英文大小寫有差別 )" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>
							<dl>
							<dd>
								<a><input id="submit" type="submit" value="登入"
									style="font-size: 20px; width: 450px; height: 60px;"></a><br>
								<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
								<a href="#" class="image fit" ><img src="images/facebooklogin.jpg"
									alt="" style="width:450px; display:block; margin:auto;"/></a></fb:login-button><br>
									
								<a href="#" class="image fit"><img src="images/googlelogin.jpg"
									alt="" style="width:450px; display:block; margin:auto;"/></a>
<!-- 								<button type="button" id="btnSignIn"></button> -->
								
							</dd>
							</dl>
								<input id="type" name="form" type='hidden' value='true' />
						</form>
											
					</div>

				
					<div class="sv3" id="signinview" style="display:none">
						<form method='POST' modelAttribute="managerBean" enctype="multipart/form-data">
							<h1 class="h11">訪客註冊</h1>
							<dl>
							<dd>
								<label for="name" style="text-align:left">*您的姓名：</label>
								<input id="name" path="name" class="text" type="text"
									placeholder="請輸入姓名" tabindex="1" autocomplete="off"
									maxlength="50"  />     <!-- autofocus="autofocus" -->
							</dl>
							<dl>
							<dd>
								<label for="email" style="text-align:left">*電子信箱：</label>
								<input id="email" path="email" class="text"
									type="text" placeholder="請輸入e-mail" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>
							<dl>
							<dd>
								<label for="phoneNum" style="text-align:left">*行動電話：</label>
								<input id="phoneNum" path="phoneNum" class="text"
									type="text" placeholder="請輸入行動電話號碼" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>
							
							<dl>
							<dd>
								<label for="account" style="text-align:left">*密碼：</label>
								<input id="password" path="password" class="text"
									type="password" placeholder="請輸入密碼 (英文大小寫有差別 )" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>
							<dl>
							<dd>
								<label for="account" style="text-align:left">*請再輸入密碼一次：</label>
								<input id="password" path="password" class="text"
									type="password" placeholder="請重複上面所輸入之密碼 (英文大小寫有差別 )" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>
							<dl>
							<dd>
								<label for="memberId" style="text-align:left">*身分證字號：</label>
								<input id="memberId" path="memberId" class="text"
									type="text" placeholder="請輸入身分證字號" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>
							<dl>
							<dd>
								<label for="birthday" style="text-align:left">*生日：</label>
								<input id="birthday" path="birthday" class="text"
									type="text" placeholder="請輸入出生年月日" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>
							<dl>
							<dd>
								<label for="radio1">男</label><input type="radio" id="radio1" name="gender" value="male">
								<label for="radio2">女</label><input type="radio" id="radio2" name="gender" value="female">
							</dl>

							<dl>
							<dd>
								<a><input id="submit" type="submit" value="註冊"
									style="font-size: 20px; width: 450px; height: 60px;"></a>
							</dd>
							</dl>
								<input id="type" name="form" type='hidden' value='true' />
						</form>
					
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
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <!--從 Web.config檔 抓取Googl App Client ID--> 
    <script type="text/javascript">
        let GoolgeApp_Cient_Id = "@WebConfigurationManager.AppSettings["Google_clientId_forLogin"]";
        let id_token_to_userIDUrl = "@Url.Action("Test","Home")";  
    </script>
    <!--引用Google Sign-in必須的.js，callback function(GoogleSigninInit)名稱自訂 -->
    <script src="https://apis.google.com/js/platform.js?onload=GoogleSigninInit" async defer></script>

    <!--以下請放置到*.js檔-->
    <script type="text/javascript">
    
    function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
    	  console.log('statusChangeCallback');
    	  console.log(response);                   // The current login status of the person.
    	  if (response.status === 'connected') {   // Logged into your webpage and Facebook.
    	    testAPI();  
    	  } else {                                 // Not logged into your webpage or we are unable to tell.
    	    document.getElementById('status').innerHTML = 'Please log ' +
    	      'into this webpage.';
    	  }
    	}


    	function checkLoginState() {               // Called when a person is finished with the Login Button.
    	  FB.getLoginStatus(function(response) {   // See the onlogin handler
    	    statusChangeCallback(response);
    	  });
    	}


    	window.fbAsyncInit = function() {
    	  FB.init({
    	    appId      : '{app-id}',
    	    cookie     : true,                     // Enable cookies to allow the server to access the session.
    	    xfbml      : true,                     // Parse social plugins on this webpage.
    	    version    : '{api-version}'           // Use this Graph API version for this call.
    	  });


    	  FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
    	    statusChangeCallback(response);        // Returns the login status.
    	  });
    	};


    	(function(d, s, id) {                      // Load the SDK asynchronously
    	  var js, fjs = d.getElementsByTagName(s)[0];
    	  if (d.getElementById(id)) return;
    	  js = d.createElement(s); js.id = id;
    	  js.src = "https://connect.facebook.net/en_US/sdk.js";
    	  fjs.parentNode.insertBefore(js, fjs);
    	}(document, 'script', 'facebook-jssdk'));


    	function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
    	  console.log('Welcome!  Fetching your information.... ');
    	  FB.api('/me', function(response) {
    	    console.log('Successful login for: ' + response.name);
    	    document.getElementById('status').innerHTML =
    	      'Thanks for logging in, ' + response.name + '!';
    	  });
    	}
    	  
    
    
    
        //jQuery處理button click event 當畫面DOM都載入時....
        $(function () {
            $("#btnSignIn").on("click", function () {
                GoogleLogin();//Google 登入
            });
            $("#btnDisconnect").on("click", function () {
                Google_disconnect();//和Google App斷連
            });
        });

        function GoogleSigninInit() {
            gapi.load('auth2', function () {
                gapi.auth2.init({
                    client_id: GoolgeApp_Cient_Id//必填，記得開發時期要開啟 Chrome開發人員工具 查看有沒有403錯誤(Javascript來源被禁止)
                });
            });//end gapi.load
        }//end GoogleSigninInit function

        
        function GoogleLogin() {
            let auth2 = gapi.auth2.getAuthInstance();//取得GoogleAuth物件
            auth2.signIn().then(function (GoogleUser) {
                console.log("Google登入成功"); 
                let user_id =  GoogleUser.getId();//取得user id，不過要發送至Server端的話，請使用↓id_token   
                let AuthResponse = GoogleUser.getAuthResponse(true) ;//true會回傳access token ，false則不會，自行決定。如果只需要Google登入功能應該不會使用到access token
                let id_token = AuthResponse.id_token;//取得id_token
                $.ajax({
                    url: id_token_to_userIDUrl,
                    method: "post",
                    data: { id_token: id_token },
                    success: function (msg) {
                        console.log(msg);
                    }
                });//end $.ajax 
               
            },
                function (error) {
                    console.log("Google登入失敗");
                    console.log(error);
                });

        }//end function GoogleLogin
         

         
        function Google_disconnect() {
            let auth2 = gapi.auth2.getAuthInstance(); //取得GoogleAuth物件

            auth2.disconnect().then(function () {
                console.log('User disconnect.');
            });
        } 
    </script>
</body>
</html>