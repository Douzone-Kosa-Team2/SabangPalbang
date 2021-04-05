<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
.error {
	color: red;
	font-size: 0.8em;
}
</style>
<script>

// 중복 이메일, 별명 체크
var dupEmail=false;
var dupNickname=false;
//아이디 중복검사
console.log("회원가입로딩");	
$(function(){ 
	$("#member_email").on("propertychange change keyup paste input", function(){
		
		//console.log("member_email 키 감지");
		var email = $("#member_email").val() + "@" + $("#member_email2").val();
		//console.log("email : " + email);
		$.ajax({
			method:"post",
			url:"checkEmail",
			data: {email, ${_csrf.parameterName}:"${_csrf.token}"}
		})
		.then(data => {
	         if(data.resultEmail == "success"){
	        	 //console.log("사용가능한 이메일입니다.");
	        	 dupEmail = true;
	        	 $("#errorEmail").html("사용가능한 이메일입니다.");
	         } else {
	        	 //console.log("중복된 이메일입니다.");
	        	 dupEmail=false;
	        	 $("#errorEmail").html("중복된 이메일입니다.");
	         }
	     });

	});
	$("#member_nickname").on("propertychange change keyup paste input", function(){

		//console.log("member_nickname 키 감지");
		var nickname = $("#member_nickname").val();
		//console.log("nickname : " + nickname);
		
		
		$.ajax({
		method:"post",
		url:"checkNickname",
		data: {nickname, ${_csrf.parameterName}:"${_csrf.token}"}
		})
		.then(data => {
        	 if(data.resultNickname == "success"){
        		 //console.log("사용가능한 별명입니다.");
        		 dupNickname = true;
        		 $("#errorNickname").html("사용가능한 별명입니다.");
      	  } else {
        		 //console.log("중복된 볍명입니다.");
        		 dupNickname=false;
        		 $("#errorNickname").html("중복된 볍명입니다.");
     	   }
    	 });
	});
	
});

	//유효성 검사
	function validate() {
		
		event.preventDefault(); // submit 기능 끄기
		
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		// 비밀번호 8자 이상 특수기호 1개 이상 
		var reg_pw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50}).{8,50}$/;
		// 한글 이름 2~4자 이내 혹은 영문 이름 2~10자 이내 : 띄어쓰기(\s)가 들어가며 First, Last Name 형식
		var reg_name = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		// 뒷자리 7-8자리 숫자
		var reg_tel_suf = /^[0-9]{7,8}$/;
		// 한글,영문,숫자 사용가능 2자이상 15자 이하
		var reg_nickname = /^[0-9a-zA-Z가-힣]{2,15}$/; 

		// 초기화
		var result = true;
		$(".error").html("");

		// 유효성 검사 코드
		const member_email = $("#member_email").val();
		const member_pw = $("#member_pw").val();
		const member_pwcheck = $("#member_pwcheck").val();
		const member_name = $("#member_name").val();
		const tel_pre = $("#tel_pre").val();
		const tel_suf = $("#tel_suf").val();
		const member_nickname = $("#member_nickname").val();
		const agreecheck = $("#agreecheck").is(":checked");

		
		// 이메일 유효성
		if (member_email === "") {
			result = false;
			$("#errorEmail").html("필수 사항 입니다.");
		} else if(dupEmail == false){
			result = false;
			$("#errorEmail").html("중복된 이메일입니다.");
		}
		
		// 비밀번호 유효성
		if (member_pw === "") {
			result = false;
			$("#errorPw").html("필수 사항 입니다.");
		} else if (member_pw.length < 8) {
			result = false;
			$("#errorPw").html("최소 8자 이상 입력해야 합니다.");
		} else if (member_pw.length > 50) {
			result = false;
			$("#errorPw").html("최대 50자 이하 입력가능 합니다.");
		}
		else{
			if (!reg_pw.test(member_pw)) {
				result = false;
				$("#errorPw").html("특수기호 1개 이상 넣어주세요.");
			}
		}
		

		// 비밀번호 확인 유효성
		if (member_pwcheck === "") {
			result = false;
			$("#errorPwCheck").html("비밀번호가 일치하지 않습니다.");
		} else if(member_pwcheck != member_pw){
			result = false;
			$("#errorPwCheck").html("비밀번호가 일치하지 않습니다.");
		}
		
		// 이름 유효성
		if (member_name === "") {
			result = false;
			$("#errorName").html("필수 사항 입니다.");
		} else{
			if (!reg_name.test(member_name)) {
				result = false;
				$("#errorName").html("2자이상 4자 이하의 한글 이름 혹은 띄어쓰기를한 영문 이름을 적어주세요.");
			}
		}
		
		// 전화 앞번호 유효성
		if (tel_pre === "") {
			result = false;
			$("#errorPhone").html("필수 사항 입니다.");
		}
		// 전화 뒷번호 유효성
		if (tel_suf === "") {
			result = false;
			$("#errorPhone").html("필수 사항 입니다.");
		} else{
			if (!reg_tel_suf.test(tel_suf)) {
				result = false;
				$("#errorPhone").html("7자이상 8자 이하의 숫자만 적어주세요.");
			}
		}
		
		// 별명 유효성
		if (member_nickname === "") {
			result = false;
			$("#errorNickname").html("필수 사항 입니다.");
		} else if (!reg_nickname.test(member_nickname)) {
			result = false;
			$("#errorNickname").html("2자이상 15자 이하 한글,영문,숫자로 적어주세요.");
		} else if(dupNickname == false){
			result = false;
			$("#errorNickname").html("중복된 볍명입니다.");
		}
		
		// 약관동의 유효성
		if (agreecheck == false) {
			result = false;
			$("#errorAgree").html("필수 사항 체크해 주세요.");
		}
		
		//전송 
		if (result) {
			$("#signForm")[0].submit(); //element 객체 얻기 + 전송 preventDefault
			//document.joinForm.submit(); //name으로 찾기 
		}
	}
	

