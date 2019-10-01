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

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});

	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([ [ 'Language', 'Speakers (in millions)' ],
				[ 'German', 5.85 ], [ 'French', 1.66 ], [ 'Italian', 0.316 ], [ 'Romansh', 0.0791 ] ]);

		var options = {
			legend : 'none',
			pieSliceText : 'label',
			title : 'Swiss Language Use (100 degree rotation)',
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
						<div id="piechart" style="width: 900px; height: 500px;"></div>
					</td>
					<td>
						<div id="piechart_3d" style="width: 900px; height: 500px;"></div>
					</td>

				</tr>
			</table>

		</div>
	</div>
	<div class="card-footer small text-muted">Updated at ${updatedTime}</div>

</div>




