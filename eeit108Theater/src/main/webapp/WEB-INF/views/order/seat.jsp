<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Seat</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
.sold {}

.sold-label {
    background-color: rgb(255, 78, 78);
    border-color: rgb(255, 0, 0);
    opacity: 1;
}

.table-seat tr {
	line-height: 30px;
}

.table-seat label {
	padding: 7px;
}

.side-bar {
	position: absolute;
	top: 0;
	height: 100%;
}

#btn-submit{
            transition: 0.5s ease;
        }
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	var SelectedSeat = [];
	var MAX = ${ticketCnt};
	var labelChecked = "ui-checkboxradio-checked ";
	var labelActive = "ui-state-active ";
	var labelDisabled = "ui-checkboxradio-disabled "
	$(function() {
		$("input[name='seat']").checkboxradio({
			icon : false
		});
		$("input.sold").checkboxradio({
			icon : false,
			disabled : true
		});

		$("input[name='seat']").filter("input[class != 'sold']").click(
				function() {
					var id = $(this).attr("id");
					if (SelectedSeat.indexOf(id) != -1) { //if this is in the selectedSeat, means that user don't want to select it now
						SelectedSeat.splice(SelectedSeat.indexOf(id), 1);
					} else {
						SelectedSeat.push($(this).attr("id"));
						if (SelectedSeat.length > MAX) {
							$("#" + SelectedSeat[0]).prop("checked", false);
							$("[for='" + SelectedSeat[0] + "']").removeClass(labelChecked + labelActive);
							SelectedSeat.splice(0, 1);
						}
					}
					if(SelectedSeat.length > MAX){
			            console.log("Something WRONG!!!");
			        } else if(SelectedSeat.length == MAX){
			            $("#btn-submit").removeClass("disabled");
			            $("#btn-submit").prop("disabled", false);
			        } else{
			            $("#btn-submit").addClass("disabled");
			            $("#btn-submit").prop("disabled", true);
			        }
				});
		
	});
</script>
</head>

<body>
	<div class="container">
		<form action="<c:url value='/order/makeOrder'/>" method="POST">
			<div class="row">
				<div class="col-md-3 order-md-2 order-sm-1">
					<div>
						<table class="table border">
							<thead>
								<tr style="text-align: center">
									<th>Member Info</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>帳號： ${order.ownerEmail}</td>
								</tr>
							</tbody>

						</table>
					</div>
					<div class="mt-5">
						<table class="table border">
							<thead>
								<tr style="text-align: center">
									<th>Order List</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var='item' items="${order.orderItems}">
									<tr>
										<td>
											<div>${item.itemName}</div>
											<div class="float-right">${item.unitPrice}X${item.quantity}=${item.unitPrice * item.quantity}</div>
										</td>
									</tr>
								</c:forEach>
								<tr>
									<td>
										<div>
											<b>Total</b>
										</div>
										<div class="float-right">${order.totalPrice}</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-md-9 order-md-1 order-sm-2">
					<div id="movie-info" class="row mb-3">
						<div class="col-md-2">
							<span>電影分級</span>
						</div>
						<div class="col-md-6">
							<h3>電影名稱 ${order.timeTable.movieName}</h3>
						</div>
						<div class="col-md-4">
							<div>時間 ${order.timeTable.startTime}</div>
							<div>影廳 ${order.timeTable.theater}</div>
						</div>
					</div>
					<div class="overflow-auto">
						<div id="screen" style="min-width: 550px; text-align: center; margin-bottom: 50px">
							<button type="button" class="btn btn-secondary btn-lg" style="width: 80%" disabled>Screen</button>
						</div>
						<div class="position-relative" style="width: 90%; min-width: 550px; margin: 0 auto;">
							<!-- left-side-bar -->
							<div class="side-bar" id="left-side-bar" style="left: 0%">
								<table style="text-align: center" class="table-seat">${sideBar}
								</table>
							</div>
							<!-- seat -->
							<div style="width: 100%">
								<table class="table-seat" style="margin: 0 auto; left: 0; top: 0; table-layout: fixed; width: 100%;">${seatTable}
								</table>
							</div>
							<!-- right-side-bar -->
							<div class="side-bar" id="right-side-bar" style="right: 0%">
								<table class="table-seat" style="text-align: center">${sideBar}
								</table>
							</div>
							<div class="clearfix d-none d-sm-block"></div>
							<!-- <div class="col-md-12 d-inline-block col-seat-width">
                        <input class="btn btn-primary float-right" type="submit" value="Submit">
                    </div> -->
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-5  float-right">
				<div class="col-md-2 ">
					<input id="btn-submit" class="btn btn-secondary disabled" type="submit" value="Submit" disabled>
				</div>
			</div>
		</form>
	</div>
</body>

</html>