<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="overflow-auto">
	<div id="screen" style="min-width: ${minWidth}px; text-align: center; margin-bottom: 5%; margin-top:5%;">
		<button type="button" class="btn btn-secondary btn-lg" style="width: 80%" disabled>Screen</button>
	</div>
	<div class="position-relative" style="width: 90%; min-width: ${minWidth}px; margin: 0 auto;">
		<!-- seat -->
		<div style="width: 100%; margin-bottom: 5%;">
			<table id="seatTable" class="table-seat" style="margin: 0 auto; left: 0; top: 0; table-layout: fixed; width: 100%;">${seatTable}
			</table>
		</div>
		<!-- 		<div class="clearfix d-none d-sm-block"></div> -->
	</div>
</div>
<div id="legend" style="text-align: right; margin-bottom: 10%; margin-top: 5%;">
	<span style="margin-right: 5%">
		<label for='available-legend'></label>
		<input type='checkbox' name='seat-legend' class="notSale" id='available-legend'>
		可選擇
	</span>
	<span style="margin-right: 5%">
		<label for='sold-legend' class="sold"></label>
		<input type='checkbox' name='seat-legend' class="notSale" id='sold-legend'>
		已售出
	</span>
	<span style="margin-right: 5%">
		<label for='preserve-legend' class="preserve"></label>
		<input type='checkbox' name='seat-legend' class="notSale" id='preserve-legend'>
		現場保留位
	</span>
</div>
