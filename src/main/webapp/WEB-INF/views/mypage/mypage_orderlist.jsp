<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

 <!-- 마이페이지 메뉴 헤더 -->
         <div class="mypage_header">
            <a class="member_info" href="mypage_memberInfo">회원 정보</a>
            <a class="order_info" href="mypage_orderlist">주문 내역</a>
            <a class="inquiry_info" href="mypage_inquiry">내가 쓴 문의글</a>
        </div>
  <!-- 마이페이지 주문 내역 -->

        <div class="state_button">
            <select name="time_button">
                <option selected="" value="" disabled="">기간</option>
                <option value="오래된 순">오래된 순</option>
                <option value="최신 순">최신 순</option>
            </select>
            <select name="order_button">
                <option selected="" value="" disabled="">배송상태</option>
                <option value="오래된 순">배송 준비 중</option>
                <option value="최신 순">배송 중</option>
                <option value="최신 순">배송 완료</option>
            </select>
        </div>

        <div class="order-header">
            <div class="order-header1">
                <span class="order-header1_1">송장번호</span>
                <span class="order-header1_2">주문날짜</span></div>
            <div class="order-header2">상품명</div>
            <div class="order-header3">가격</div>
            <div class="order-header3">배송상태</div>
        </div>

        <div class="order-list">
            <div class="order-list_1">
                <span>4433514 </span>
                <span> | </span>
                <span> 2021.03.11</span>
            </div>
            <div class="order-list_2">
                <img src="resources/images/sb1_0.png" width="100">
            </div>
            <div class="order-list_3">
                <span class="order-list_3_1">아늑하고 따뜻한 방</span>
                <span class="order-list_3_2">(스카르스타, 크란스크라게, 글라돔, 테르티알)</span>
            </div>
            <div class="order-list_4">W 350,000</div>
            <div class="order-list_5">배송 준비 중</div>

        </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>