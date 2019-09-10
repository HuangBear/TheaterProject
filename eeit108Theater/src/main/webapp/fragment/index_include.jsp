<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>赫米特租屋管理</title>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/favicon.ico">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/datatables.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/w3.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<link href="https://fonts.googleapis.com/css?family=Pacifico"
	rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/cwtexyen.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/js/flashcanvas.js"></script>
<script src="<%=request.getContextPath()%>/js/jSignature.min.js"></script>
<script src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'
	rel='stylesheet' type='text/css'>
<!-- CSS reset -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reset.css">
<!-- Gem style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<!-- Modernizr -->
<script src="<%=request.getContextPath()%>/js/modernizr.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>

<style>
* {
	margin: 0;
	padding: 0;
}

a:link, a:visited, a:hover, a:active {
	color: white;
	padding: 14px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

#hermitHome {
	color: white;
}

.w3-sidebar span {
	color: white;
	font-family: 'cwTeXYen', sans-serif;
}

.main-gallery {
	width: 100%;
	height: 50vh;
	background: url("images/main.jpg");
	background-position: center;
	background-size: cover;
	margin-top: 52px;
}

.w3-jumbo span {
	font-family: "Tangerine", serif;
}

.glfont {
	font-family: 'Pacifico', cursive;
}

.glcwTeXYen {
	font-family: 'cwTeXYen', sans-serif;
}

#button {
	padding: .5em 1em;
	text-decoration: none;
}

#footer {
	margin-top: 30px;
	margin-bottom: 0px;
	width: 100%;
	height: 100px;
	position: absolute;
	bottom: 0;
	left: 0;
}

/* Shared */
.loginBtn {
	box-sizing: border-box;
	position: relative;
	width: 14em; /* - apply for fixed size */
	margin: 0.2em;
	padding: 0 15px 0 46px;
	border: none;
	text-align: center;
	line-height: 34px;
	white-space: nowrap;
	border-radius: 0.2em;
	font-size: 16px;
	color: #FFF;
}

.loginBtn:before {
	content: "";
	box-sizing: border-box;
	position: absolute;
	top: 0;
	left: 0;
	width: 34px;
	height: 100%;
}

.loginBtn:focus {
	outline: none;
}

.loginBtn:active {
	box-shadow: inset 0 0 0 32px rgba(0, 0, 0, 0.1);
}

