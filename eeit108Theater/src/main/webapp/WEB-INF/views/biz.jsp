<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 業務專區</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />

<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous">  
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="assets/js/jR3DCarousel.min.js"></script>


<script type="text/javascript">

		$(document).ready(function(){
			var slideImages = [ {src: 'images/frontend/biz01.jpg'},
	             		 		{src: 'images/frontend/biz02.jpg'},
	              				{src: 'images/frontend/biz03.jpg'},
	              				{src: 'images/frontend/biz04.jpg'}]
			//var jR3DCarousel;
	
		jR3DCarousel = $('.jR3DCarouselGallery').jR3DCarousel({
				width: 1210, 		/* largest allowed width */
				height: 520, 		/* largest allowed height */
				slides: slideImages /* array of images source */
		});
	
		var carouselCustomeTemplateProps =  {
	 			width: 1210, 				/* largest allowed width */
			  	height: 516, 				/* largest allowed height */
			  	slideLayout : 'fill',     /* "contain" (fit according to aspect ratio), "fill" (stretches object to fill) and "cover" (overflows box but maintains ratio) */
			  	animation: 'slide3D', 	/* slide | scroll | fade | zoomInSlide | zoomInScroll | slide3D */
			  	animationCurve: 'ease',
			  	animationDuration: 500,
			  	animationInterval: 500,
			  	slideClass: 'jR3DCarouselCustomSlide',
			  	autoplay: true,
			  	controls: true,			/* control buttons */
			  	navigation: 'circles'			/* circles | squares | '' */,
			  	perspective: 2000,
			  	rotationDirection: 'ltr',
			  	onSlideShow: slideShownCallback
		}
	
		function slideShownCallback($slide){
			console.log("Slide shown: ", $slide.find('img').attr('src'))
		}

		jR3DCarouselCustomeTemplate = $('.jR3DCarouselGalleryCustomeTemplate').jR3DCarousel(carouselCustomeTemplateProps);

  		})
</script>

