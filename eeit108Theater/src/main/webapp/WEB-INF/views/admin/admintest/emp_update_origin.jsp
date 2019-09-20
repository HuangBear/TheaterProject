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

    <a class="navbar-brand mr-1" href="index.html">7-1 Cinema</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search 站內搜尋功能-->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
	 <a class="navbar-brand mr-1" href="empIndexA">${empName}</a>
	<!--         <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2"> -->
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger">7</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="#">Settings</a>
          <a class="dropdown-item" href="#">Activity Log</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="empIndexA">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Home</span>
        </a>
      </li>
      

      <li class="nav-item  active">
        <a class="nav-link" href="empTable">
          <i class="fas fa-fw fa-table"></i>
          <span>員工清單</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="emp_add">
          <i class="fas fa-fw fa-table"></i>
          <span>新增員工</span></a>
      </li>
    </ul>

    <div id="content-wrapper">
    
    
      <div class="container-fluid">

        <!-- Breadcrumbs-->
        
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
        <form:form method="POST" modelAttribute="employeeBean" enctype="multipart/form-data">
        
          <div class="form-group">    
                <div class="form-label-group">
                  <form:input type="email" id="email" class="form-control" 
                  value="${eb.email}" required="required" autofocus="autofocus" path="email" readonly="value"/>
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
          
<!--           <div class="form-group"> -->
<!--             <div class="form-label-group"> -->
<%--               <form:input type="date" id="birthdayString" class="form-control"  --%>
<%--                required="required" path="birthdayString"/> --%>
<!--               <label for="birthdayString">員工生日</label> -->
<!--             </div> -->
<!--           </div> -->
          
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
              value="" path="uploadImage"/>
              <label for="uploadImage">上傳照片</label>
            </div>
          </div>
          
          
          <button type="submit" class="btn btn-primary">送出</button>
          <button type="reset" class="btn btn-primary">重填</button><br><hr>
          <button type="button" id="oneSet"  class="btn btn-success">一鍵填入</button>

       
				
        </form:form>
       </div>

      </div>
    </div>
        
       

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © 7-1 Cinema 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="vendor/chart.js/Chart.min.js"></script>
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/admin/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="js/admin/demo/datatables-demo.js"></script>
  <script src="js/admin/demo/chart-area-demo.js"></script>

</body>

</html>


