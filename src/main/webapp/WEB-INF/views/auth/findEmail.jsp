<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="findEmail_main">
		<div class="findEmail_header">

			<h3>사방팔방</h3>

		</div>
		<form>
			<div class="findEmail_input">
				<div class="mb-3">
					<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="이름" name="name">
				</div>
				<div class="mb-3">
					<input type="text" class="form-control" id="inputPassword" placeholder="연락처" name="tel">
				</div>

				<button type="button" class="btn btn-info">이메일 찾기</button>
			</div>
		</form>
		<div class="findEmail_otherMenu">
			<a href="login">로그인하기</a>
			<a href="resetPw">비밀번호 재설정</a>
			<a href="signin">회원가입</a>

		</div>

	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>