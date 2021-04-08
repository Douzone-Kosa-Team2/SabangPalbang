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
.order_style{
	font-family: 'Cafe24Dangdanghae'; 
	font-size:0.9em;
}
</style>
<!-- sabang_main -->
<div class="sabang_main">
	<div class="sabang_div1">
		<img class="sabang_div1_img"
			src="resources/images/sabang_post/sabang_slogan.jpg" width="100%" height="100px">
	</div>
	<div class="sabang_div2">
		<ul class="sabang_div2_sort_type">
			<c:if test="${stdno==0}">
				<li class="menu"><a class="order_style"
					href="sabang_main?std=0"
					style="text-decoration: underline !important; text-underline-position: under;">판매율
						순</a></li>
				<li class="menu"><a class="order_style"
					href="sabang_main?std=1">낮은 가격 순</a></li>
				<li class="menu"><a class="order_style"
					href="sabang_main?std=2">높은 가격 순</a></li>
				<li class="menu"><a class="order_style"
					href="sabang_main?std=3">조회수 순</a></li>
			</c:if>
			<c:if test="${stdno==1}">
				<li class="menu"><a class="order_style"
					href="sabang_main?std=0">판매율 순</a></li>
				<li class="menu"><a class="order_style"
					href="sabang_main?std=1"
					style="text-decoration: underline !important; text-underline-position: under;">낮은
						가격 순</a></li>
				<li class="menu"><a class="order_style"
					href="sabang_main?std=2">높은 가격 순</a></li>
				<li class="menu"><a class="order_style"
					href="sabang_main?std=3">조회수 순</a></li>
			</c:if>
			<c:if test="${stdno==2}">
				<li class="menu"><a class="order_style"
					href="sabang_main?std=0">판매율 순</a></li>
				<li class="menu"><a class="order_style"
					href="sabang_main?std=1">낮은 가격 순</a></li>
				<li class="menu"><a class="order_style"
					href="sabang_main?std=2"
					style="text-decoration: underline !important; text-underline-position: under;">높은
						가격 순</a></li>
				<li class="menu"><a class="order_style"
					href="sabang_main?std=3">조회수 순</a></li>
			</c:if>
			<c:if test="${stdno==3}">
				<li class="menu"><a class="order_style"
					href="sabang_main?std=0">판매율 순</a></li>
				<li class="menu"><a class="order_style"
					href="sabang_main?std=1">낮은 가격 순</a></li>
				<li class="menu"><a class="order_style"
					href="sabang_main?std=2">높은 가격 순</a></li>
				<li class="menu"><a class="order_style"
					href="sabang_main?std=3"
					style="text-decoration: underline !important; text-underline-position: under;">조회수
						순</a></li>
			</c:if>
		</ul>
	</div>
	<div class="d-flex flex-row flex-wrap justify-content-center">
		<c:forEach var="sabang" items="${list}">
			<div class="sabang_div3_line" style="width:33%;">
				<div class="sabang_div3_line_item">
					<a class="sabang_div3_move"
						href="sabang_detail?sid=${sabang.sabang_id}">
						<div class="sabang_div3_line_item2">
							<img src="resources/images/sabang_post/${sabang.sabang_imgoname}"
								width="400" height="400" />
						</div>
						<br/>
						<text style="font-family: 'Cafe24Dangdanghae'; font-size:1.5em"> ${sabang.sabang_name} </text>
						<br/> 
						<c:if
							test="${sabang.sabang_price != sabang.sabang_saleprice}">
							<span class="price" style="color: gray; font-size: 1em; text-decoration-line: line-through; font-family: 'Cafe24Dangdanghae';">&#8361;
								<fmt:formatNumber value="${sabang.sabang_price}" pattern="#,###"/></span>
							<br/>
							<span class="price"> <text
									style="font-family: 'Cafe24Dangdanghae'; font-size:1.5em">&#8361;<fmt:formatNumber value="${sabang.sabang_saleprice}" pattern="#,###"/></text></span>
							<span style="color: red; font-size:1.5em" class="percent" id="${sabang.sabang_id}">
								<text style="font-family: 'Cafe24Dangdanghae'; font-size:1.5em">
								<script>salepercent(${sabang.sabang_id},${sabang.sabang_price}, ${sabang.sabang_saleprice});</script>
								</text>
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

	<div class="d-flex justify-content-center">
		<div>
			<nav style="width: 100%;">
					<!-- 처음 이전 12345 다음 맨끝 -->
				<ul  class="pagination">
					<li class="page-item">
						<a class="page-link" href="sabang_main?std=${stdno}&pageNo=1">처음</a> 
					</li>
						<c:if test="${sabang_pager.groupNo>1}">
						<li class="page-item">
							<a class="page-link" href="sabang_main?std=${stdno}&pageNo=${sabang_pager.startPageNo-1}">이전</a>
						</li>
						</c:if> 
						<c:forEach var="i" begin="${sabang_pager.startPageNo}" end="${sabang_pager.endPageNo}">

							<c:if test="${sabang_pager.pageNo!=i}">
							<li class="page-item">
								<a class="page-link"
									href="sabang_main?std=${stdno}&pageNo=${i}">${i}</a>
							</li>
							</c:if>
							<c:if test="${sabang_pager.pageNo==i}">
							<li class="page-item active">
								<a class="page-link"
									href="sabang_main?std=${stdno}&pageNo=${i}">${i}</a>
							</li>
							</c:if>
						</c:forEach> 
						<c:if test="${sabang_pager.groupNo<pager.totalGroupNo}">
						<li class="page-item">
							<a class="page-link"
								href="sabang_main?std=${stdno}&pageNo=${sabang_pager.endPageNo+1}">다음</a>
								</li>
						</c:if>
						<li class="page-item"> 
						<a class="page-link" href="sabang_main?std=${stdno}&pageNo=${sabang_pager.totalPageNo}">맨끝</a>
						</li>
				</ul>
			</nav>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>