<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal-dialog modal-dialog-centered" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title" id="loginModalTitle">會員登入</h5>
			<p style="color: red">${errMsg.error}</p>
		</div>
		<div class="modal-body">
			<label for="account">帳號</label>
			<input id="account" name="account" type="text" placeholder="請輸入會員帳號">
			<p style="color: red">${errMsg.account}</p>
			<label for="password">密碼</label>
			<input id="password" name="password" type="password" placeholder="請輸入密碼">
			<p style="color: red">${errMsg.password}</p>
		</div>
		<div class="modal-footer">
			<button type="submit" class="btn btn-primary">登入</button>
			<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
			<button id="oneset" type="button" class="btn btn-info">一鍵輸入</button>
		</div>
	</div>
</div>
<script>
$(function(){
	$("#oneset").click(function() {
		$("#account").val("taigeranan@gmail.com");
		$("#password").val("Do!ng123");
	});
	
});
</script>