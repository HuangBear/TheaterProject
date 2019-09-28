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
          <li class="breadcrumb-item active">forumTable</li>
        </ol>

       
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            	討論區清單</div>
          <div class="card-body">
            <div class="table-responsive">
          
              
            <c:if test='${not empty movies}'>
			<c:forEach var='movie' varStatus='vs' items='${movies}'>
			<c:if test ='${vs.first}'>
				<c:out value="<table class='table table-bordered' id='dataTable' width='100%' cellspacing='0'>" escapeXml='false'/>
				<c:out value=" <thead><tr><th>編號</th><th>Title</th>
				<th>發文</th>
				<th>Tag</th><th>發文時間</th>
				<th>編輯</th>
				</tr> </thead>
				<tfoot><tr><th>編號</th><th>Title</th>
				<th>發文</th>
				<th>Tag</th><th>發文時間</th>
				<th>編輯</th>
				</tr> </tfoot><tbody>
				" escapeXml='false'/>
			</c:if>
			
			<tr>
				<td>${article.movie.no}</td>
				<td>${article.movie.moviename}</td>
				<td>${article.title}</td>
				<td>${article.author.name}</td>
				<td>${article.postTime}</td>
				<td>${article.likeCount}</td>
				<td>${article.dislikeCount}</td>
				<td>
				<button class="editBtn btn btn-info"  id="${article.no}">
				編輯
				</button><p>
				</td>
				
				
<!-- 				<td><button class='btn btn-danger' -->
<%--  				onclick='javascrtpt:window.location.href="EmpResign?pk=${emp.no}"'>離職</button></td>  --%>
				

			</tr>
			<c:if test ='${vs.last }'>
				<c:out value="</tbody></table><hr>" escapeXml='false'/>
			</c:if>
		</c:forEach>
	</c:if>
                            
            </div>
          </div>
          <div class="card-footer small text-muted">Updated  at 00:00 PM</div>
        </div>

      <script src="js/admin/demo/datatables-demo.js"></script>
  	  <script src="js/admin/demo/chart-area-demo.js"></script>
<script>
 $(".editBtn").click(function() {
    	
    	var no = $(this).attr("id");
    	//var pquantity = $(this).val();
    	$.ajax({
    		url : "<c:url value='/admin/movie_edit'/>",
    		data : {
    			no : no,
    			//quantity : pquantity
    		},
    		type : "GET",
    		success : function(data) {
    			$("#pageItems").html(data);
    		}
    	});
        });
 </script>

