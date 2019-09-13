<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='spring' uri='http://www.springframework.org/tags'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.title {
		font-size: 16px;
		width: 100px;
		color: red; 
	}
	.content {
		font-size: 16px;
		width : 300px;
	}
</style>
</head>
<body>
	<div class='caption'
		style='width: 500px; height: 1000px; margin: 200px; border: solid 1px; float: left;'>
		<div
			style='width: 130px; height: 310px; margin: 0 8px 15px 8px; display: flow;'>
			<img src="<c:url value = '/getPicture/${movie.no}'/>"
				style='width: 150px; height: 180px; margin: 8px; float: left;'>
			<b style = 'font-size: 16px;'>${movie.movieName}</b><br>
			<div class = 'title'>導演</div>
			<div class = 'content'>${movie.directors}</div>
					
					
			<iframe width="560" height="315"
					src= "${link}"
					frameborder="0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
		</div>
	</div>
	<div class='caption'
		style='width: 700px; height: 1000px; margin: 100px; border: solid 1px; float: left;'>
		<c:forEach var = 'time' items = '${times}'>
			<div>
				<b style = 'font-size: 16px;'>${time.movieName}</b><br>
				<button type = 'button'><fmt:formatDate value="${time.startTime}" pattern='HH:mm'/></button>
			</div>
		</c:forEach>	
	</div>
	<div style = 'border: solid 1px black;'>
	<c:forEach var = 'hihi' items = '${hi}'>
		<b style = 'font-size: 16px;'>${hihi}</b>
	</c:forEach>
	</div>
</body>
</html>