<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='spring' uri='http://www.springframework.org/tags'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	width: 300px;
}
b {
	font-size: 16px;
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
			<b style='font-size: 16px;'>${movie.movieName}</b><br>
			<div class='title'>導演</div>
			<div class='content'>${movie.directors}</div>


			<iframe width="560" height="315" src="${link}" frameborder="0"
				allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
				allowfullscreen></iframe>
		</div>
	</div>
	<div class='caption'
		style='width: 1000px; height: 1000px; margin: 100px; border: solid 1px; float: left;'>

			
<%-- 		<b style='font-size: 16px;'>${theatersA[0].theater}</b> --%>
<%-- 		<c:forEach  var='theater' items='${theatersA}'>			 --%>
<!-- 				<button type='button'> -->
<%-- 					<fmt:formatDate value="${theater.startTime}" pattern='HH:mm' /> --%>
<!-- 				</button>			 -->
<!-- 			<br> -->
<%-- 		</c:forEach> --%>
<%-- 		<b style='font-size: 16px;'>${theatersB[0].theater}</b> --%>
<%-- 		<c:forEach  var='theater' items='${theatersB}'>			 --%>
<!-- 				<button type='button'> -->
<%-- 					<fmt:formatDate value="${theater.startTime}" pattern='HH:mm' /> --%>
<!-- 				</button>			 -->
<!-- 			<br> -->
<%-- 		</c:forEach> --%>
		
<%-- 		<c:forEach begin="0" end="1" var='theater' items='${theaters}'> --%>
<%-- 			<b style='font-size: 16px;'>${movie.movieName}</b> --%>
<%-- 			<b style='font-size: 16px;'>${theater.theater}</b> --%>
<%-- 			<c:forEach var='button' items='${theaters}'> --%>
<!-- 				<button type='button'> -->
<%-- 					<fmt:formatDate value="${button.startTime}" pattern='HH:mm' /> --%>
<!-- 				</button> -->
<%-- 			</c:forEach> --%>
<!-- 			<br> -->
<%-- 		</c:forEach> --%>
			<c:choose>
				<c:when test = '${!empty startTime0}'>
					<b>${movie.movieName}</b><b>${theater0}</b>
					<c:forEach var = 'startTime' items = '${startTime0}'>
					<button type = 'button'><fmt:formatDate value="${startTime}" pattern='HH:mm' /></button>
					</c:forEach>
					<br>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test = '${!empty startTime1}'>
					<b>${movie.movieName}</b><b>${theater1}</b>
					<c:forEach var = 'startTime' items = '${startTime1}'>
					<button type = 'button'><fmt:formatDate value="${startTime}" pattern='HH:mm' /></button>
					</c:forEach>
					<br>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test = '${!empty startTime2}'>
					<b>${movie.movieName}</b><b>${theater2}</b>
					<c:forEach var = 'startTime' items = '${startTime2}'>
					<button type = 'button'><fmt:formatDate value="${startTime}" pattern='HH:mm' /></button>
					</c:forEach>
					<br>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test = '${!empty startTime3}'>
					<b>${movie.movieName}</b><b>${theater3}</b>
					<c:forEach var = 'startTime' items = '${startTime3}'>
					<button type = 'button'><fmt:formatDate value="${startTime}" pattern='HH:mm' /></button>
					</c:forEach>
					<br>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test = '${!empty startTime4}'>
					<b>${movie.movieName}</b><b>${theater4}</b>
					<c:forEach var = 'startTime' items = '${startTime4}'>
					<button type = 'button'><fmt:formatDate value="${startTime}" pattern='HH:mm' /></button>
					</c:forEach>
					<br>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test = '${!empty startTime5}'>
					<b>${movie.movieName}</b><b>${theater5}</b>
					<c:forEach var = 'startTime' items = '${startTime5}'>
					<button type = 'button'><fmt:formatDate value="${startTime}" pattern='HH:mm' /></button>
					</c:forEach>
					<br>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test = '${!empty startTime6}'>
					<b>${movie.movieName}</b><b>${theater6}</b>
					<c:forEach var = 'startTime' items = '${startTime6}'>
					<button type = 'button'><fmt:formatDate value="${startTime}" pattern='HH:mm' /></button>
					</c:forEach>
					<br>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test = '${!empty startTime7}'>
					<b>${movie.movieName}</b><b>${theater7}</b>
					<c:forEach var = 'startTime' items = '${startTime7}'>
					<button type = 'button'><fmt:formatDate value="${startTime}" pattern='HH:mm' /></button>
					</c:forEach>
					<br>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test = '${!empty startTime8}'>
					<b>${movie.movieName}</b><b>${theater8}</b>
					<c:forEach var = 'startTime' items = '${startTime8}'>
					<button type = 'button'><fmt:formatDate value="${startTime}" pattern='HH:mm' /></button>
					</c:forEach>
					<br>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test = '${!empty startTime9}'>
					<b>${movie.movieName}</b><b>${theater9}</b>
					<c:forEach var = 'startTime' items = '${startTime9}'>
					<button type = 'button'><fmt:formatDate value="${startTime}" pattern='HH:mm' /></button>
					</c:forEach>
					<br>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
			
<%-- 			<c:if test = '${!empty startTime0}'> --%>
			
<%-- 			</c:if> --%>
<%-- 			<c:if test = '${empty startTime2}'> --%>
<%-- 			<b>${movie.movieName}</b><b>${theater2}</b> --%>
<%-- 			<c:forEach var = 'startTime' items = '${startTime2}'> --%>
<%-- 				<button type = 'button'><fmt:formatDate value="${startTime}" pattern='HH:mm' /></button> --%>
<%-- 			</c:forEach> --%>
<%-- 			</c:if> --%>
			
	</div>
	<div style='border: solid 1px black;'></div>




</body>
</html>