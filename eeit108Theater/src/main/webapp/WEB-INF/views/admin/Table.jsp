<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 



        <!-- Breadcrumbs-->
        
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Home</a>
          </li>
          <li class="breadcrumb-item active">empTable</li>
        </ol>

       
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            	7-1 Cinema員工清單</div>
          <div class="card-body">
            <div class="table-responsive">
          
              
            <c:if test='${not empty employees}'>
			<c:forEach var='emp' varStatus='vs' items='${employees}'>
			<c:if test ='${vs.first }'>
				<c:out value="<table class='table table-bordered' id='dataTable' width='100%' cellspacing='0'>" escapeXml='false'/>
				<c:out value=" <thead><tr><th>員工編號</th><th>姓名</th>
				<th>員工ID</th><th>員工email</th><th>員工電話</th>
				<th>password</th><th>薪資</th><th>職等</th><th>工作狀態</th><th>更新</th>
				<th>離職</th>
				</tr> </thead>
				<tfoot><tr><th>員工編號</th><th>姓名</th>
				<th>員工ID</th><th>員工email</th><th>員工電話</th>
				<th>password</th><th>薪資</th><th>職等</th><th>工作狀態</th><th>更新</th>
				<th>離職</th>
				</tr> </tfoot><tbody>
				" escapeXml='false'/>
			</c:if>
			
			<tr>
				<td>${emp.no}</td>
				<td>${emp.name}</td>
				<td>${emp.employeeId}</td>
				<td>${emp.email}</td>
				<td>${emp.phoneNum}</td>
				<td>${emp.password}</td>
				<td>${emp.salary}</td>
				<c:choose> 
				<c:when test="${emp.permission == 1}">
				<c:out value="<td>一般員工</td>" escapeXml='false'/>
				</c:when>
				<c:when test="${emp.permission == 2}">
				<c:out value="<td>影城經理</td>" escapeXml='false'/>
				</c:when>
				<c:when test="${emp.permission == 3}">
				<c:out value="<td>影城主管</td>" escapeXml='false'/>
				</c:when>
				<c:otherwise>
                 <c:out value="<td>無職位</td>" escapeXml='false'/>
            	</c:otherwise>
				 </c:choose>
				 
				<c:choose> 
				<c:when test="${emp.available == true}">
				<c:out value="<td>受雇中</td>" escapeXml='false'/>
				</c:when>
				<c:otherwise>
                 <c:out value="<td>已離職</td>" escapeXml='false'/>
            	</c:otherwise>
				 </c:choose>
				<td>
				<button class="itemTag2 btn btn-info"  id="${emp.no}">
				編輯
				</button><p>
				</td>
				
				<td><button class='btn btn-danger'
 				onclick='javascrtpt:window.location.href="EmpResign?pk=${emp.no}"'>離職</button></td> 
				

			</tr>
			<c:if test ='${vs.last }'>
				<c:out value="</tbody></table><hr>" escapeXml='false'/>
			</c:if>
		</c:forEach>
	</c:if>
                            
            </div>
          </div>
          <div class="card-footer small text-muted">Updated  at ${now}</div>
          <a href="/EmpPDF">pdf</a>
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

