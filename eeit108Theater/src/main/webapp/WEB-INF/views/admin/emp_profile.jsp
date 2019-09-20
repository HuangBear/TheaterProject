<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>7-1 Cinema</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/admin/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

    <jsp:include page="/WEB-INF/views/admin/Header.jsp" />
    <!-- -------------------------------------------以上Header---------------------------------------------- -->
    
    <!-- 內文區 -->
    <div id="wrapper">

    <!-- 插入Sidebar -->
 
    <jsp:include page="/WEB-INF/views/admin/empSidebar.jsp" />

    <!-- 內文修飾照片一張 -->
   
    <div id="content-wrapper">
	<div class="container-fluid">
    <div style="height:200px;background-image:url(images/admin/CINEMA01_1.jpg);background-position:center;background-size:cover;"></div>
    </div>
      <!-- 內文放在這個下面-->
      <!-- ------------------------------------------------------------------------------------------------- -->	
     
     
     <div class="card card-solid">
        <div class="card-body pb-0">
          <div class="row d-flex align-items-stretch">
            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
              <div class="card bg-light">
                <div class="card-header text-muted border-bottom-0">
                                   員工編號 : ${employeeBean1.no}
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                  
                    <div class="col-7">
                      <h2 class="lead"><b>${employeeBean1.name}</b></h2>
                      <p class="text-muted text-sm"><b>About: </b> 工作職等 : ${employeeBean1.permission} </p>
                      <ul class="ml-4 mb-0 fa-ul text-muted">
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span> ID : ${employeeBean1.employeeId}</li>
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span> Phone : ${employeeBean1.phoneNum}</li>
                      </ul>
                    </div>
                    <div class="col-5 text-center">
                      <img width='160' src="<c:url value='/getEmpPicture/${employeeBean1.no}'/>" class="img-circle img-fluid"/>
                    </div>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="text-right">
                    <a href="#" class="btn btn-sm bg-teal">
                      <i class="fas fa-comments"></i>
                    </a>
                    <a href="#" class="btn btn-sm btn-primary">
                      <i class="fas fa-user"></i> View Profile
                    </a>
                  </div>
                </div>
              </div>
            </div>
            </div></div></div>
     
     
     <!-- ------------------------------------------------------------------------------------------------- -->	
     <!-- 內文放在這個上面 -->
  
    </div>
    <!-- /.content-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- ------------------------------------------以下Footer-------------------------------------------------- -->
    	
	<jsp:include page="/WEB-INF/views/admin/Footer.jsp" />

</body>

</html>
