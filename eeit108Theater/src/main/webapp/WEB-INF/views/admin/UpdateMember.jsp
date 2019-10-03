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
          <li class="breadcrumb-item active">UpdateMember</li>
        </ol>

 <!-- DataTables Example -->
        <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">7-1 Cinema 會員管理</div>
      <div class="card-body">
        <form:form method="POST" action="updateMem" modelAttribute="memberBean" enctype="multipart/form-data">
        
        <form:input type="hidden" id="no" class="form-control" 
                  value="${mem.no}" required="required"  path="no" />
        

        <div class="form-group">
            <div class="form-label-group">
              <form:input type="text" class="form-control" 
              value="${mem.name}"  path="name" />
              <label for="name">會員姓名</label>
            </div>
          </div>
          
      	<div class="form-group">
            <div class="form-label-group">
              <form:input type="text" class="form-control" 
              value="${mem.banCounter}"  path="banCounter"/>
              <label for="name">禁言次數</label>
            </div>
          </div>

          <div class="form-group">
            <div class="form-label-group">
              <form:select   class="form-control" 
               required="required" path="available">
               
                <c:choose> 
					<c:when test="${mem.available == true}">
						<form:option value="0" >停權狀態</form:option>
						<form:option value="1" selected="selected">正常狀態</form:option>
					</c:when>
					<c:otherwise>
                 		<form:option value="0" selected="selected">停權狀態</form:option>
						<form:option value="1" >正常狀態</form:option>
            		</c:otherwise>
				 </c:choose>
				 
               
				
               </form:select>
               

            </div>
          </div>
           <div class="form-group">
            <div class="form-label-group">
              <form:select  class="form-control" 
               required="required" path="commentPermission">
             
             	<c:choose> 
					<c:when test="${mem.commentPermission == true}">
						<form:option value="0" >禁言中</form:option>
						<form:option value="1" selected="selected">未禁言</form:option>
					</c:when>
					<c:otherwise>
                 		<form:option value="0" selected="selected">禁言中</form:option>
						<form:option value="1" >未禁言</form:option>
            		</c:otherwise>
				 </c:choose>
             
		
               </form:select>
          </div>
          </div>
          
          
        
          <button type="submit"  class=" btn btn-primary">送出</button>
          <button type="reset" class="btn btn-primary">重填</button><br><hr>
            
				
        </form:form>
       </div>

      </div>
    
     
     
     <!-- ------------------------------------------------------------------------------------------------- -->	
     <!-- 內文放在這個上面 -->
  
  