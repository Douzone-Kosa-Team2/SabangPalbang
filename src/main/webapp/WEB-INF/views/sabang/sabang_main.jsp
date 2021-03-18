<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- sabang_main -->
     <div class="sabang_main">
	   <div class="sabang_div1">
	        <img class="sabang_div1_img" src="resources/images/sabang_post/slogan_sa.png" height="45px">
	    </div>
	    <div class="sabang_div2">
	        <ul class="sabang_div2_sort_type">
	            <li class="menu"><a class="sabang_div3_move" href="" >판매율 순</a></li>
	            <li class="menu"><a class="sabang_div3_move" href="" style="color:gray;">낮은 가격 순</a></li>
	            <li class="menu"><a class="sabang_div3_move" href="" style="color:gray;">높은 가격 순</a></li>
	            <li class="menu"><a class="sabang_div3_move" href="" style="color:gray;">조회수 순</a></li>
	        </ul>     
	    </div>
        <div class="sabang_div3">
            <div class="sabang_div3_line">
                <div class="sabang_div3_line_item" >
                    <a class="sabang_div3_move" href="sabang_detail.html">
                        <img src="resources/images/sabang_post/sabang_post1.png" height="200"><br/>
                        시원한 그리스풍 방<br/>
                        <span class="price" style="color: gray; font-size: 0.9em; text-decoration-line: line-through;">&#8361; 2,500,000</span><br/>
                        <span class="price">&#8361; 2,000,000</span>
                        <span style="color: red;">20%</span>
                    </a>
                </div>
                <div class="sabang_div3_line_item" >
                    <a class="sabang_div3_move" href="sabang_detail.html">
                        <img src="resources/images/sabang_post/sabang_post2.png" height="200"><br/>
                        화사한 북유럽풍 방<br/>
                        <span class="price" style="color: gray; font-size: 0.9em; text-decoration-line: line-through;">&#8361; 3,500,000</span><br/>
                        <span class="price">&#8361; 3,000,000</span>
                        <span style="color: red;">14%</span>
                    </a>
                </div>
                <div class="sabang_div3_line_item" >
                    <a class="sabang_div3_move" href="sabang_detail.html">
                        <img src="resources/images/sabang_post/sabang_post3.png" height="200"><br/>
                        모던 그 자체 방<br/>
                        <span class="price" style="color: gray; font-size: 0.9em; text-decoration-line: line-through;">&#8361; 1,800,000</span><br/>
                        <span class="price">&#8361; 1,500,000</span>
                        <span style="color: red;">16%</span>
                    </a>
                </div>
            </div>
            <div class="sabang_div3_line">
                <div class="sabang_div3_line_item" >
                    <a class="sabang_div3_move" href="sabang_detail.html">
                        <img src="resources/images/sabang_post/sabang_post4.png" height="200"><br/>
                        적은 돈 럭셔리 침실<br/>
                        <span></span><br/>
                        <span class="price">&#8361; 900,000</span>
                    </a>
                </div>
                <div class="sabang_div3_line_item" >
                    <a class="sabang_div3_move" href="sabang_detail.html">
                        <img src="resources/images/sabang_post/sabang_post5.png" height="200"><br/>
                       감각적이고 편리한 방<br/>
                        <span></span><br/>
                        <span class="price">&#8361; 900,000</span>
                    </a>
                </div>
                <div class="sabang_div3_line_item" >
                    <a class="sabang_div3_move" href="sabang_detail.html">
                        <img src="resources/images/sabang_post/sabang_post6.png" height="200"><br/>
                        다용도 작업 방<br/>
                        <span class="price" style="color: gray; font-size: 0.9em; text-decoration-line: line-through;">&#8361; 1,200,000</span><br/>
                        <span class="price">&#8361; 800,000</span>
                        <span style="color: red;">33%</span>
                    </a>
                </div>
            </div>
    </div>
    </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>