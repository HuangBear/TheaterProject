<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>START</title>
</head>
<body>
	<p/>Hi! ${loginMember.name} 
	<p/>Let's start! 
	<p/>Movie Name = ${timeTable.movie.movieName} 
	<p/>Start at = ${timeTable.startTime} 
	<p/>Duration = ${timeTable.duration}

	<a href="<c:url value='/order/showProducts'/>">START</a>
</body>
</html>