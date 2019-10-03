<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

    <ul class="sidebar navbar-nav">
        <li class="nav-item active">
        <a  class="itemTag nav-link" href="empIndexA" id="">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Home</span>
        </a>
        </li>
        <sec:authorize access="hasAuthority('1') or hasAuthority('2') or hasAuthority('3')">
        <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="ticket">
          <i class="fas fa-fw fa-ticket-alt"></i>
          <span>票務管理</span></a>
        </li>
        </sec:authorize>
       <sec:authorize access="hasAuthority('1') or hasAuthority('2') or hasAuthority('3')">
 		<li class=" nav-item">
        <a  class="itemTag nav-link" href="#" id="Table" >
          <i class="fas fa-fw fa-address-book"></i>
          <span>員工清單</span>
        </a>
        </li>
        </sec:authorize>
         <sec:authorize access="hasAuthority('1') or hasAuthority('2') or hasAuthority('3')">
        <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="Mem_list">
          <i class="fas fa-fw fa-address-book"></i>
          <span>會員清單</span></a>
        </li>
        </sec:authorize>
         <sec:authorize access="hasAuthority('1') or hasAuthority('2') or hasAuthority('3')">
        <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="Table2">
          <i class="fas fa-fw fa-table"></i>
          <span>電影清單</span></a>
        </li>
        </sec:authorize>
         <sec:authorize access=" hasAuthority('2') or hasAuthority('3')">
        <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="emp_add">
          <i class="fas fa-fw fa-user-circle"></i>
          <span>新增員工</span></a>
        </li>
        </sec:authorize>
         <sec:authorize access=" hasAuthority('2') or hasAuthority('3')">
        <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="movie_add">
          <i class="fas fa-fw fa-table"></i>
          <span>新增電影</span></a>
        </li>
        </sec:authorize>
         <sec:authorize access=" hasAuthority('2') or hasAuthority('3')">
        <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="bulletin_add">
          <i class="fas fa-fw fa-bullhorn"></i>
          <span>發布公告</span></a>
        </li>
        </sec:authorize>
         <sec:authorize access=" hasAuthority('2') or hasAuthority('3')">
        <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="bulletin_all">
          <i class="fas fa-fw fa-bullhorn"></i>
          <span>歷史公告</span></a>
        </li>
        </sec:authorize>
         <sec:authorize access="hasAuthority('1') or hasAuthority('2') or hasAuthority('3')">
        <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="emp_Forum">
          <i class="fas fa-fw fa-table"></i>
          <span>討論管理</span></a>
        </li>
        </sec:authorize>
         <sec:authorize access=" hasAuthority('2') or hasAuthority('3')">
        <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="allProducts">
          <i class="fas fa-fw  fa-cart-plus"></i>
          <span>商品清單</span></a>
        </li>
        </sec:authorize>
         <sec:authorize access=" hasAuthority('2') or hasAuthority('3')">
         <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="charts">
          <i class="fas fa-fw fa-chart-bar"></i>
          <span>圖表輸出</span></a>
        </li>
        </sec:authorize>
         <sec:authorize access="hasAuthority('1') or hasAuthority('2')">
         <li class="nav-item">
        <a class="itemTag nav-link" href="#" id="WebSocket">
          <i class="fas fa-comment" aria-hidden="true"></i>
          <span>即時客服</span></a>
        </li>
		</sec:authorize>
		<sec:authorize access=" hasAuthority('2') or hasAuthority('3')">
		<li class="nav-item">
        <a class="itemTag nav-link" href="#" id="timeTable_add">
          <i class="fas fa-fw fa-table"></i>
          <span>新增時刻</span></a>
        </li>
        </sec:authorize>

		


    </ul>

 <!-- ------------------------------------------------------------------------------------------------- -->	


