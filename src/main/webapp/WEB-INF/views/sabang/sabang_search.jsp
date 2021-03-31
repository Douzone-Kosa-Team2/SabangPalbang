<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>


<!-- sabang_main -->
<div class="sabang_search">
	<div class="sabang_search_div1">
		<img class="sabang_search_div1_img"
			src="resources/images/sabang_search/slogan_search.png" height="45px">
	</div>
	<div class="sabang_search_sabang_div2"></div>
	<div class="sabang_search_div3">
		<div class="sabang_search_div3_line">
			<c:forEach var="sabang" items="${rslist}">

				<div class="sabang_div3_line_item">
					<a class="sabang_div3_move"
						href="sabang_detail?sid=${sabang.sabang_id}"> <img
						src="resources/images/sabang_post/${sabang.sabang_imgoname}"
						height="200"><br /> ${sabang.sabang_name}<br /> <c:if
							test="${sabang.sabang_price != sabang.sabang_saleprice}">
							<span class="price"
								style="color: gray; font-size: 0.9em; text-decoration-line: line-through; font-family: 'Cafe24Dangdanghae';">&#8361;
								${sabang.sabang_price}</span>
							<br />
							<span class="price"> <text
									style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>${sabang.sabang_saleprice}</span>
							<span style="color: red;" class="percent"> <script>salepercent(${sabang.sabang_price}, ${sabang.sabang_saleprice});</script>
							</span>
						</c:if> <c:if test="${sabang.sabang_price == sabang.sabang_saleprice}">
							<text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>${sabang.sabang_saleprice}</span>
						</c:if>
					</a>
				</div>

			</c:forEach>

		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>