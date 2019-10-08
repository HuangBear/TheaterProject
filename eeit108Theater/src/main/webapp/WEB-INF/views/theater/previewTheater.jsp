<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
/* .sold-label { */
/* 	background-color: rgb(255, 78, 78); */
/* 	border-color: rgb(255, 0, 0); */
/* 	opacity: 1; */
/* } */
#previewModal label.sold {
	background-color: rgb(255, 78, 78);
	border-color: rgb(255, 0, 0);
	opacity: 1;
}

#previewModal label.preserve {
	background-color: rgb(255, 214, 78);
	border-color: rgb(255, 196, 0);
	opacity: 1;
}

#previewModal .table-seat tr {
	line-height: 30px;
}

#previewModal td {
	width: 25px;
}

#previewModal .table-seat label {
	padding: 10px;
}

#previewModal .ui-state-disabled {
	opacity: 1;
}

#previewModal form label {
	margin: auto;
}
</style>


	<jsp:include page="/WEB-INF/views/order/theaterStatus.jsp" />


<script type="text/javascript">
	$(function() {
		$("#previewModalBody td.nullSeat").html("");
		$("#previewModalBody td.nullSeat").attr("title", "");
		$("#previewModalBody input").checkboxradio({
			icon : false,
			disabled : true
		});
		
	});
</script>