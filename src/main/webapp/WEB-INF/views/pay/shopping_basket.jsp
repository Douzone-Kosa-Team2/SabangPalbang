
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>
	function pay() {
		$("form").attr("action", "pay");
		$("form")[0].submit;
	}
	function deleteCart(cid) {
		window.location.href="deleteCart";
	}
</script>
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
		<td>번호</td>
		<td><input class="table_header2" type="checkbox" name="xxx"
			value="yyy" checked></td>
		<td></td>
		<td>상품명</td>
		<td>수량</td>
		<td>판매가</td>
		<td>배송비</td>
		<td></td>
	</tr>
</table>
<form name="form" method="get">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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

		<c:forEach var="cart" items="${sessionCart}">
			<tr>
				<td>1</td>
				<td><input class="table_header2" type="checkbox" name="xxx"
					value="yyy" checked></td>
				<td style="padding: 20px;"><img class="table_list5"
					src="resources/images/sabang_post/${cart.sabang_imgoname}"
					height="80" width="70"></td>
				<td style="text-align: center;">${cart.sabang_name}</td>
				<td>${cart.products_totalcount}</td>
				<td><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>
					${cart.product_totalprice}</td>
				<td>배송비무료</td>
				<td><button onclick="deleteCart(${cart.cart_id})">X</button></td>
			</tr>
			<br />
		</c:forEach>


	</table>
	<div class="shopping_basket_select_cancle_totalPrice">
		<div class="select_cancle_totalPrice_button">
			<button type="button" class="btn btn-outline-info">선택 삭제</button>
		</div>

		<strong class="shopping_basket_totalPrice1">총가격</strong> <strong
			class="shopping_basket_totalPrice2"><text
				style="font-family: 'Cafe24Dangdanghae';">&#8361;</text> 1,000,000</strong>

	</div>
	<div class="shopping_basket_buy_button">

		<button type="submit" class="btn btn-lg btn-info" onclick="pay()"
			style="width: 40%; height: 40%; color: white">결제하기</button>
	</div>
</form>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>