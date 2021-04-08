<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script>
	const salepercent = (id,price, saleprice) => {
		const percent = (price-saleprice)/price*100; 
		$("#"+id).html(Math.floor(percent)+"%");
	};
</script>
<style>
.sabang_div3_line_item2 {
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
<div class="sabang_main">
	<div class="sabang_div1">
		<img class="sabang_div1_img"
			src="resources/images/sabang_post/slogan_sa.png" height="45px">
	</div>
	<div class="sabang_div2">
		<ul class="sabang_div2_sort_type">
			<c:if test="${stdno==0}">
				<li class="menu"><a class="sabang_div3_move"
					href="sabang_main?std=0"
					style="text-decoration: underline !important; text-underline-position: under;">판매율
						순</a></li>
				<li class="menu"><a class="sabang_div3_move"
					href="sabang_main?std=1">낮은 가격 순</a></li>
				<li class="menu"><a class="sabang_div3_move"
					href="sabang_main?std=2">높은 가격 순</a></li>
				<li class="menu"><a class="sabang_div3_move"
					href="sabang_main?std=3">조회수 순</a></li>
			</c:if>
			<c:if test="${stdno==1}">
				<li class="menu"><a class="sabang_div3_move"
					href="sabang_main?std=0">판매율 순</a></li>
				<li class="menu"><a class="sabang_div3_move"
					href="sabang_main?std=1"
					style="text-decoration: underline !important; text-underline-position: under;">낮은
						가격 순</a></li>
				<li class="menu"><a class="sabang_div3_move"
					href="sabang_main?std=2">높은 가격 순</a></li>
				<li class="menu"><a class="sabang_div3_move"
					href="sabang_main?std=3">조회수 순</a></li>
			</c:if>
			<c:if test="${stdno==2}">
				<li class="menu"><a class="sabang_div3_move"
					href="sabang_main?std=0">판매율 순</a></li>
				<li class="menu"><a class="sabang_div3_move"
					href="sabang_main?std=1">낮은 가격 순</a></li>
				<li class="menu"><a class="sabang_div3_move"
					href="sabang_main?std=2"
					style="text-decoration: underline !important; text-underline-position: under;">높은
						가격 순</a></li>
				<li class="menu"><a class="sabang_div3_move"
					href="sabang_main?std=3">조회수 순</a></li>
			</c:if>
			<c:if test="${stdno==3}">
				<li class="menu"><a class="sabang_div3_move"
					href="sabang_main?std=0">판매율 순</a></li>
				<li class="menu"><a class="sabang_div3_move"
					href="sabang_main?std=1">낮은 가격 순</a></li>
				<li class="menu"><a class="sabang_div3_move"
					href="sabang_main?std=2">높은 가격 순</a></li>
				<li class="menu"><a class="sabang_div3_move"
					href="sabang_main?std=3"
					style="text-decoration: underline !important; text-underline-position: under;">조회수
						순</a></li>
			</c:if>
		</ul>
	</div>
	<div class="d-flex flex-row flex-wrap justify-content-center">
		<c:forEach var="sabang" items="${list}">
			<div class="sabang_div3_line ">
				<div class="sabang_div3_line_item">
					<a class="sabang_div3_move"
						href="sabang_detail?sid=${sabang.sabang_id}">
						<div class="sabang_div3_line_item2">
							<img src="resources/images/sabang_post/${sabang.sabang_imgoname}"
								height="200" />
						</div>
						<br /> ${sabang.sabang_name}<br /> <c:if
							test="${sabang.sabang_price != sabang.sabang_saleprice}">
							<span class="price"
								style=" font-size: 0.9em; text-decoration-line: line-through; font-family: 'Cafe24Dangdanghae';">&#8361;
								${sabang.sabang_price}</span>
							<br />
							<span class="price"> <text
									style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>${sabang.sabang_saleprice}</span>
							<span style="color: red;" class="percent"
								id="${sabang.sabang_id}"> <script>salepercent(${sabang.sabang_id},${sabang.sabang_price}, ${sabang.sabang_saleprice});</script>
							</span>
						</c:if> <c:if test="${sabang.sabang_price == sabang.sabang_saleprice}">
							<text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>${sabang.sabang_saleprice}</span>
						</c:if>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>

	<div class="d-flex justify-content-center">
		<div>
			<table style="width: 100%;">
				<tr>
					<!-- 처음 이전 12345 다음 맨끝 -->
					<td colspan="5" class="text-center"><a
						class="btn btn-outline-primary btn-sm"
						href="sabang_main?std=${stdno}&pageNo=1">처음</a> <c:if
							test="${sabang_pager.groupNo>1}">
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