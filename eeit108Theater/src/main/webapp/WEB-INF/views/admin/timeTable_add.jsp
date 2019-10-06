<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 

        
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="empIndexA">Home</a>
          </li>
          <li class="breadcrumb-item active">新增時刻</li>
        </ol>

       
        <!-- DataTables Example -->
        <div class="container">
      <div class="card card-register mx-auto mt-5">
      <div class="card-header">7-1 Cinema 新增時刻</div>
      <div class="card-body">                            
        <form:form method="POST" modelAttribute="time" action = 'timeTable_add'>
          
<!--           <div class="form-group">     -->
<!--                 <div class="form-label-group"> -->
<!--                 	<span>選擇電影：　</span> -->
<!--                 	<select id = 'movie'> -->
<!--                 		<option>請選擇電影</option> -->
<%--                 		<c:forEach var = 'movie' items = '${movies}'> --%>
<%--                 			<option>${movie}</option> --%>
<%--                 		</c:forEach> --%>
<!--                 	</select> -->
<!--                 </div> -->
<!--          </div> -->
		<div class="form-group">
        <select class="form-control form-control-lg" id = 'movie'>
  				<option>請選擇電影</option>
  				<c:forEach var = 'movie' items = '${movies}'>
                			<option>${movie}</option>
                </c:forEach>
		</select>
		</div>
          
          <div class="form-group">    
                <div class="form-label-group">
                  <form:input type="hidden" id="movieName" class="form-control" 
                  placeholder="movieName" required="required" autofocus="autofocus" path="movieName"/>
                </div>
         </div>
         <div class="form-group">    
                <div class="form-label-group">
                  <form:input type="hidden" id="available" class="form-control" 
                  placeholder="available" required="required" autofocus="autofocus" path="available" value = '1'/>
                  <label for="available">available</label>
                </div>
         </div>
           
           <div class="form-group">
            <div class="form-label-group">
              <form:input type="date" id="startDate" class="form-control" 
              placeholder="startDate" required="required" path="startDate"/>
              <label for="startDate">上映日期</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="time" id="startTime" class="form-control" 
              placeholder="startTime" required="required" path="startTime"/>
              <label for="startTime">上映時間</label>
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
        	<select class="form-control form-control-lg" id = 'selectVersion'>
  				<option>請選擇片種</option>
  				<option>2D</option>
  				<option>3D</option>
  				<option>IMAX</option>
		</select>
		</div>
          
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="hidden" id="version" class="form-control" 
              placeholder="version" required="required" path="version"/>
            </div>
          </div>
          
          <div class="form-group">
        	<select class="form-control form-control-lg" id = 'selectTheater'>
  				<option>請選擇廳院</option>
		</select>
		</div>
          
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="hidden" id="theater" class="form-control" 
               placeholder="theater" required="required" path="theater"/> 
              <label for="theater">廳院</label>
            </div>
          </div>
          
           
          
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="breakTime" class="form-control" 
              placeholder="breakTime" required="required" path="breakTime"/> 
              <label for="breakTime">間隔</label>
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
			$('#movieName').val('壞壞萌雪怪');
			$('#startDate').val('2019-10-06');
			$('#startTime').val('09:00');
			$('#duration').val('98');
			$('#version').val('IMAX');
			$('#theater').val('Z廳');
			$('#breakTime').val('30');
			$('#movie').val('20');
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
    $(document).ready(function() {
		$("#movie").change(function() {
			var selectedMovie = $("#movie option:selected").text();
			console.log(selectedMovie);
			$.ajax({
				url : "<c:url value = '/getMovieDetail' />",
				data : {"movieName" : selectedMovie},
				dataType : 'json',
				type : "GET",
				success : function(data) {
					console.log(data);
					alert("hello");
 					if (data.length > 0) {
 						$("#movieName").val(data[0]);
 						$("#duration").val(data[1]);
 					}
				}
			})
		});
		$("#selectVersion").change(function() {
			var selectedVersion = $("#selectVersion option:selected").text();
			$("#version").val(selectedVersion);
			if (selectedVersion == 'IMAX') {
				$('#selectTheater').append($('<option></option>').text('A廳'));
				$('#selectTheater').append($('<option></option>').text('B廳'));
				$('#selectTheater').append($('<option></option>').text('C廳'));
				$('#selectTheater').append($('<option></option>').text('D廳'));
			} else if (selectedVersion == '3D') {
				$('#selectTheater').append($('<option></option>').text('E廳'));
				$('#selectTheater').append($('<option></option>').text('F廳'));
			} else if (selectedVersion == '2D') {
				$('#selectTheater').append($('<option></option>').text('G廳'));
				$('#selectTheater').append($('<option></option>').text('H廳'));
				$('#selectTheater').append($('<option></option>').text('I廳'));
				$('#selectTheater').append($('<option></option>').text('J廳'));
				$('#selectTheater').append($('<option></option>').text('K廳'));
				$('#selectTheater').append($('<option></option>').text('L廳'));
				$('#selectTheater').append($('<option></option>').text('M廳'));
			}
		});
		$("#selectTheater").change(function() {
			var selectedTheater = $("#selectTheater option:selected").text();
			$("#theater").val(selectedTheater);
		})
    });
	</script>
     
     
   
