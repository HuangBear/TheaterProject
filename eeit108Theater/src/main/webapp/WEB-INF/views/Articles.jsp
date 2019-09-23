<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Articles</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css'  type="text/css" />
</head>
<body>
    <div style="text-align:center" class="jumbotron">
	   <h1>${title}</h1>
	   <p>${subtitle}</p>
    </div>
    <hr style="height:1px;border:none;color:#333;background-color:#333;">
    <a href="<spring:url value='/add' />"
    							class="btn btn-primary btn-lg" style="font-size: 16px">發文</a><BR>

    <section class="container">
        <div class="row">
          <c:forEach var='Article' items='${Articles}'>
            <div class="col-sm-6 col-md-3" style="width: 900px; height: 90px">
                <div class="thumbnail" style="width: 900px; height: 90px">
                    <div class="caption">
                        
                        <p>
                        	<a href="<spring:url value='/Article?id=${Article.no}' />"
    							class="btn btn-primary btn-lg btn-block" style="font-size: 16px">
    							<span class="glyphicon-info-sigh glyphicon"></span>
    							${Article.title} 
    							發文者 : ${Article.author.name} 
    							發文時間: ${Article.postTime}
 							</a>
                        </p>
                    </div>
                </div>
            </div>
          </c:forEach>
        </div>
        </section>
</body>
</html>
