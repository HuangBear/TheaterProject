<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style type="text/css">
.hide {
	display: none;
}
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="js/admin/demo/chart-area-demo.js"></script>
<script src="js/admin/demo/chart-bar-demo.js"></script>
<script src="js/admin/demo/chart-pie-demo.js"></script>

<!-- <script type="application/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->


<script type="text/javascript">


	// Area Chart Example
	var ctx = document.getElementById("myAreaChart");
	var Today = new Date();
	var myLineChart = new Chart(ctx, {
		type : 'line',
		data : {
			labels : [ 	<c:forEach items="${chart2jsp[0].listChartContainer}" var="bPM" >
			'${bPM.chartKey}' ,
	 		</c:forEach > ],
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
				data : [ <c:forEach items="${chart2jsp[0].listInteger}" var="tc" >
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
						min : 0,
						max : 20,
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
	var ctx = document.getElementById("myPieChart");
	var myPieChart = new Chart(ctx, {
	  type: 'pie',
	  data: {
	    labels: [ "${chart2jsp[0].fir.chartKey}", "${chart2jsp[0].sec.chartKey}", "${chart2jsp[0].thi.chartKey}"],
	    datasets: [{
	      data: [${chart2jsp[0].fir.chartValue}, ${chart2jsp[0].sec.chartValue}, ${chart2jsp[0].thi.chartValue}],
	      backgroundColor: ['#007bff', '#dc3545', '#ffc107'],
	    }],
	  },
	});
	
	
	// Bar Chart Example
	var ctx = document.getElementById("myBarChart");
	var myLineChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: [
			<c:forEach items="${chart2jsp[0].listChartContainer}" var="bPM" >
			'${bPM.chartKey}' ,
	 		</c:forEach >
	       	
	    	],
	    datasets: [{
	      label: "Revenue",
	      backgroundColor: "rgba(2,117,216,1)",
	      borderColor: "rgba(2,117,216,1)",
	      data: [			
	    	  <c:forEach items="${chart2jsp[0].listChartContainer}" var="bPM" >
			'${bPM.chartValue}' ,
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
	          min: 0,
	          max: 10,
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
					<a class="nav-item nav-link active" id="nav-bul-tab" data-toggle="tab" href="#nav-bul" role="tab" aria-controls="nav-bul" aria-selected="true">公告</a> <a
						class="nav-item nav-link" id="nav-mem-tab" data-toggle="tab" href="#nav-mem" role="tab" aria-controls="nav-mem" aria-selected="false">會員</a> <a
						class="nav-item nav-link" id="nav-emp-tab" data-toggle="tab" href="#nav-emp" role="tab" aria-controls="nav-emp" aria-selected="false">員工</a>
				</div>
			</nav>
			<div class="tab-content " id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-bul" role="tabpanel" aria-labelledby="nav-bul-tab">
					<table class="columns">
						<tr>
							<td>
								<canvas id="myBarChart" style="width: 800px; height: 400px;"></canvas>
								<h2 style="text-align: center;">每月公告數</h2>
							</td>
							<td>
								<canvas id="myAreaChart" style="width: 800px; height: 400px;"></canvas>
								<h2 style="text-align: center;">公告總數</h2>
							</td>
						</tr>
						<tr>
							<td>
								<canvas id="myPieChart" style="width: 800px; height: 400px;"></canvas>
								<h2 style="text-align: center;">公告類型統計</h2>
							</td>
						</tr>

					</table>

				</div>
				<div class="tab-pane fade" id="nav-mem" role="tabpanel" aria-labelledby="nav-mem-tab">
					<table class="columns">
						<tr>
							<td>
								<canvas id="myBarChart" style="width: 800px; height: 400px;"></canvas>
								<h2 style="text-align: center;">每月公告數</h2>
							</td>
							<td>
								<canvas id="myPieChart" style="width: 800px; height: 400px;"></canvas>
								<h2 style="text-align: center;">公告類型統計</h2>
							</td>
							<td>
								<canvas id="myAreaChart" style="width: 800px; height: 400px;"></canvas>
								<h2 style="text-align: center;">公告總數</h2>
							</td>
						</tr>
					</table>
				</div>
				<div class="tab-pane fade" id="nav-emp" role="tabpanel" aria-labelledby="nav-emp-tab"></div>
			</div>
		</div>
	</div>
	<div class="card-footer small text-muted">Updated at ${updatedTime}</div>

</div>




