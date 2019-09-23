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
     
     
   
