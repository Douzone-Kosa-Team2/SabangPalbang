	<%@ page contentType="text/html; charset=UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	
	<!-- 마이페이지 메뉴 헤더 -->
	<div class="mypage_header_123">
		<a class="member_info" href="mypage_memberInfo_check">회원 정보</a> 
		<a class="order_info" href="mypage_orderlist">주문 내역</a> 
		<a href="mypage_inquiry">내가 쓴 문의글</a>
	
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
			<th>주문번호</th>
			<th>주문날짜</th>
			<th></th>
			<th>상품명</th>
			<th>가격</th>
			<th>배송상태</th>
		</tr>
		<c:forEach var="orderMain" items="${myOrderList}">
			<tr>
				<td>${orderMain.order_id}</td>
				<td><fmt:formatDate value="${orderMain.order_date}" pattern="YYYY.MM.dd"/></td>
				<td><img src="resources/images/sabang_post/${sabang_imgoname}" width="100"></td>
				<td>${sabang_name}<br/>
				(
				<c:forEach var="orderDetail" items="${orderMain.orderList}" varStatus="status">
					<c:if test="${!status.last}">
						${orderDetail.product_name},
					</c:if>
					<c:if test="${status.last}">
						${orderDetail.product_name}
					</c:if>
				</c:forEach>
				)
				</td>
				<td>${orderMain.order_price}</td>
				<td>${orderMain.order_state}</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>