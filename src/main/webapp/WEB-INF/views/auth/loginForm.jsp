<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- 로그인 부분 -->
	<div class="login_content">
		<div class="login_header">

			<h3>사방팔방</h3>

		</div>
		<form method="post" action="<%=application.getContextPath() %>/login">
			<div class="login_input">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

				<div class="mb-3">
					<input type="email" class="form-control" id="member_email" placeholder="이메일" name="member_email">
				</div>
				<div class="mb-3">
					<input type="password" class="form-control" id="member_pw" placeholder="비밀번호" name="member_pw">
				</div>

				<button type="submit" class="btn btn-info">로그인</button>
			</div>
		</form>
		<div class="login_otherMenu">
			<a href="findEmailForm">이메일찾기</a>
			<a href="resetPwForm">비밀번호 재설정</a>
			<a href="signinForm">회원가입</a>
		</div>

	</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>