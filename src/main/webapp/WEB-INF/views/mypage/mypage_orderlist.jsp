	<%@ page contentType="text/html; charset=UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	
	
	<!-- 마이페이지 메뉴 헤더 -->
	<div class="mypage_header_123">
		<a class="member_info" href="mypage_memberInfo">회원 정보</a> <a
			class="order_info" href="mypage_orderlist">주문 내역</a> <a
			href="mypage_inquiry">내가 쓴 문의글</a>
	
	</div>
	<!-- 마이페이지 주문 내역 -->
	
	<div class="state_button">
		<select name="time_button">
			<option selected="" value="" disabled="">기간</option>
			<option value="오래된 순">오래된 순</option>
			<option value="최신 순">최신 순</option>
		</select> <select name="order_button">
			<option selected="" value="" disabled="">배송상태</option>
			<option value="오래된 순">배송 준비 중</option>
			<option value="최신 순">배송 중</option>
			<option value="최신 순">배송 완료</option>
		</select>
	</div>
	<table class="orderlist_table">
		<colgroup>
			<col width="1%">
			<col width="3%">
			<col width="7%">
			<col width="9%">
			<col width="2%">
			<col width="6%">
		</colgroup>
		<tr>
			<th>송장번호</th>
			<th>주문날짜</th>
			<th></th>
			<th>상품명</th>
			<th>가격</th>
			<th>배송상태</th>
	
		</tr>
	
		<tr>
			<td>4433514</td>
			<td>2021.03.11</td>
			<td><img src="resources/images/sabang_detail/sb1_0.png" width="100"></td>
			<td>아늑하고 따뜻한 방<br />(스카르스타, 크란스크라게, 글라돔, 테르티알)
			</td>
			<td>W 350,000</td>
			<td>배송준비중</td>
		</tr>
	</table>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>