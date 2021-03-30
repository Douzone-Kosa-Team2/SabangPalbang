<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>
	function changeImg(num){
		var bigImg = document.getElementById("changeImg_big");
		var smallImg = document.querySelectorAll(".sabang_detail_1_goods_div_img");
		var imgSize = smallImg.length;
		
		for(var i=0;i<imgSize;i++){
			if(i==num){
				
				bigImg.src= "resources/images/sabang_detail/sb1_"+i+".png";
				smallImg[i].style.opacity = "1";
			}
			else{
				smallImg[i].style.opacity = "0.6";
			}
		}
	}
</script>

<!-- 상세페이지 1 -->
	<div class="sabang_detail_1">

		<div class="sabang_detail_1_main_image">
			<img src="resources/images/sabang_post/${sabang.sabang_imgoname}" id="changeImg_big" height="500px" width="500px">

		</div>

		<div class="sabang_detail_1_price_list">
			<div class="sabang_detail_1_list_title">
				<strong>${sabang.sabang_name}</strong>
			</div>
			<div class="sabang_detail_1_list_name d-flex flex-row">
			
				<div class="sabang_detail_1_list_name_name">
					<c:forEach var="product" items="${productList}">
						<div>${product.product_name}</div>
					</c:forEach>
				</div>
				<div class="sabang_detail_1_list_name_price">
					<c:forEach var="product" items="${productList}">
					
						<div><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>${product.product_price}</div>
						<div><input class="form-check-input" type="checkbox" value="${product.product_id}" checked></div>
						
					</c:forEach>
				</div>
				

			</div>
			<div class="sabang_detail_1_total_price">
				<div class="sabang_detail_1_total_font">총합</div>
				<div class="sabang_detail_1_total_price_font">
					<strong><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text> 350,000</strong>
				</div>
			</div>
			<div class="sabang_detail_1_trolley_buyButton">
				<div class="trolley_button">
					<a href="shopping_basket">
						<img src="resources/images/common/trolley.png" width="65">
					</a>
					
				</div>
				<div class="sabang_detail_1_buyButton">
					<a href="pay">
						<img src="resources/images/sabang_detail/sb1_6.png" width="230">
					</a>
					
				</div>
			</div>
		</div>

	</div>

	<div class="sabang_detail_1_good_Explanatin">
		<div class="sabang_detail_1_goods_div">
			<div>
				<img class="sabang_detail_1_goods_div_img" src="resources/images/sabang_detail/sb1_0.png"
					width="100" onmouseover="changeImg(0)">
			</div>
			<c:forEach var="product" items="${productList}">
				<div>
					<img class="sabang_detail_1_goods_div_img" src="resources/images/sabang_detail/${product.product_imgsname}"
						width="100" onmouseover="changeImg(1)">
				</div>
			</c:forEach>
		</div>
		<div class="sabang_detail_1_Explanatin">
			<div class="sabang_detail_1_Explanatin_top">
				따뜻한 조명의 테르티알로 방의 분위기를 더 아늑하게 해보세요.<br /> 어느자세든 편하게 높이를 조절해 허리를 편안하게
				해주는 스카르스타...
			</div>
			<div class="sabang_detail_1_Explanatin_down">※ 이 이미지는 8평 기준 가구입니다</div>
		</div>

	</div>

	<!-- 상세페이지 2 -->

	<!-- 상품1 -->

	<div class="sabang_detail_2">
		<c:forEach var="product" items="${productList}">
			<div class="sabang_detail_2_content">
	
				<div class="sabang_detail_2_content_img">
					<img src="resources/images/sabang_detail/${product.product_imgsname}"/>
				</div>
	
				<div class="sabang_detail_2_content_txt">
	
					<div class="sabang_detail_2_content_txt_header"></div>
					<h3>${product.product_name} &nbsp;&nbsp;<text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>${product.product_price}</h3>
					<div class="sabang_detail_2_content_txt_content">
						<div class="sabang_detail_2_content_txt_content_1">
							<p>${product.product_explain1}</p>
							
						</div>
						<div class="sabang_detail_2_content_txt_content_2">
							<p>${product.product_explain2}</p>
							
						</div>
					</div>
				</div>
			</div>
		</c:forEach>	
	</div>


	<!-- 상세페이지 3 -->
	<br/>
	<br/>
	<br/>	
	<hr/>
	<br/>

	<!-- 문의 게시판  -->
	<div class="sabang_detail_3">
		<div class="sabang_detail_3_div_table">
			<table class="table">
				<thead class="thead-light">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">문의종류 <svg xmlns="http://www.w3.org/2000/svg"
								width="16" height="16" fill="currentColor"
								class="bi bi-arrow-down-circle" viewBox="0 0 16 16">
	  						<path fill-rule="evenodd"
									d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z" />
						</svg>
						</th>
						<th scope="col">답변상태 <svg xmlns="http://www.w3.org/2000/svg"
								width="16" height="16" fill="currentColor"
								class="bi bi-arrow-down-circle" viewBox="0 0 16 16">
	  						<path fill-rule="evenodd"
									d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z" />
						</svg>
						</th>
						<th scope="col">제목</th>
						<th scope="col">문의자</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td scope="row">1</td>
						<td>반품/취소/교환</td>
						<td style="color: #adb5bd;">검토중</td>
						<td>반품/취소 문의입니다.</td>
						<td>이*정</td>
						<td>2021.03.10</td>
					</tr>
					<tr>
						<td scope="row">2</td>
						<td>상품</td>
						<td style="color: #00BFFF;">답변완료</td>
						<td>상품 문의입니다.</td>
						<td>조*상</td>
						<td>2021.03.09</td>
					</tr>
					<tr>
						<td scope="row">3</td>
						<td>반품/취소/교환</td>
						<td style="color: #00BFFF;">답변완료</td>
						<td>배송 문의입니다.</td>
						<td>이*현</td>
						<td>2021.03.08</td>
					</tr>
					<tr>
						<td scope="row">4</td>
						<td>반품/취소/교환</td>
						<td style="color: #adb5bd;">검토중</td>
						<td>반품/취소 문의입니다.</td>
						<td>이*정</td>
						<td>2021.03.07</td>
					</tr>
					<tr>
						<td scope="row">5</td>
						<td>상품</td>
						<td style="color: #00BFFF;">답변완료</td>
						<td>상품 문의입니다.</td>
						<td>조*상</td>
						<td>2021.03.06</td>
					</tr>
					<tr>
						<td scope="row">6</td>
						<td>반품/취소/교환</td>
						<td style="color: #00BFFF;">답변완료</td>
						<td>배송 문의입니다.</td>
						<td>이*현</td>
						<td>2021.03.05</td>
					</tr>
					<tr>
						<td scope="row">7</td>
						<td>반품/취소/교환</td>
						<td style="color: #adb5bd;">검토중</td>
						<td>반품/취소 문의입니다.</td>
						<td>이*정</td>
						<td>2021.03.04</td>
					</tr>
					<tr>
						<td scope="row">8</td>
						<td>상품</td>
						<td style="color: #00BFFF;">답변완료</td>
						<td>상품 문의입니다.</td>
						<td>조*상</td>
						<td>2021.03.03</td>
					</tr>
					<tr>
						<td scope="row">9</td>
						<td>반품/취소/교환</td>
						<td style="color: #00BFFF;">답변완료</td>
						<td>배송 문의입니다.</td>
						<td>이*현</td>
						<td>2021.03.02</td>
					</tr>
					<tr style="border-bottom: hidden;">
						<td colspan="2"></td>
						<td scope="row" colspan="3" style="text-align: center;"><a
							href="">1</a> <a href="">2</a> <a href="">3</a></td>
						<td>
							<button onclick="ask()" type="button" class="btn btn-dark">작성하기</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<br />
	</div>
<script>
	function ask(){
		window.open("pop_ask","사방팔방 문의하기","popup");
	}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>