<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script>
//유효성 검사
	function validateFindPW() {
		
		//event.preventDefault(); // submit 기능 끄기
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		var reg_name = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		var reg_phone = /^\d{10,11}$/;

		// 초기화
		var result = true;
		$(".error").html("");

		// 유효성 검사 코드
		const member_email = $("#member_email").val();
		const member_name = $("#member_name").val();
		const member_phone = $("#member_phone").val();
	
		
		// 이메일 유효성
		if (member_email === "") {
			result = false;
			$("#errorEmail").html("필수 사항 입니다.");
		} else if(!reg_email.test(member_email)){
			result = false;
			$("#errorEmail").html("이메일 형식에 맞지않습니다.");
		}
		
		// 이름 유효성
		if (member_name === "") {
			result = false;
			$("#errorName").html("필수 사항 입니다.");
		} else if(!reg_name.test(member_name)){
			$("#errorName").html("2자이상 4자 이하의 한글 이름 혹은 띄어쓰기를한 영문 이름을 적어주세요.");
		}
			
		// 전화 앞번호 유효성
		if (member_phone === "") {
			result = false;
			$("#errorPhone").html("필수 사항 입니다.");
		} else if (!reg_phone.test(member_phone)) {
				result = false;
				$("#errorPhone").html("7자이상 8자 이하의 숫자만 적어주세요.");
		}
		console.log(result);
		
		return result;
	}
	function checkPw(){
		event.preventDefault();
		var member_email = $("#member_email").val();
		var member_name = $("#member_name").val();
		var member_phone = $("#member_phone").val();
		$.ajax({
		method:"post",
		url:"findPwCheck",
		data: { 
			member_email,
			member_name,
			member_phone,
			${_csrf.parameterName}:"${_csrf.token}"
			}
		})
		.then(data => {
	    	 if(data.result == "success"){
				 $("#resetForm").submit();
	  	  } else if(data.result == "notFindEmail"){
	    		 console.log("없는 이메일 입니다.");
	    		 alert("없는 이메일 입니다.");
	 	   } else if(data.result == "notFindName"){
	 		  	 console.log("없는 이름 입니다.");
	 			 alert("없는 이름 입니다.");
	 	   } else if(data.result == "notFindPhone"){
	 		  	 console.log("다른 번호 입니다.");
	 			 alert("다른 번호 입니다.");
	 	   }
		 });
	}
</script>

<style>
.error {
	color: red;
	font-size: 0.8em;
}
</style>


<!-- 비밀번호 재설정 부분 -->
	<div class="resetPw_main">
		<div class="resetPw_header">

			<h3>사방팔방</h3>

		</div>

		<form id="resetForm" method="post" action="findPwdDo" onsubmit="return validateFindPW()" novalidate>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="resetPw_input">
				<div class="mb-3">
					<input type="email" class="form-control" id="member_email" placeholder="이메일" name="member_email">
				</div>
				<div class="mb-3">
					<span class="error" id="errorEmail"></span>
				</div>
				<div class="mb-3">
					<input type="text" class="form-control" id="member_name" placeholder="이름" name="member_name">
				</div>
				<div class="mb-3">
					<span class="error" id="errorName"></span>
				</div>
				<div class="mb-3">
					<input type="text" class="form-control" id="member_phone" placeholder="연락처" name="member_phone">
				</div>
				<div class="mb-3">
					<span class="error" id="errorPhone"></span>
				</div>
				<button onclick="checkPw()" type="submit" class="btn btn-info">비밀번호 재설정</button>
			</div>

			<div class="resetPw_otherMenu">
				<a href="loginForm">로그인하기</a>
				<a href="findEmailForm">이메일 찾기</a>
				<a href="signinForm">회원가입</a>

			</div>
		</form>
	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>