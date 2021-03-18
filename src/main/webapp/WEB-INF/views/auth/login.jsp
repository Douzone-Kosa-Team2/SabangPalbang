<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- 로그인 부분 -->
	<div class="login_content">
		<div class="login_header">

			<h3>사방팔방</h3>

		</div>
		<form>
			<div class="login_input">

				<div class="mb-3">
					<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="이메일" name="email">
				</div>
				<div class="mb-3">
					<input type="password" class="form-control" id="inputPassword" placeholder="비밀번호" name="password">
				</div>

				<button type="button" class="btn btn-info">로그인</button>
			</div>
		</form>
		<div class="login_otherMenu">
			<a href="#" onclick="location.href='findEmail.html'">이메일찾기</a>
			<a href="#" onclick="location.href='resetPw.html'">비밀번호 재설정</a>
			<a href="#" onclick="location.href='signin.html'">회원가입</a>
		</div>

	</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>