<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>



<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>7-1 Cinema</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/admin/sb-admin.css" rel="stylesheet">


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Page level plugin JavaScript-->
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="vendor/datatables/jquery.dataTables.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/admin/sb-admin.min.js"></script>

<!-- Demo scripts for this page-->
<script src="js/admin/demo/datatables-demo.js"></script>
<script src="js/admin/demo/chart-area-demo.js"></script>
<script>
	$(function() {
		$(".itemTag").click(function() {

			var link = $(this).attr("id");
			//var pquantity = $(this).val();
			$.ajax({
				url : "<c:url value='/admin/updatePage'/>",
				data : {
					url : link,
				},
				type : "GET",
				success : function(data) {
					$("#pageItems").html(data);
				}
			});
		});

	});
</script>
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/admin/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

	<jsp:include page="/WEB-INF/views/admin/Header.jsp" />
	<!-- -------------------------------------------以上Header---------------------------------------------- -->

	<!-- 內文區 -->
	<div id="wrapper">

		<!-- 插入Sidebar -->

		<jsp:include page="/WEB-INF/views/admin/empSidebar.jsp" />

		<!-- 內文修飾照片一張 -->

		<div id="content-wrapper">
			<div class="container-fluid">
				<div
					style="height: 200px; background-image: url(images/admin/CINEMA01_1.jpg); background-position: center; background-size: cover;"></div>
			</div>
			<!-- 內文放在這個下面-->
			<!-- ------------------------------------------------------------------------------------------------- -->

			<div class="container-fluid" id="pageItems">
				<%--      <jsp:include page="/WEB-INF/views/admin/empTableList.jsp" /> --%>
				<p>
					<span>首頁文章 放置處</span>
				</p>
				<p>
					<span>${error}</span>
				</p>
			</div>




			<!-- ------------------------------------------------------------------------------------------------- -->
			<!-- 內文放在這個上面 -->

		</div>
		<!-- /.content-wrapper -->
	</div>
	<!-- /#wrapper -->
	<!-- ------------------------------------------以下Footer-------------------------------------------------- -->

	<jsp:include page="/WEB-INF/views/admin/Footer.jsp" />
	<script>
		$(function() {
			openWebsocket();

		});

		function openWebsocket() {
			var area = document.getElementById('talkarea');
			var text = document.getElementById('talktext');
			var websocket = new WebSocket("ws://" + location.host
					+ "/eeit108Theater/websocket.do");

			websocket.onopen = function(evt) {

			};

			websocket.onmessage = function(message) {
				var jsonData = JSON.parse(message.data);
				if (jsonData.message != null) {
					area.value += jsonData.message + "\n";
				}
			};

			websocket.onclose = function(evt) {
				websocket.close();
			};

			websocket.onerror = function(evt) {
				websocket.close();
			};

			$('#sendmsg').click(function() {
				websocket.send(text.value);
				text.value = "";
			});
		}
	</script>
</body>

</html>
