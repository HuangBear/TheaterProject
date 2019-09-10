<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Products</title>
</head>
<body>
	<div style = 'width: 80%; margin: auto;'>
    <c:forEach var='movie' items='${movies}'>
        <div style = 'background-color: pink;'>
			<div style = 'width: 130px; height: 310px; margin: 15px 8px 15px 8px; float: left; display: inline-block; text-align: center; border: 1px solid black; padding-top: 40px;'>
            	<img src = "<c:url value = '/getPicture/${movie.no}'/>" style = 'width: 100px; height: 120px;'><br>
            	<b style='font-size: 16px;'>${movie.movieName}</b><br>
            	<b style = 'font-size: 16px'>${movie.openingDate}上映</b><br>
            	<a href = "<c:url value = '/movieTimes_${movie.no}' />" >立即訂票</a>
            </div>       
        </div>
    </c:forEach>
    </div>
</body>
</html>