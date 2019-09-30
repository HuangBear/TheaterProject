<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 

        
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="empIndexA">Home</a>
          </li>
          <li class="breadcrumb-item active">編輯電影</li>
        </ol>

       
        <!-- DataTables Example -->
        <div class="container">
      <div class="card card-register mx-auto mt-5">
      <div class="card-header">7-1 Cinema 編輯電影</div>
      <div class="card-body">
        <form:form method="POST" enctype="multipart/form-data" action = 'movie_edit' modelAttribute ='former'>
        <div class="form-group">    
                <div class="form-label-group">
                  <form:input type="hidden" id="no" class="form-control" 
                  placeholder="no" required="required" autofocus="autofocus" path ='no' value = "${former.no}"/>
                  <label for="no">編號</label>
                </div>
         </div>
          <div class="form-group">    
                <div class="form-label-group">
                  <form:input type="text" id="movieName" class="form-control" 
                  placeholder="movieName" required="required" autofocus="autofocus" path='movieName' value = "${former.movieName}"/>
                  <label for="movieName">片名</label>
                </div>
         </div>
           
           <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="directors" class="form-control" 
              placeholder="directors" required="required" path='directors' value = "${former.directors}"/>
              <label for="directors">導演</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="casts" class="form-control" 
              placeholder="casts" required="required" path='casts' value = "${former.casts}"/>
              <label for="casts">演員</label>
            </div>
          </div>
      	<div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="duration" class="form-control" 
              placeholder="duration" required="required" path='duration' value = "${former.duration}"/>
              <label for="duration">片長</label>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="engMovieName" class="form-control" 
              placeholder="engMovieName" required="required" path ='engMovieName' value = "${former.engMovieName}"/>
              <label for="engMovieName">英文片名</label>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="openingDate" class="form-control" 
              placeholder="openingDate" required="required" path ='openingDate' value = "${former.openingDate}"/>
              <label for="openingDate">上映時間</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="endingDate" class="form-control" 
              placeholder="endingDate" required="required" path ='endingDate' value = "${former.endingDate}"/>
              <label for="endingDate">下檔時間</label>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="genres" class="form-control" 
              placeholder="genres" required="required" path='genres' value = "${former.genres}"/>
              <label for="genres">種類</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="languages" class="form-control" 
              placeholder="languages" required="required" path ='languages' value = "${former.languages}"/>
              <label for="languages">語言</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type = 'text' id="introduction" class="form-control" 
              placeholder="introduction" required="required" path ='introduction' value = "${former.introduction}"/>
              <label for="introduction"></label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="rating" class="form-control" 
              placeholder="rating" required="required" path ='rating' value = "${former.rating}"/>
              <label for="rating">分級</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="trailerLink" class="form-control" 
              placeholder="trailerLink" required="required" path ='trailerLink' value = "${former.trailerLink[0]}"/>
              <label for="trailerLink">預告片</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="company" class="form-control" 
              placeholder="company" required="required" path = 'company' value = "${former.company}"/>
              <label for="company">發行公司</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="file" id="uploadImage" class="form-control" 
              placeholder="uploadImage" path = 'uploadImage'/>
              <label for="uploadImage">劇照</label>
            </div>
          </div>
          <button type="submit" class="btn btn-primary">送出</button>
          <button type="reset" class="btn btn-primary">重填</button><br><hr>
          <button type="button" id="oneSet"  class="btn btn-success">一鍵填入</button>

       
				
        </form:form>
       </div>

      </div>
      </div>
      

    <script>
	
    
    $(".itemTag2").click(function() {
    	
    	var pk = $(this).attr("id");
    	//var pquantity = $(this).val();
    	$.ajax({
    		url : "<c:url value='/admin/updateEMP'/>",
    		data : {
    			pk : pk,
    			//quantity : pquantity
    		},
    		type : "GET",
    		success : function(data) {
    			$("#pageItems").html(data);
    		}
    	});
        });
    
	
	</script>
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
     
     
   
