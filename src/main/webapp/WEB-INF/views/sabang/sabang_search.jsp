<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>
	const salepercent = (id,price, saleprice) => {
		const percent = (price-saleprice)/price*100; 
		$("#"+id).html(Math.floor(percent)+"%");
	};
</script>
<style>
.sabang_div3_line_item2 {
	border-radius: 5%; 
	overflow: hidden;
}

.sabang_div3_line_item2  img {
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
	-webkit-transition: .3s;
	-moz-transition: .3s;
	-ms-transition: .3s;
	-o-transition: .3s;
	transition: .3s;
}

.sabang_div3_line_item2:hover img {
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-ms-transform: scale(1.1);
	-o-transform: scale(1.1);
	transform: scale(1.1);
}
</style>
<!-- sabang_main -->
<div class="sabang_search">
	<div class="sabang_search_div1">
		<img class="sabang_search_div1_img"
			src="resources/images/main/sabang_search_header.jpg" width="100%">
			<br/>
	</div>
	<div class="sabang_search_sabang_div2">
	<br/>
	</div>
	<div class="sabang_search_div3">
		<div class="sabang_search_div3_line d-flex flex-row flex-wrap justify-content-center">
			<c:forEach var="sabang" items="${rslist}">
				<div class="sabang_div3_line" style="width:33%;">
					<div class="sabang_div3_line_item2">
					<a class="sabang_div3_move"
						href="sabang_detail?sid=${sabang.sabang_id}"> 
						<div class="sabang_div3_line_item2">
						<img src="resources/images/sabang_post/${sabang.sabang_imgoname}"width="400" height="400">
						</div>
						<br/>
						<text style="font-family: 'Cafe24Dangdanghae'; font-size:1.5em"> 
								${sabang.sabang_name}</text><br/>
					 <c:if test="${sabang.sabang_price != sabang.sabang_saleprice}">
							<span class="price"
								style="color: gray; font-size: 1em; text-decoration-line: line-through; font-family: 'Cafe24Dangdanghae';">&#8361;
								<fmt:formatNumber value="${sabang.sabang_price}" pattern="#,###"/></span>
							<br />
							<span class="price"> 
							<text style="font-family: 'Cafe24Dangdanghae'; font-size:1.5em">&#8361;<fmt:formatNumber value="${sabang.sabang_saleprice}" pattern="#,###"/></text></span>
							<span style="color: red; font-size:1.5em" class="percent" id="${sabang.sabang_id}"> 
								<text style="font-family: 'Cafe24Dangdanghae'; font-size:1.5em"><script>salepercent(${sabang.sabang_id},${sabang.sabang_price}, ${sabang.sabang_saleprice});</script></text>
							</span>
						</c:if> 
						
						<c:if test="${sabang.sabang_price == sabang.sabang_saleprice}">
							<text style="font-family: 'Cafe24Dangdanghae'; font-size:1.5em">&#8361;<fmt:formatNumber value="${sabang.sabang_saleprice}" pattern="#,###"/></text></span>
						</c:if>
					</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<br/>
<br/>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>