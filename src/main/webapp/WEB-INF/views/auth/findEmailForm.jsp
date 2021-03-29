<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="findEmail_main">
		<div class="findEmail_header">

			<h3>사방팔방</h3>

		</div>
		<form method="post" action="findEmail">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			
			<div class="findEmail_input">
				<div class="mb-3">
					<input type="text" class="form-control" id="member_name" placeholder="이름" name="member_name">
				</div>
				<div class="mb-3">
					<input type="text" class="form-control" id="member_phone" placeholder="연락처" name="member_phone">
				</div>

				<button type="submit" class="btn btn-info">이메일 찾기</button>
			</div>
		</form>
		<div class="findEmail_otherMenu">
			<a href="loginForm">로그인하기</a>
			<a href="resetPwForm">비밀번호 재설정</a>
			<a href="signinForm">회원가입</a>

		</div>

	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>