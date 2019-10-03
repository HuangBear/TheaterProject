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

	google.charts.load("current", {
		packages : [ "corechart" ]
	});

	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		
	var data = google.visualization.arrayToDataTable([['Language', 'Speakers (in millions)'],
		<c:forEach items="${buelltinPreMoon}" var="bPM" >
			['${bPM.chartKey}', ${bPM.chartValue}],
	 </c:forEach >
		]);

		
		var options = {
			legend : 'none',
			pieSliceText : 'label',
			title : '每月公告',
			pieStartAngle : 100,
		};

		var chart = new google.visualization.PieChart(document.getElementById('piechart'));
		chart.draw(data, options);
	}
	
	
	// 		google.charts.load("current", {
	// 			packages : [ "corechart" ]
	// 		});
	google.charts.setOnLoadCallback(drawChart1);

	function drawChart1() {
		var data1 = google.visualization.arrayToDataTable([ [ 'Task', 'Hours per Day' ], [ 'Work', 11 ],
				[ 'Eat', 2 ], [ 'Commute', 2 ], [ 'Watch TV', 2 ], [ 'Sleep', 7 ] ]);

		var options1 = {
			title : 'My Daily Activities',
			is3D : true,
		};

		var chart1 = new google.visualization.PieChart(document.getElementById('piechart_3d'));
		chart1.draw(data1, options1);
	}

	google.charts.setOnLoadCallback(drawChart2);

	function drawChart2() {
		var data = google.visualization.arrayToDataTable([ [ 'Year', 'Sales', 'Expenses' ],
				[ '2004', 1000, 400 ], [ '2005', 1170, 460 ], [ '2006', 660, 1120 ], [ '2007', 1030, 540 ] ]);

		var options = {
			title : 'Company Performance',
			curveType : 'function',
			legend : {
				position : 'bottom'
			}
		};

		var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

		chart.draw(data, options);
	}

	// Area Chart Example
	var ctx = document.getElementById("myAreaChart");
	var Today = new Date();
	var myLineChart = new Chart(ctx, {
		type : 'line',
		data : {
			labels : [ (Today.getMonth() + 1) + " 月 " + (Today.getDate() - 5) + " 日",
					(Today.getMonth() + 1) + " 月 " + (Today.getDate() - 4) + " 日",
					(Today.getMonth() + 1) + " 月 " + (Today.getDate() - 3) + " 日",
					(Today.getMonth() + 1) + " 月 " + (Today.getDate() - 2) + " 日",
					(Today.getMonth() + 1) + " 月 " + (Today.getDate() - 1) + " 日",
					(Today.getMonth() + 1) + " 月 " + Today.getDate() + " 日(本日)" ],
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
				data : [ 0, 3, 2, 1, 7, 2 ],
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
						maxTicksLimit : 7
					}
				} ],
				yAxes : [ {
					ticks : {
						min : 0,
						max : 10,
						maxTicksLimit : 5
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
	    labels: ["Blue", "Red", "Yellow", "Green"],
	    datasets: [{
	      data: [20, 30, 10, 40],
	      backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745'],
	    }],
	  },
	});
	
	
	// Bar Chart Example
	var ctx = document.getElementById("myBarChart");
	var myLineChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: [
			<c:forEach items="${buelltinPreMoon}" var="bPM" >
			'${bPM.chartKey}' ,
	 </c:forEach >
	       	
	    	],
	    datasets: [{
	      label: "Revenue",
	      backgroundColor: "rgba(2,117,216,1)",
	      borderColor: "rgba(2,117,216,1)",
	      data: [			
	    	  <c:forEach items="${buelltinPreMoon}" var="bPM" >
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
	          max: 5,
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

			<table class="columns">
				<tr>

					<td>
						<canvas id="myAreaChart" style="width: 800px; height: 400px;"></canvas> <%-- <canvas id="myAreaChart" width="100%" height="30"></canvas> --%>

					</td>
					<td>
						<canvas id="myBarChart" style="width: 800px; height: 400px;"></canvas> <%-- <canvas id="myBarChart" width="100%" height="50"></canvas> --%>

					</td>
					<td>
						<canvas id="myPieChart" style="width: 800px; height: 400px;"></canvas> <%-- <canvas id="myPieChart" width="100%" height="100"></canvas> --%>

					</td>

					<td>
						<div id="piechart" style="width: 900px; height: 500px;"></div>
					</td>
					<td>
						<div id="piechart_3d" style="width: 900px; height: 500px;"></div>
					</td>
					<td>
						<div id="curve_chart" style="width: 900px; height: 500px"></div>
					</td>
				</tr>
			</table>

		</div>
	</div>
	<div class="card-footer small text-muted">Updated at ${updatedTime}</div>

</div>




