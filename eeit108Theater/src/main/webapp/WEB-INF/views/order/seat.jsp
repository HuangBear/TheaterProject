<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
.sold {
	background-color: red;
	color: white;
}

.tr-seat {
	line-height: 30px;
}

.side-bar {
	position: absolute;
	top: 0;
	height: 100%;
}

.label-p {
	padding: 7px;
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
	var MAX = 3;
	var labelChecked = "ui-checkboxradio-checked ";
	var labelActive = "ui-state-active ";
	var labelDisabled = "ui-checkboxradio-disabled "
	$(function() {

		$("input[name='seat']").checkboxradio({
			icon : false
		});
		$("input").prop("checked", false);
		$("label").removeClass("ui-checkboxradio-checked ui-state-active");

		$("label.sold").addClass(labelDisabled);
		$('label[for^=seat]').filter("[class!='sold']").click(
				function() {
					$(this).addClass(labelDisabled);
					if (SelectedSeat.length < MAX) {
						SelectedSeat.push($(this).attr("for"));
					} else {
						$("label[for='" + SelectedSeat[0] + "']").removeClass(
								labelActive + labelChecked + labelDisabled);
						$("#" + SelectedSeat[0]).prop('checked', false);
						SelectedSeat.splice(0, 1);
						SelectedSeat.push($(this).attr("for"));
					}
					console.log(SelectedSeat);
					$("input[type='checkbox']:checked").each(function() {
						console.log($(this).val());
					});
				});
	});
</script>
</head>

<body>
	<div class="container">
		<form action="#" method="GET">
			<div class="row">

				<div class="col-md-9">
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
					<div id="screen" style="text-align: center; margin-bottom: 20px">
						<button type="button" class="btn btn-secondary btn-lg" style="width: 550px" disabled>Screen</button>
					</div>
					<div class="position-relative" style="width: 550px; margin: 0 auto;">
						<!-- left-side-bar -->
						<div class="side-bar" id="left-side-bar" style="left: 0%">
							<table style="text-align: center" class="float-right">
								<tr class="tr-seat">
									<td>A</td>
								</tr>
								<tr class="tr-seat">
									<td>B</td>
								</tr>
								<tr class="tr-seat">
									<td>C</td>
								</tr>
								<tr class="tr-seat">
									<td>D</td>
								</tr>
								<tr class="tr-seat">
									<td>E</td>
								</tr>
								<tr class="tr-seat">
									<td>F</td>
								</tr>
								<tr class="tr-seat">
									<td>G</td>
								</tr>
								<tr class="tr-seat">
									<td>H</td>
								</tr>
								<tr class="tr-seat">
									<td>I</td>
								</tr>
								<tr class="tr-seat">
									<td>J</td>
								</tr>
								<tr class="tr-seat">
									<td>K</td>
								</tr>
								<tr class="tr-seat">
									<td>L</td>
								</tr>
								<tr class="tr-seat">
									<td>M</td>
								</tr>
								<tr class="tr-seat">
									<td>N</td>
								</tr>
								<tr class="tr-seat">
									<td>O</td>
								</tr>
							</table>
						</div>
						<!-- seat -->
						<div style="width: 100%">
							<table style="margin: 0 auto; left: 0; top: 0; table-layout: fixed; width: 100%;">
								<tr class="tr-seat">
									<td></td>
									<td></td>
									<td><label for="seatA1" title="A1" class="label-p"></label> <input type="checkbox" name="seat" id="seatA1" value="A1">
									</td>
									<td><label for="seatA2" title="A2" class="label-p"></label> <input type="checkbox" name="seat" id="seatA2" value="A2">
									</td>
									<td><label for="seatA3" title="A3" class="label-p"></label> <input type="checkbox" name="seat" id="seatA3" value="A3">
									</td>
									<td><label for="seatA4" title="A4" class="label-p"></label> <input type="checkbox" name="seat" id="seatA4" value="A4">
									</td>
									<td><label for="seatA5" title="A5" class="label-p"></label> <input type="checkbox" name="seat" id="seatA5" value="A5">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatA6" title="A6" class="label-p"></label> <input type="checkbox" name="seat" id="seatA6" value="A6">
									</td>
									<td><label for="seatA7" title="A7" class="label-p"></label> <input type="checkbox" name="seat" id="seatA7" value="A7">
									</td>
									<td><label for="seatA8" title="A8" class="label-p"></label> <input type="checkbox" name="seat" id="seatA8" value="A8">
									</td>
									<td><label for="seatA9" title="A9" class="label-p"></label> <input type="checkbox" name="seat" id="seatA9" value="A9">
									</td>
									<td><label for="seatA10" title="A10" class="label-p"></label> <input type="checkbox" name="seat" id="seatA10" value="A10">
									</td>
									<td><label for="seatA11" title="A11" class="label-p"></label> <input type="checkbox" name="seat" id="seatA11" value="A11">
									</td>
									<td><label for="seatA12" title="A12" class="label-p"></label> <input type="checkbox" name="seat" id="seatA12" value="A12">
									</td>
									<td><label for="seatA13" title="A13" class="label-p"></label> <input type="checkbox" name="seat" id="seatA13" value="A13">
									</td>
									<td><label for="seatA14" title="A14" class="label-p"></label> <input type="checkbox" name="seat" id="seatA14" value="A14">
									</td>
									<td><label for="seatA15" title="A15" class="label-p"></label> <input type="checkbox" name="seat" id="seatA15" value="A15">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatA16" title="A16" class="label-p"></label> <input type="checkbox" name="seat" id="seatA16" value="A16">
									</td>
									<td><label for="seatA17" title="A17" class="label-p"></label> <input type="checkbox" name="seat" id="seatA17" value="A17">
									</td>
									<td><label for="seatA18" title="A18" class="label-p"></label> <input type="checkbox" name="seat" id="seatA18" value="A18">
									</td>
									<td><label for="seatA19" title="A19" class="label-p"></label> <input type="checkbox" name="seat" id="seatA19" value="A19">
									</td>
									<td><label for="seatA20" title="A20" class="label-p"></label> <input type="checkbox" name="seat" id="seatA20" value="A20">
									</td>

									<td></td>
									<td></td>
								</tr>
								<tr class="tr-seat">
									<td></td>
									<td></td>
									<td><label for="seatB0" title="B0" class="label-p"></label> <input type="checkbox" name="seat" id="seatB0" value="B0">
									</td>
									<td><label for="seatB1" title="B1" class="label-p"></label> <input type="checkbox" name="seat" id="seatB1" value="B1">
									</td>
									<td><label for="seatB2" title="B2" class="label-p"></label> <input type="checkbox" name="seat" id="seatB2" value="B2">
									</td>
									<td><label for="seatB3" title="B3" class="label-p"></label> <input type="checkbox" name="seat" id="seatB3" value="B3">
									</td>
									<td><label for="seatB4" title="B4" class="label-p"></label> <input type="checkbox" name="seat" id="seatB4" value="B4">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatB6" title="B6" class="label-p"></label> <input type="checkbox" name="seat" id="seatB6" value="B6">
									</td>
									<td><label for="seatB7" title="B7" class="label-p"></label> <input type="checkbox" name="seat" id="seatB7" value="B7">
									</td>
									<td><label for="seatB8" title="B8" class="label-p"></label> <input type="checkbox" name="seat" id="seatB8" value="B8">
									</td>
									<td><label for="seatB9" title="B9" class="label-p"></label> <input type="checkbox" name="seat" id="seatB9" value="B9">
									</td>
									<td><label for="seatB10" title="B10" class="label-p"></label> <input type="checkbox" name="seat" id="seatB10" value="B10">
									</td>
									<td><label for="seatB11" title="B11" class="label-p"></label> <input type="checkbox" name="seat" id="seatB11" value="B11">
									</td>
									<td><label for="seatB12" title="B12" class="label-p"></label> <input type="checkbox" name="seat" id="seatB12" value="B12">
									</td>
									<td><label for="seatB13" title="B13" class="label-p"></label> <input type="checkbox" name="seat" id="seatB13" value="B13">
									</td>
									<td><label for="seatB14" title="B14" class="label-p"></label> <input type="checkbox" name="seat" id="seatB14" value="B14">
									</td>
									<td><label for="seatB15" title="B15" class="label-p"></label> <input type="checkbox" name="seat" id="seatB15" value="B15">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatB17" title="B17" class="label-p"></label> <input type="checkbox" name="seat" id="seatB17" value="B17">
									</td>
									<td><label for="seatB18" title="B18" class="label-p"></label> <input type="checkbox" name="seat" id="seatB18" value="B18">
									</td>
									<td><label for="seatB19" title="B19" class="label-p"></label> <input type="checkbox" name="seat" id="seatB19" value="B19">
									</td>
									<td><label for="seatB20" title="B20" class="label-p"></label> <input type="checkbox" name="seat" id="seatB20" value="B20">
									</td>
									<td><label for="seatB21" title="B21" class="label-p"></label> <input type="checkbox" name="seat" id="seatB21" value="B21">
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr class="tr-seat">
									<td></td>
									<td></td>
									<td><label for="seatC0" title="C0" class="label-p"></label> <input type="checkbox" name="seat" id="seatC0" value="C0">
									</td>
									<td><label for="seatC1" title="C1" class="label-p"></label> <input type="checkbox" name="seat" id="seatC1" value="C1">
									</td>
									<td><label for="seatC2" title="C2" class="label-p"></label> <input type="checkbox" name="seat" id="seatC2" value="C2">
									</td>
									<td><label for="seatC3" title="C3" class="label-p"></label> <input type="checkbox" name="seat" id="seatC3" value="C3">
									</td>
									<td><label for="seatC4" title="C4" class="label-p"></label> <input type="checkbox" name="seat" id="seatC4" value="C4">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatC6" title="C6" class="label-p"></label> <input type="checkbox" name="seat" id="seatC6" value="C6">
									</td>
									<td><label for="seatC7" title="C7" class="label-p"></label> <input type="checkbox" name="seat" id="seatC7" value="C7">
									</td>
									<td><label for="seatC8" title="C8" class="label-p"></label> <input type="checkbox" name="seat" id="seatC8" value="C8">
									</td>
									<td><label for="seatC9" title="C9" class="label-p"></label> <input type="checkbox" name="seat" id="seatC9" value="C9">
									</td>
									<td><label for="seatC10" title="C10" class="label-p"></label> <input type="checkbox" name="seat" id="seatC10" value="C10">
									</td>
									<td><label for="seatC11" title="C11" class="label-p"></label> <input type="checkbox" name="seat" id="seatC11" value="C11">
									</td>
									<td><label for="seatC12" title="C12" class="label-p"></label> <input type="checkbox" name="seat" id="seatC12" value="C12">
									</td>
									<td><label for="seatC13" title="C13" class="label-p"></label> <input type="checkbox" name="seat" id="seatC13" value="C13">
									</td>
									<td><label for="seatC14" title="C14" class="label-p"></label> <input type="checkbox" name="seat" id="seatC14" value="C14">
									</td>
									<td><label for="seatC15" title="C15" class="label-p"></label> <input type="checkbox" name="seat" id="seatC15" value="C15">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatC17" title="C17" class="label-p"></label> <input type="checkbox" name="seat" id="seatC17" value="C17">
									</td>
									<td><label for="seatC18" title="C18" class="label-p"></label> <input type="checkbox" name="seat" id="seatC18" value="C18">
									</td>
									<td><label for="seatC19" title="C19" class="label-p"></label> <input type="checkbox" name="seat" id="seatC19" value="C19">
									</td>
									<td><label for="seatC20" title="C20" class="label-p"></label> <input type="checkbox" name="seat" id="seatC20" value="C20">
									</td>
									<td><label for="seatC21" title="C21" class="label-p"></label> <input type="checkbox" name="seat" id="seatC21" value="C21">
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr class="tr-seat">
									<td></td>
									<td></td>
									<td><label for="seatD0" title="D0" class="label-p"></label> <input type="checkbox" name="seat" id="seatD0" value="D0">
									</td>
									<td><label for="seatD1" title="D1" class="label-p"></label> <input type="checkbox" name="seat" id="seatD1" value="D1">
									</td>
									<td><label for="seatD2" title="D2" class="label-p"></label> <input type="checkbox" name="seat" id="seatD2" value="D2">
									</td>
									<td><label for="seatD3" title="D3" class="label-p"></label> <input type="checkbox" name="seat" id="seatD3" value="D3">
									</td>
									<td><label for="seatD4" title="D4" class="label-p"></label> <input type="checkbox" name="seat" id="seatD4" value="D4">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatD6" title="D6" class="label-p"></label> <input type="checkbox" name="seat" id="seatD6" value="D6">
									</td>
									<td><label for="seatD7" title="D7" class="label-p"></label> <input type="checkbox" name="seat" id="seatD7" value="D7">
									</td>
									<td><label for="seatD8" title="D8" class="label-p"></label> <input type="checkbox" name="seat" id="seatD8" value="D8">
									</td>
									<td><label for="seatD9" title="D9" class="label-p"></label> <input type="checkbox" name="seat" id="seatD9" value="D9">
									</td>
									<td><label for="seatD10" title="D10" class="label-p"></label> <input type="checkbox" name="seat" id="seatD10" value="D10">
									</td>
									<td><label for="seatD11" title="D11" class="label-p"></label> <input type="checkbox" name="seat" id="seatD11" value="D11">
									</td>
									<td><label for="seatD12" title="D12" class="label-p"></label> <input type="checkbox" name="seat" id="seatD12" value="D12">
									</td>
									<td><label for="seatD13" title="D13" class="label-p"></label> <input type="checkbox" name="seat" id="seatD13" value="D13">
									</td>
									<td><label for="seatD14" title="D14" class="label-p"></label> <input type="checkbox" name="seat" id="seatD14" value="D14">
									</td>
									<td><label for="seatD15" title="D15" class="label-p"></label> <input type="checkbox" name="seat" id="seatD15" value="D15">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatD17" title="D17" class="label-p"></label> <input type="checkbox" name="seat" id="seatD17" value="D17">
									</td>
									<td><label for="seatD18" title="D18" class="label-p"></label> <input type="checkbox" name="seat" id="seatD18" value="D18">
									</td>
									<td><label for="seatD19" title="D19" class="label-p"></label> <input type="checkbox" name="seat" id="seatD19" value="D19">
									</td>
									<td><label for="seatD20" title="D20" class="label-p"></label> <input type="checkbox" name="seat" id="seatD20" value="D20">
									</td>
									<td><label for="seatD21" title="D21" class="label-p"></label> <input type="checkbox" name="seat" id="seatD21" value="D21">
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr class="tr-seat">
									<td></td>
									<td></td>
									<td><label for="seatE0" title="E0" class="label-p"></label> <input type="checkbox" name="seat" id="seatE0" value="E0">
									</td>
									<td><label for="seatE1" title="E1" class="label-p"></label> <input type="checkbox" name="seat" id="seatE1" value="E1">
									</td>
									<td><label for="seatE2" title="E2" class="label-p"></label> <input type="checkbox" name="seat" id="seatE2" value="E2">
									</td>
									<td><label for="seatE3" title="E3" class="label-p"></label> <input type="checkbox" name="seat" id="seatE3" value="E3">
									</td>
									<td><label for="seatE4" title="E4" class="label-p"></label> <input type="checkbox" name="seat" id="seatE4" value="E4">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatE6" title="E6" class="label-p"></label> <input type="checkbox" name="seat" id="seatE6" value="E6">
									</td>
									<td><label for="seatE7" title="E7" class="label-p"></label> <input type="checkbox" name="seat" id="seatE7" value="E7">
									</td>
									<td><label for="seatE8" title="E8" class="label-p"></label> <input type="checkbox" name="seat" id="seatE8" value="E8">
									</td>
									<td><label for="seatE9" title="E9" class="label-p"></label> <input type="checkbox" name="seat" id="seatE9" value="E9">
									</td>
									<td><label for="seatE10" title="E10" class="label-p"></label> <input type="checkbox" name="seat" id="seatE10" value="E10">
									</td>
									<td><label for="seatE11" title="E11" class="label-p"></label> <input type="checkbox" name="seat" id="seatE11" value="E11">
									</td>
									<td><label for="seatE12" title="E12" class="label-p"></label> <input type="checkbox" name="seat" id="seatE12" value="E12">
									</td>
									<td><label for="seatE13" title="E13" class="label-p"></label> <input type="checkbox" name="seat" id="seatE13" value="E13">
									</td>
									<td><label for="seatE14" title="E14" class="label-p"></label> <input type="checkbox" name="seat" id="seatE14" value="E14">
									</td>
									<td><label for="seatE15" title="E15" class="label-p"></label> <input type="checkbox" name="seat" id="seatE15" value="E15">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatE17" title="E17" class="label-p"></label> <input type="checkbox" name="seat" id="seatE17" value="E17">
									</td>
									<td><label for="seatE18" title="E18" class="label-p"></label> <input type="checkbox" name="seat" id="seatE18" value="E18">
									</td>
									<td><label for="seatE19" title="E19" class="label-p"></label> <input type="checkbox" name="seat" id="seatE19" value="E19">
									</td>
									<td><label for="seatE20" title="E20" class="label-p"></label> <input type="checkbox" name="seat" id="seatE20" value="E20">
									</td>
									<td><label for="seatE21" title="E21" class="label-p"></label> <input type="checkbox" name="seat" id="seatE21" value="E21">
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr class="tr-seat">
									<td></td>
									<td></td>
									<td><label for="seatF0" title="F0" class="label-p"></label> <input type="checkbox" name="seat" id="seatF0" value="F0">
									</td>
									<td><label for="seatF1" title="F1" class="label-p"></label> <input type="checkbox" name="seat" id="seatF1" value="F1">
									</td>
									<td><label for="seatF2" title="F2" class="label-p"></label> <input type="checkbox" name="seat" id="seatF2" value="F2">
									</td>
									<td><label for="seatF3" title="F3" class="label-p"></label> <input type="checkbox" name="seat" id="seatF3" value="F3">
									</td>
									<td><label for="seatF4" title="F4" class="label-p"></label> <input type="checkbox" name="seat" id="seatF4" value="F4">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatF6" title="F6" class="label-p"></label> <input type="checkbox" name="seat" id="seatF6" value="F6">
									</td>
									<td><label for="seatF7" title="F7" class="label-p"></label> <input type="checkbox" name="seat" id="seatF7" value="F7">
									</td>
									<td><label for="seatF8" title="F8" class="label-p"></label> <input type="checkbox" name="seat" id="seatF8" value="F8">
									</td>
									<td><label for="seatF9" title="F9" class="label-p"></label> <input type="checkbox" name="seat" id="seatF9" value="F9">
									</td>
									<td><label for="seatF10" title="F10" class="label-p"></label> <input type="checkbox" name="seat" id="seatF10" value="F10">
									</td>
									<td><label for="seatF11" title="F11" class="label-p"></label> <input type="checkbox" name="seat" id="seatF11" value="F11">
									</td>
									<td><label for="seatF12" title="F12" class="label-p"></label> <input type="checkbox" name="seat" id="seatF12" value="F12">
									</td>
									<td><label for="seatF13" title="F13" class="label-p"></label> <input type="checkbox" name="seat" id="seatF13" value="F13">
									</td>
									<td><label for="seatF14" title="F14" class="label-p"></label> <input type="checkbox" name="seat" id="seatF14" value="F14">
									</td>
									<td><label for="seatF15" title="F15" class="label-p"></label> <input type="checkbox" name="seat" id="seatF15" value="F15">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatF17" title="F17" class="label-p"></label> <input type="checkbox" name="seat" id="seatF17" value="F17">
									</td>
									<td><label for="seatF18" title="F18" class="label-p"></label> <input type="checkbox" name="seat" id="seatF18" value="F18">
									</td>
									<td><label for="seatF19" title="F19" class="label-p"></label> <input type="checkbox" name="seat" id="seatF19" value="F19">
									</td>
									<td><label for="seatF20" title="F20" class="label-p"></label> <input type="checkbox" name="seat" id="seatF20" value="F20">
									</td>
									<td><label for="seatF21" title="F21" class="label-p"></label> <input type="checkbox" name="seat" id="seatF21" value="F21">
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr class="tr-seat">
									<td></td>
									<td></td>
									<td><label for="seatG0" title="G0" class="label-p"></label> <input type="checkbox" name="seat" id="seatG0" value="G0">
									</td>
									<td><label for="seatG1" title="G1" class="label-p"></label> <input type="checkbox" name="seat" id="seatG1" value="G1">
									</td>
									<td><label for="seatG2" title="G2" class="label-p"></label> <input type="checkbox" name="seat" id="seatG2" value="G2">
									</td>
									<td><label for="seatG3" title="G3" class="label-p"></label> <input type="checkbox" name="seat" id="seatG3" value="G3">
									</td>
									<td><label for="seatG4" title="G4" class="label-p"></label> <input type="checkbox" name="seat" id="seatG4" value="G4">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatG6" title="G6" class="label-p"></label> <input type="checkbox" name="seat" id="seatG6" value="G6">
									</td>
									<td><label for="seatG7" title="G7" class="label-p"></label> <input type="checkbox" name="seat" id="seatG7" value="G7">
									</td>
									<td><label for="seatG8" title="G8" class="label-p"></label> <input type="checkbox" name="seat" id="seatG8" value="G8">
									</td>
									<td><label for="seatG9" title="G9" class="label-p"></label> <input type="checkbox" name="seat" id="seatG9" value="G9">
									</td>
									<td><label for="seatG10" title="G10" class="label-p"></label> <input type="checkbox" name="seat" id="seatG10" value="G10">
									</td>
									<td><label for="seatG11" title="G11" class="label-p"></label> <input type="checkbox" name="seat" id="seatG11" value="G11">
									</td>
									<td><label for="seatG12" title="G12" class="label-p"></label> <input type="checkbox" name="seat" id="seatG12" value="G12">
									</td>
									<td><label for="seatG13" title="G13" class="label-p"></label> <input type="checkbox" name="seat" id="seatG13" value="G13">
									</td>
									<td><label for="seatG14" title="G14" class="label-p"></label> <input type="checkbox" name="seat" id="seatG14" value="G14">
									</td>
									<td><label for="seatG15" title="G15" class="label-p"></label> <input type="checkbox" name="seat" id="seatG15" value="G15">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatG17" title="G17" class="label-p"></label> <input type="checkbox" name="seat" id="seatG17" value="G17">
									</td>
									<td><label for="seatG18" title="G18" class="label-p"></label> <input type="checkbox" name="seat" id="seatG18" value="G18">
									</td>
									<td><label for="seatG19" title="G19" class="label-p"></label> <input type="checkbox" name="seat" id="seatG19" value="G19">
									</td>
									<td><label for="seatG20" title="G20" class="label-p"></label> <input type="checkbox" name="seat" id="seatG20" value="G20">
									</td>
									<td><label for="seatG21" title="G21" class="label-p"></label> <input type="checkbox" name="seat" id="seatG21" value="G21">
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr class="tr-seat">
									<td></td>
									<td></td>
									<td><label for="seatH0" title="H0" class="label-p"></label> <input type="checkbox" name="seat" id="seatH0" value="H0">
									</td>
									<td><label for="seatH1" title="H1" class="label-p"></label> <input type="checkbox" name="seat" id="seatH1" value="H1">
									</td>
									<td><label for="seatH2" title="H2" class="label-p"></label> <input type="checkbox" name="seat" id="seatH2" value="H2">
									</td>
									<td><label for="seatH3" title="H3" class="label-p"></label> <input type="checkbox" name="seat" id="seatH3" value="H3">
									</td>
									<td><label for="seatH4" title="H4" class="label-p"></label> <input type="checkbox" name="seat" id="seatH4" value="H4">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatH6" title="H6" class="label-p"></label> <input type="checkbox" name="seat" id="seatH6" value="H6">
									</td>
									<td><label for="seatH7" title="H7" class="label-p"></label> <input type="checkbox" name="seat" id="seatH7" value="H7">
									</td>
									<td><label for="seatH8" title="H8" class="label-p"></label> <input type="checkbox" name="seat" id="seatH8" value="H8">
									</td>
									<td><label for="seatH9" title="H9" class="label-p"></label> <input type="checkbox" name="seat" id="seatH9" value="H9">
									</td>
									<td><label for="seatH10" title="H10" class="label-p"></label> <input type="checkbox" name="seat" id="seatH10" value="H10">
									</td>
									<td><label for="seatH11" title="H11" class="label-p"></label> <input type="checkbox" name="seat" id="seatH11" value="H11">
									</td>
									<td><label for="seatH12" title="H12" class="label-p"></label> <input type="checkbox" name="seat" id="seatH12" value="H12">
									</td>
									<td><label for="seatH13" title="H13" class="label-p"></label> <input type="checkbox" name="seat" id="seatH13" value="H13">
									</td>
									<td><label for="seatH14" title="H14" class="label-p"></label> <input type="checkbox" name="seat" id="seatH14" value="H14">
									</td>
									<td><label for="seatH15" title="H15" class="label-p"></label> <input type="checkbox" name="seat" id="seatH15" value="H15">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatH17" title="H17" class="label-p"></label> <input type="checkbox" name="seat" id="seatH17" value="H17">
									</td>
									<td><label for="seatH18" title="H18" class="label-p"></label> <input type="checkbox" name="seat" id="seatH18" value="H18">
									</td>
									<td><label for="seatH19" title="H19" class="label-p"></label> <input type="checkbox" name="seat" id="seatH19" value="H19">
									</td>
									<td><label for="seatH20" title="H20" class="label-p"></label> <input type="checkbox" name="seat" id="seatH20" value="H20">
									</td>
									<td><label for="seatH21" title="H21" class="label-p"></label> <input type="checkbox" name="seat" id="seatH21" value="H21">
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr class="tr-seat">
									<td></td>
									<td></td>
									<td><label for="seatI0" title="I0" class="label-p"></label> <input type="checkbox" name="seat" id="seatI0" value="I0">
									</td>
									<td><label for="seatI1" title="I1" class="label-p"></label> <input type="checkbox" name="seat" id="seatI1" value="I1">
									</td>
									<td><label for="seatI2" title="I2" class="label-p"></label> <input type="checkbox" name="seat" id="seatI2" value="I2">
									</td>
									<td><label for="seatI3" title="I3" class="label-p"></label> <input type="checkbox" name="seat" id="seatI3" value="I3">
									</td>
									<td><label for="seatI4" title="I4" class="label-p"></label> <input type="checkbox" name="seat" id="seatI4" value="I4">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatI6" title="I6" class="label-p"></label> <input type="checkbox" name="seat" id="seatI6" value="I6">
									</td>
									<td><label for="seatI7" title="I7" class="label-p"></label> <input type="checkbox" name="seat" id="seatI7" value="I7">
									</td>
									<td><label for="seatI8" title="I8" class="label-p"></label> <input type="checkbox" name="seat" id="seatI8" value="I8">
									</td>
									<td><label for="seatI9" title="I9" class="label-p"></label> <input type="checkbox" name="seat" id="seatI9" value="I9">
									</td>
									<td><label for="seatI10" title="I10" class="label-p"></label> <input type="checkbox" name="seat" id="seatI10" value="I10">
									</td>
									<td><label for="seatI11" title="I11" class="label-p"></label> <input type="checkbox" name="seat" id="seatI11" value="I11">
									</td>
									<td><label for="seatI12" title="I12" class="label-p"></label> <input type="checkbox" name="seat" id="seatI12" value="I12">
									</td>
									<td><label for="seatI13" title="I13" class="label-p"></label> <input type="checkbox" name="seat" id="seatI13" value="I13">
									</td>
									<td><label for="seatI14" title="I14" class="label-p"></label> <input type="checkbox" name="seat" id="seatI14" value="I14">
									</td>
									<td><label for="seatI15" title="I15" class="label-p"></label> <input type="checkbox" name="seat" id="seatI15" value="I15">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatI17" title="I17" class="label-p"></label> <input type="checkbox" name="seat" id="seatI17" value="I17">
									</td>
									<td><label for="seatI18" title="I18" class="label-p"></label> <input type="checkbox" name="seat" id="seatI18" value="I18">
									</td>
									<td><label for="seatI19" title="I19" class="label-p"></label> <input type="checkbox" name="seat" id="seatI19" value="I19">
									</td>
									<td><label for="seatI20" title="I20" class="label-p"></label> <input type="checkbox" name="seat" id="seatI20" value="I20">
									</td>
									<td><label for="seatI21" title="I21" class="label-p"></label> <input type="checkbox" name="seat" id="seatI21" value="I21">
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr class="tr-seat">
									<td></td>
									<td></td>
									<td><label for="seatJ0" title="J0" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ0" value="J0">
									</td>
									<td><label for="seatJ1" title="J1" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ1" value="J1">
									</td>
									<td><label for="seatJ2" title="J2" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ2" value="J2">
									</td>
									<td><label for="seatJ3" title="J3" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ3" value="J3">
									</td>
									<td><label for="seatJ4" title="J4" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ4" value="J4">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatJ6" title="J6" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ6" value="J6">
									</td>
									<td><label for="seatJ7" title="J7" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ7" value="J7">
									</td>
									<td><label for="seatJ8" title="J8" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ8" value="J8">
									</td>
									<td><label for="seatJ9" title="J9" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ9" value="J9">
									</td>
									<td><label for="seatJ10" title="J10" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ10" value="J10">
									</td>
									<td><label for="seatJ11" title="J11" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ11" value="J11">
									</td>
									<td><label for="seatJ12" title="J12" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ12" value="J12">
									</td>
									<td><label for="seatJ13" title="J13" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ13" value="J13">
									</td>
									<td><label for="seatJ14" title="J14" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ14" value="J14">
									</td>
									<td><label for="seatJ15" title="J15" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ15" value="J15">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatJ17" title="J17" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ17" value="J17">
									</td>
									<td><label for="seatJ18" title="J18" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ18" value="J18">
									</td>
									<td><label for="seatJ19" title="J19" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ19" value="J19">
									</td>
									<td><label for="seatJ20" title="J20" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ20" value="J20">
									</td>
									<td><label for="seatJ21" title="J21" class="label-p"></label> <input type="checkbox" name="seat" id="seatJ21" value="J21">
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr class="tr-seat">
									<td></td>
									<td></td>
									<td><label for="seatK0" title="K0" class="label-p"></label> <input type="checkbox" name="seat" id="seatK0" value="K0">
									</td>
									<td><label for="seatK1" title="K1" class="label-p"></label> <input type="checkbox" name="seat" id="seatK1" value="K1">
									</td>
									<td><label for="seatK2" title="K2" class="label-p"></label> <input type="checkbox" name="seat" id="seatK2" value="K2">
									</td>
									<td><label for="seatK3" title="K3" class="label-p"></label> <input type="checkbox" name="seat" id="seatK3" value="K3">
									</td>
									<td><label for="seatK4" title="K4" class="label-p"></label> <input type="checkbox" name="seat" id="seatK4" value="K4">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatK6" title="K6" class="label-p"></label> <input type="checkbox" name="seat" id="seatK6" value="K6">
									</td>
									<td><label for="seatK7" title="K7" class="label-p"></label> <input type="checkbox" name="seat" id="seatK7" value="K7">
									</td>
									<td><label for="seatK8" title="K8" class="label-p"></label> <input type="checkbox" name="seat" id="seatK8" value="K8">
									</td>
									<td><label for="seatK9" title="K9" class="label-p"></label> <input type="checkbox" name="seat" id="seatK9" value="K9">
									</td>
									<td><label for="seatK10" title="K10" class="label-p"></label> <input type="checkbox" name="seat" id="seatK10" value="K10">
									</td>
									<td><label for="seatK11" title="K11" class="label-p"></label> <input type="checkbox" name="seat" id="seatK11" value="K11">
									</td>
									<td><label for="seatK12" title="K12" class="label-p"></label> <input type="checkbox" name="seat" id="seatK12" value="K12">
									</td>
									<td><label for="seatK13" title="K13" class="label-p"></label> <input type="checkbox" name="seat" id="seatK13" value="K13">
									</td>
									<td><label for="seatK14" title="K14" class="label-p"></label> <input type="checkbox" name="seat" id="seatK14" value="K14">
									</td>
									<td><label for="seatK15" title="K15" class="label-p"></label> <input type="checkbox" name="seat" id="seatK15" value="K15">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatK17" title="K17" class="label-p"></label> <input type="checkbox" name="seat" id="seatK17" value="K17">
									</td>
									<td><label for="seatK18" title="K18" class="label-p"></label> <input type="checkbox" name="seat" id="seatK18" value="K18">
									</td>
									<td><label for="seatK19" title="K19" class="label-p"></label> <input type="checkbox" name="seat" id="seatK19" value="K19">
									</td>
									<td><label for="seatK20" title="K20" class="label-p"></label> <input type="checkbox" name="seat" id="seatK20" value="K20">
									</td>
									<td><label for="seatK21" title="K21" class="label-p"></label> <input type="checkbox" name="seat" id="seatK21" value="K21">
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr class="tr-seat">
									<td></td>
									<td></td>
									<td><label for="seatL0" title="L0" class="label-p"></label> <input type="checkbox" name="seat" id="seatL0" value="L0">
									</td>
									<td><label for="seatL1" title="L1" class="label-p"></label> <input type="checkbox" name="seat" id="seatL1" value="L1">
									</td>
									<td><label for="seatL2" title="L2" class="label-p"></label> <input type="checkbox" name="seat" id="seatL2" value="L2">
									</td>
									<td><label for="seatL3" title="L3" class="label-p"></label> <input type="checkbox" name="seat" id="seatL3" value="L3">
									</td>
									<td><label for="seatL4" title="L4" class="label-p"></label> <input type="checkbox" name="seat" id="seatL4" value="L4">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatL6" title="L6" class="label-p"></label> <input type="checkbox" name="seat" id="seatL6" value="L6">
									</td>
									<td><label for="seatL7" title="L7" class="label-p"></label> <input type="checkbox" name="seat" id="seatL7" value="L7">
									</td>
									<td><label for="seatL8" title="L8" class="label-p"></label> <input type="checkbox" name="seat" id="seatL8" value="L8">
									</td>
									<td><label for="seatL9" title="L9" class="label-p"></label> <input type="checkbox" name="seat" id="seatL9" value="L9">
									</td>
									<td><label for="seatL10" title="L10" class="label-p"></label> <input type="checkbox" name="seat" id="seatL10" value="L10">
									</td>
									<td><label for="seatL11" title="L11" class="label-p"></label> <input type="checkbox" name="seat" id="seatL11" value="L11">
									</td>
									<td><label for="seatL12" title="L12" class="label-p"></label> <input type="checkbox" name="seat" id="seatL12" value="L12">
									</td>
									<td><label for="seatL13" title="L13" class="label-p"></label> <input type="checkbox" name="seat" id="seatL13" value="L13">
									</td>
									<td><label for="seatL14" title="L14" class="label-p"></label> <input type="checkbox" name="seat" id="seatL14" value="L14">
									</td>
									<td><label for="seatL15" title="L15" class="label-p"></label> <input type="checkbox" name="seat" id="seatL15" value="L15">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatL17" title="L17" class="label-p"></label> <input type="checkbox" name="seat" id="seatL17" value="L17">
									</td>
									<td><label for="seatL18" title="L18" class="label-p"></label> <input type="checkbox" name="seat" id="seatL18" value="L18">
									</td>
									<td><label for="seatL19" title="L19" class="label-p"></label> <input type="checkbox" name="seat" id="seatL19" value="L19">
									</td>
									<td><label for="seatL20" title="L20" class="label-p"></label> <input type="checkbox" name="seat" id="seatL20" value="L20">
									</td>
									<td><label for="seatL21" title="L21" class="label-p"></label> <input type="checkbox" name="seat" id="seatL21" value="L21">
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr class="tr-seat">
									<td></td>
									<td></td>
									<td><label for="seatM0" title="M0" class="label-p"></label> <input type="checkbox" name="seat" id="seatM0" value="M0">
									</td>
									<td><label for="seatM1" title="M1" class="label-p"></label> <input type="checkbox" name="seat" id="seatM1" value="M1">
									</td>
									<td><label for="seatM2" title="M2" class="label-p"></label> <input type="checkbox" name="seat" id="seatM2" value="M2">
									</td>
									<td><label for="seatM3" title="M3" class="label-p"></label> <input type="checkbox" name="seat" id="seatM3" value="M3">
									</td>
									<td><label for="seatM4" title="M4" class="label-p"></label> <input type="checkbox" name="seat" id="seatM4" value="M4">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatM6" title="M6" class="label-p"></label> <input type="checkbox" name="seat" id="seatM6" value="M6">
									</td>
									<td><label for="seatM7" title="M7" class="label-p"></label> <input type="checkbox" name="seat" id="seatM7" value="M7">
									</td>
									<td><label for="seatM8" title="M8" class="label-p"></label> <input type="checkbox" name="seat" id="seatM8" value="M8">
									</td>
									<td><label for="seatM9" title="M9" class="label-p"></label> <input type="checkbox" name="seat" id="seatM9" value="M9">
									</td>
									<td><label for="seatM10" title="M10" class="label-p"></label> <input type="checkbox" name="seat" id="seatM10" value="M10">
									</td>
									<td><label for="seatM11" title="M11" class="label-p"></label> <input type="checkbox" name="seat" id="seatM11" value="M11">
									</td>
									<td><label for="seatM12" title="M12" class="label-p"></label> <input type="checkbox" name="seat" id="seatM12" value="M12">
									</td>
									<td><label for="seatM13" title="M13" class="label-p"></label> <input type="checkbox" name="seat" id="seatM13" value="M13">
									</td>
									<td><label for="seatM14" title="M14" class="label-p"></label> <input type="checkbox" name="seat" id="seatM14" value="M14">
									</td>
									<td><label for="seatM15" title="M15" class="label-p"></label> <input type="checkbox" name="seat" id="seatM15" value="M15">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatM17" title="M17" class="label-p"></label> <input type="checkbox" name="seat" id="seatM17" value="M17">
									</td>
									<td><label for="seatM18" title="M18" class="label-p"></label> <input type="checkbox" name="seat" id="seatM18" value="M18">
									</td>
									<td><label for="seatM19" title="M19" class="label-p"></label> <input type="checkbox" name="seat" id="seatM19" value="M19">
									</td>
									<td><label for="seatM20" title="M20" class="label-p"></label> <input type="checkbox" name="seat" id="seatM20" value="M20">
									</td>
									<td><label for="seatM21" title="M21" class="label-p"></label> <input type="checkbox" name="seat" id="seatM21" value="M21">
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr class="tr-seat">
									<td></td>
									<td></td>
									<td><label for="seatN0" title="N0" class="label-p"></label> <input type="checkbox" name="seat" id="seatN0" value="N0">
									</td>
									<td><label for="seatN1" title="N1" class="label-p"></label> <input type="checkbox" name="seat" id="seatN1" value="N1">
									</td>
									<td><label for="seatN2" title="N2" class="label-p"></label> <input type="checkbox" name="seat" id="seatN2" value="N2">
									</td>
									<td><label for="seatN3" title="N3" class="label-p"></label> <input type="checkbox" name="seat" id="seatN3" value="N3">
									</td>
									<td><label for="seatN4" title="N4" class="label-p"></label> <input type="checkbox" name="seat" id="seatN4" value="N4">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatN6" title="N6" class="label-p"></label> <input type="checkbox" name="seat" id="seatN6" value="N6">
									</td>
									<td><label for="seatN7" title="N7" class="label-p"></label> <input type="checkbox" name="seat" id="seatN7" value="N7">
									</td>
									<td><label for="seatN8" title="N8" class="label-p"></label> <input type="checkbox" name="seat" id="seatN8" value="N8">
									</td>
									<td><label for="seatN9" title="N9" class="label-p"></label> <input type="checkbox" name="seat" id="seatN9" value="N9">
									</td>
									<td><label for="seatN10" title="N10" class="label-p"></label> <input type="checkbox" name="seat" id="seatN10" value="N10">
									</td>
									<td><label for="seatN11" title="N11" class="label-p"></label> <input type="checkbox" name="seat" id="seatN11" value="N11">
									</td>
									<td><label for="seatN12" title="N12" class="label-p"></label> <input type="checkbox" name="seat" id="seatN12" value="N12">
									</td>
									<td><label for="seatN13" title="N13" class="label-p"></label> <input type="checkbox" name="seat" id="seatN13" value="N13">
									</td>
									<td><label for="seatN14" title="N14" class="label-p"></label> <input type="checkbox" name="seat" id="seatN14" value="N14">
									</td>
									<td><label for="seatN15" title="N15" class="label-p"></label> <input type="checkbox" name="seat" id="seatN15" value="N15">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatN17" title="N17" class="label-p"></label> <input type="checkbox" name="seat" id="seatN17" value="N17">
									</td>
									<td><label for="seatN18" title="N18" class="label-p"></label> <input type="checkbox" name="seat" id="seatN18" value="N18">
									</td>
									<td><label for="seatN19" title="N19" class="label-p"></label> <input type="checkbox" name="seat" id="seatN19" value="N19">
									</td>
									<td><label for="seatN20" title="N20" class="label-p"></label> <input type="checkbox" name="seat" id="seatN20" value="N20">
									</td>
									<td><label for="seatN21" title="N21" class="label-p"></label> <input type="checkbox" name="seat" id="seatN21" value="N21">
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr class="tr-seat">
									<td></td>
									<td></td>
									<td><label for="seatO0" title="O0" class="label-p"></label> <input type="checkbox" name="seat" id="seatO0" value="O0">
									</td>
									<td><label for="seatO1" title="O1" class="label-p"></label> <input type="checkbox" name="seat" id="seatO1" value="O1">
									</td>
									<td><label for="seatO2" title="O2" class="label-p"></label> <input type="checkbox" name="seat" id="seatO2" value="O2">
									</td>
									<td><label for="seatO3" title="O3" class="label-p"></label> <input type="checkbox" name="seat" id="seatO3" value="O3">
									</td>
									<td><label for="seatO4" title="O4" class="label-p"></label> <input type="checkbox" name="seat" id="seatO4" value="O4">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatO6" title="O6" class="p-2 sold"></label> <input type="checkbox" name="seat" id="seatO6" value="O6">
									</td>
									<td><label for="seatO7" title="O7" class="label-p"></label> <input type="checkbox" name="seat" id="seatO7" value="O7">
									</td>
									<td><label for="seatO8" title="O8" class="label-p"></label> <input type="checkbox" name="seat" id="seatO8" value="O8">
									</td>
									<td><label for="seatO9" title="O9" class="label-p"></label> <input type="checkbox" name="seat" id="seatO9" value="O9">
									</td>
									<td><label for="seatO10" title="O10" class="label-p"></label> <input type="checkbox" name="seat" id="seatO10" value="O10">
									</td>
									<td><label for="seatO11" title="O11" class="label-p"></label> <input type="checkbox" name="seat" id="seatO11" value="O11">
									</td>
									<td><label for="seatO12" title="O12" class="label-p"></label> <input type="checkbox" name="seat" id="seatO12" value="O12">
									</td>
									<td><label for="seatO13" title="O13" class="label-p"></label> <input type="checkbox" name="seat" id="seatO13" value="O13">
									</td>
									<td><label for="seatO14" title="O14" class="label-p"></label> <input type="checkbox" name="seat" id="seatO14" value="O14">
									</td>
									<td><label for="seatO15" title="O15" class="label-p"></label> <input type="checkbox" name="seat" id="seatO15" value="O15">
									</td>
									<td></td>
									<td></td>
									<td><label for="seatO17" title="O17" class="label-p"></label> <input type="checkbox" name="seat" id="seatO17" value="O17">
									</td>
									<td><label for="seatO18" title="O18" class="label-p"></label> <input type="checkbox" name="seat" id="seatO18" value="O18">
									</td>
									<td><label for="seatO19" title="O19" class="label-p"></label> <input type="checkbox" name="seat" id="seatO19" value="O19">
									</td>
									<td><label for="seatO20" title="O20" class="label-p"></label> <input type="checkbox" name="seat" id="seatO20" value="O20">
									</td>
									<td><label for="seatO21" title="O21" class="label-p"></label> <input type="checkbox" name="seat" id="seatO21" value="O21">
									</td>
									<td></td>
									<td></td>
								</tr>
							</table>
						</div>
						<!-- right-side-bar -->
						<div class="side-bar" id="right-side-bar" style="right: 0%">
							<table style="text-align: center">
								<tr class="tr-seat">
									<td>A</td>
								</tr>
								<tr class="tr-seat">
									<td>B</td>
								</tr>
								<tr class="tr-seat">
									<td>C</td>
								</tr>
								<tr class="tr-seat">
									<td>D</td>
								</tr>
								<tr class="tr-seat">
									<td>E</td>
								</tr>
								<tr class="tr-seat">
									<td>F</td>
								</tr>
								<tr class="tr-seat">
									<td>G</td>
								</tr>
								<tr class="tr-seat">
									<td>H</td>
								</tr>
								<tr class="tr-seat">
									<td>I</td>
								</tr>
								<tr class="tr-seat">
									<td>J</td>
								</tr>
								<tr class="tr-seat">
									<td>K</td>
								</tr>
								<tr class="tr-seat">
									<td>L</td>
								</tr>
								<tr class="tr-seat">
									<td>M</td>
								</tr>
								<tr class="tr-seat">
									<td>N</td>
								</tr>
								<tr class="tr-seat">
									<td>O</td>
								</tr>
							</table>
						</div>
						<div class="clearfix d-none d-sm-block"></div>
						<!-- <div class="col-md-12 d-inline-block col-seat-width">
                        <input class="btn btn-primary float-right" type="submit" value="Submit">
                    </div> -->
					</div>
				</div>
				<div class="col-md-3">
					<div class="border-1">
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
										<div class="float-right">${item.unitPrice} X ${item.quantity} = ${item.unitPrice * item.quantity}</div>
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
			</div>
			<div class="row mt-5">
				<div class="col-md-12">
					<input class="btn btn-secondary float-right" type="submit" value="Submit">
				</div>
			</div>
		</form>
	</div>
</body>

</html>