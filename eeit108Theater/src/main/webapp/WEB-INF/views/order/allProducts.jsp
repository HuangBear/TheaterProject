<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show All Products</title>
</head>
<body>
	<c:forEach var="product" items="${products}">
		<div style="display: inline-block">
			<ul>
				<li>NO. = ${product.no}</li>
				<li>Available = ${product.available}</li>
				<li>Name = ${product.name}</li>
				<li>Price = ${product.price}</li>
				<li>Type = ${product.type}</li>
			</ul>
		</div>
	</c:forEach>
</body>
</html>