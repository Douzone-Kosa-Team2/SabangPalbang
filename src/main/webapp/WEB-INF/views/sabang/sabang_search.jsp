<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>
	const salepercent = (id,price, saleprice) => {
		const percent = (price-saleprice)/price*100; 
		$("#"+id).html(Math.floor(percent)+"%");
	};
</script>

<!-- sabang_main -->
<div class="sabang_search">
	<div class="sabang_search_div1">
		<img class="sabang_search_div1_img"
			src="resources/images/sabang_search/slogan_search.png" height="45px">
	</div>
	<div class="sabang_search_sabang_div2"></div>
	<div class="sabang_search_div3">
		<div class="sabang_search_div3_line d-flex flex-row flex-wrap justify-content-center">
			<c:forEach var="sabang" items="${rslist}">

				<div class="sabang_div3_line_item">
					<a class="sabang_div3_move"
						href="sabang_detail?sid=${sabang.sabang_id}"> <img
						src="resources/images/sabang_post/${sabang.sabang_imgoname}"
						width="400" height="400"><br />
						<text style="font-family: 'Cafe24Dangdanghae'; font-size:1.5em"> 
								${sabang.sabang_name}</text><br/>
					 <c:if test="${sabang.sabang_price != sabang.sabang_saleprice}">
							<span class="price"
								style="color: gray; font-size: 1em; text-decoration-line: line-through; font-family: 'Cafe24Dangdanghae';">&#8361;
								${sabang.sabang_price}</span>
							<br />
							<span class="price"> 
							<text style="font-family: 'Cafe24Dangdanghae'; font-size:1.5em">&#8361;${sabang.sabang_saleprice}</text></span>
							<span style="color: red; font-size:1.5em" class="percent" id="${sabang.sabang_id}"> 
								<text style="font-family: 'Cafe24Dangdanghae'; font-size:1.5em"><script>salepercent(${sabang.sabang_id},${sabang.sabang_price}, ${sabang.sabang_saleprice});</script></text>
							</span>
						</c:if> 
						
						<c:if test="${sabang.sabang_price == sabang.sabang_saleprice}">
							<text style="font-family: 'Cafe24Dangdanghae'; font-size:1.5em">&#8361;${sabang.sabang_saleprice}</text></span>
						</c:if>
					</a>
				</div>

			</c:forEach>

		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>