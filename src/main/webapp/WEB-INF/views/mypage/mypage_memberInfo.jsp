<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("roadaddress").value = addr;
                // 초기화 하고 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailaddress").value="";
                document.getElementById("detailaddress").focus();
            }
        }).open();
    }
</script>

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
		var email = $("#member_email").val();
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




<!-- 마이페이지 메뉴 헤더 -->
<div class="mypage_header">
	<a class="mypage_header_member_info" href="mypage_memberInfo_check">회원 정보</a>
	<a href="mypage_orderlist">주문 내역</a> 
	<a href="mypage_inquiry">내가 쓴 문의글</a>
</div>


<!-- 회원 정보 페이지 -->

<div class="mypage_memInfo_main">

	<form method="post" action="updateMember">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" /> <input type="hidden" name="member_id"
			value="${member.member_id}" />
		<div class="mypage_memInfo_signinInput">
			<div class="mypage_memInfo_signinInput_label">이메일</div>

			<div class="mb-3 mypage_memInfo_signinInput_bind">
				<input type="email" class="form-control" id="member_email"
					placeholder="${member.member_email}" name="member_email">
			</div>
			<span id="errorEmail" class="error mb-3"></span>
			<br/>
			<br/>
			<div class="mypage_memInfo_signinInput_label">비밀번호</div>
			<div>
				<small>비밀번호 8자 이상 특수기호 1개 이상으로 구성하여야 합니다.</small>
			</div>
			<div class="mb-3">
				<input type="password" class="form-control" id="member_pw"
					placeholder="수정 비밀번호" name="member_pw">
			</div>
			<span id="errorPw" class="error"></span>
			
			<br />
			<div class="mypage_memInfo_signinInput_label">비밀번호 확인</div>
			<div class="mb-3">
				<input type="password" class="form-control" id="member_pwcheck"
					placeholder="수정 비밀번호 확인" name="member_pwcheck">
			</div>
			<span id="errorPwCheck" class="error"></span>
			
			<br />
			<div class="mypage_memInfo_signinInput_label">이름</div>
			<div class="mb-3">
				<input type="text" class="form-control" id="member_name"
					placeholder="${member.member_name}" name="member_name">
			</div>
			<span id="errorName" class="error"></span>
			<br />
			<div class="mypage_memInfo_signinInput_label">연락처</div>
			<div class="mb-3 mypage_memInfo_signinInput_bind">

				<input type="tel" class="form-control" id="member_phone"
					placeholder="${member.member_phone}" name="member_phone">

			</div>
			<!-- <div class="mypage_memInfo_signinInput_label">연락처</div>
			<div class="mb-3 mypage_memInfo_signinInput_bind">
				<select name="tel_pre">
					<option selected="" value="" disabled="">선택해주세요</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="019">019</option>
				</select> <input type="tel" class="form-control" id="tel_suf"
					placeholder="휴대폰번호 입력" name="tel_suf">
			</div> -->
			<span id="errorPhone" class="error"></span>
			<br />

			<%--  <div class="mypage_memInfo_signinInput_label">주소</div>
               
                <div class="mb-3 mypage_memInfo_signinInput_bind">
                    <input type="text" class="form-control" id="zipcode" value="${member.zipcode}"
                            name="zipcode">
                    <input type="button" class="form-control" id="findaddress" value="우편번호 찾기" name="findaddress">

                </div>           

                <div>
                    <input type="text" class="form-control" id="roadaddress" value="${member.roadaddress}"
                       		name="roadaddress">
                </div>
                <div>
                   	<input type="text" class="form-control" id="detailaddress" value="${member.detailaddress}"
                        	name="detailaddress">
               	</div> --%>
               	
               	
            <!-- daum 도로검색 api -->
            <div class="mb-1">
            	<input type="text" id="zipcode" placeholder="우편번호" value="${member.zipcode}" name="zipcode" style="width:69%" readonly>
            	<input type="button" onclick="DaumPostcode()" value="우편번호 찾기" style="width:30%">
            </div>
            <div class="mb-1">
            	<input type="text" id="roadaddress" placeholder="주소" value="${member.roadaddress}" name="roadaddress" style="width:100%" readonly>
            </div>
			<div class="mb-1">
				<input type="text" id="detailaddress" placeholder="상세주소" value="${member.detailaddress}" name="detailaddress">
				<input type="text" id="extraAddress" placeholder="참고항목" readonly>
			</div>
			

			
			<br />

			<div>별명</div>
			<div>
				<small>다른 유저와 겹치지않는 별명을 입력해주세요, (2~15자)</small>
			</div>
			<div class="mb-3 mypage_memInfo_signinInput_bind">
				<input type="text" class="form-control" id="member_nickname"
					placeholder="${member.member_nickname}" name="member_nickname">
			</div>
			<span id="errorNickname" class="error"></span>
			<div style="text-align: center;">
				<button type="submit" class="btn btn-primary btn-lg">회원 정보
					수정</button>
			</div>
		</div>
	</form>

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>