<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 場次查詢</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<style>
	.logo{width:15%;
		 }
		 
	.content {overflow: center;
              width: 800px;
              padding-bottom: 20px;
              border: 3px solid #797777;
              border-radius: 20px;
        	 }
        
    .title {background-color: rgb(186, 187, 187);
            line-height: 2.5em;
            color: #F0F0F0;
            /* padding-left: 20px; */
            text-align: center;
            border-radius: 20px;
           }
        
    .div1 {width: 720px;
           margin:2% 0%;
           text-align: center;
           }
           
    .div2 {width: 720px;
           margin:2% 0%;
           text-align: left;
           }           

    .div3 {width: 720px;
           text-align: center;
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

			<center>
			<div class="container">
				<article id="main" class="special"> <header>

				</header> <a href="#" class="logo"><img src="images/frontend/716logo.png" alt="" /></a>
				
	
					<div class="content">
                	<article>
                   		<h2 class="title">場次查詢</h2>
                   			<p>牠 第二章 (輔) <br>
                   				IMAX影廳 <br>
                   				片長：2時49分</p>
							<hr>                 	
                        	<div class="div1" id="links">
                        		請選擇時間：
                            	<select name="請選擇電影名稱" length="10">
									<option value="0">--請選擇時間--</option>
									<option value="1">10:30</option>
									<option value="2">14:30</option>
									<option value="3">18:30</option>
								</select>
                        		<br>
                        		<br>
                        		<br>
                        		請選擇數量：
                            	<select name="請選擇查詢廳次" length="10">
									<option value="0">--請選擇票種--</option>
									<option value="1">單人套餐一張</option>
									<option value="2">雙人套餐兩張</option>
									<option value="3">雙人豪華套餐兩張</option>
								</select>	
                        	</div>
							<hr>
						<div class="div2">
							場次開放時間說明：<br>
							1.週五上映之電影，新場次公布於每週三中午12:00~下午18:00，開放未來一週(即當週的星期五至下週星期四為止)之場次。<br>
							2.週三上映之電影，新場次公布於每週一晚上20:00~22:00，開放週三、週四之場次。<br>
							3.其他因預售活動或特殊假期、特殊開片日之電影，將另行公告場次開放時間。	
                    	</div>
                    </div>
                    <br>
                        <div class="div3">
                           	<a href="seat"><input type="submit" value="送出"></a>
                           	<input type="reset" value="清除">
                       	</div>
                	</article>
            	</div>
				</center>	
					
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
</body>
</html>