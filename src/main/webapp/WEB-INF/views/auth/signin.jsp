<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 회원가입 내용 부분 -->
	<div class="signin_main">

		<div class="signin_header">
			<h3>회원 가입</h3>
			<hr>
		</div>
		<form>
			<div class="signin_input">
				<div>이메일</div>

				<div class="mb-3 signin_input_form">
					<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="이메일">@ <select
						name="emailaddr">
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

				<div>비밀번호</div>
				<div>영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.</div>
				<div class="mb-3">
					<input type="text" class="form-control" id="inputPassword" placeholder="비밀번호" name="password">
				</div>

				<div>비밀번호 확인</div>
				<div class="mb-3">
					<input type="password" class="form-control" id="inputPassword" placeholder="비밀번호 확인">
				</div>

				<div>이름</div>
				<div class="mb-3">
					<input type="text" class="form-control" id="inputPassword" placeholder="이름" name="name">
				</div>

				<div>연락처</div>
				<div class="mb-3 signin_input_form">
					<select name="tel_pre">
						<option selected="" value="" disabled="">선택해주세요</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
						<option value="02">02</option>
					</select> <input type="tel" class="form-control" id="exampleFormControlInput1"
						placeholder="휴대폰번호 입력" name="tel_suf">

				</div>

				<div>별명</div>
				<div>다른 유저와 겹치지않는 별명을 입력해주세요, (2~15자)</div>
				<div class="mb-3">
					<input type="text" class="form-control" id="inputPassword" placeholder="별명(2~15자)" name="nickname">
				</div>

				<div class="signin_agree">
					<input type="checkbox" />&nbsp;&nbsp;개인정보 약관에 동의합니다.
				</div>

				<div class="signin_btn">
					<button type="button" class="btn btn-info">회원가입 완료</button>
				</div>


			</div>
		</form>

		<div class="signin_othermenu">

			<p>
				이미 아이디가 있으신가요? <a class="header_logIn_item" href="login">로그인</a>
			</p>
		</div>

	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>