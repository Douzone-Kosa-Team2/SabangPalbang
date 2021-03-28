<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 비밀번호 재설정 부분 -->
	<div class="resetPw_main">
		<div class="resetPw_header">

			<h3>사방팔방</h3>

		</div>

		<form method="post" action="resetPw">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="resetPw_input">
				<div class="mb-3">
					<input type="email" class="form-control" id="member_email" placeholder="이메일" name="member_email">
				</div>

				<div class="mb-3">
					<input type="text" class="form-control" id="member_name" placeholder="이름" name="member_name">
				</div>
				
				<div class="mb-3">
					<input type="text" class="form-control" id="member_phone" placeholder="연락처" name="member_phone">
				</div>

				<button type="submit" class="btn btn-info">비밀번호 재설정</button>
			</div>

			<div class="resetPw_otherMenu">
				<a href="loginForm">로그인하기</a>
				<a href="findEmailForm">이메일 찾기</a>
				<a href="signinForm">회원가입</a>

			</div>
		</form>
	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>