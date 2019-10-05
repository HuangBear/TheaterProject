<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style type="text/css">
.td {

padding:50px;
	width: 800px;
	height: 500px;
}

.ww {
/* 	width: 600px; */
/* 	height: 500px */
}
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="js/admin/demo/chart-area-demo.js"></script>
<script src="js/admin/demo/chart-bar-demo.js"></script>
<script src="js/admin/demo/chart-pie-demo.js"></script>

<script>
//$(document).ready(function(){
	<c:forEach items="${chart2jsp}" var="chart2jsp" varStatus="status">
	// Area Chart Example
	var ctx = document.getElementById("myAreaChart${status.index}");
	var Today = new Date();
	var myLineChart = new Chart(ctx, {
		type : 'line',
		data : {
			labels : [ 	<c:forEach items="${chart2jsp.listChartContainer}" var="c2j" >
			'${c2j.chartKey}' ,
	 		</c:forEach >	],
			datasets : [ {
				label : "Sessions",
				lineTension : 0.3,
				backgroundColor : "rgba(2,117,216,0.2)",
				borderColor : "rgba(2,117,216,1)",
				pointRadius : 5,
				pointBackgroundColor : "rgba(2,117,216,1)",
				pointBorderColor : "rgba(255,255,255,0.8)",
				pointHoverRadius : 5,
				pointHoverBackgroundColor : "rgba(2,117,216,1)",
				pointHitRadius : 50,
				pointBorderWidth : 2,
				data : [ <c:forEach items="${chart2jsp.listInteger}" var="tc" >
				'${tc}' ,
		 		</c:forEach > ],
			} ],
		},
		options : {
			scales : {
				xAxes : [ {
					time : {
						unit : 'date'
					},
					gridLines : {
						display : false
					},
					ticks : {
// 						maxTicksLimit : 7
					}
				} ],
				yAxes : [ {
					ticks : {
// 						min : 0,
// 						max : 20,
// 						maxTicksLimit : 5
					},
					gridLines : {
						color : "rgba(0, 0, 0, .125)",
					}
				} ],
			},
			legend : {
				display : false
			}
		}
	});
	
	
	// Pie Chart Example
	var ctx = document.getElementById("myPieChart${status.index}");
	var myPieChart = new Chart(ctx, {
	  type: 'pie',
	  data: {
	    labels: [
	    	<c:if test="${chart2jsp.fir.chartKey !=null}">"${chart2jsp.fir.chartKey}",</c:if>
	    	<c:if test="${chart2jsp.sec.chartKey !=null}">"${chart2jsp.sec.chartKey}",</c:if>
	    	<c:if test="${chart2jsp.thi.chartKey !=null}">"${chart2jsp.thi.chartKey}",</c:if>
	    	<c:if test="${chart2jsp.fou.chartKey !=null}">"${chart2jsp.fou.chartKey}",</c:if>
	    	<c:if test="${chart2jsp.fif.chartKey !=null}">"${chart2jsp.fif.chartKey}",</c:if>
	    	<c:if test="${chart2jsp.six.chartKey !=null}">"${chart2jsp.six.chartKey}",</c:if>],
	    datasets: [{
	      data: [
	    	  <c:if test="${chart2jsp.fir.chartValue !=null}">"${chart2jsp.fir.chartValue}",</c:if>
		    	<c:if test="${chart2jsp.sec.chartValue !=null}">"${chart2jsp.sec.chartValue}",</c:if>
		    	<c:if test="${chart2jsp.thi.chartValue !=null}">"${chart2jsp.thi.chartValue}",</c:if>
		    	<c:if test="${chart2jsp.fou.chartValue !=null}">"${chart2jsp.fou.chartValue}",</c:if>
		    	<c:if test="${chart2jsp.fif.chartValue !=null}">"${chart2jsp.fif.chartValue}",</c:if>
		    	<c:if test="${chart2jsp.six.chartValue !=null}">"${chart2jsp.six.chartValue}",</c:if>	    	  
	    	  ],
	      backgroundColor: [
	    	  <c:if test="${chart2jsp.fir.chartKey !=null}">'#f50000',</c:if>
	    	  <c:if test="${chart2jsp.sec.chartKey !=null}">'#ffda53',</c:if>
	    	  <c:if test="${chart2jsp.thi.chartKey !=null}">'#55ffd5',</c:if>
	    	  <c:if test="${chart2jsp.fou.chartKey !=null}">'#3b87ff',</c:if>
	    	  <c:if test="${chart2jsp.fif.chartKey !=null}">'#495566',</c:if>  
	    	  <c:if test="${chart2jsp.six.chartKey !=null}">'#7d0185',</c:if>	],
	    }],
	  },
	});
	
	
	// Bar Chart Example
	var ctx = document.getElementById("myBarChart${status.index}");
	var myLineChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: [
			<c:forEach items="${chart2jsp.listChartContainer}" var="c2j" >
			'${c2j.chartKey}' ,
	 		</c:forEach >
	       	   	],
	    datasets: [{
	      label: "Revenue",
	      backgroundColor: "rgba(2,117,216,1)",
	      borderColor: "rgba(2,117,216,1)",
	      data: [			
	    	  <c:forEach items="${chart2jsp.listChartContainer}" var="c2j" >
			'${c2j.chartValue}' ,
			 </c:forEach >
			],
	    }],
	  },
	  options: {
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'month'
	        },
	        gridLines: {
	          display: false
	        },
	        ticks: {
// 	          maxTicksLimit: 6
	        }
	      }],
	      yAxes: [{
	        ticks: {
// 	          min: 0,
// 	          max: 10,
// 	          maxTicksLimit: 5
	        },
	        gridLines: {
	          display: true
	        }
	      }],
	    },
	    legend: {
	      display: false
	    }
	  }
	});
	</c:forEach > 