/* Facebook */
.loginBtn--facebook {
	background-color: #4C69BA;
	background-image: linear-gradient(#4C69BA, #3B55A0);
	/*font-family: "Helvetica neue", Helvetica Neue, Helvetica, Arial, sans-serif;*/
	text-shadow: 0 -1px 0 #354C8C;
}

.loginBtn--facebook:before {
	border-right: #364e92 1px solid;
	background:
		url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/14082/icon_facebook.png')
		6px 6px no-repeat;
}

.loginBtn--facebook:hover, .loginBtn--facebook:focus {
	background-color: #5B7BD5;
	background-image: linear-gradient(#5B7BD5, #4864B1);
}

/* Google */
.loginBtn--google {
	/*font-family: "Roboto", Roboto, arial, sans-serif;*/
	background: #DD4B39;
}

.loginBtn--google:before {
	border-right: #BB3F30 1px solid;
	background:
		url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/14082/icon_google.png')
		6px 6px no-repeat;
}

.loginBtn--google:hover, .loginBtn--google:focus {
	background: #E74B37;
}

.breadBox {
	width: 100%;
	display: block;
	box-sizing: border-box;
}

.breadBox .breadNav {
	width: 1200px;
	margin: auto;
	padding: 0;
}

.breadBox .breadNav .breadList, .conditionShow {
	float: left;
	margin: 0;
	padding: 0;
}

.breadBox .breadNav a {
	font-size: 13px;
	line-height: 55px;
}

.fa {
	display: inline-block;
	font: normal normal normal 14px/1 FontAwesome;
	font-size: inherit;
	text-rendering: auto;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

.conditionShow {
	margin-left: 15px;
	width: 867px;
}

.breadBox .breadNav span {
	font-size: 12px;
	color: #A3A3A3;
}

.conditionShow span {
	display: block;
	float: left;
	margin-top: 15px;
	margin-right: 10px;
	border: 1px solid #D4D4D4;
	padding: 0px 10px;
	padding-right: 0px;
	color: #666666;
}

nav.main-nav:hover {
	background-color: #d0d0d0;
}

.main-nav {
	width: 80px;
	height: 55px;
}

.main-nav ul {
	margin-left: 18px;
}
</style>
</head>
<body>
	<div class="w3-bar w3-black navbar-fixed-top glcwTeXYen"
		style="height: 40px">
		<button class="w3-button w3-dark-grey w3-xlarge w3-left"
			onclick="openLeftMenu()">&#9776;</button>
		<a href="<%=request.getContextPath()%>/index.jsp"
			class="w3-bar-item w3-button w3-xlarge w3-left glfont"><span
			id="hermitHome">Hermit</span></a>
		<!-- 如果有登入就不顯示 -->
		<c:if test="${empty LoginOK}">
			<a
				href="<%=request.getContextPath()%>/register/register_select_page.jsp"
				class="w3-bar-item w3-button w3-xlarge w3-right w3-margin-right"><span
				id="hermitHome">註冊</span></a>
			<span class="w3-bar-item  w3-xlarge w3-right" id="hermitHome">|</span>
		</c:if>
		<!-- 如果有登入就顯示登出 -->
		<c:if test="${!empty LoginOK}">
			<a href="<%=request.getContextPath()%>/MemberLogin/Logout.jsp"
				class="w3-bar-item w3-button w3-xlarge w3-right w3-margin-right"><span
				id="hermitHome">登出</span></a>
			<a
				href="<%=request.getContextPath()%>/memberbackstage/mem_back_index.jsp"
				class="w3-bar-item w3-button w3-xlarge w3-right w3-margin-right"><span
				id="hermitHome">${LoginOK.memName}</span></a>
			<span style="margin-top: 8px;"
				class="w3-xlarge w3-right w3-margin-right" id="hermitHome">您好！</span>
		</c:if>

		<!-- inser more links here -->
		<!-- 如果有登入就不顯示 -->
		<c:if test="${empty LoginOK}">
			<nav class="main-nav">
				<ul>
					<li><a class="cd-signin" href="#0"
						style="font-size: 24px; margin-top: 8px; border: none;">登入</a></li>
				</ul>
			</nav>
		</c:if>

		<div
			class="w3-sidebar w3-bar-block w3-animate-left navbar-fixed-top w3-dark-gray"
			style="color: white; display: none; font-size: 20px; font-family: Microsoft JhengHei;"
			id="leftMenu">
			<button onclick="closeLeftMenu()"
				class="w3-bar-item w3-button w3-large">
				<span>Close &times</span>
			</button>
			<a href="<%=request.getContextPath()%>/index.jsp"
				class="w3-bar-item w3-button"><span>首頁</span></a>
			<a href="" class="w3-bar-item w3-button" id="mbi"><span>會員中心</span></a> 
			<a href="" class="w3-bar-item w3-button" id="mbf"><span>我的收藏</span></a>
			<a href="" class="w3-bar-item w3-button" id="mbc"><span>我的預約</span></a>
			<a href="" class="w3-bar-item w3-button" id="mbq"><span>Q&A</span></a>
			<a href="" class="w3-bar-item w3-button" id="mbl"><span>租賃紀錄</span></a>
		</div>
	</div>

	<div id="top" class="masthead" role="main"
		style="height: auto; padding-top: 80px; padding-bottom: 0">
		<div class="container" style="overflow: hidden">
			<span class="w3-jumbo glfont">Hermit<span>
		</div>
		<div class="row" style="height: auto">
			<div class="col-md-6 col-sm-12 col-md-offset-3 subscribe">
				<form class="form-horizontal" role="form"
					action="<%=request.getContextPath()%>/index.jsp" id="subscribeForm"
					method="POST">
					<div class="form-group" style="overflow: hidden">
						<div class="input-group">
							<input class="form-control input-lg" name="houstTitle"
								id="houstTitle" placeholder="請輸入您想尋找的關鍵字..."
								value=${sessionScope.houseTitle}> <span
								class="input-group-addon"
								style="margin: 0; padding: 0; background-color: rgba(0, 0, 0, 0)"><button
									id="submit" type="button" class="btn btn-success btn-lg">搜尋</button></span>
						</div>
						<div style="height: 38vh; width: 100%; overflow: hidden">
							<div id="effect" class="form-control"
								style="background-color: rgba(255, 255, 255, 0.3); height: 75%; overflow: auto">
								<div class=" col-md-2" style="">
									<select id="city" name="cityNO"
										class="form-control form-control-sm"
										style="border: 1px, solid, gray;">
										<option value="-1">&gt;&nbsp;縣市&nbsp;&lt;</option>
									</select>
								</div>
								<div class=" col-md-2">
									<select id="borough" class="form-control form-control-sm"
										style="border: 1px, solid, gray;">
										<option value="-1">&gt;&nbsp;鄉鎮區&nbsp;&lt;</option>
									</select>
								</div>
								<div class=" col-md-2">
									<select id="houseType" class="form-control form-control-sm"
										style="border: 1px, solid, gray;">
										<option value="-1">&gt;&nbsp;房屋類型&nbsp;&lt;</option>
									</select>
								</div>
								<div class=" col-md-2">
									<select id="houseForm" class="form-control form-control-sm"
										style="border: 1px, solid, gray;">
										<option value="-1">&gt;&nbsp;房屋型態&nbsp;&lt;</option>
									</select>
								</div>
								<div class=" col-md-2">
									<select id="houseSize" class="form-control form-control-sm"
										style="border: 1px, solid, gray;">
										<option value="-1">&gt;&nbsp;房屋大小&nbsp; &lt;</option>
										<option value="0">10坪以下</option>
										<option value="1">10-15坪</option>
										<option value="2">15-20坪</option>
										<option value="3">20-30坪</option>
										<option value="4">30坪以上</option>
									</select>
								</div>
								<div class="col-md-11  w3-margin text-left"
									style="background-color: rgba(255, 255, 255, 0.6); height: auto; overflow: auto">
									<div style="height: 30px">
										<div class="w3-left" style="width: 100%;">
											<label class="radio-inline" style="margin-right: 6%">
												<span class="glcwTeXYen" style="font-size: 1.3em">租金
													&gt;</span>
											</label> <label class="radio-inline"> <input type="radio"
												id="租金不限" name="houseRent">不限
											</label> <label class="radio-inline"> <input type="radio"
												id="5000以下" name="houseRent">5000以下
											</label> <label class="radio-inline"> <input type="radio"
												id="5000-10000元" name="houseRent">5000-10000元
											</label> <label class="radio-inline"> <input type="radio"
												id="10000-20000元" name="houseRent">10000-20000元
											</label> <label class="radio-inline"> <input type="radio"
												id="20000-30000元" name="houseRent">20000-30000元
											</label> <label class="radio-inline"> <input type="radio"
												id="30000元以上" name="houseRent">30000元以上
											</label>
										</div>
									</div>
									<div style="height: 150px">
										<div class="col-md-12">
											<label class="radio-inline w3-left"
												style="display: block; padding-left: 4px"> <span
												class="glcwTeXYen" style="font-size: 1.3em">其他設備 :</span>
											</label>
										</div>
										<div id="equid" style="width: 86%;">
											<div class="col-md-2">
												<label class="radio-inline"> <span> <input
														type="checkbox" id="電視" name="TV">電視
												</span>
												</label>
											</div>
											<div class="col-md-2">
												<label class="radio-inline"> <span> <input
														type="checkbox" id="冷氣" name="aircondition">冷氣
												</span>
												</label>
											</div>
											<div class="col-md-2">
												<label class="radio-inline"> <span> <input
														type="checkbox" id="冰箱" name="refrigerator">冰箱
												</span>
												</label>
											</div>
											<div class="col-md-2">
												<label class="radio-inline"> <span> <input
														type="checkbox" id="熱水器" name="waterHeater">熱水器
												</span>
												</label>
											</div>
											<div class="col-md-2">
												<label class="radio-inline"> <span> <input
														type="checkbox" id="瓦斯" name="gas">瓦斯
												</span>
												</label>
											</div>
											<div class="col-md-2">
												<label class="radio-inline"> <span> <input
														type="checkbox" id="第四台" name="theFourthStation">第四台
												</span>
												</label>
											</div>
											<div class="col-md-2">
												<label class="radio-inline"> <span> <input
														type="checkbox" id="網路" name="net">網路
												</span>
												</label>
											</div>
											<div class="col-md-2">
												<label class="radio-inline"> <span> <input
														type="checkbox" id="洗衣機" name=washing>洗衣機
												</span>
												</label>
											</div>
											<div class="col-md-2">
												<label class="radio-inline"> <span> <input
														type="checkbox" id="床" name="bed">床
												</span>
												</label>
											</div>
											<div class="col-md-2">
												<label class="radio-inline"> <span> <input
														type="checkbox" id="衣櫃" name="wardrobe">衣櫃
												</span>
												</label>
											</div>
											<div class="col-md-2">
												<label class="radio-inline"> <span> <input
														type="checkbox" id="沙發" name="sofa">沙發
												</span>
												</label>
											</div>
											<div class="col-md-2">
												<label class="radio-inline"> <span> <input
														type="checkbox" id="停車位" name="parking">停車位
												</span>
												</label>
											</div>
											<div class="col-md-2">
												<label class="radio-inline"> <span> <input
														type="checkbox" id="電梯" name="elevator">電梯
												</span>
												</label>
											</div>
											<div class="col-md-2">
												<label class="radio-inline"> <span> <input
														type="checkbox" id="陽台" name="balcony">陽台
												</span>
												</label>
											</div>
											<div class="col-md-2">
												<label class="radio-inline"> <span> <input
														type="checkbox" id="可開伙" name="permitCook">可開伙
												</span>
												</label>
											</div>
											<div class="col-md-2">
												<label class="radio-inline"> <span> <input
														type="checkbox" id="養寵物" name="pet">養寵物
												</span>
												</label>
											</div>
											<div class="col-md-2">
												<label class="radio-inline"> <span> <input
														type="checkbox" id="近捷運" name="closeMRT">近捷運
												</span>
												</label>
											</div>
											<div class="col-md-2">
												<label class="radio-inline">
													<button type="button" id="clearCheckBox"
														class="btn btn-primary">清除全部</button>
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<span id="advencedSearch" class="w3-right"
								style="line-height: 25px; width: 80px; font-size: 10px; background-color: rgba(255, 255, 255, 0.7); color: black; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">進階搜尋<span
								class="glyphicon glyphicon-chevron-up"></span></span>
						</div>
						<div class="col-md-5 col-sm-4"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
	<div class="w3-black w3-margin-bottom"
		style="height: 3vh; border-bottom-left-radius: 15px; border-bottom-right-radius: 3px;"></div>

	<!-- 登入 -->
	<div class="cd-user-modal" id="loginmodal">
		<!-- this is the entire modal form, including the background -->
		<div class="cd-user-modal-container">
			<!-- this is the container wrapper -->
			<ul class="cd-switcher">
				<li><a href="#0" class="selected">Sign in</a></li>
			</ul>

			<div id="cd-login">
				<!-- log in form -->
				<form class="cd-form" id="loginform"
					action="<c:url value='/Login/memlogin.do?action=login'/>"
					method="POST">
					<p class="fieldset">
						<label class="image-replace cd-username" for="signup-username">Account</label>
						<input class="full-width has-padding has-border" name="account"
							id="account" type="text" placeholder="Account"
							value="${cookie.account.value}"> <small><font
							color="red" size="-1" id="putacc"></font></small>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">Password</label>
						<input class="full-width has-padding has-border" name="pwd"
							id="pwd" type="password" placeholder="Password"
							value="${cookie.pwd.value}"> <small><font
							color="red" size="-1" id="putpwd"></font></small>
					</p>

					<p class="fieldset">
						<small><font color="red" size="-1" id="loginErr"></font></small>
					</p>

					<div>
						<img id="image" align="center" style="margin-left: 30px"
							border="0" onclick="refresh()"
							src="<%=request.getContextPath()%>/MemberLogin/Image.jsp"
							title="點擊更換圖片"><br />
					</div>

					<p class="fieldset">
						<label class="" for="">請輸入驗證碼:</label> <input type="text"
							id="code" maxlength="6" size="10"><small><font
							color="red" size="-1" id="putver"></font></small>
					</p>

					<p id="rememberBtn" class="remember-box">
						<input type="checkbox" id="remember" ${cookie.flag.value}>
						<label for="remember">Remember me</label>
					</p>

					<p class="fieldset">
						<button class="loginBtn loginBtn--facebook" type="button"
							id="facebook" style="margin-left: 43px">Login with
							Facebook</button>

						<button class="loginBtn loginBtn--google" type="button"
							id="google">Login with Google</button>
					</p>

					<p class="fieldset">
						<input class="full-width" type="submit" value="Login"
							id="submitBtn">
						<!-- <button class="full-width" type="button" id="submitBtn" value="Login">Login</button> -->
					</p>
				</form>

				<p class="cd-form-bottom-message">
					<a href="#0">Forgot your password?</a>
				</p>
			</div>

			<div id="cd-reset-password">
				<!-- reset password form -->
				<p class="cd-form-message">忘記你的密碼了嗎?請輸入你申請的帳號，
				會寄送重新設定密碼的Mail到你的信箱內，再點選裡面的連結設定你的新密碼。</p>

				<form class="cd-form" method="POST">

					<p class="fieldset">
						<label class="image-replace cd-username" for="reset-account">Account</label>
						<input class="full-width has-padding has-border"
							name="findByAccount" id="resetAccount" type="text"
							placeholder="Account"> <small><font color="red"
							size="-1" id="reseterror"></font></small>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding" type="button"
							value="Reset password" id="submitReset">
					</p>
				</form>

				<p class="cd-form-bottom-message">
					<a href="#0">Back to log-in</a>
				</p>
			</div>
			<!-- cd-reset-password -->
		</div>
		<!-- cd-user-modal-container -->
	</div>
	<!-- cd-user-modal -->

	<section class="breadBox">
		<div class="breadNav clearfix">
			<div class="breadList" id="breadList">
				<a href="<%=request.getContextPath()%>/index.jsp"
					style="color: black; padding: 0;">Hermit</a> <i
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></i>&nbsp;&nbsp;
			</div>
			<div id="showSearch" class="conditionShow clearfix"></div>
		</div>
	</section>

	<script>
		function openLeftMenu() {
		    document.getElementById("leftMenu").style.display = "block";
		    
		}
		function closeLeftMenu() {
		    document.getElementById("leftMenu").style.display = "none";
		}
		$( function() {
			var sessionHouseTitle = "<%=session.getAttribute("houseTitle")%>";
			var sessionCityNO = <%=session.getAttribute("cityNO")%> ;
			var sessionBoroughNO = <%=session.getAttribute("boroughNO")%>;
			var sessionTypeNO = <%=session.getAttribute("typeNO")%>;
			var sessionFormNO = <%=session.getAttribute("formNO")%>;
			var sessionHouseSize = <%=session.getAttribute("houseSize")%>;
			var sessionHouseRent = <%=session.getAttribute("houseRent")%>;
			var sessionEquid = <%=session.getAttribute("equid")%>
			
			
			
			var spanArrow = $(".glyphicon-chevron-up"); 
			var advencedSearch = $( "#advencedSearch" );
			var effect = $( "#effect" );
			var leftMenu = $("#leftMenu");
			var path = "<%=request.getContextPath()%>";
			var city = $("#city");
			var borough = $("#borough");
			var houseForm= $("#houseForm");
			var houseType= $("#houseType");
			var houseSize = $("#houseSize");
			var houseTitle = $("#houstTitle");
			var BoroughInit = 0;
			var radioButtons = $("input:radio[name='houseRent']");
			var chkboxButtions = $("#equid input:checkbox");
			var indexCheck = "<%=request.getRequestURI()%>" == "/hermit/index.jsp" | "<%=request.getRequestURI()%>" == "/hermit/";
			var showSearch = $("#showSearch");
			var cityOpt;
			function getCity(){  
				$.post(path+"/CityServlet.do",{"action":"getAllCity"},function(data){
					var cityData = $.parseJSON(data).list;
					city.empty();
					
					$.each(cityData,function(index,value){
						var opt = $("<option></option>").text(value.cityName);
						opt.val(value.cityNO)
						city.append(opt); 
						if(sessionCityNO != -1 && (sessionCityNO == value.cityNO)){
							showSearch.append( $("<span></span>").html(value.cityName+"&nbsp;&nbsp;&nbsp;"));
						}
					})
					if(sessionCityNO != null && (!indexCheck)){
						city.val(sessionCityNO);
					}
					getBorough();
				});
			}
			function getBorough(){
				$.post(path+"/BoroughsServlet.do",{"action":"getAllBoroughByCity","cityNO":city.val()},function(data){
					var boroughData = $.parseJSON(data).list;
					borough.empty();
					borough.append($("<option></option>").text("> 鄉鎮區 <").val(-1));
					$.each(boroughData,function(index,value){
						var opt = $("<option></option>").text(value.boroughName);
						opt.val(value.boroughNO)
						borough.append(opt); 
						if(sessionBoroughNO != -1 && (sessionBoroughNO == value.boroughNO)){
							showSearch.append( $("<span></span>").html(value.boroughName+"&nbsp;&nbsp;&nbsp;"));
						}
					})
					if(sessionBoroughNO != null && BoroughInit == 0  && (!indexCheck)){
						borough.val(sessionBoroughNO);
					}
				});
			}
			
			if(indexCheck){
				$(".breadBox").hide();
			}else{
				$(".breadBox").show();
			}
			function showBread(){
				showSearch.empty();
				if(sessionHouseTitle != 'null' && sessionHouseTitle != '' && ((sessionHouseTitle.replace(' ','').lenght) != 0)){
					showSearch.append( $("<span></span>").html(sessionHouseTitle+"&nbsp;&nbsp;&nbsp;") );
				}
				
			}
			showBread();
			
			
			
			
			
			function runEffect(){
				effect.toggle( "blind",  500 );
				if(spanArrow.attr('class') == "glyphicon glyphicon-chevron-down"){
					spanArrow.attr("class","glyphicon glyphicon-chevron-up");
				}else if(spanArrow.attr('class') == "glyphicon glyphicon-chevron-up"){
					spanArrow.attr("class","glyphicon glyphicon-chevron-down")
				}
			};
			
			advencedSearch.on( "click", function() {
			      runEffect();
			});
			
			if(indexCheck){
				effect.hide();
				houseTitle.val("");
				spanArrow.attr("class","glyphicon glyphicon-chevron-down")
			}
		   
		    
			
			function houseSizeShow(){
				if(sessionHouseSize != null && (!indexCheck)){
					houseSize.val(sessionHouseSize);
				}
				if(sessionHouseSize != -1 && sessionHouseSize != null){
					$.each($("#houseSize>option"),function(index,size){
						if(index == (sessionHouseSize+1)){
							showSearch.append( $("<span></span>").html(size.text+"&nbsp;&nbsp;&nbsp;") );
						}
					})
				}
			}
			function houseRentShow(){
				if(sessionHouseRent != null && sessionHouseRent != -1 && (!indexCheck)){
					$.each(radioButtons,function(index,button){
						if(index == sessionHouseRent){
							button.checked = true;
							showSearch.append( $("<span></span>").html(button.id+"&nbsp;&nbsp;&nbsp;"));
						}
					})
				}
			}
			function equidShowBread(){	
				if(!indexCheck){
					$.each(sessionEquid,function(key,value){
						if(value){
							$.each(chkboxButtions,function(index,box){
								if(key == box.name){
									box.checked = true;
									showSearch.append( $("<span></span>").html(box.id+"&nbsp;&nbsp;&nbsp;") );
								}
							})
						}
					})
				}
			}
// 			初始化下拉選單
			$("#clearCheckBox").on("click",function(){
				$.each(chkboxButtions,function(index,box){
					box.checked = false;
				})
				$.each(radioButtons,function(index,button){
					
					if(index == 0){
						button.checked = true;
					}else{
						button.checked = false;
					}
				})
				city.val(1);
				borough.val(-1);
				houseForm.val(-1);
				houseType.val(-1);
				houseSize.val(-1);
			})
			city.on("change",function(){
				BoroughInit = 1;
				getBorough();
				borough.val(-1);
				
			})
			function getForm(){
				 $.post(path+"/HouseFormServlet.do",{"action":"getAllForm"},function(data){
						var formData = $.parseJSON(data).list;
						houseForm.empty();
						houseForm.append($("<option></option>").text("> 房屋型態 <").val(-1));
							$.each(formData,function(index,value){
								var opt = $("<option></option>").text(value.hForm);
								opt.val(value.formNO);
								houseForm.append(opt);
								if(sessionFormNO != -1 && (sessionFormNO == value.formNO)){
									showSearch.append( $("<span></span>").html(value.hForm+"&nbsp;&nbsp;&nbsp;"));
								}
							})
						if(sessionFormNO != null && (!indexCheck)){
							houseForm.val(sessionFormNO);			
						}
				    })
				}
				function getType(){
				    $.post(path+"/HouseTypeServlet.do",{"action":"getAllType"},function(data){
						var typeData = $.parseJSON(data).list;
						houseType.empty();
						houseType.append($("<option></option>").text("> 房屋類型 <").val(-1));
						$.each(typeData,function(index,value){
							var opt = $("<option></option>").text(value.hType);
							opt.val(value.typeNO);
							houseType.append(opt);	
							if(sessionTypeNO != -1 && (sessionTypeNO == value.typeNO)){
								showSearch.append( $("<span></span>").html(value.hType+"&nbsp;&nbsp;&nbsp;"));
							}
						})
						if(sessionTypeNO != null && (!indexCheck)){
							houseType.val(sessionTypeNO);			
						}
				    })
				}
			getCity();	
			getType();
			getForm();
			houseRentShow();
			equidShowBread();
			houseSizeShow();
			
			
//			送出查詢條件			
		
			$("#submit").on("click",function(){
				var jsonStr = JSON.stringify({
						TV:$("#equid label input[name='TV']").prop('checked'),
						aircondition:$("#equid label input[name='aircondition']").prop('checked'),
						refrigerator:$("#equid label input[name='refrigerator']").prop('checked'),
						waterHeater:$("#equid label input[name='waterHeater']").prop('checked'),
						gas:$("#equid label input[name='gas']").prop('checked'),
						theFourthStation:$("#equid label input[name='theFourthStation']").prop('checked'),
						net:$("#equid label input[name='net']").prop('checked'),
						washing:$("#equid label input[name='washing']").prop('checked'),
						bed:$("#equid label input[name='bed']").prop('checked'),
						wardrobe:$("#equid label input[name='wardrobe']").prop('checked'),
						sofa:$("#equid label input[name='sofa']").prop('checked'),
						parking:$("#equid label input[name='parking']").prop('checked'),
						elevator:$("#equid label input[name='elevator']").prop('checked'),
						balcony:$("#equid label input[name='balcony']").prop('checked'),
						permitCook:$("#equid label input[name='permitCook']").prop('checked'),
						pet:$("#equid label input[name='pet']").prop('checked'),
						closeMRT:$("#equid label input[name='closeMRT']").prop('checked'),	
				});
				var searchStr = {
						houseTitle:houseTitle.val(),
						cityNO:city.val(),
						boroughNO:borough.val(),
						typeNO:houseType.val(),
						formNO:houseForm.val(),
						houseSize:houseSize.val(),
						houseRent:radioButtons.index(radioButtons.filter(':checked')),
						equid:jsonStr
				};
			$.post("<%=request.getContextPath()%>/AdvancedSearch",searchStr,function(data){
					location.replace("<%=request.getContextPath()%>/search.jsp");
				})
			});		
		});

		function openLeftMenu() {
			document.getElementById("leftMenu").style.display = "block";
			}
		function closeLeftMenu() {
			document.getElementById("leftMenu").style.display = "none";
			}
		
		
		// 更新驗證碼
		function refresh() {
		document.getElementById("image").src = "<%=request.getContextPath()%>/MemberLogin/Image.jsp?"
				+ new Date();
		}
		// 登入判斷
		$(document).ready(function(){
			// 登入資訊用-start
			var $form_modal = $('.cd-user-modal'),
			$form_login = $form_modal.find('#cd-login'),
			$form_signup = $form_modal.find('#cd-signup'),
			$form_forgot_password = $form_modal.find('#cd-reset-password'),
			$form_modal_tab = $('.cd-switcher'),
			$tab_login = $form_modal_tab.children('li').eq(0).children('a'),
			$tab_signup = $form_modal_tab.children('li').eq(1).children('a'),
			$forgot_password_link = $form_login.find('.cd-form-bottom-message a'),
			$back_to_login_link = $form_forgot_password.find('.cd-form-bottom-message a'),
			$main_nav = $('.main-nav');
			// 登入資訊用-end
			
			$("#submitBtn").click(function(){
				var box;
				// 清除錯誤訊息
				$("#putacc").text("");
				$("#putpwd").text("");
				$("#putver").text("");
				$("#loginErr").text("");
				if($("#remember").prop("checked")){
					box = "on";
				}
				
			// 登入後判斷是否是驗證會員
			$.post('<%=request.getContextPath()%>/Login/memlogin.do?action=login',{account:$("#account").val(),pwd:$("#pwd").val(),code:$("#code").val(),remember:box},function(data){
				
				var header1 = data.split("*")[0];
				var header2 = data.split("*")[1];
				if(header1 == "ok"){
					window.location = header2;
					location.reload();
				}
				
				var datas = data.split(";");
				for(var d of datas){
					var s = d.split(".")[0];
					var a = d.split(".")[1];
					if(s == "1"){
						$("#putacc").text(a);
					}else if(s == "2"){
						$("#putpwd").text(a);
					}else if(s == "3"){
						$("#putver").text(a);
					}else if(s == "4"){
						$("#putver").text(a);
					}else if(s=="5"){
						$("#loginErr").text(a);
					}else if(s=="6"){
						alert(a);
						window.location = "<%=request.getContextPath()%>/member.do?memAccount="+$("#account").val()+"&action=checkAgain";
						}
					}
				})
			})
			
			// 送出重設密碼連結
			$("#submitReset").click(function(){
				$("#submitReset").prop("disabled",true);
				// 清除錯誤訊息
				$("#reseterror").text("");
				$.post('<%=request.getContextPath()%>/Login/forgotpwd.do',{account:$("#resetAccount").val()},function(data){
					if(data == "此帳號不存在！"){
						$("#reseterror").text(data);
						$("#submitReset").prop("disabled",false);
					}else{
						alert(data);
						window.location = "<%=request.getContextPath()%>/index.jsp";
					}
				})			
			})
			
			// 進入會員中心前判斷是否已登入
			$("#mbi").click(function(event){
				event.preventDefault();
				$.post('<%=request.getContextPath()%>/Login/memlogin.do',{"action":"check"},function(data){
					if(data=="OK"){
						window.location = "<%=request.getContextPath()%>/memberbackstage/mem_back_index.jsp?action=check";
					}else if(data=="NO"){
						$main_nav.children('ul').removeClass('is-visible');
						$form_modal.addClass('is-visible');	
						$form_login.addClass('is-selected');
						$form_signup.removeClass('is-selected');
						$form_forgot_password.removeClass('is-selected');
						$tab_login.addClass('selected');
						$tab_signup.removeClass('selected');
						return;
					}
				})
			})
			
			// 進入收藏前判斷是否已登入
			$("#mbf").click(function(event){
				event.preventDefault();
				$.post('<%=request.getContextPath()%>/Login/memlogin.do',{"action":"check"},function(data){
					if(data=="OK"){
						window.location = "<%=request.getContextPath()%>/memberbackstage/mem_back_favorite.jsp?action=check";
					}else if(data=="NO"){
						$main_nav.children('ul').removeClass('is-visible');
						$form_modal.addClass('is-visible');	
						$form_login.addClass('is-selected');
						$form_signup.removeClass('is-selected');
						$form_forgot_password.removeClass('is-selected');
						$tab_login.addClass('selected');
						$tab_signup.removeClass('selected');
						return;
					}
				})
			})

			// 進入預約前判斷是否已登入
			$("#mbc").click(function(event){
				event.preventDefault();
				$.post('<%=request.getContextPath()%>/Login/memlogin.do',{"action":"check"},function(data){
					if(data=="OK"){
						window.location = "<%=request.getContextPath()%>/memberbackstage/mem_back_calendar.jsp?action=check";
					}else if(data=="NO"){
						$main_nav.children('ul').removeClass('is-visible');
						$form_modal.addClass('is-visible');	
						$form_login.addClass('is-selected');
						$form_signup.removeClass('is-selected');
						$form_forgot_password.removeClass('is-selected');
						$tab_login.addClass('selected');
						$tab_signup.removeClass('selected');
						return;
					}
				})
			})
			
			// 進入Q&A前判斷是否已登入
			$("#mbq").click(function(event){
				event.preventDefault();
				$.post('<%=request.getContextPath()%>/Login/memlogin.do',{"action":"check"},function(data){
					if(data=="OK"){
						window.location = "<%=request.getContextPath()%>/memberbackstage/mem_back_qanda.jsp?action=check";
					}else if(data=="NO"){
						$main_nav.children('ul').removeClass('is-visible');
						$form_modal.addClass('is-visible');	
						$form_login.addClass('is-selected');
						$form_signup.removeClass('is-selected');
						$form_forgot_password.removeClass('is-selected');
						$tab_login.addClass('selected');
						$tab_signup.removeClass('selected');
						return;
					}
				})
			})
			
			// 進入租賃紀錄前判斷是否已登入
			$("#mbl").click(function(event){
				event.preventDefault();
				$.post('<%=request.getContextPath()%>/Login/memlogin.do',{"action":"check"},function(data){
					if(data=="OK"){
						window.location = "<%=request.getContextPath()%>/LeaseServlet.do?action=getAllLease&memNO=${LoginOK.memNO}";
					}else if(data=="NO"){
						$main_nav.children('ul').removeClass('is-visible');
						$form_modal.addClass('is-visible');	
						$form_login.addClass('is-selected');
						$form_signup.removeClass('is-selected');
						$form_forgot_password.removeClass('is-selected');
						$tab_login.addClass('selected');
						$tab_signup.removeClass('selected');
						return;
					}
				})
			})
		// 登入判斷結束
		})
				
				
		$(function(){
		
		var G_CLIENT_ID = "538877171960-djc145ihldt91ec28hajlt5m66sis16g.apps.googleusercontent.com";
		var G_REDIRECT_URL = "http://localhost:8081/hermit/identity.do?action=google_login_Action";
		var G_SCOPE = 'https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile';
		
		var F_CLIENT_ID = "1719931494697481";
		var F_REDIRECT_URL = "http://localhost:8081/hermit/identity.do?action=facebook_login_Action";
		var F_SCOPE = 'email';
		
		
		$("#google").click(function(){
			window.location='https://accounts.google.com/o/oauth2/auth?response_type=code&state=/profile&client_id='+G_CLIENT_ID+'&redirect_uri='+G_REDIRECT_URL+'&scope='+G_SCOPE;
		})
		
		$("#facebook").click(function(){
			window.location='https://www.facebook.com/v2.10/dialog/oauth?response_type=code&state=/profile&client_id='+F_CLIENT_ID+'&redirect_uri='+F_REDIRECT_URL+'&scope='+F_SCOPE;
		})
	})
	</script>
</body>
</html>