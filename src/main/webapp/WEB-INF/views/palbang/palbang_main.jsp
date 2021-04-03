<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- palbang_main -->
    <div class="palbang_main">
        <div class="palbang_div1"> <!-- 슬로건 -->
            <img class="palbang_div1_img" src="resources/images/palbang_post/pal_slogan.png" height="45px">
        </div>
        <div class="palbang_div2"> <!-- 정렬 카테고리 -->
            <ul class="palbang_div2_sort_type">
                <li class="menu"><a href="palbang_main?std=0">좋아요 순</a></li>
                <li class="menu"><a href="palbang_main?std=1" style="color:gray;">조회수 순</a></li>
                <li class="menu"><a href="palbang_main?std=2" style="color:gray;">등록일 순</a></li>
                <li class="menu"><a href="palbang_main?std=3" style="color:gray;">오래된 순</a></li>
            </ul>
        </div>
       <div class="palbang_div3_parent"> 
        	<div class="palbang_div3"> <!--방자랑하기 버튼과 아래 게시물-->
	            <div class="palbang_div3_btn">
	    			 <button type="button" onclick="location.href='palbang_create'"
	                    	class="palbang_div3_btn btn" style="background-color: #00B0F0; color: white;">방 자랑하기</button>
	             
	            </div>        
	            <div class="d-flex flex-row flex-wrap justify-content-center">
					<c:forEach var="palbang" items="${list}">
						<div class="palbang_div3_line"> <!-- 게시물 첫번째 행 , 게시물 3개 포함 -->
							<div class="palbang_div3_line_item">
								<a class="palbang_div3_move" href="palbang_detail?pid=${palbang.palbang_id}"> 
									<img src="resources/images/palbang_post/${palbang.palbang_imgoname}" height="200"><br/> 
									<div style="font-size: 1.3em;">${palbang.palbang_title}</div>
								    <div style="font-size: 1em;">${palbang.palbang_nickname}</div>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16" style="color: red;">
		                            <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
		                        	</svg> ${palbang.palbang_likecount}
								</a>
							</div>
						</div>
					</c:forEach>
				</div>    
        	</div>
   		</div>
        <div class="d-flex justify-content-center">
		<div>
			<table style="width:100%;">
				<tr>
					<!-- 처음 이전 12345 다음 맨끝 -->
					<td colspan="5" class="text-center"><a
						class="btn btn-outline-primary btn-sm" href="palbang_main?std=${stdno}&pageNo=1">처음</a>
						<c:if test="${palbang_pager.groupNo>1}">
							<a class="btn btn-outline-info btn-sm"
								href="palbang_main?std=${stdno}&pageNo=${palbang_pager.startPageNo-1}">이전</a>
						</c:if> <c:forEach var="i" begin="${palbang_pager.startPageNo}"
							end="${palbang_pager.endPageNo}">
	
							<c:if test="${palbang_pager.pageNo!=i}">
								<a class="btn btn-outline-success btn-sm"
									href="palbang_main?std=${stdno}&pageNo=${i}">${i}</a>
							</c:if>
							<c:if test="${palbang_pager.pageNo==i}">
								<a class="btn btn-outline-danger btn-sm"
									href="palbang_main?std=${stdno}&pageNo=${i}">${i}</a>
							</c:if>
						</c:forEach> <c:if test="${palbang_pager.groupNo<palbang_pager.totalGroupNo}">
							<a class="btn btn-outline-info btn-sm"
								href="palbang_main?std=${stdno}&pageNo=${palbang_pager.endPageNo+1}">다음</a>
						</c:if> <a class="btn btn-outline-primary btn-sm"
						href="palbang_main?std=${stdno}&pageNo=${palbang_pager.totalPageNo}">맨끝</a></td>
				</tr>
			</table>
		</div>
	</div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>