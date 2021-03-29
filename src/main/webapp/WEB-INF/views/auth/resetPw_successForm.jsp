<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 비밀번호 재설정 완료 페이지 -->
<div class="resetPw_success rounded">
    <div class="resetPw_success_1"><span>회원님의 비밀번호를 재설정 하였습니다!</span></div>
    <div class="resetPw_success_1_1"></div>
    <div class="resetPw_success_2"><span>회원 정보</span></div>
    <div class="resetPw_success_3"><span>별명 님</span></div>
    <div class="resetPw_success_3_1"><span>ant9407@gmail.com 으로 재설정된 비밀번호를 전송 했습니다.</span></div>
    <!-- <div class="resetPw_success_4"><span>가격 :  <text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>  350,000</span></div>
    <div class="resetPw_success_5">송장번호 : 4433514 | 주문날짜 : 2021.03.14</div> -->
    <div class="resetPw_success_6">
        <a href="main">
            <button type="button" class="btn btn-outline-secondary btn-lg">메인으로 돌아가기</button>
        </a>
        <a href="loginForm">
            <button type="button" class="btn btn-outline-primary btn-lg">로그인 하기</button>
        </a>
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>