<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script>
	const salepercent = (price, saleprice) => {
		const percent = (price-saleprice)/price*100; 
		$(".percent").html(Math.floor(percent)+"%");
	};
</script>

<!-- sabang_main -->
<div class="sabang_main">
	<div class="sabang_div1">
		<img class="sabang_div1_img"
			src="resources/images/sabang_post/slogan_sa.png" height="45px">
	</div>
	<div class="sabang_div2">
		<ul class="sabang_div2_sort_type">
			<li class="menu"><a class="sabang_div3_move" href="sabang_main?std=0">판매율 순</a></li>
			<li class="menu"><a class="sabang_div3_move" href="sabang_main?std=1"
				style="color: gray;">낮은 가격 순</a></li>
			<li class="menu"><a class="sabang_div3_move" href="sabang_main?std=2"
				style="color: gray;">높은 가격 순</a></li>
			<li class="menu"><a class="sabang_div3_move" href="sabang_main?std=3"
				style="color: gray;">조회수 순</a></li>
		</ul>
	</div>
	<div class="d-flex flex-row flex-wrap justify-content-center">
		<c:forEach var="sabang" items="${list}">
			<div class="sabang_div3_line ">
				<div class="sabang_div3_line_item">
					<a class="sabang_div3_move" href="sabang_detail?sid=${sabang.sabang_id}"> <img
						src="resources/images/sabang_post/${sabang.sabang_imgoname}"
						height="200"><br /> ${sabang.sabang_name}<br /> 
						
						<c:if test="${sabang.sabang_price != sabang.sabang_saleprice}">
							<span
							class="price"
							style="color: gray; font-size: 0.9em; text-decoration-line: line-through; font-family: 'Cafe24Dangdanghae';">&#8361;
								${sabang.sabang_price}</span><br /> <span class="price">
								
									<text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>${sabang.sabang_saleprice}</span>
									<span style="color: red;" class="percent">
										<script>salepercent(${sabang.sabang_price}, ${sabang.sabang_saleprice});</script>
									</span>
						</c:if>
						<c:if test="${sabang.sabang_price == sabang.sabang_saleprice}">
								<text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>${sabang.sabang_saleprice}</span>
						</c:if>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>

	<div class="d-flex justify-content-center">
		<div>
			<table style="width:100%;">
				<tr>
					<!-- 처음 이전 12345 다음 맨끝 -->
					<td colspan="5" class="text-center"><a
						class="btn btn-outline-primary btn-sm" href="sabang_main?std=${stdno}&pageNo=1">처음</a>
	
						<c:if test="${sabang_pager.groupNo>1}">
							<a class="btn btn-outline-info btn-sm"
								href="sabang_main?std=${stdno}&pageNo=${sabang_pager.startPageNo-1}">이전</a>
						</c:if> <c:forEach var="i" begin="${sabang_pager.startPageNo}"
							end="${sabang_pager.endPageNo}">
	
							<c:if test="${sabang_pager.pageNo!=i}">
								<a class="btn btn-outline-success btn-sm"
									href="sabang_main?std=${stdno}&pageNo=${i}">${i}</a>
							</c:if>
							<c:if test="${sabang_pager.pageNo==i}">
								<a class="btn btn-outline-danger btn-sm"
									href="sabang_main?std=${stdno}&pageNo=${i}">${i}</a>
							</c:if>
						</c:forEach> <c:if test="${sabang_pager.groupNo<pager.totalGroupNo}">
							<a class="btn btn-outline-info btn-sm"
								href="sabang_main?std=${stdno}&pageNo=${sabang_pager.endPageNo+1}">다음</a>
						</c:if> <a class="btn btn-outline-primary btn-sm"
						href="sabang_main?std=${stdno}&pageNo=${sabang_pager.totalPageNo}">맨끝</a></td>
				</tr>
			</table>
		</div>
	</div>
</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>