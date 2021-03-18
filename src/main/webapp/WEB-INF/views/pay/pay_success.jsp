<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 결제 완료 페이지 -->
<div class="pay_success rounded">
    <div class="pay_success_1"><span>주문이 완료 되었습니다!</span></div>
    <div class="pay_success_1_1"></div>
    <div class="pay_success_2"><span>주문 정보</span></div>
    <div class="pay_success_3"><span>따뜻하고 아늑한 집</span></div>
    <div class="pay_success_3_1"><span>(스카르스타, 크란스크라게, 글라돔, 테르티알)</span></div>
    <div class="pay_success_4"><span>가격 :  <text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>  350,000</span></div>
    <div class="pay_success_5">송장번호 : 4433514 | 주문날짜 : 2021.03.14</div>
    <div class="pay_success_6">
        <a href="main">
            <button type="button" class="btn btn-outline-secondary btn-lg">메인으로 돌아가기</button>
        </a>
        <a href="mypage_orderlist">
            <button type="button" class="btn btn-outline-primary btn-lg">마이페이지로 이동</button>
        </a>
        
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>