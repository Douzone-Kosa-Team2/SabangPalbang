<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
var dupEmail=false;
var dupPhone=false;
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
	        	 //$("#errorEmail").html("사용가능한 이메일입니다.");
	         } else {
	        	 //console.log("중복된 이메일입니다.");
	        	 dupEmail = false;
	        	 $("#errorEmail").html("중복된 이메일입니다.");
	         }
	     });

	});
	$("#member_email2").on("propertychange change keyup paste input", function(){
		
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
	        	 dupEmail = false;
	        	 $("#errorEmail").html("중복된 이메일입니다.");
	         }
	     });

	});
	$("#member_phone").on("propertychange change keyup paste input", function(){
		
		//console.log("tel_suf 키 감지");
		//console.log("tel1 : " + $("#tel_pre").val());
		var checkTelephone = $("#member_phone").val();

		$.ajax({
			method:"post",
			url:"checkPhone",
			data: {checkTelephone, ${_csrf.parameterName}:"${_csrf.token}"}
		})
		.then(data => {
	         if(data.resultPhone == "success"){
	        	 //console.log("사용가능한 이메일입니다.");
	        	 dupPhone = true;
	        	 //$("#errorPhone").html("사용가능한 휴대폰번호입니다.");
	         } else {
	        	 //console.log("중복된 이메일입니다.");
	        	 dupPhone = false;
	        	 $("#errorPhone").html("중복된 휴대폰번호입니다.");
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
        		 dupNickname = false;
        		 $("#errorNickname").html("중복된 볍명입니다.");
     	   }
    	 });
	});
	
});

	//유효성 검사
	function validateUpdateMember() {
		
		//event.preventDefault(); // submit 기능 끄기
		
		// 비밀번호 8자 이상 특수기호 1개 이상 
		var reg_pw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50}).{8,50}$/;
		var reg_phone = /^\d{10,11}$/;

		// 초기화
		var result = true;
		$(".error").html("");

		// 유효성 검사 코드

		const member_pw = $("#member_pw").val();
		const member_pwcheck = $("#member_pwcheck").val();
		const member_phone = $("#member_phone").val();

		// 초기화
		$("#errorPw").html("");
		$("#errorPwCheck").html("");
		$("#errorPhone").html("");
		
		// 비밀번호 유효성
		if(member_pw !== ""){
			if (member_pw.length > 0 && member_pw.length < 8) {
				result = false;
				$("#errorPw").html("최소 8자 이상 입력해야 합니다.");
			} else if (member_pw.length > 50) {
				result = false;
				$("#errorPw").html("최대 50자 이하 입력가능 합니다.");
			}  else if (!reg_pw.test(member_pw)) {
				result = false;
				$("#errorPw").html("특수기호 1개 이상 넣어주세요.");
			}
		} else {
			$("#errorPw").html("기존 비밀번호 사용.");
		}

		// 비밀번호 확인 유효성
		if((member_pw !== "")&&(member_pwcheck === "")){
			result = false;
			$("#errorPwCheck").html("비밀번호를 확인해주세요.");
		} else if(member_pwcheck != member_pw){
			result = false;
			$("#errorPwCheck").html("비밀번호가 일치하지 않습니다.");
		}
		// 휴대번호 유효성
		if (member_phone !== "") {
			if(reg_phone.test(member_phone)){
				result = false;
				$("#errorPhone").html("10자이상 11자 이하의 숫자만 적어주세요.");
			} else if(dupPhone){
				result = false;
				$("#errorPhone").html("중복된 번호입니다.");
			}
		} else {
			$("#errorPhone").html("기존 휴대번호 사용.");
		}
		console.log(result);
		
		return result;
	}
	function deleteMember(){
		event.preventDefault();
		$.ajax({
		method:"post",
		url:"deleteMember",
		data: {${_csrf.parameterName}:"${_csrf.token}"}
		})
		.then(data => {
        	 if(data.result == "success"){
				 $("#deleteForm").submit();
      	  } else {
        		 console.log("탈퇴 실패");
     	   }
    	 });
	}
	
	
	$('#exampleModal').on('shown.bs.modal', function () {
		  $('#exampleModal').trigger('focus')
	})
