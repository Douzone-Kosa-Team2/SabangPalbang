
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>


<!-- 마이페이지 메뉴 헤더 -->
<div class="mypage_header_123">
	<a class="member_info" href="mypage_memberInfo_check">회원 정보</a> <a
		class="order_info" href="mypage_orderlist">주문 내역</a> <a
		href="mypage_inquiry">내가 쓴 문의글</a>
</div>

<c:if test="${fn:length(myOrderList) == 0}">
	<p style="text-align:center;font-size:20px;margin:200px;color:grey;">
		<sec:authentication property="name"/> 님의 <span style="color:#00B0F0;"> 주문</span> 내역이 없습니다 </p>
</c:if>
<c:if test="${fn:length(myOrderList) > 0}">
	<!-- 마이페이지 주문 내역 - 내용이 있을 때-->
	<div class="state_button">
		<select name="time_button">
			<option value="최신순" selected>최신순</option>
			<option value="오래된순">오래된순</option>
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
				<td><fmt:formatDate value="${orderMain.order_date}"
						pattern="YYYY.MM.dd" /></td>
				<td><img src="resources/images/sabang_post/${orderMain.sabang_imgoname}"
					width="100"></td>
				<td>${orderMain.sabang_name}<br /> ( <c:forEach var="orderDetail"
						items="${orderMain.orderLists}" varStatus="status">
						<c:if test="${!status.last}">
							${orderDetail.product_name},
						</c:if>
						<c:if test="${status.last}">
							${orderDetail.product_name}
						</c:if>
					</c:forEach> )
				</td>
				<td>${orderMain.order_price}</td>
				<td>${orderMain.order_state}</td>
			</tr>
		</c:forEach>
		<tr>
			<!-- 처음 이전 12345 다음 맨끝 -->
			<td colspan="5" class="text-center"><a
				class="btn btn-outline-primary btn-sm"
				href="mypage_orderlist?pageNo=1">처음</a> <c:if
					test="${mypage_order_pager.groupNo>1}">
					<a class="btn btn-outline-info btn-sm"
						href="mypage_orderlist?pageNo=${mypage_order_pager.startPageNo-1}">이전</a>
				</c:if> <c:forEach var="i" begin="${mypage_order_pager.startPageNo}"
					end="${mypage_order_pager.endPageNo}">
	
					<c:if test="${mypage_order_pager.pageNo!=i}">
						<a class="btn btn-outline-success btn-sm"
							href="mypage_orderlist?pageNo=${i}">${i}</a>
					</c:if>
					<c:if test="${mypage_order_pager.pageNo==i}">
						<a class="btn btn-outline-danger btn-sm"
							href="mypage_orderlist?pageNo=${i}">${i}</a>
					</c:if>
				</c:forEach> <c:if
					test="${mypage_order_pager.groupNo<mypage_order_pager.totalGroupNo}">
					<a class="btn btn-outline-info btn-sm"
						href="mypage_orderlist?pageNo=${mypage_order_pager.endPageNo+1}">다음</a>
				</c:if> <a class="btn btn-outline-primary btn-sm"
				href="mypage_orderlist?pageNo=${mypage_order_pager.totalPageNo}">맨끝</a></td>
		</tr>
	</table>
</c:if>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>