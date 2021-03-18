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
                <li class="menu"><a href="" >좋아요 순</a></li>
                <li class="menu"><a href="" style="color:gray;">조회수 순</a></li>
                <li class="menu"><a href="" style="color:gray;">등록일 순</a></li>
                <li class="menu"><a href="" style="color:gray;">오래된 순</a></li>
            </ul>
        </div>
        <div class="palbang_div3_parent">
        <div class="palbang_div3"> <!--방자랑하기 버튼과 아래 게시물-->
            <div class="palbang_div3_btn">
                <a href="palbang_create">
                    <button type="button" class="palbang_div3_btn btn" style="background-color: #00B0F0; color: white;">방 자랑하기</button>
                </a>
               
            </div>
                
            <div class="palbang_div3_line"> <!-- 게시물 첫번째 행 , 게시물 3개 포함 -->
                <div class="palbang_div3_line_item"> <!-- 하나의 게시물 -->
                    <a class="palbang_div3_move" href="palbang_detail.html">
                        <img src="resources/images/palbang_post/pal_post1.png" height="200"><br/>
                        <div style="font-size: 1.3em;">크리스마스 느낌나는 내 방</div>
                        <div style="font-size: 1em;">산타클로스</div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16" style="color: red;">
                            <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                        </svg> 45
                    </a>
                </div>
                <div class="palbang_div3_line_item"> 
                    <a class="palbang_div3_move" href="palbang_detail.html"></a>
                        <img src="resources/images/palbang_post/pal_post2.png" height="200"><br/>
                        <div style="font-size: 1.3em;">커피 한 잔의 여유가 흘러넘치는 방</div>
                        <div style="font-size: 1em;">방구석오뎅</div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16" style="color: red;">
                            <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                        </svg> 32
                    </a>
                </div>
                <div class="palbang_div3_line_item">
                    <a class="palbang_div3_move" href="palbang_detail.html">
                        <img src="resources/images/palbang_post/pal_post3.png" height="200"><br/>
                        <div style="font-size: 1.3em;">2층침대의 로망은 로망일뿐이다.</div>
                        <div style="font-size: 1em;">이웃집동생</div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16" style="color: red;">
                            <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                        </svg>30
                    </a>
                </div>   
            </div>
            <div class="palbang_div3_line"> <!-- 게시물 두 번째 행 , 게시물 3개 포함 -->
                <div class="palbang_div3_line_item" >
                    <a class="palbang_div3_move" href="palbang_detail.html">
                        <img src="resources/images/palbang_post/pal_post4.png" height="200"><br/>
                        <div style="font-size: 1.3em;">소품으로 내 방 꾸미기</div>
                        <div style="font-size: 1em;">빈털터리</div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16" style="color: red;">
                            <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                        </svg> 45
                    </a>
                </div>
                <div class="palbang_div3_line_item">
                    <a class="palbang_div3_move" href="palbang_detail.html">
                        <img src="resources/images/palbang_post/pal_post5.png" height="200"><br/>
                        <div style="font-size: 1.3em;">아침엔 브런치가 땡기는 방</div>
                        <div style="font-size: 1em;">늦잠꾸러기</div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16" style="color: red;">
                            <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                        </svg> 32
                    </a>
                </div>
                <div class="palbang_div3_line_item">
                    <a class="palbang_div3_move" href="palbang_detail.html">
                        <img src="resources/images/palbang_post/pal_post6.png" height="200"><br/>
                        <div style="font-size: 1.3em;">깔끔해서 청소하고 싶은 내 방</div>
                        <div style="font-size: 1em;">청개구리</div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16" style="color: red;">
                            <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                        </svg> 30
                    </a>
                </div>
            </div>
        </div>
    </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>