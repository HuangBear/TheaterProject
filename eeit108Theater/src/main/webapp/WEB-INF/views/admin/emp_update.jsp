<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 

      <!-- 內文放在這個下面-->
      <!-- ------------------------------------------------------------------------------------------------- -->	
     
     <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="empIndexA">Home</a>
          </li>
          <li class="breadcrumb-item active">emp Edit</li>
        </ol>

 <!-- DataTables Example -->
        <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">7-1 Cinema 員工編輯</div>
      <div class="card-body">
        <form:form method="POST" action="emp_update" modelAttribute="employeeBean" enctype="multipart/form-data">
        
        <form:input type="hidden" id="no" class="form-control" 
                  value="${eb.no}" required="required"  path="no" />
        
          <div class="form-group">    
                <div class="form-label-group">
                  <form:input type="email" id="email" class="form-control" 
                  value="${eb.email}" required="required" autofocus="autofocus" path="email" />
                  <label for="email">員工信箱</label>
                </div>
         </div>
           
           <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="employeeId" class="form-control" 
              value="${eb.employeeId}" required="required" path="employeeId"/>
              <label for="employeeId">員工身分證號碼</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="name" class="form-control" 
              value="${eb.name}" required="required" path="name"/>
              <label for="name">員工姓名</label>
            </div>
          </div>
      	<div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="phoneNum" class="form-control" 
              value="${eb.phoneNum}" required="required" path="phoneNum"/>
              <label for="phoneNum">員工電話</label>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="password" id="password" class="form-control" 
             value="${eb.password}" required="required" path="password"/>
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

            </div>
          </div>
          

          <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" id="salary" class="form-control" 
              value="${eb.salary}" required="required" path="salary"/>
              <label for="salary">薪水</label>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-label-group">
              <form:select  id="permission" class="form-control" 
               required="required" path="permission">
              
               <form:option value="0" >無權限</form:option>
				<form:option value="1" selected="selected">一般員工</form:option>
				<form:option value="2" >影城經理</form:option>
				<form:option value="3" >主管</form:option>
               </form:select>
               

            </div>
          </div>
           <div class="form-group">
            <div class="form-label-group">
              <form:select  id="available" class="form-control" 
               required="required" path="available">
             
               <form:option value="0" >已離職</form:option>
				<form:option value="1" selected="selected">受雇中</form:option>			
               </form:select>
          </div>
          </div>
          
           <div class="form-group">
            <div class="form-label-group">
              <form:input type="file" id="uploadImage" class="form-control" 
               path="uploadImage"/>
              <label for="uploadImage">上傳照片</label>
            </div>
          </div>
          
          
          <button type="submit" class="btn btn-primary">送出</button>
          <button type="reset" class="btn btn-primary">重填</button><br><hr>
          <button type="button" id="oneSet"  class="btn btn-success">一鍵填入</button>

       
				
        </form:form>
       </div>

      </div>
    
     
     
     <!-- ------------------------------------------------------------------------------------------------- -->	
     <!-- 內文放在這個上面 -->
  
  