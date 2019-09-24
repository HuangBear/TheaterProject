<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 


<div class="container-fluid" id="pageItems">
		
			<textarea id="talkarea"
				style="font-size: 1em; resize: none; color: black;"
				readonly="readonly" rows="20em" cols=190%></textarea>
			<hr />
			<input type="text" id="talktext" size=180% style="color: black" /><input
				id="sendmsg" style="color: black" type="button" value="送出" />


<!-- 		 <div class="card card-prirary cardutline direct-chat direct-chat-primary"> -->
<!--               <div class="card-header"> -->
<!--                 <h3 class="card-title">Direct Chat</h3> -->

<!--                 <div class="card-tools"> -->
<!--                   <span data-toggle="tooltip" title="3 New Messages" class="badge bg-primary">3</span> -->
<!--                   <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i> -->
<!--                   </button> -->
<!--                   <button type="button" class="btn btn-tool" data-toggle="tooltip" title="Contacts" -->
<!--                           data-widget="chat-pane-toggle"> -->
<!--                     <i class="fas fa-comments"></i></button> -->
<!--                   <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i> -->
<!--                   </button> -->
<!--                 </div> -->
<!--               </div> -->
<!--               /.card-header -->
<!--               <div class="card-body"> -->
<!--                 Conversations are loaded here -->
<!--                 <div class="direct-chat-messages"> -->
<!--                   Message. Default to the left -->
<!--                   <div class="direct-chat-msg"> -->
<!--                     <div class="direct-chat-infos clearfix"> -->
<!--                       <span class="direct-chat-name float-left">Alexander Pierce</span> -->
<!--                       <span class="direct-chat-timestamp float-right">23 Jan 2:00 pm</span> -->
<!--                     </div> -->
<!--                     /.direct-chat-infos -->
<!--                     <img class="direct-chat-img" src="../dist/img/user1-128x128.jpg" alt="Message User Image"> -->
<!--                     /.direct-chat-img -->
<!--                     <div class="direct-chat-text"> -->
<!--                       Is this template really for free? That's unbelievable! -->
<!--                     </div> -->
<!--                     /.direct-chat-text -->
<!--                   </div> -->
<!--                   /.direct-chat-msg -->

<!--                   Message to the right -->
<!--                   <div class="direct-chat-msg right"> -->
<!--                     <div class="direct-chat-infos clearfix"> -->
<!--                       <span class="direct-chat-name float-right">Sarah Bullock</span> -->
<!--                       <span class="direct-chat-timestamp float-left">23 Jan 2:05 pm</span> -->
<!--                     </div> -->
<!--                     /.direct-chat-infos -->
<!--                     <img class="direct-chat-img" src="../dist/img/user3-128x128.jpg" alt="Message User Image"> -->
<!--                     /.direct-chat-img -->
<!--                     <div class="direct-chat-text"> -->
<!--                       You better believe it! -->
<!--                     </div> -->
<!--                     /.direct-chat-text -->
<!--                   </div> -->
<!--                   /.direct-chat-msg -->
<!--                 </div> -->
<!--                 /.direct-chat-messages -->

<!--                 Contacts are loaded here -->
<!--                 <div class="direct-chat-contacts"> -->
<!--                   <ul class="contacts-list"> -->
<!--                     <li> -->
<!--                       <a href="#"> -->
<!--                         <img class="contacts-list-img" src="../dist/img/user1-128x128.jpg"> -->

<!--                         <div class="contacts-list-info"> -->
<!--                           <span class="contacts-list-name"> -->
<!--                             Count Dracula -->
<!--                             <small class="contacts-list-date float-right">2/28/2015</small> -->
<!--                           </span> -->
<!--                           <span class="contacts-list-msg">How have you been? I was...</span> -->
<!--                         </div> -->
<!--                         /.contacts-list-info -->
<!--                       </a> -->
<!--                     </li> -->
<!--                     End Contact Item -->
<!--                   </ul> -->
<!--                   /.contatcts-list -->
<!--                 </div> -->
<!--                 /.direct-chat-pane -->
<!--               </div> -->
<!--               /.card-body -->
<!--               <div class="card-footer"> -->
<%--                 <form action="#" method="post"> --%>
<!--                   <div class="input-group"> -->
<!--                     <input type="text" name="message" placeholder="Type Message ..." class="form-control"> -->
<!--                     <span class="input-group-append"> -->
<!--                       <button type="submit" class="btn btn-primary">Send</button> -->
<!--                     </span> -->
<!--                   </div> -->
<%--                 </form> --%>
<!--               </div> -->
<!--               /.card-footer -->
<!--             </div> -->
<!--             /.direct-chat -->
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