</script>

<!-- 회원가입 내용 부분 -->
<div class="signin_main">

	<div class="signin_header">
		<h3>회원 가입</h3>
		<hr>
	</div>
	<form id="signForm" method="post" action="signin" onsubmit="validate()"
		novalidate>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

		<div class="signin_input">
			<div>이메일</div>

			<div class="signin_input_form">
				<input type="text" class="form-control" id="member_email"
					placeholder="이메일" name="member_email"> @ <select
					id="member_email2" name="member_email2">
					<option selected="" value="" disabled="">선택해주세요</option>
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
					<option value="nate.com">nate.com</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="outlook.com">outlook.com</option>
					<option value="icloud.com">icloud.com</option>
					<!-- <option value="_manual">직접입력</option> -->
				</select>
			</div>
			<span id="errorEmail" class="error mb-3"></span>


			<div>비밀번호</div>
			<div>
				<small>비밀번호 8자 이상 특수기호 1개 이상으로 구성하여야 합니다.</small>
			</div>
			<div class="mb-3">
				<input type="password" class="form-control" id="member_pw"
					placeholder="비밀번호" name="member_pw"> <span id="errorPw"
					class="error"></span>
			</div>

			<div>비밀번호 확인</div>
			<div class="mb-3">
				<input type="password" class="form-control" id="member_pwcheck"
					placeholder="비밀번호 확인" name="member_pwcheck"> <span
					id="errorPwCheck" class="error"></span>
			</div>

			<div>이름</div>
			<div class="mb-3">
				<input type="text" class="form-control" id="member_name"
					placeholder="이름" name="member_name"> <span id="errorName"
					class="error"></span>
			</div>

			<div>휴대번호</div>
			<div class="signin_input_form">
				<select name="tel_pre">
					<option selected="" value="" disabled="">선택해주세요</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="019">019</option>
				</select> <input type="tel" class="form-control" id="tel_suf"
					placeholder="휴대폰번호 입력" name="tel_suf">

			</div>
			<span id="errorPhone" class="error"></span>

			<div>별명</div>
			<div>
				<small>다른 유저와 겹치지않는 별명을 입력해주세요, (2~15자)</small>
			</div>
			<div class="mb-3">
				<input type="text" class="form-control" id="member_nickname"
					placeholder="별명(2~15자)" name="member_nickname"> <span
					id="errorNickname" class="error"></span>
			</div>

			<div class="signin_agree">
				<input id="agreecheck" type="checkbox" />&nbsp;&nbsp;개인정보 약관에
				동의합니다. <span id="errorAgree" class="error"></span>
			</div>

			<div class="signin_btn">
				<button type="submit" class="btn btn-info">회원가입 완료</button>
			</div>


		</div>
	</form>

	<div class="signin_othermenu">

		<p>
			이미 아이디가 있으신가요? <a class="header_logIn_item" href="loginForm">로그인</a>
		</p>
	</div>

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>