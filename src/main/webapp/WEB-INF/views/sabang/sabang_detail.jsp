<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>
	function changeImg(num){
		var bigImg = document.getElementById("changeImg_big");
		var smallImg = document.querySelectorAll(".sabang_detail_1_goods_div_img");
		var imgSize = smallImg.length;
		
		for(var i=0;i<imgSize;i++){
			if(i==num){				
				if(i==0){
					bigImg.src= "resources/images/sabang_post/${sabang.sabang_imgoname}";
					smallImg[i].style.opacity = "1";
				}
				else{
					bigImg.src= "resources/images/sabang_detail/sb1_"+i+".png";
					smallImg[i].style.opacity = "1";
				}
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
		<c:forEach var="product" items="${productList}">
				<div class="sabang_detail_1_list_name d-flex justify-content-center" style="margin:10px 70px; border-bottom:1px solid #ced4da">
					<div class="sabang_detail_1_list_name_name">
						<div>${product.product_name}</div>
					</div>
					<div class="sabang_detail_1_list_name_price">
						<div><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>${product.product_price} </div>
					</div>
					<div class="sabang_detail_1_list_name_price">
						<div><input class="form-check-input" style="margin-left:10px;" type="checkbox" value="${product.product_id}" checked></div>
					</div>
				</div>
			</c:forEach>
		
			<div class="sabang_detail_1_total_price">
				<div class="sabang_detail_1_total_font">총합</div>
				<div class="sabang_detail_1_total_price_font ">
					<strong ><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text> 350,000</strong>
				</div>
			</div>
			<div class="sabang_detail_1_trolley_buyButton">
				<div class="trolley_button">
					<a href="shopping_basket">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
  							<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
						</svg>
					</a>
				</div>
				<div class="sabang_detail_1_buyButton">
					<button href="pay" type="button" class="btn btn-info">바로구매</button>
				</div>
			</div>
		</div>

		

	</div>

	<div class="sabang_detail_1_good_Explanatin">
		<div class="sabang_detail_1_goods_div">
			<div>
				<img class="sabang_detail_1_goods_div_img" src="resources/images/sabang_post/${sabang.sabang_imgoname}"
					width="100" onmouseover="changeImg(0)">
			</div>
			<c:forEach var="product" items="${productList}" varStatus="status">
				<div>
					<img class="sabang_detail_1_goods_div_img" src="resources/images/sabang_detail/${product.product_imgsname}"
						width="100" onmouseover="changeImg(${status.count})">
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
					<h3>${product.product_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<text style="font-family:'Cafe24Dangdanghae';">&#8361;</text>&nbsp;&nbsp;${product.product_price}</h3>
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
	<div class="sabang_detail_3" id="inquirypart">
		
		<br />
	</div>
<script>
	function ask(){
		window.open("pop_ask","사방팔방 문의하기","popup");
	}
	$(function() {
		console.log("success");
		getList(1,${sid});
	});
	
	const getList = (pageNo,sid) => {
		console.log("success2");
		
		$.ajax({
            url: "inquirylist",
            data: {sid ,pageNo}, 
            method: "get"
         })
		.then(data => {
			console.log("success3");
			$("#inquirypart").html(data);
		});
	};
	
	
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>