<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 회원가입 완료 페이지 -->
<div class="signin_success rounded">
    <div class="signin_success_1"><span>회원가입이 되었습니다!</span></div>
    <div class="signin_success_1_1"></div>
    <div class="signin_success_2"><span>회원 정보</span></div>
    <div class="signin_success_3"><span>별명 님</span></div>
    <div class="signin_success_3_1"><span>사방팔방에 회원이 되신 것을 환영합니다.</span></div>
    <!-- <div class="signin_success_4"><span>가격 :  <text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>  350,000</span></div>
    <div class="signin_success_5">송장번호 : 4433514 | 주문날짜 : 2021.03.14</div> -->
    <div class="signin_success_6">
        <a href="main">
            <button type="button" class="btn btn-outline-secondary btn-lg">메인으로 돌아가기</button>
        </a>
        <a href="signin">
            <button type="button" class="btn btn-outline-primary btn-lg">로그인 하기</button>
        </a>
        
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>