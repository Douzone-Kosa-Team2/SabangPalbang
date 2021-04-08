<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script>
	/* event.preventDefault();
	 if($(':radio[name="cartKey"]:checked').length < 1){
	 alert('1개를 꼭 선택하세요.');                        
	 } */

	function validate() {
		//유효성검사 
		event.preventDefault();
		console.log($(':radio[name="cartKey"]:checked').length);
		if ($(':radio[name="cartKey"]:checked').length == 1) {
			$("form").submit();
		} else {
			alert('1개 품목을 선택해주세요.');
		}
	}
</script>
<style>
.bascketImg_container {
	width: 55%;
	height: 600px;
	background-color: yellow;
	background: url("resources/images/basket/nomoney.jpg");
	opacity:0.8;
	margin: 10px 400px;
}

.message {
	padding:50px;
	font-size: 30px;
	color: white;
	text-align: center;
}
</style>

<c:if test="${sessionCart == null}">
	<div class="bascketImg_container">
		<p class="message">
			<sec:authentication property="name" />
			님의 <span style="color: #00B0F0;"> 장바구니는</span> 비어있습니다.
		</p>
	</div>
</c:if>

<c:if test="${sessionCart}">
	<!-- 장바구니 -->
	<div class="shopping_basket_title">
		<strong>장바구니</strong>
	</div>
	<table class="shopping_basket_header">
		<colgroup>
			<col width="6%">
			<col width="8%">
			<col width="16%">
			<col width="15%">
			<col width="14%">
			<col width="15%">
			<col width="15%">
			<col width="1%">
		</colgroup>
		<tr>
			<td></td>
			<td>번호</td>
			<td></td>
			<td>상품명</td>
			<td>수량</td>
			<td>판매가</td>
			<td>배송비</td>
			<td></td>
		</tr>
	</table>
	<form name="form" method="post" action="pay">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<table class="shopping_basket_list">
			<colgroup>
				<col width="6.5%">
				<col width="12%">
				<col>
				<col width="28%">
				<col width="16.9%">
				<col width="19.5%">
				<col width="20%">
				<col>
			</colgroup>

			<c:forEach var="cart" items="${sessionCart}" varStatus="status">
				<tr>
					<td><input class="table_header2" type="radio" name="cartKey"
						value="${cart.key}"></td>
					<td><c:out value="${status.count}" /></td>
					<td style="padding: 20px;"><img class="table_list5"
						src="resources/images/sabang_post/${cart.value.sabang_imgoname}"
						height="80" width="70"></td>
					<td style="text-align: center;">${cart.value.sabang_name}</td>
					<td>${cart.value.products_totalcount}</td>
					<td><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>
						${cart.value.product_totalprice}</td>
					<td>배송비무료</td>
					<td><button type="button"
							onclick="location.href='deleteCart?cid=${cart.key}'">X</button></td>
				</tr>
				<br />
			</c:forEach>
		</table>
		<div class="shopping_basket_buy_button">
			<button class="btn btn-lg btn-info" onclick="validate()"
				style="width: 40%; height: 40%; color: white">결제하기</button>
		</div>
	</form>
</c:if>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>