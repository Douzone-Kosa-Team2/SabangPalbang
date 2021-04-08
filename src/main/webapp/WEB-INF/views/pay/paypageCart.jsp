<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

   $(function (){
      $('input[type=radio][name=order_payment]').on('click',function(){
         
         var chkValue = $('input[type=radio][name=order_payment]:checked').val();
         
         if(chkValue == 'payByCard'){
            $('#card').show();
            $('#deposit').hide();
            $('#phone22').hide();
         }
         else if (chkValue == 'payByDeposit'){
            $('#deposit').show();
            $('#card').hide();
            $('#phone22').hide();
         }
         else {
            $('#phone22').show();
            $('#card').hide();
            $('#deposit').hide();

         }
      });
   });
   
   $(document).ready(function() {
		 var init = true;		
			if(init === true){
				console.log("초기화 비교 화면");	
				$(function initPost(){
					console.log("초기화 함수진입 화면");	
					var initPostWay =`
						<div style='width: 60%'>
						<div class='form-group'>
							<label for='btitle'>주문자</label> <input type='text' class='form-control' id='oderer' name='oderer' value='${member.member_name}'>
							<span id="errorName" class="error"></span>
							</div>
						<div class='form-group'>
							<label for='bcontent'>주소</label>
							<div class='mb-1'><input type='text' id='zipcode' placeholder='우편번호' value='${member.zipcode}' name='order_zipcode' style='width: 69%' readonly> <input type='button' onclick='DaumPostcode()' value='우편번호 찾기' style='width: 30%'></div>
							<div class='mb-1'><input type='text' id='roadaddress' placeholder='주소' value='${member.roadaddress}' name='order_roadaddress' style='width: 100%' readonly>
							</div>
							<div class='mb-1'><input type='text' id='detailaddress' placeholder='상세주소' value='${member.detailaddress}' name='order_detailaddress'><input type='text' id='extraAddress' placeholder='참고항목' readonly></div>
						</div>
						
						<div class='form-group'><label for='bcontent'>번호</label> <input type='text' class='form-control' id='order_phone' name='order_phone' value='${member.member_phone}'>
						<span id="errorPhone" class="error"></span></div>
						</div>`;
						$('#addPostWay').html(initPostWay);
				})			
			}	
		});
   

   $(function() {
		$('input[type=radio][name=post_way]').on('click', function() {
			var chkValue = $('input[type=radio][name=post_way]:checked').val();
			if (chkValue == 'default_location') {	
				
				console.log("기본배송 함수 호출");
				$(function viewbPost() {
					console.log("기본 배송지 함수 들어옴");
						var viewPostWay =`
						<div id="pop1">

						<div>${member.member_name}</div>
						<div>
							<span>${member.roadaddress}</span><span>${member.detailaddress}</span>
						</div>
						<div>${member.member_phone}</div>
						<input type="hidden" name="order_zipcode" value="${member.zipcode}"/>
						<input type="hidden" name="order_roadaddress" value="${member.roadaddress}"/>
						<input type="hidden" name="order_detailaddress" value="${member.detailaddress}"/>
						<input type="hidden" name="order_phone" value="${member.member_phone}"/>
					</div>`;
							
						$('#addPostWay').html(viewPostWay);
					 })
				
			} else if (chkValue == 'direct_input') {
				
				console.log("직접배송 함수 호출");
				$(function viewdPost() {
					console.log("직접 배송지 함수 들어옴");
						var viewPostWay2 = `
							<div style='width: 60%'>
						<div class='form-group'>
							<label for='btitle'>주문자</label> <input type='text' class='form-control' id='oderer' name='oderer' value='${member.member_name}'>
							<span id="errorName" class="error"></span>
							</div>
						<div class='form-group'>
							<label for='bcontent'>주소</label>
							<div class='mb-1'><input type='text' id='zipcode' placeholder='우편번호' value='${member.zipcode}' name='order_zipcode' style='width: 69%' readonly> <input type='button' onclick='DaumPostcode()' value='우편번호 찾기' style='width: 30%'></div>
							<div class='mb-1'><input type='text' id='roadaddress' placeholder='주소' value='${member.roadaddress}' name='order_roadaddress' style='width: 100%' readonly>
							</div>
							<div class='mb-1'><input type='text' id='detailaddress' placeholder='상세주소' value='${member.detailaddress}' name='order_detailaddress'><input type='text' id='extraAddress' placeholder='참고항목' readonly></div>
						</div>
						
						<div class='form-group'><label for='bcontent'>번호</label> <input type='text' class='form-control' id='order_phone' name='order_phone' value='${member.member_phone}'>
						<span id="errorPhone" class="error"></span></div>
						</div>`;
						
						init = false;
						
						$('#addPostWay').html(viewPostWay2);
					})  
			}		
		});
	 });
   
   
   
   
	const totalSum = function(price) {
		//console.log(event.target);
		console.log($("#sum_price").text());
		var sum = $("#sum_price").text();
		sum = parseInt(sum);
		console.log(price);
		console.log(event.target.checked);
		if (event.target.checked == true) {

			document.getElementById("sum_price").innerHTML = sum + price;
			console.log($("#sum_price").text());
		} else {

			document.getElementById("sum_price").innerHTML = sum - price;
			console.log($("#sum_price").text());
		}
	};	
