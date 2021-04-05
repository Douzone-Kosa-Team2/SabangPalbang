<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>


<!-- 마이페이지 메뉴 헤더 -->
<div class="mypage_header">
	<a class="mypage_header_member_info" href="mypage_memberInfo_check">회원 정보</a>
	<a href="mypage_orderlist">주문 내역</a> 
	<a href="mypage_inquiry">내가 쓴 문의글</a>
</div>


<!-- 회원 정보 페이지 전 체크 페이지 -->

<div class="mypage_memInfo_main">

	<form method="post" action="updateMemberForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" /> 
		<input type="hidden" name="member_id" value="${member.member_id}" />
		<div class="mypage_memInfo_signinInput">
			<div class="mypage_memInfo_signinInput_label">이메일</div>

			<div class="mb-3 mypage_memInfo_signinInput_bind">
				<input type="email" class="form-control" id="member_email"
					value="${member.member_email}" name="member_email" readonly>
			</div>
			<br />
			<div class="mypage_memInfo_signinInput_label">비밀번호</div>
		
			<div class="mb-3">
				<input type="password" class="form-control" id="member_pw"
					placeholder="비밀번호를 입력하세요." name="member_pw">
			</div>
			
			<br>
			
			<div class="mt-4" style="text-align: center;">
				<button type="submit" class="btn btn-primary btn-lg">회원 정보 수정</button>
			</div>
		</div>
	</form>

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>