<style type="text/css">

	.jR3DCarouselGallery,.jR3DCarouselGalleryCustomeTemplate {
		margin: 0 auto; /* optional - if want to center align */
	}

	.jR3DCarouselGalleryCustomeTemplate .captions{
		position: relative;
		padding: 4px 0;
		bottom: 27px;
		background: #ec1c8e;
		display:block			
	}

	.jR3DCarouselGalleryCustomeTemplate a{
		text-decoration: none;			
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
					<div class="jR3DCarouselGalleryCustomeTemplate" style="margin:auto;transition:transform 1000ms;">
						<div class="jR3DCarouselCustomSlide">
							<img src="images/frontend/biz01c.jpg" />
						</div>
			
						<div class="jR3DCarouselCustomSlide">
							<img src="images/frontend/biz02c.jpg" />			
						</div>
			
						<div class="jR3DCarouselCustomSlide">
							<img src="images/frontend/biz03c.jpg" />
						</div>
						
						<div class="jR3DCarouselCustomSlide">
							<img src="images/frontend/biz04c.jpg" />
						</div>
					</div>
				
				<br><br><br>
				<header><h2><a href="#">業務專區</a></h2></header> 
				<hr>
				<section> 
					<header>
						<h2>9/2~9/30年度最強優惠!</h2><br>
						<h4>下半年搶先購票最划算!</h4>
					</header>
					<p>包廳團劃滿百送五! 團體購票滿百送三! <br>
				                     購票優惠:單次購買團體電影優待票100張，共贈送3張免費電影優待券! <br>
				                     包廳團劃優惠:單次包廳團劃滿100張，共贈送5張免費電影優待券。 <br>
				                     詳情請洽全省威秀影城業務部 <br>
					   <br>
        		 	         注意事項： <br>
				       *買百送需購票達到百張才享優惠，50張則無優惠，威秀影城保有活動最終解釋權 <br>
				       *免費電影優待券期限兩個月，限看一般廳2D影片，逾期無效 <br>
				       *包廳團劃活動需觀賞2019/9/2-9/30之期間影片，並且付款完成才享有此優惠，所贈免費券不可使用當次場次。 <br>
				       *購買團票優惠適用於全省威秀影城 / 包廳團劃優惠花蓮區影城不適用此活動。 <br>
				       *此活動需事前與業務人員聯繫與確認訂單，週一到週五上班日購票才可享此優惠，假日與例假日購票則為滿百送二。</p>
				</section>
				<hr>
				<section> 
					<header>
						<h2>團體電影優待券【1本50張】與餐飲券</h2><br>
						<h4>一本50張，優待期限為8個月，不限場次時間</h4>
					</header>
					<p>*本券可加價使用於特殊版本電影或特殊影廳，片長150分鐘以上(含150分鐘)之電影需加價或特殊節日須另加價，加價金額請洽影城售票櫃台。 <br>
					   *本券優惠期限為八個月，逾期兌換每張需酌收手續費30元。 <br>
					   *一次購買100張加送2張免費電影優待券(期限為2個月，新片第一週不可觀賞，不適用於3D影片或特殊影廳。) <br>
					   *保障消費者權益，每張均附有足額履約保證。 <br>
					   *大量購票另有優惠(1000張以上)，歡迎來電洽詢。 <br>
					   *付款方式: 現場刷卡領票，現場付現領票或匯款後郵寄票券 <br>
					   *下單前請填寫訂購確認單並且回傳確認領票影城。 <br>
						<br>
					   *另有販售十張一本餐飲券: <br>
						經濟餐券(中杯飲品+小爆米花)一本800元 <br>
						豪華餐券(中杯飲品+小爆米花+熱狗或吉拿棒二選一)一本1200元 <br>
						詳情請洽各點業務人員。 <br>
						<br>	
						團體票價為： <br>
						◎台北地區/新竹巨城/全台通用240 元 <br>
						◎新竹大遠百/頭份尚順230元 <br>
						◎桃園地區/台中地區 220元 <br>
						◎台南遠百/高雄遠百 210元 <br>
						◎花蓮區團體票 200元</p>
				</section>
				<hr>
				<section> 
					<header>
						<h2>團體劃位/包廳服務</h2><br>
						<h4>50人以上即可享有優惠票價+優先劃位!</h4>
					</header>
					<p>團體劃位: 50人以上觀賞同場次電影(該廳部分席次)，即可享有團體價格並優先劃位 <br>
					        包廳活動: 依照影廳座位數全數包下整場影廳(價格=影廳座位數*團體票價)，開場前還可享有10分鐘廳內活動、接待桌、歡迎告示，最適合招待客戶與員工同歡的電影欣賞方式!包廳活動可另播自製影片費用另計 適用於學校班級、公司團體員工電影欣賞、家庭日、招待客戶、行銷活動...等。<br>
						<br>
						*請於7-10個工作天前來電預定 <br>
						*片長超過150分鐘或特殊節日需加價，確認後於付款前另行告知。 <br>
						*包廳團劃活動受限於片商拷貝調度，強片首二週僅能安排大廳映演。 <br>
						*團劃包廳須一人一票對號入座(無自由入座方式) <br>
						*包廳與團劃活動依現場排片為主 / 席次安排以預訂先後順序為主 <br>
						*團劃包廳活動為專屬優惠活動，出票後恕不退換，主辦單位請勿提供外食 <br>
						*週末影片，出票時間為當週三下午，須付款後才可出票 <br>
						*新片上映首週、假日與假日前一晚,需搭配可樂爆米花組合餐飲。 <br>
						-電影介紹 開放下載中 請點選上方附件(不定期更新)</p>
				</section></article>
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
		<script src="assets/js/jquery-2.1.4.min.js"></script>
		<script src="assets/js/jR3DCarousel.js"></script>
		

</body>
</html>