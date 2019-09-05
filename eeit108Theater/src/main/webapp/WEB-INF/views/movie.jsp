<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Products</title>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css'  type="text/css" />
</head>
<body>
    <c:forEach var='movie' items='${movies}'>
        <div class="caption">
			<div style = 'width: 700px; height: 700px;'>
            	<img src = '${movie.movieImage}'>
            	<b style='font-size: 16px;'>${movie.movieName}</b>
            	<b style = 'font-size: 16px;'>${movie.trailerLink}</b>
            	<b style = 'font-size: 16px;'>${movie.casts}</b>
            	
            </div>         
        </div>    
    </c:forEach>
</body>
</html>