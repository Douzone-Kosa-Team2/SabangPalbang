<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="findEmail_success rounded">
    <div class="findEmail_success_1"><span>회원님의 이메일을 찾았습니다!</span></div>
    <div class="findEmail_success_2"></div>
    <div class="findEmail_success_3"><span>회원 정보</span></div>
    <div class="findEmail_success_4"><span>별명 님</span></div>
    <div class="findEmail_success_5"><span>ant9407@gmail.com</span></div>

    <div class="findEmail_success_6">
        <a href="main">
            <button type="button" class="btn btn-outline-secondary btn-lg">메인으로 돌아가기</button>
        </a>
        <a href="resetPw">
            <button type="button" class="btn btn-outline-primary btn-lg">비밀번호 재설정</button>
        </a>
        <a href="signin">
            <button type="button" class="btn btn-outline-primary btn-lg">로그인 하기</button>
        </a>
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>