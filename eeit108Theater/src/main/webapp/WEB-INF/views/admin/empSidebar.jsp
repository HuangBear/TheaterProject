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


 <!-- ------------------------------------------------------------------------------------------------- -->
  

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
        <li class="nav-item active">
        <a  class="itemTag nav-link" href="empIndexA" id="">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Home</span>
        </a>
        </li>
      
 		<li class=" nav-item">
        <a  class="itemTag nav-link" href="#" id="Table" >
          <i class="fas fa-fw fa-table"></i>
          <span>員工清單</span>
        </a>
        <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="Mem_list">
          <i class="fas fa-fw fa-table"></i>
          <span>會員清單</span></a>
        </li>
        </li>
        <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="Table2">
          <i class="fas fa-fw fa-table"></i>
          <span>電影清單</span></a>
        </li>
        
        <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="emp_add">
          <i class="fas fa-fw fa-table"></i>
          <span>新增員工</span></a>
        </li>
        <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="movie_add">
          <i class="fas fa-fw fa-table"></i>
          <span>新增電影</span></a>
        </li>
        <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="newBulletin">
          <i class="fas fa-fw fa-table"></i>
          <span>發布公告</span></a>
        </li>
        <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="allBulletin">
          <i class="fas fa-fw fa-table"></i>
          <span>歷史公告</span></a>
        </li>
         <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="WebSocket">
          <i class="fa fa-cog" aria-hidden="true"></i>
          <span>即時客服</span></a>
        </li>
		

    </ul>

 <!-- ------------------------------------------------------------------------------------------------- -->	


</body>

</html>