</script>




<!-- 마이페이지 메뉴 헤더 -->
<div class="mypage_header">
	<a class="mypage_header_member_info" href="mypage_memberInfo_check">회원
		정보</a> <a href="mypage_orderlist">주문 내역</a> <a href="mypage_inquiry">내가
		쓴 문의글</a>
</div>


<!-- 회원 정보 페이지 -->

<div class="mypage_memInfo_main">

	<form id="updateForm" method="post" action="updateMember"
		onsubmit="return validateUpdateMember()" novalidate>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" /> <input type="hidden" name="member_id"
			value="${member.member_id}" />
		<div class="mypage_memInfo_signinInput">
			<div class="mypage_memInfo_signinInput_label">이메일</div>

			<div class="mb-3 mypage_memInfo_signinInput_bind">
				<input type="email" class="form-control" id="member_email"
					value="${member.member_email}" name="member_email" readonly>
			</div>
			<span id="errorEmail" class="error mb-3"></span> <br /> <br />
			<div class="mypage_memInfo_signinInput_label">비밀번호</div>
			<div>
				<small>비밀번호 8자 이상 특수기호 1개 이상으로 구성하여야 합니다.</small>
			</div>
			<div class="mb-3">
				<input type="password" class="form-control" id="member_pw"
					placeholder="수정 비밀번호" name="member_pw">
			</div>
			<span id="errorPw" class="error"></span> <br />
			<div class="mypage_memInfo_signinInput_label">비밀번호 확인</div>
			<div class="mb-3">
				<input type="password" class="form-control" id="member_pwcheck"
					placeholder="수정 비밀번호 확인" name="member_pwcheck">
			</div>
			<span id="errorPwCheck" class="error"></span> <br />
			<div class="mypage_memInfo_signinInput_label">이름</div>
			<div class="mb-3">
				<input type="text" class="form-control" id="member_name"
					value="${member.member_name}" name="member_name" readonly>
			</div>
			<span id="errorName" class="error"></span> <br />
			<div class="mypage_memInfo_signinInput_label">휴대번호</div>
			<div class="mb-3 mypage_memInfo_signinInput_bind">

				<input type="tel" class="form-control" id="member_phone"
					placeholder="${member.member_phone}" name="member_phone">

			</div>
			<span id="errorPhone" class="error"></span> <br />

			<!-- daum 도로검색 api -->
			<div class="mb-1">
				<input type="text" id="zipcode" placeholder="우편번호"
					value="${member.zipcode}" name="zipcode" style="width: 69%"
					readonly> <input type="button" onclick="DaumPostcode()"
					value="우편번호 찾기" style="width: 30%">
			</div>
			<div class="mb-1">
				<input type="text" id="roadaddress" placeholder="주소"
					value="${member.roadaddress}" name="roadaddress"
					style="width: 100%" readonly>
			</div>
			<div class="mb-1">
				<input type="text" id="detailaddress" placeholder="상세주소"
					value="${member.detailaddress}" name="detailaddress"> <input
					type="text" id="extraAddress" placeholder="참고항목" readonly>
			</div>

			<br />

			<div>별명</div>
			<div class="mb-3 mypage_memInfo_signinInput_bind">
				<input type="text" class="form-control" id="member_nickname"
					value="${member.member_nickname}" name="member_nickname" readonly>
			</div>
			<span id="errorNickname" class="error"></span> <br>

			<div class="mb-3" style="text-align: center;">
				<button type="submit" class="btn btn-primary btn-lg">회원 정보
					수정</button>
			</div>
			<div class="mb-3" style="text-align: center;">
				<button type="button" data-toggle="modal"
					data-target="#exampleModal" class="btn btn-danger btn-lg">회원
					탈퇴</button>
			</div>
		</div>
	</form>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">

				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">정말로 회원을 탈퇴 하시겠습니까?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<form id="deleteForm" method="post" class="d-inline-block"
					action="${pageContext.request.contextPath}/logout">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<button type="button" class="btn btn-danger"
						onclick="deleteMember()">회원 탈퇴</button>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>