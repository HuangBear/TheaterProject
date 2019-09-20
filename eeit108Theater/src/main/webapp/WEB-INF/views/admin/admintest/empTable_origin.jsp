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
          <span class="badge badge-danger">6</span>
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
				<button class="btn btn-info"  onclick="javascrtpt:window.location.href='emp_update?pk=${emp.no}'">
				編輯
				</button><p>
				</td>
				
				<td><button class='btn btn-danger'
 				onclick='javascrtpt:window.location.href="EmpResign?pk=${emp.no}"'>離職</button></td> 
				
<%-- 				<c:choose> --%>
				
<%-- 				<c:when test="${emp.available == true}"> --%>
<%-- 				<c:out value="<td><button class='btn btn-danger'   --%>
<%-- 				onclick='javascrtpt:window.location.href="EmpResign?pk=${emp.no}"'>離職 --%>
<%-- 				</button></td>" escapeXml='false'/> --%>
<%-- 				</c:when> --%>
				
<%-- 				<c:when test="${emp.available == false}"> --%>
<%-- 				<c:out value="<td><button class='btn btn-success'   --%>
<%-- 				onclick='javascrtpt:window.location.href="EmpResign?pk=${emp.no}"'>復工 --%>
<%-- 				</button></td>" escapeXml='false'/> --%>
<%-- 				</c:when> --%>
				
<%-- 				 </c:choose> --%>
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
