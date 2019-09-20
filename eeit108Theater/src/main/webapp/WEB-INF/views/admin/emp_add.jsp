<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 

        
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="empIndexA">Home</a>
          </li>
          <li class="breadcrumb-item active">新增員工</li>
        </ol>

       
        <!-- DataTables Example -->
        <div class="container">
      <div class="card card-register mx-auto mt-5">
      <div class="card-header">7-1 Cinema 新增員工</div>
      <div class="card-body">
        <form:form method="POST" action="emp_add" modelAttribute="employeeBean">
        
          <div class="form-group">    
                <div class="form-label-group">
                  <form:input type="email" id="email" class="form-control" 
                  placeholder="email" required="required" autofocus="autofocus" path="email"/>
                  <label for="email">員工信箱</label>
                </div>
         </div>
           
           <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="employeeId" class="form-control" 
              placeholder="employeeId" required="required" path="employeeId"/>
              <label for="employeeId">員工身分證號碼</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="name" class="form-control" 
              placeholder="name" required="required" path="name"/>
              <label for="name">員工姓名</label>
            </div>
          </div>
      	<div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="phoneNum" class="form-control" 
              placeholder="phoneNum" required="required" path="phoneNum"/>
              <label for="phoneNum">員工電話</label>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="password" id="password" class="form-control" 
              placeholder="password" required="required" path="password"/>
              <label for="password">員工密碼</label>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-label-group">
              <form:select  id="gender" class="form-control" 
               required="required" path="gender">
               <form:option value="1" selected="selected">男</form:option>
				<form:option value="2" >女</form:option>
               </form:select>
<!--               <label for="gender">員工性別</label> -->
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="date" id="birthdayString" class="form-control" 
               required="required" path="birthdayString"/>
              <label for="birthdayString">員工生日</label>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="salary" class="form-control" 
              placeholder="salary" required="required" path="salary"/>
              <label for="salary">薪水</label>
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
     
     
   
