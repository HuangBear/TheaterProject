<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>START</title>
</head>
<body>
	<p/>Hi! ${LoginOK.name} 
	<p/>Let's start! 
	<p/>Movie Name = ${timeTable.movie.movieName} 
	<p/>Start at = ${timeTable.startTime} 
	<p/>Duration = ${timeTable.duration}
	<form action="<c:url value='/order/showProducts'/>" method="GET">
		<label for="timeTableId">Time Table Id: </label>
		<input id="timeTableId" name="timeTableId" type="text">
		<input type="submit" value="START">
	</form>
</body>
</html>