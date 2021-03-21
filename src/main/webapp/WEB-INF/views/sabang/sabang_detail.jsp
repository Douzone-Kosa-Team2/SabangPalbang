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
			<img src="resources/images/sabang_detail/sb1_0.png" id="changeImg_big" height="500px" width="500px">

		</div>

		<div class="sabang_detail_1_price_list">
			<div class="sabang_detail_1_list_title">
				<strong>아늑하고 따뜻한 방</strong>
			</div>
			<div class="sabang_detail_1_list_name">
				<div class="sabang_detail_1_list_name_name">
					<div>스카르스타</div>
					<div>크란스크라게</div>
					<div>글라돔</div>
					<div>테르티알</div>
				</div>
				<div class="sabang_detail_1_list_name_price">
					<div><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text> 150,000</div>
					<div><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text> 50,000</div>
					<div><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text> 100,000</div>
					<div><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text> 50,000</div>
				</div>
				<div class="sabang_detail_1_list_name_check">
					<div>
						<img src="resources/images/common/plus_minus_bt.png">
					</div>
					<div>
						<img src="resources/images/common/plus_minus_bt.png">
					</div>
					<div>
						<img src="resources/images/common/plus_minus_bt.png">
					</div>
					<div>
						<img src="resources/images/common/plus_minus_bt.png">
					</div>
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
			<div>
				<img class="sabang_detail_1_goods_div_img" src="resources/images/sabang_detail/sb1_1.png"
					width="100" onmouseover="changeImg(1)">
			</div>
			<div>
				<img class="sabang_detail_1_goods_div_img" src="resources/images/sabang_detail/sb1_2.png"
					width="100" height="100" onmouseover="changeImg(2)">
			</div>
			<div>
				<img class="sabang_detail_1_goods_div_img" src="resources/images/sabang_detail/sb1_3.png"
					width="100" height="100" onmouseover="changeImg(3)">
			</div>
			<div>
				<img class="sabang_detail_1_goods_div_img" src="resources/images/sabang_detail/sb1_4.png"
					width="100" height="100" onmouseover="changeImg(4)">
			</div>
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

		<div class="sabang_detail_2_content">

			<div class="sabang_detail_2_content_img">
				<img src="resources/images/sabang_detail/sb1_1.png" />
			</div>

			<div class="sabang_detail_2_content_txt">

				<div class="sabang_detail_2_content_txt_header"></div>
				<h3>테트티알 &nbsp;&nbsp;<text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>50,000</h3>
				<div class="sabang_detail_2_content_txt_content">
					<div class="sabang_detail_2_content_txt_content_1">
						<p>조명의 각도를 자유롭게 조절하여 원하는 곳에 빛을 비출 수 있습니다.</p>
						<p>탁상스탠드 또는 벽부착등으로 사용할 수 있습니다.</p>
						<p>조명은 별도구매입니다. LED전구 E26사용을 권장합니다.</p>
					</div>
					<div class="sabang_detail_2_content_txt_content_2">
						<p>최대: 13W</p>
						<p>갓 지름: 17cm</p>
						<p>코드 길이: 1.5m</p>
					</div>
				</div>
			</div>

		</div>
		<!-- 상품2 -->

		<div class="sabang_detail_2_content">

			<div class="sabang_detail_2_content_img">
				<img src="resources/images/sabang_detail/sb1_2.png" />
			</div>

			<div class="sabang_detail_2_content_txt">

				<div class="sabang_detail_2_content_txt_header"></div>
				<h3>크란스크라게 &nbsp;&nbsp; <text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>50,000</h3>
				<div class="sabang_detail_2_content_txt_content">
					<div class="sabang_detail_2_content_txt_content_1">
						<p>125 TC(스레드카운트).</p>
						<p>TC(스레드카운트)는 패브릭의 제곱인치당 실의 수를 나타냅니다.</p>
						<p>TC(스레드카운트)가 높을수록 페브릭이 촘촘합니다.</p>
						<p>다양한 사이즈 중에서 선택할 수 있습니다.</p>
					</div>
					<div class="sabang_detail_2_content_txt_content_2">
						<p>면 100%</p>
						<p>세탁기,최대 60'C, 표준 코스,</p>
						<p>표백하지 마세요.</p>
						<p>건조기, 표준 코스(최대80'C.)</p>
						<p>드라이클리닝하지 마세요.</p>
					</div>
				</div>
			</div>

		</div>
		<!-- 상품3 -->

		<div class="sabang_detail_2_content">

			<div class="sabang_detail_2_content_img">
				<img src="resources/images/sabang_detail/sb1_3.png" />
			</div>

			<div class="sabang_detail_2_content_txt">

				<div class="sabang_detail_2_content_txt_header"></div>
				<h3>스카르스타 &nbsp;&nbsp;<text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>150,000</h3>
				<div class="sabang_detail_2_content_txt_content">
					<div class="sabang_detail_2_content_txt_content_1">
						<p>손잡이를 돌려 책상 높이를 70~120cm로 조절할 수 있습니다. 일하는.</p>
						<p>자세에 맞게 가장 편안한 높이로 맞춰보세요.</p>
						<p></p>
						<p>앉아서 또는 서서 사용할 수 있습니다. 장시간 같은 자세에서 오는</p>
						<p>피로감을 덜어주며 집중력도 높여줍니다.</p>
					</div>
					<div class="sabang_detail_2_content_txt_content_2">
						<img src="resources/images/sabang_detail/sb1_3_1.png" />
					</div>
				</div>
			</div>

		</div>

		<!-- 상품4 -->

		<div class="sabang_detail_2_content">

			<div class="sabang_detail_2_content_img">
				<img src="resources/images/sabang_detail/sb1_4.png" />
			</div>

			<div class="sabang_detail_2_content_txt">

				<div class="sabang_detail_2_content_txt_header"></div>
				<h3>글라돔 &nbsp;&nbsp;<text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>100,000</h3>
				<div class="sabang_detail_2_content_txt_content">
					<div class="sabang_detail_2_content_txt_content_1">
						<p>트레이를 빼서 쟁반으로 사용할 수도 있습니다.</p>
						<p>테두리가 있어서 옮기기 쉽고 유리잔이나 그릇이 밖으로 떨어지지</p>
						<p>않습니다.</p>
					</div>
					<div class="sabang_detail_2_content_txt_content_2">
						<img src="resources/images/sabang_detail/sb1_4_1.png" />
					</div>
				</div>
			</div>

		</div>
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