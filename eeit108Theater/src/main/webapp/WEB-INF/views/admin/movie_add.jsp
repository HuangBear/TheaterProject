<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 

        
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="empIndexA">Home</a>
          </li>
          <li class="breadcrumb-item active">新增電影</li>
        </ol>

       
        <!-- DataTables Example -->
        <div class="container">
      <div class="card card-register mx-auto mt-5">
      <div class="card-header">7-1 Cinema 新增電影</div>
      <div class="card-body">
        <form:form method="POST" action="movie_add" modelAttribute="movieBean">
        
          <div class="form-group">    
                <div class="form-label-group">
                  <form:input type="text" id="movieName" class="form-control" 
                  placeholder="movieName" required="required" autofocus="autofocus" path="movieName"/>
                  <label for="movieName">片名</label>
                </div>
         </div>
           
           <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="directors" class="form-control" 
              placeholder="directors" required="required" path="directors"/>
              <label for="directors">導演</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="casts" class="form-control" 
              placeholder="casts" required="required" path="casts"/>
              <label for="casts">演員</label>
            </div>
          </div>
      	<div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="duration" class="form-control" 
              placeholder="duration" required="required" path="duration"/>
              <label for="duration">片長</label>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="engMovieName" class="form-control" 
              placeholder="engMovieName" required="required" path="engMovieName"/>
              <label for="engMovieName">英文片名</label>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="date" id="openingDate" class="form-control" 
              placeholder="openingDate" required="required" path="openingDate"/>
              <label for="openingDate">上映時間</label>
            </div>
          </div>
          
           
          
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="date" id="endingDate" class="form-control" 
              placeholder="endingDate" required="required" path="endingDate"/>
              <label for="endingDate">下檔時間</label>
            </div>
          </div>
          
         
          
          <div class="form-group">    
          	<div class="form-label-group">
            	<form:input type="text" id="movieName" class="form-control" 
                  placeholder="movieName" required="required" autofocus="autofocus" path="movieName"/>
                  <label for="movieName">片名</label>
                </div>
         </div>
          
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="genres" class="form-control" 
              placeholder="genres" required="required" path="genres"/>
              <label for="genres">種類</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="languages" class="form-control" 
              placeholder="languages" required="required" path="languages"/>
              <label for="languages">語言</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="introduction" class="form-control" 
              placeholder="introduction" required="required" path="introduction"/>
              <label for="introduction">簡介</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="rating" class="form-control" 
              placeholder="rating" required="required" path="rating"/>
              <label for="rating">分級</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="trailerLink" class="form-control" 
              placeholder="trailerLink" required="required" path="trailerLink"/>
              <label for="trailerLink">預告片</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="file" id="movieImage" class="form-control" 
              placeholder="movieImage" required="required" path="movieImage"/>
              <label for="movieImage">劇照</label>
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
		$('#oneSet').click(function() {

			$('#email').val('AzureBear@gmail.com');
			$('#employeeId').val('A129999976');
			$('#name').val('小池熊');
			$('#phoneNum').val('66316666');
			$('#password').val('Do!ng123');
			$('#gender').val('1');
			$('#birthdayString').val('1990-01-01');
			$('#salary').val('38000');
		})
	</script>
        
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
     
     
   
