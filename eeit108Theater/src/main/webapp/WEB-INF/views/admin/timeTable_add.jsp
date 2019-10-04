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
        
          <div class="form-group">    
                <div class="form-label-group">
                  <form:input type="text" id="movieName" class="form-control" 
                  placeholder="movieName" required="required" autofocus="autofocus" path="movieName"/>
                  <label for="movieName">片名</label>
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
              <form:input type="text" id="startDate" class="form-control" 
              placeholder="startDate" required="required" path="startDate"/>
              <label for="startDate">上映日期</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="startTime" class="form-control" 
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
            <div class="form-label-group">
              <form:input type="text" id="version" class="form-control" 
              placeholder="version" required="required" path="version"/>
              <label for="version">片種</label>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="theater" class="form-control" 
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
          
<!--           <div class="form-group"> -->
<!--             <div class="form-label-group"> -->
<%--               <form:input type="text" id="movie" class="form-control"  --%>
<%--               placeholder="movie" required="required" path="movie"/> --%>
<!--               <label for="movie">FK</label> -->
<!--             </div> -->
<!--           </div> -->
          
          <button type="submit" class="btn btn-primary">送出</button>
          <button type="reset" class="btn btn-primary">重填</button><br><hr>
          <button type="button" id="oneSet"  class="btn btn-success">一鍵填入</button>

       
				
        </form:form>
       </div>

      </div>
      </div>
      
      <script>
		$('#oneSet').click(function() {

			$('#movieName').val('冰鳥');
			$('#startDate').val('2019-10-06');
			$('#startTime').val('09:00');
			$('#duration').val('90');
			$('#version').val('IMAX');
			$('#theater').val('Z廳');
			$('#breakTime').val('30');
			$('#movie').val('1');
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
     
     
   