</script>

<!-- 메인 결제부분 -->

<div class="pay_main">
   <form id="payForm" method="post" action="paySuccess">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <input type="hidden" name="cartKey" value="${cartKey}" />

      <div class="pay_header">
         <div>주문결제</div>
      </div>

      <div class="pay_content">
         <div class="pay_content_left">
            <div class="pay_content_left_delivery">
               <div class="pay_content_left_delivery_header">배송정보</div>
               <hr />

               <div class="pay_content_left_delivery_content">
                  <div class="pay_content_left_delivery_content_select">
                  
                  	
                     <div class="pay_content_left_delivery_content_select_1">
                        <input id="basicPost" type="radio" name="post_way"
                           value="default_location"
                           style="width: 30px; height: 30px; vertical-align: -5px;"
                           ><label for="id1">기본배송지</label>

                     </div>
                     
                     <div class="pay_content_left_delivery_content_select_2">
                        <input id="directPost" type="radio" name="post_way"
                           value="direct_input"
                           style="width: 30px; height: 30px; vertical-align: -5px;"checked><label
                           for="id2">직접입력</label>

                     </div>
                  </div>
                  <hr/>
                  
                  <div id="addPostWay" class="pay_content_left_delivery_content_address d-flex flex-column">

                    

                     
                  </div>
               </div>
            </div>

            <div class="pay_content_left_way">
               <div class="pay_content_left_way_header">결제방법</div>
               <hr />
               <div class="pay_content_left_way_content">
                  <div
                     class="pay_content_left_way_content_select btn-group btn-group-lg"
                     data-toggle="buttons">

                     <label class="btn rmAudio active"> <input
                        type="radio" name="order_payment" value="payByCard" style="opacity: 0;" checked>
                        카드 결제
                     </label> <label class="btn rmAudio"> <input
                        type="radio" name="order_payment" value="payByDeposit" style="opacity: 0;"> 무통장 입금
                     </label> <label class="btn rmAudio"> <input
                        type="radio" name="order_payment" value="payByPhone" style="opacity: 0;"> 휴대폰 결제
                     </label>
                  </div>

                 <div class="pay_content_left_way_content_bank_1">
							<div id="card" role="group" class="btn btn-group-lg btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-outline-light rmAudio active"><input
									type="radio" name="order_bankcode" value="004" style="opacity: 0;" checked>
									<img width="90%" src="resources/images/pay_bank/bank_kb.png">
								</label>
								<label class="btn btn-outline-light rmAudio"><input
									type="radio" name="order_bankcode" value="002" style="opacity: 0;">
									<img src="resources/images/pay_bank/bank_samsung.png">
								</label>
								<label class="btn btn-outline-light rmAudio"><input
									type="radio" name="order_bankcode" value="071" style="opacity: 0;">
									<img src="resources/images/pay_bank/bank_hyundai.png">
								</label>
								
								<label class="btn btn-outline-light rmAudio"><input
									type="radio" name="order_bankcode" value="088" style="opacity: 0;">
									<img src="resources/images/pay_bank/bank_shinhan.png">
								</label>
								<label class="btn btn-outline-light rmAudio"><input
									type="radio" name="order_bankcode" value="055" style="opacity: 0;">
									<img src="resources/images/pay_bank/bank_lotte.png">
								</label>
								<label class="btn btn-outline-light rmAudio"><input
									type="radio" name="order_bankcode" value="011" style="opacity: 0;">
									<img src="resources/images/pay_bank/bank_nh.png">
								</label>
								<label class="btn btn-outline-light rmAudio"><input
									type="radio" name="order_bankcode" value="050" style="opacity: 0;">
									<img src="resources/images/pay_bank/bank_bc.png">
								</label>
								<label class="btn btn-outline-light rmAudio"><input
									type="radio" name="order_bankcode" value="027" style="opacity: 0;">
									<img src="resources/images/pay_bank/bank_citi.png">
								</label>
								<label class="btn btn-outline-light rmAudio"><input
									type="radio" name="order_bankcode" value="090" style="opacity: 0;">
									<img src="resources/images/pay_bank/bank_kakao.png">
								</label>
								<label class="btn btn-outline-light rmAudio""><input
									type="radio" name="order_bankcode" value="090" style="opacity: 0;">
									<img src="resources/images/pay_bank/bank_sc.png">
								</label>
								<label class="btn btn-outline-light rmAudio"><input
									type="radio" name="order_bankcode" value="081" style="opacity: 0;">
									<img src="resources/images/pay_bank/bank_hana.png">
								</label>
								<label class="btn btn-outline-light rmAudio"><input
									type="radio" name="order_bankcode" value="020" style="opacity: 0;">
									<img src="resources/images/pay_bank/bank_uri.png">
								</label>
							</div>

                     <div id="deposit" style="display: none;" class="ml-5">
                     
                        <div class="form-group" style="width: 30%">
								
									<label for="btitle">입금자명 : &nbsp; 조민상</label>		
															
								</div>
								<div class="form-group mt-4" style="width: 60%">
									<label for="bcontent">입금은행 : &nbsp; 카카오뱅크 &nbsp; 3333-13-5087920 &nbsp; (조민상) &nbsp; &nbsp; &nbsp;</label>
									<input type="radio"  class="mt-5" id="depositer" name="order_bankcode" value="998">
									<span id="errorName" class="error"></span>
								</div>
                     </div>

                     <div id="phone22" style="display: none;" class="ml-5">
                        <div class="form-group" style="width: 30%">
									<label for="bcontent">휴대폰 결제 : &nbsp;&nbsp; 010-8550-7078 &nbsp; &nbsp; &nbsp; &nbsp;</label>
									<input type="radio"  class="mt-5" id="depositer" name="order_bankcode" value="999">
									<span id="errorName" class="error"></span>
								</div>
                     </div>

                  </div>
               </div>
            </div>
         </div>

         <div class="pay_content_right">
            <div class="pay_content_right_header"></div>
            <div class="pay_content_right_content">
               <div class="pay_content_right_content_1">주문상품 정보</div>
               <input type="hidden" name="sabangid" value="${selectedCart.sabang_id}"/>
               <div class="pay_content_right_content_2">
                  <img
                     src="resources/images/sabang_post/${selectedCart.sabang_imgoname}"
                     width="150" />
                  <div>${selectedCart.sabang_name}</div>
               </div>
               <div class="pay_content_right_content_3">

                  <div class="pay_content_right_content_3_1">
                     <c:forEach var="product" items="${selectedCart.productCarts}">
                        <div>${product.product_name}</div>
                     </c:forEach>
                  </div>
                  <div class="pay_content_right_content_3_2">
                     <c:set var="sum" value="0" />
                     <c:forEach var="product" items="${selectedCart.productCarts}">
                        <div>
                        <input type="hidden" name="productlist" value="${product.product_id}"/>
                           <text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>
                           <fmt:formatNumber value="${product.product_price}" pattern="#,###"/></div>
                        <c:set var="sum" value="${sum + product.product_price}" />
                     </c:forEach>
                  </div>
               </div>
               
               <div class="pay_content_right_content_4">
                  <div class="content_4_1">총 합계</div>

                  <div class="content_4_2">
                     <text style="font-family:'Cafe24Dangdanghae';">&#8361;</text>
                     <fmt:formatNumber value="${sum}" pattern="#,###"/>
                     <input type="hidden" name="order_price" value="${sum}"/>
                  </div>

               </div>



               <button type="button" class="btn btn-lg btn-info"
                  style="width: 82%; height: 30%; color: white" onclick="success()">결제하기</button>

               <button type="button" class="btn btn-lg btn-light"
                  style="width: 82%; height: 30%; color: black" onclick="cancel()">취소하기</button>


            </div>
         </div>

      </div>
      
   </form>
