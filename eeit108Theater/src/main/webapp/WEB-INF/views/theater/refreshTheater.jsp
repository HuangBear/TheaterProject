<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/order/theaterStatus.jsp"/>
<script>
	$("#capacity").val(${newTheater.capacity});
</script>