<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

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
	<form:form method="POST" modelAttribute = 'movieBean' enctype="multipart/form-data">
   <table>
    <tr>
        <td><form:label path="movieName">片名：</form:label></td>
        <td><form:input path="movieName" type = 'text' /></td>
    </tr>
    <tr>
        <td><form:label path="directors">導演：</form:label></td>
        <td><form:input path="directors" type = 'text'/></td>
    </tr>
    <tr>
        <td><form:label path="casts">演員：</form:label></td>
        <td><form:input path="casts" type = 'text'/></td>
    </tr>
    <tr>
    	<td><form:label path="introduction">電影介紹：</form:label></td>
    	<td><form:input path="introduction" type = 'text'/></td>
    </tr>
    <tr>
    	<td><form:label path="company">發行公司：</form:label></td>
    	<td><form:input path="company" type = 'text'/></td>
    </tr>
    <tr>
    	<td><form:label path="trailerLink">預告片網址</form:label></td>
    	<td><form:input path="trailerLink" type ='text'/></td>
    </tr>
    <tr>
    	<td><form:label path="duration">片長：</form:label></td>
    	<td><form:input path="duration" type="text"/></td>
    </tr>
    <tr>
    	<td><form:label path="openingDate">上映時間：</form:label></td>
    	<td><form:input path="openingDate" type="date"></form:input></td>
    </tr>
    <tr>
    	<td><form:label path="endingDate">下檔時間：</form:label></td>
    	<td><form:input path="endingDate" type="date"></form:input></td>
    </tr>
    <tr>
    	<td><form:label path="languages">語言：</form:label></td>
    	<td><form:input path="languages" type="text"></form:input></td>
    </tr>
    <tr>
    	<td><form:label path="genres">種類：</form:label></td>
    	<td><form:input path="genres" type="text"></form:input></td>
    </tr>
    <tr>
    	<td><form:label path="uploadImage">電影劇照：</form:label></td>
    	<td><form:input path="uploadImage" type="file"></form:input></td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="submit" value="Submit"/>
        </td>
    </tr>
</table>  
</form:form>
</body>
</html>
