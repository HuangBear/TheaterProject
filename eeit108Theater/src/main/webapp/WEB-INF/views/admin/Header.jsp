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

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
 <a class="navbar-brand" href="empIndexA">
    <img src="images/admin/716logo.png" alt="Logo" style="width:40px;">
  </a>
    <a class="navbar-brand mr-1" href="empIndexA">7-1 Cinema 後台管理</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search 站內搜尋功能-->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
    <%--     <a class="navbar-brand mr-1" href="EmpLogout">${empName}</a> --%>
    <a class="navbar-brand mr-1" href="" data-toggle="modal" data-target="#logoutModal">${empName}</a>
	</form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">

      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <c:choose> 
				<c:when test="${empty employeeBean1.employeeImage}">
				<c:out value="<i class='fas fa-user-circle fa-fw'></i>" escapeXml='false'/>
				</c:when>
				<c:when test="${!empty employeeBean1}">
				<c:out value='<img width="40" src=" ${pageContext.request.contextPath}/getEmpPicture/${employeeBean1.no}" class="img-circle img-fluid"/>' escapeXml='false'/>
				</c:when>                        
				</c:choose>       
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          
          <a class="dropdown-item" href="emp_profile">Profile</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav>
  
  <!--以上為header 以下放內文+footer--><!--以上為header 以下放內文+footer--><!--以上為header 以下放內文+footer-->
  <!-- ------------------------------------------------------------------------------------------------- -->
  
  
  
  
  
  <!-- ------------------------------------------------------------------------------------------------- --> 
</body>

</html>
