<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy. MM. dd. a hh:mm:ss");
%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 결제 완료 페이지 -->
<div class="pay_success rounded">
    <div class="pay_success_1"><span>주문이 완료 되었습니다!</span></div>
    <div class="pay_success_1_1"></div>
    <div class="pay_success_2"><span>주문 정보</span></div>
    <div class="pay_success_3"><span>${sabangname.sabang_name}</span></div>
    <div class="pay_success_3_1 d-flex flex-row justify-content-center">
    <c:forEach var="product" items="${productname}">
    <div>${product.product_name}&nbsp</div>
    </c:forEach>
    </div>
    <div class="pay_success_4"><span>가격 :  <text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text> <fmt:formatNumber value="${order.order_price}" pattern="#,###"/></span></div>
    <div class="pay_success_5">주문 번호 : ${order.order_id} &nbsp 주문날짜 : <%= sf.format(nowTime) %></div>
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