</div>
<script>
   function success() {
	 //결제 유효성검사 
		event.preventDefault();
		var reg_name = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		var reg_phone = /^\d{10,11}$/;
	
		
		var result = true;
		$(".error").html("");
		
		const order_name = $("#oderer").val();
		const order_tel = $("#order_phone").val();
		const order_zipcode = $("#zipcode").val();
		const order_address = $("#detailaddress").val();
		// 이름 유효성
		if (order_name === "") {
			result = false;
			$("#errorName").html("필수 사항 입니다.");
		} else{
			if (!reg_name.test(order_name)) {
				result = false;
				$("#errorName").html("2자이상 4자 이하의 한글 이름 혹은 띄어쓰기를한 영문 이름을 적어주세요.");
			}
		}
		 // 전화 뒷번호 유효성
		 if (order_tel === "") {
			result = false;
			$("#errorPhone").html("필수 사항 입니다.");
		} else{
			if (!reg_phone.test(order_tel)) {
				result = false;
				$("#errorPhone").html("7자이상 8자 이하의 숫자만 적어주세요.");
			}
		}  
		//주소가 없을 시
		 if(order_zipcode === ""){
				result = false;
				alert("주소 정보를 입력해주세요.")
			}
			else if(order_address ===""){
				result = false;
				alert("상세 주소 정보를 입력해주세요.")
			}
		
		
		
		if(result){
		if($(':radio[name="order_bankcode"]:checked').length == 1){
			
			
			let payElem = $('#payForm');
			payElem.submit();
		}
		else{
			alert("최소 1개의 결제 방법을 선택해야 합니다.")
		}
	}
   }
   
   function cancel() {
      location.href = "shopping_basket";
   }
</script>
<script>
   function DaumPostcode() {
      new daum.Postcode({
         oncomplete : function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
               addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === 'R') {
               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                  extraAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if (data.buildingName !== '' && data.apartment === 'Y') {
                  extraAddr += (extraAddr !== '' ? ', '
                        + data.buildingName : data.buildingName);
               }
               // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if (extraAddr !== '') {
                  extraAddr = ' (' + extraAddr + ')';
               }
               // 조합된 참고항목을 해당 필드에 넣는다.
               document.getElementById("extraAddress").value = extraAddr;

            } else {
               document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("roadaddress").value = addr;
            // 초기화 하고 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailaddress").value = "";
            document.getElementById("detailaddress").focus();
         }
      }).open();
   }
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>