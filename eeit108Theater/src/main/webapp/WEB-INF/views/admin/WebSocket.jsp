<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 


<ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="empIndexA">Home</a>
          </li>
          <li class="breadcrumb-item active">即時客服系統</li>
        </ol>
        <div class="container">
  <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            	7-1 Cinema 即時客服系統</div>
          <div class="card-body">
		<div class="container-fluid" id="pageItems">
		
<!-- 			<textarea id="talkarea" -->
<!-- 				style="font-size: 1em; resize: none; color: black;" -->
<!-- 				readonly="readonly" rows="20" ></textarea> -->
<!-- 			<hr /> -->
<!-- 			<input type="text" id="talktext" size=45% style="color: black" /> -->
<!-- 			<input id="sendmsg" style="color: black" type="button" value="送出" /> -->
			
<div class="form-group">
  
  <textarea class="form-control rounded-0" id="talkarea" readonly="readonly" rows="10"></textarea>
	<hr />
			<input type="text" class="form-control rounded-0" id="talktext"  style="color: black" />
			<input id="sendmsg" class="form-control" style="color: black" type="button"   value="送出" />
</div>


	</div>
</div>
</div>
</div>
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
