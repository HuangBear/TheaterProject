<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = 'c' uri = 'http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix = 'spring' uri = 'http://www.springframework.org/tags' %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class = 'caption' style = 'width: 500px; height: 1000px; margin: 200px; border: solid 1px; float: left;'>
		<div  style = 'width: 130px; height: 310px; margin: 0 8px 15px 8px; float: left; display: flow; text-align:center;'>
		<img src = "<c:url value = '/getPicture/${movie.no}'/>" style = 'width: 100px; height: 120px; margin: 8px;'><br>
		<table>
			<tr>
				<td style = 'font-size: 16px; background-color: pink;'>${movie.movieName}</td>
			</tr>
			<tr>
				<td style = 'font-size: 16px;'>${movie.casts}</td>
			</tr>
			<tr>
				<td style = 'font-size: 16px;'>${movie.directors}</td>
			</tr>
			<tr>
				<td style = 'font-size: 16px;'>${movie.openingDate}</td>
			</tr>
			<tr>
				<td style = 'font-size: 16px;'>${movie.duration} 分 </td>
			</tr>
			<tr>
				<td>${movie.trailerLink}</td>
			</tr>
<%-- 		<span>演員</span><b style = 'font-size:16px;'>${movie.casts}</b><br> --%>
<%-- 		<span>導演</span><b style = 'font-size:16px;'>${movie.directors}</b><br> --%>
<%-- 		<span>上映時間</span><b style = 'font-size:16px;'>${movie.openingDate}</b><br> --%>
<%-- 		<span>片長</span><b style = 'font-size:16px;'>${movie.duration} 分</b><br> --%>
		</table>
	</div>
	</div>
</body>
</html>