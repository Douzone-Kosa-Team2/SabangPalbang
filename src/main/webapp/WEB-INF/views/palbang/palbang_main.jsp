<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
.palbang_div3_line_item2  { 
	border-radius: 5%; 
	overflow: hidden; 
	}
.palbang_div3_line_item2  img {
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
}
.palbang_div3_line_item2:hover img {
    -webkit-transform:scale(1.1);
    -moz-transform:scale(1.1);
    -ms-transform:scale(1.1);   
    -o-transform:scale(1.1);
    transform:scale(1.1);
}
.order_style{
	font-family: 'Cafe24Dangdanghae'; 
	font-size:0.9em;
}
</style>
<!-- palbang_main -->
    <div class="palbang_main">
        <div class="palbang_div1"> <!-- 슬로건 -->
            <img class="palbang_div1_img" src="resources/images/palbang_post/palbang_slogan.jpg" width="95%">
        </div>
        <div class="palbang_div2"> <!-- 정렬 카테고리 -->
            <ul class="palbang_div2_sort_type">
            	<c:if test="${stdno==0}">
            		<li class="menu"><a href="palbang_main?std=0" class="order_style" style="text-decoration: underline !important; text-underline-position: under;">좋아요 순</a></li>
                	<li class="menu"><a href="palbang_main?std=1" class="order_style">조회수 순</a></li>
	                <li class="menu"><a href="palbang_main?std=2" class="order_style">등록일 순</a></li>
	                <li class="menu"><a href="palbang_main?std=3" class="order_style">오래된 순</a></li>
            	</c:if>
				<c:if test="${stdno==1}">
            		<li class="menu"><a href="palbang_main?std=0" class="order_style" >좋아요 순</a></li>
                	<li class="menu"><a href="palbang_main?std=1" class="order_style" style="text-decoration: underline !important; text-underline-position: under;">조회수 순</a></li>
	                <li class="menu"><a href="palbang_main?std=2" class="order_style">등록일 순</a></li>
	                <li class="menu"><a href="palbang_main?std=3" class="order_style">오래된 순</a></li>
            	</c:if>
           		<c:if test="${stdno==2}">
            		<li class="menu"><a href="palbang_main?std=0" class="order_style">좋아요 순</a></li>
                	<li class="menu"><a href="palbang_main?std=1" class="order_style">조회수 순</a></li>
	                <li class="menu"><a href="palbang_main?std=2" class="order_style" style="text-decoration: underline !important; text-underline-position: under;">등록일 순</a></li>
	                <li class="menu"><a href="palbang_main?std=3" class="order_style">오래된 순</a></li>
            	</c:if>
            	<c:if test="${stdno==3}">
            		<li class="menu"><a href="palbang_main?std=0" class="order_style">좋아요 순</a></li>
                	<li class="menu"><a href="palbang_main?std=1" class="order_style">조회수 순</a></li>
	                <li class="menu"><a href="palbang_main?std=2" class="order_style">등록일 순</a></li>
	                <li class="menu"><a href="palbang_main?std=3" class="order_style" style="text-decoration: underline !important; text-underline-position: under;">오래된 순</a></li>
            	</c:if>
            </ul>
        </div>
        <div class="palbang_div3_btn">
	    			 <button type="button" onclick="location.href='palbang_create'"
	                    	class="palbang_div3_btn btn" style="background-color: #00B0F0; color: white;">방 자랑하기</button>
	             
	            </div>  
       <div class="palbang_div3_parent"> 
        	<div class="palbang_div3"> <!--방자랑하기 버튼과 아래 게시물-->
	                 
	            <div class="d-flex flex-row flex-wrap justify-content-center">
					<c:forEach var="palbang" items="${list}">
						<div class="palbang_div3_line" style="width:33%;"> <!-- 게시물 첫번째 행 , 게시물 3개 포함 -->
							<div class="palbang_div3_line_item">
								<a class="palbang_div3_move" href="palbang_detail?pid=${palbang.palbang_id}"> 
									<div class="palbang_div3_line_item2">
									<img src="resources/images/palbang_post/${palbang.palbang_imgoname}" width="400" height="400"></div><br/> 
									<div><text style="font-family: 'Cafe24Dangdanghae'; font-size:1.5em">${palbang.palbang_title}</text></div>
								    <div><text style="font-family: 'Cafe24Dangdanghae'; font-size:1em">${palbang.palbang_nickname}</text></div>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16" style="color: red;">
		                            <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
		                        	</svg> <text style="font-family: 'Cafe24Dangdanghae'; font-size:1em">${palbang.palbang_likecount}</text>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>    
        	</div>
   		</div>
        <div class="d-flex justify-content-center">
		<div>
			<nav style="width: 100%;">
					<!-- 처음 이전 12345 다음 맨끝 -->
				<ul  class="pagination">
					<li class="page-item">
						<a class="page-link" href="palbang_main?std=${stdno}&pageNo=1">처음</a> 
					</li>
						<c:if test="${palbang_pager.groupNo>1}">
						<li class="page-item">
							<a class="page-link" href="palbang_main?std=${stdno}&pageNo=${palbang_pager.startPageNo-1}">이전</a>
						</li>
						</c:if> 
						<c:forEach var="i" begin="${palbang_pager.startPageNo}"
							end="${palbang_pager.endPageNo}">

							<c:if test="${palbang_pager.pageNo!=i}">
							<li class="page-item">
								<a class="page-link"
									href="palbang_main?std=${stdno}&pageNo=${i}">${i}</a>
							</li>
							</c:if>
							<c:if test="${palbang_pager.pageNo==i}">
							<li class="page-item active">
								<a class="page-link"
									href="palbang_main?std=${stdno}&pageNo=${i}">${i}</a>
							</li>
							</c:if>
						</c:forEach> 
						<c:if test="${palbang_pager.groupNo<palbang_pager.totalGroupNo}">
						<li class="page-item">
							<a class="page-link"
								href="palbang_main?std=${stdno}&pageNo=${palbang_pager.endPageNo+1}">다음</a>
								</li>
						</c:if>
						<li class="page-item"> 
						<a class="page-link" href="palbang_main?std=${stdno}&pageNo=${palbang_pager.totalPageNo}">맨끝</a>
						</li>
				</ul>
			</nav>
		</div>
	</div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>