//})
</script>


<!-- Breadcrumbs-->

<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="#">Home</a></li>
	<li class="breadcrumb-item active">bulletin_add</li>
</ol>


<!-- DataTables Example -->

<div class="card mb-3">
	<div class="card-header">
		<i class="fas fa-table"></i> 7-1 Cinema圖表
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<nav>
				<div class="nav nav-tabs mb-5" id="nav-tab" role="tablist">

					<c:forEach items="${chart2jsp}" var="chart2jsp" varStatus="status">
						<a aria-controls="nav-${status.index}" id="nav-${status.index}-tab" data-toggle="tab" href="#nav-${status.index}" role="tab"
							<c:if test="${status.index==0}">
							 class="nav-item nav-link active" aria-selected="true"
							</c:if>
							<c:if test="${status.index>0}">
							 class="nav-item nav-link " aria-selected="false"
							</c:if>>${chart2jsp.str1}</a>
					</c:forEach>
				</div>
			</nav>
			<div class="tab-content " id="nav-tabContent">
				<c:forEach items="${chart2jsp}" var="chart2jsp" varStatus="status">
					<div <c:if test="${status.index==0}">
					class="tab-pane fade show active" 
					</c:if>
						<c:if test="${status.index > 0}">
					class="tab-pane fade"
					</c:if> id="nav-${status.index}" role="tabpanel"
						aria-labelledby="nav-${status.index}-tab">
						<table class="columns">
							<tr>
								<td class="td">
									<canvas id="myBarChart${status.index}" style="width: 700px; height: 400px;"></canvas>
									<h2 style="text-align: center;">每月新增${chart2jsp.str1}數</h2>
								</td>
								<td class="td">
									<canvas id="myAreaChart${status.index}" style="width: 700px; height: 400px;"></canvas>
									<h2 style="text-align: center;">${chart2jsp.str1}總數</h2>
								</td>
							</tr>
							<tr>
								<td class="td">
									<canvas id="myPieChart${status.index}" style="width: 700px; height: 400px;"></canvas>
									<h2 style="text-align: center;">${chart2jsp.str1}類型</h2>
								</td>
								<td class="td"></td>
							</tr>

						</table>
					</div>
				</c:forEach>

				<div class="tab-pane fade" id="nav-emp" role="tabpanel" aria-labelledby="nav-emp-tab"></div>
			</div>
		</div>
	</div>
	<div class="card-footer small text-muted">Updated at ${updatedTime}</div>

</div>




