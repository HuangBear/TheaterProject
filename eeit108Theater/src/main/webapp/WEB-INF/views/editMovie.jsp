<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<script src = "http://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">
fieldset {
	border: 1px solid rgb(255, 232, 57);
	width: 400px;
	margin: auto;
}
</style>
<title>Products</title>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css'  type="text/css" />
</head>
<body>
	<form:form method="POST" enctype="multipart/form-data" modelAttribute ='former'>
   <table>
    <tr>
        <td><label>片名：</label></td>
        <td><form:input path="movieName" type = 'text' id = "movieName" value = "${former.movieName}"/></td>
    </tr>
    <tr>
        <td><label>導演：</label></td>
        <td><form:input path="directors" type = 'text' id = "directors" value = "${former.directors}"/></td>
    </tr>
    <tr>
        <td><label>演員：</label></td>
        <td><form:input path="casts" type = 'text' id = "casts" value = "${former.casts}"/></td>
    </tr>
    <tr>
    	<td><label>電影介紹：</label></td>
    	<td><form:input path="introduction" type = 'text' id = "introduction" value = "${former.introduction}"/></td>
    </tr>
    <tr>
    	<td><label >發行公司：</label></td>
    	<td><form:input path="company" type = 'text' id = "company" value = "${former.company}"/></td>
    </tr>
    <tr>
    	<td><label>預告片網址</label></td>
    	<td><form:input path="trailerLink" type ='text' id = "trailerLink" value = "${former.trailerLink[0]}"/></td>
    </tr>
    <tr>
    	<td><label>片長：</label></td>
    	<td><form:input path="duration" type="text" id = "duration" value = "${former.duration}"/></td>
    </tr>
    <tr>
    	<td><label>上映時間：</label></td>
    	<td><form:input path="openingDate" type="text" id = "openingDate" value = "${former.openingDate}"/></td>
    </tr>
    <tr>
    	<td><label>下檔時間：</label></td>
    	<td><form:input path="endingDate" type="text" id = "endingDate" value = "${former.endingDate}"/></td>
    </tr>
    <tr>
    	<td><label>語言：</label></td>
    	<td><form:input path="languages" type="text" id = "languages" value = "${former.languages}"/></td>
    </tr>
    <tr>
    	<td><label>種類：</label></td>
    	<td><form:input path="genres" type="text" id = "genres" value = "${former.genres}"/></td>
    </tr>
    <tr>
    	<td><label>電影劇照：</label></td>
    	<td><form:input path="uploadImage" type="file" id = "uploadImage"/></td>
    </tr>
    <tr>
    	<td><label >電影劇照：</label></td>
    	<td><img src = "<c:url value = '/getPicture/${former.no}'/>"
					style='width: 100px; height: 120px;'></td>
	</tr>
    <tr>
        <td colspan="2">
            <input type="submit" value="Submit"/>
        </td>
    </tr>
</table>

</form:form>
<script>
$(document).ready(function() {
	let type_open = $("#openingDate").attr("type");
	let type_end = $("#endingDate").attr("type");
	$("#openingDate").click(function() {
		if (type_open === "text") {
			$("#openingDate").attr("type", "date");
		} else {
			$("#openingDate").attr("type", "text");
		}
	});
	$("#endingDate").click(function() {
		if (type_end === "text") {
			$("#endingDate").attr("type", "date");
		} else {
			$("#endingDate").attr("type", "text");
		}
	});
});
</script>
</body>
</html>
