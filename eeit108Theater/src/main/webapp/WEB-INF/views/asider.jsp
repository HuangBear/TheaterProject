<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 

<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/jq.dice-menu.min.js"></script>   

<style>
	.foo1:hover{color:gold;}
	
	.dice-menu {padding: 0;
    			display: block;
    			position: fixed;
    			top: 25%;
    			right: 0;
				}
				
	.dice-menu li {display: block;
    				border-width: 0;
    				padding: 15px;
    				overflow: hidden;
    				background-color: #e84c3d;
    				color: #fff;
    				opacity: 0;
    				cursor: pointer;
					}
					
	.dice-menu li:first-child {opacity: .8;
								}
								   
</style>

<aside>
	<ul class="dice-menu">
  		<li><span class="fa fa-circle-o-notch"></span></li>
  		<li><span class="fa fa-comment-o" href="ticketing">立即訂票</span></li>
  		<li><span class="fa fa-envelope" href="forums">電影討論</span></li>
 		<li><span class="fa fa-qq" href="memberinfo" target="_blank">會員中心</span></li>
  		<li><span class="fa fa-weibo" href="qaservice">線上客服</span></li>
  		<li><span class="fa fa-weixin" href="#"></span></li>
  		<li><span class="fa fa-paw" href="#"></span></li>
  		<li><span href="#">12</span></li>
  		<li><span href="#">34</span></li>
	</ul>
	
		<ul class="dice-menu">
			<li><span class="fa fa-circle-o-notch"></span></li>
			<li><span class="fa fa-comment-o" href="#para2"></span></li>
			<li><span class="fa fa-envelope" href="#para3"></span></li>
			<li><span class="fa fa-coffee" href="https://www.gmail.com" target="_blank"></span></li>
			<li><span class="fa fa-cc-amex" href="https://www.yahoo.com"></span></li>
			<li><span class="fa fa-google-wallet" href="https://www.hotmail.com"></span></li>
			<li><span class="fa fa-money" href="https://www.gmail.com"></span></li>
			<li><span href="https://www.gmail.com">12</span></li>
			<li><span href="https://www.gmail.com">34</span></li>
		</ul>

</aside>