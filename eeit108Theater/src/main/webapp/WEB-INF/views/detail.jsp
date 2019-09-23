<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 電影介紹</title>
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
	.content {overflow: auto;
              width: 30%;
              padding-bottom: 0;
              border:0;
              border-top-left-radius: 20px;
              border-top-right-radius: 20px;
   		     }

</style>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let gems = document.querySelectorAll("img.gem");
            let gemsLen = gems.length;
            var is_clicked = false;
            var score = 0;
            for (let i = 0; i < gemsLen; i++) {
                gems[i].addEventListener("mouseover", function () {
                    if (!is_clicked) {
                        var j = i;
                        while (j != -1) {
                            document.getElementById(`gem${j}`).src = "images/frontend/D4.png";
                            j--;
                        }
                    }
                });
                gems[i].addEventListener("mouseout", function () {
                    if (!is_clicked) {
                        document.getElementById(`gem${i}`).src = "images/frontend/D3.png";
                    }
                });
                gems[i].addEventListener("click", function () {
                    score = i + 1;
                    if (is_clicked) {
                        var m = i;
                        var n = i + 1;
                        for (m; m >= 0; m--) {
                            document.getElementById(`gem${m}`).src = "images/frontend/D4.png";
                        }
                        for (n; n < 5; n++) {
                            document.getElementById(`gem${n}`).src = "images/frontend/D3.png";
                        }
                    }
                    is_clicked = true;
                    document.getElementById(`idsc`).innerHTML = `${score}`;
                });
            }
            document.getElementById("resetAll").addEventListener("click", function () {
                score = 0;
                is_clicked = false;
                document.getElementById(`idsc`).innerHTML = `${score}`;
                for (k = 0; k < 5; k++) {

                    document.getElementById(`gem${k}`).src = "images/frontend/D3.png";
                }
            });
            document.getElementById("submitAll").addEventListener("click", function () {
                if (score == 0) {
                    alert(`請評分後再送出。`)
                } else {
                    alert(`謝謝評分，您給的分數為${score}分。`)
                }
            });
            document.getElementById("resetZone").addEventListener("mouseover", function () {
                score = 0;
                is_clicked = false;
                document.getElementById(`idsc`).innerHTML = `${score}`;
                for (k = 0; k < 5; k++) {
                    document.getElementById(`gem${k}`).src = "images/frontend/D4.png";
                }
            });
        });

    </script>
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
						
						<section> 
							<header><h3><a href="#">電影介紹</a></h3></header>
						
						<hr />
						<div class="row gtr-50">
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/release.png"
									alt="" /></a>
							</div>
							<div class="col-8">
								<p>
								<h4><a href="#one">上映日期：</a></h4>
								<p>Release Date</p>
							</div>
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/cast.png"
									alt="" /></a>
							</div>
							<div class="col-8">
								<p>
								<h4><a href="#two">導演/主要演員：</a></h4>
								<p>Cast</p>
							</div>
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/filmlength.png"
									alt="" /></a>
							</div>
							<div class="col-8">
								<p>
								<h4><a href="#three">片長、類型：</a></h4>
								<p>Film Length / Type</p>
							</div>
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/trailer.png"
									alt="" /></a>
							</div>
							<div class="col-8">
								<p>
								<h4><a href="#four">預告片：</a></h4>
								<p>Trailer</p>
							</div>
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/introduction.png"
									alt="" /></a>
							</div>
							<div class="col-8">
								<p>
								<h4><a href="#five">劇情簡介：</a></h4>
								<p>About The Story</p>
							</div>
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/score.png"
									alt="" /></a>
							</div>
							<div class="col-8">
								<p>
								<h4><a href="#six">評分</a></h4>
								<p>Score</p>
							</div>
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/comment.png"
									alt="" /></a>
							</div>
							<div class="col-8">
								<p>
								<h4><a href="#seven">評論</a></h4>
								<p>Comment</p>
							</div>
						</div>
						<footer> 
							<a href="ticketing" class="button">立即訂票</a>
						</footer>
						</section>
					</div>
					<div class="col-8 col-12-mobile imp-mobile" id="content">
						<article id="main"> <header>
						<h2>
							<a>牠 第二章</a>
						</h2>
						<a href="ticketing" class="button">前往討論</a>
						<p>IT CHAPTER TWO</p>
						</header> <a><img src="images/frontend/now01.jpg" alt="" /></a>
						
						<section> <header>
						<h3><a name="one">上映日期：</a></h3>
						</header>
						<p>2019/09/05</p>
						</section> 
						
						<section> <header>
						<h3><a name="two">導演/主要演員：</a></h3>
						</header>
						<p>導演：安迪馬希堤(Andy Muschietti) <br>
						         演員：詹姆斯麥艾維(James McAvoy)、 傑維爾伯特(Javier Botet)、 <br>
						          潔西卡雀絲坦(Jessica Chastain)、 比爾史卡斯加德(Bill Skarsgård)、 <br>
						          比爾哈德爾(Bill Hader)</p>
						</section>
						
						<section> <header>
						<h3><a name="three">片長、類型：</a></h3>
						</header>
						<p>片長：2時49分<br>
							類型：懸疑、驚悚、恐怖</p>
						</section>
						 
						<section> <header>
						<h3><a name="four">預告片：</a></h3>
						</header>
						<p><iframe width="640" height="360" src="https://www.youtube.com/embed/-BU5z3j-bs0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>
						</section>
						 
						<section> <header>
						<h3><a name="five">劇情簡介：</a></h3>
						</header>
						<p>導演安迪馬希堤再度集結了少年版與成年版的魯蛇俱樂部成員，為了小丑潘尼懷斯，他們在27年後重回故鄉德瑞鎮。預告從貝芙莉(潔西卡雀絲坦 飾)回到德瑞鎮的故居畫面開始，赫然發現小丑潘尼懷斯並沒有被消滅，牠在27年後又回來了，正如同這個小鎮的歷史，每27年邪惡力量就會再度甦醒。於是各奔東西的魯蛇們在闊別了多年之後，再度回到這個讓他們充滿夢靨的故鄉，一同勇敢面對小丑潘尼懷斯。</p>
						</section>
						 
						<section> <header>
						<h3><a name="six">評分：</a></h3>
						</header>
						<p>
						<div class="content">
                    		<article>
                        		<form>
                                <div>
                                    <figure style="margin: auto; width:fit-content;">
                                        <!-- <img class="" src="images/blank.png" width="50" height="100" id="resetZone"> -->
                                        <img class="gem" src="images/D3.png" width="50" id="gem0">
                                        <img class="gem" src="images/D3.png" width="50" id="gem1">
                                        <img class="gem" src="images/D3.png" width="50" id="gem2">
                                        <img class="gem" src="images/D3.png" width="50" id="gem3">
                                        <img class="gem" src="images/D3.png" width="50" id="gem4">
                                        <!-- <img class="" src="images/blank.png" width="50" height="100" id=""> -->
                                    </figure>
                                </div>                                
                                <div>
                                    <script>
                                        <!--document.write(`<h2>鑽石 : <span id="idsc">0</span>倍 (全滿5倍)</h2>`)-->
                                    </script>
                                </div>
                        		</form>
                    		</article>
            			</div>
            			<div>
                            <input type="submit" name="submit" id="submitAll" value="送出">
                            <input type="reset" name="reset" id="resetAll" value="清除">
                        </div>
						</p>
						</section>
						 
						<section> <header>
						<h3><a name="seven">評論：</a></h3>
						</header>
						<p><textarea cols="100" rows="5"></textarea>
							<input type="submit" value="送出">
							<input type="reset" value="清除">
						</p>
						</section>
						  
						</article>
					</div>
				</div>
				
				<div><h6><a>其他人還看了：</a></h6></div>
				
				<hr />
			
				<div class="row">
					<p><article class="col-4 col-12-mobile special"> <a href="#"
						class="image featured"><img src="images/frontend/now03.jpg" alt="" /></a>
					<header>
					<h3>
						<a href="#">全面攻佔 3：天使救援</a>
					</h3>
					</header>
					<p>ANGEL HAS FALLEN<br>
						上映日期：2019/08/21</p>
					</article>
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
						class="image featured"><img src="images/frontend/movie5.jpg" alt="" /></a>
					<header>
					<h3>
						<a href="#">航海王：奪寶爭霸戰</a>
					</h3>
					</header>
					<p>ONE PIECE STAMPEDE<br>
						上映日期：2019/08/21</p>
					</article></p>
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