<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>
//유효성 검사
	function validateFindEmail() {
		
		//event.preventDefault(); // submit 기능 끄기
		
		var reg_name = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		var reg_phone = /^\d{10,11}$/;

		// 초기화
		var result = true;
		$(".error").html("");

		// 유효성 검사 코드
		const member_name = $("#member_name").val();
		const member_phone = $("#member_phone").val();
	
		// 이름 유효성
		if (member_name === "") {
			result = false;
			$("#errorName").html("필수 사항 입니다.");
		} else if(!reg_name.test(member_name)){
			$("#errorName").html("2자이상 4자 이하의 한글 이름 혹은 띄어쓰기를한 영문 이름을 적어주세요.");
		}
			
		// 전화 앞번호 유효성
		if (reg_phone === "") {
			result = false;
			$("#errorPhone").html("필수 사항 입니다.");
		}
		else if (!reg_phone.test(member_phone)) {
				result = false;
				$("#errorPhone").html("7자이상 8자 이하의 숫자만 적어주세요.");
		}
		console.log(result);
		
		return result;
	}
</script>

<style>
.error {
	color: red;
	font-size: 0.8em;
}
</style>
<div class="findEmail_main">
	<div class="findEmail_header">
		<h3>사방팔방</h3>
	</div>
	<form id="findForm" method="post" action="findEmailDo"
		onsubmit="return validateFindEmail()" novalidate>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

		<div class="findEmail_input">
			<div class="mb-3">
				<input type="text" class="form-control" id="member_name"
					placeholder="이름" name="member_name">
			</div>
			<div class="mb-3">
				<span class="error" id="errorName"></span>
			</div>
			<div class="mb-3">
				<input type="text" class="form-control" id="member_phone"
					placeholder="연락처" name="member_phone">
			</div>
			<div class="mb-3">
				<span class="error" id="errorPhone"></span>
			</div>
			<button type="submit" class="btn btn-info">이메일 찾기</button>
		</div>
	</form>
	<div class="findEmail_otherMenu">
		<a href="loginForm">로그인하기</a> <a href="resetPwForm">비밀번호 재설정</a> <a
			href="signinForm">회원가입</a>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>