
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>
	function pay() {
		console.log($('input:radio[name=cartkey]:checked').val());
		var cid = $('input:radio[name=cartkey]:checked').val();
		$.ajax({
			type: "post",
			url: "pay",
			data: {cid, ${_csrf.parameterName}:"${_csrf.token}"}
		});
	}
	function deleteCart(cid) {
		console.log(cid);
		//event.preventDefault();
		$.ajax({
			type: "post",
			url: "deleteCart",
			data: {cid, ${_csrf.parameterName}:"${_csrf.token}"}
		});
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
<form name="form" method="post">
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

		<c:forEach var="cart" items="${sessionCart}" varStatus="status">
			<tr>
				<td><input class="table_header2" type="radio" name="cartkey" value="${cart.key}"></td>
				<td><c:out value="${status.count}"/></td>
				<td style="padding: 20px;"><img class="table_list5"
					src="resources/images/sabang_post/${cart.value.sabang_imgoname}"
					height="80" width="70"></td>
				<td style="text-align: center;">${cart.value.sabang_name}</td>
				<td>${cart.value.products_totalcount}</td>
				<td><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>
					${cart.value.product_totalprice}</td>
				<td>배송비무료</td>
				<td><button onclick="deleteCart(${cart.key})">X</button></td>
			</tr>
			<br />
		</c:forEach>


	</table>
	<div class="shopping_basket_buy_button">

		<button class="btn btn-lg btn-info" onclick="pay()"
			style="width: 40%; height: 40%; color: white">결제하기</button>
	</div>
</form>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>