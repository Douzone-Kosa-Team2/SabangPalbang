<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function() {
		$('input[type=radio][name=order_payment]').on('click', function() {
	
			var chkValue = $('input[type=radio][name=order_payment]:checked').val();
	
			if (chkValue == 'payByCard') {
				$('#card').show();
				$('#deposit').hide();
				$('#phone22').hide();
			} else if (chkValue == 'payByDeposit') {
				$('#deposit').show();
				$('#card').hide();
				$('#phone22').hide();
			} else {
				$('#phone22').show();
				$('#card').hide();
				$('#deposit').hide();
	
			}
		});
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

					</div>`;
							
						$('#addPostWay').append(viewPostWay);
					 })
				
			} else if (chkValue == 'direct_input') {
						
				console.log("직접배송 함수 호출");
				$(function viewdPost() {
					console.log("직접 배송지 함수 들어옴");
						var viewPostWay2 = `
							<div style='width: 60%'>
						<div class='form-group'>
							<label for='btitle'>주문자</label> <input type='text' class='form-control' id='oderer' name='oderer' value='${member.member_name}'></div>
						<div class='form-group'>
							<label for='bcontent'>주소</label>
							<div class='mb-1'><input type='text' id='zipcode' placeholder='우편번호' value='${member.zipcode}' name='order_zipcode' style='width: 69%' readonly> <input type='button' onclick='DaumPostcode()' value='우편번호 찾기' style='width: 30%'></div>
							<div class='mb-1'><input type='text' id='roadaddress' placeholder='주소' value='${member.roadaddress}' name='order_roadaddress' style='width: 100%' readonly>
							</div>
							<div class='mb-1'><input type='text' id='detailaddress' placeholder='상세주소' value='${member.detailaddress}' name='order_detailaddress'><input type='text' id='extraAddress' placeholder='참고항목' readonly></div>
						</div>
						
						<div class='form-group'><label for='bcontent'>번호</label> <input type='text' class='form-control' id='phone' name='order_phone' value='${member.member_phone}'></div>
						</div>`;
						
						$('#addPostWay').append(viewPostWay2);
					})  
			}		
		});
	 });
	 
	/*  function removeCol(idx) {
	      console.log("removeCol() method");
	      
	      if(count > 0){
	         console.log("삭제하는 현재 인덱스: " + idx);
	         $('#review_'+idx).remove();
	         count -= 1;
	      }else{
	         console.log("error : 더 이상 지울 수 없습니다.");
	      }
	   } */
	/* function viewbPost() {
	console.log("기본 배송지 함수 들어옴");
		var viewPostWay = "<div id='pop1'>"+
		"<div>${member.member_name}</div>"+
		"<div><span>${member.roadaddress}</span><span>${member.detailaddress}</span></div>"+
		"<div>${member.member_phone}</div></div>";
			
		$('#addPostWay').append(viewPostWay);
	 }
	function viewdPost() {
	console.log("직접 배송지 함수 들어옴");
		var viewPostWay2 =
			"<div id='pop2' style='display: none; width: 60%'>"+
		"<div class='form-group'>"+
			"<label for='btitle'>주문자</label> <input type='text' class='form-control' id='oderer' name='oderer' value='${member.member_name}'></div>"+
		"<div class='form-group'>"+
			"<label for='bcontent'>주소</label>"+
			"<div class='mb-1'><input type='text' id='zipcode' placeholder='우편번호' value='${member.zipcode}' name='order_zipcode' style='width: 69%' readonly> <input type='button' onclick='DaumPostcode()' value='우편번호 찾기' style='width: 30%'></div>"+
			"<div class='mb-1'><input type='text' id='roadaddress' placeholder='주소' value='${member.roadaddress}' name='order_roadaddress' style='width: 100%' readonly>"+
			"</div>"+
			"<div class='mb-1'><input type='text' id='detailaddress' placeholder='상세주소' value='${member.detailaddress}' name='order_detailaddress'><input type='text' id='extraAddress' placeholder='참고항목' readonly></div>"+
		"</div>"+
		
		"<div class='form-group'><label for='bcontent'>번호</label> <input type='text' class='form-control' id='phone' name='order_phone' value='${member.member_phone}'></div>"+
		"</div>";
		$('#addPostWay').append(viewPostWay2);
	} */  
	
	
	
	 /*   $(function() {
			$('input[type=radio][name=post_way]').on('click', function() {
				console.log("체크함수 들어가기");
				var chkValue = $('input[type=radio][name=post_way]:checked').val();

				if (chkValue == 'default_location') {
					console.log("기본배송 함수 호출");
					viewbPost();
				} else if (chkValue == 'direct_input') {
					console.log("직접배송 함수 호출");
					viewdPost();
				}
			});
		});     */
	
	
	
	
	/*  $(function() {
		$('input[type=radio][name=post_way]').on('click', function() {

			var chkValue = $('input[type=radio][name=post_way]:checked').val();

			if (chkValue == 'default_location') {
				$('#pop1').show();
				$('#pop2').hide();
			} else if (chkValue == 'direct_input') {
				$('#pop1').hide();
				$('#pop2').show();
			}
		});
	});  */

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
	<form id="payForm" method="post" action="payDirectSuccess">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
									checked><label for="id1">기본배송지</label>

							</div>
							<div class="pay_content_left_delivery_content_select_2">
								<input id="directPost" type="radio" name="post_way"
									value="direct_input"
									style="width: 30px; height: 30px; vertical-align: -5px;"><label
									for="id2">직접입력</label>

							</div>
						</div>
						<hr />
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

							<label class="btn btn-outline-info rmAudio"> <input
								type="radio" name="order_payment" value="payByCard" checked>
								카드 결제
							</label> <label class="btn btn-outline-info rmAudio"> <input
								type="radio" name="order_payment" value="payByDeposit"> 무통장 입금
							</label> <label class="btn btn-outline-info rmAudio"> <input
								type="radio" name="order_payment" value="payByPhone"> 휴대폰 결제
							</label>
						</div>

						<div class="pay_content_left_way_content_bank_1">
						<input type="hidden" name="order_bankcode" value="032"/>
							<div id="card" class="btn btn-group-lg">
								<button type="button" class="btn_image" id="img_btn">
									<img src="resources/images/pay_bank/bank_kb.png">
								</button>
								<button type="button" class="btn_image" id="img_btn">
									<img src="resources/images/pay_bank/bank_samsung.png">
								</button>
								<button type="button" class="btn_image" id="img_btn">
									<img src="resources/images/pay_bank/bank_hyundai.png">
								</button>
								<button type="button" class="btn_image" id="img_btn">
									<img src="resources/images/pay_bank/bank_shinhan.png">
								</button>
								<button type="button" class="btn_image" id="img_btn">
									<img src="resources/images/pay_bank/bank_lotte.png">
								</button>
								<button type="button" class="btn_image" id="img_btn">
									<img src="resources/images/pay_bank/bank_nh.png">
								</button>
								<button type="button" class="btn_image" id="img_btn">
									<img src="resources/images/pay_bank/bank_bc.png">
								</button>
								<button type="button" class="btn_image" id="img_btn">
									<img src="resources/images/pay_bank/bank_citi.png">
								</button>
								<button type="button" class="btn_image" id="img_btn">
									<img src="resources/images/pay_bank/bank_kakao.png">
								</button>
								<button type="button" class="btn_image" id="img_btn">
									<img src="resources/images/pay_bank/bank_sc.png">
								</button>
								<button type="button" class="btn_image" id="img_btn">
									<img src="resources/images/pay_bank/bank_hana.png">
								</button>
								<button type="button" class="btn_image" id="img_btn">
									<img src="resources/images/pay_bank/bank_uri.png">
								</button>
							</div>

							<div id="deposit" style="display: none;">
								<div class="form-group" style="width: 30%">
									<label for="btitle">입금자명</label> <input type="text"
										class="form-control" id="depositer" name="depositer">
								</div>
								<div class="form-group mt-4" style="width: 60%">
									<label for="bcontent">입금은행</label> <select class="ml-2 d-block"
										id="depositBank" name="depositBank">
										<option value="basicDeposit1">카카오뱅크 : 3333-13-5087920
											조민상</option>
										<option value="basicDeposit2">국민은행: 218301-04-295558
											조민상</option>
									</select>
								</div>
								<div class="form-group " style="width: 60%">
									<label class="btn rmAudio"> 현금영수증 </label> <label
										class="btn rmAudio"> <input type="radio" name="#"
										value="#"> 현금영수증 신청
									</label> <label class="btn rmAudio"> <input type="radio"
										name="#" value="#" checked> 신청안함
									</label>
								</div>
							</div>

							<div id="phone22" style="display: none;">
								<div class="form-group" style="width: 30%">
									<label for="btitle">휴대폰 번호</label> <input type="text"
										class="form-control" id="phone22" name="order_phone"> <small>"-"생략하고
										입력하시오.</small>
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
					
					<div class="pay_content_right_content_2">
						<img src="resources/images/sabang_post/${sabang.sabang_imgoname}"
							width="150" />
						<div>${sabang.sabang_name}</div>
					</div>
					<div class="pay_content_right_content_3">

						<div class="pay_content_right_content_3_1">
							<c:forEach var="product" items="${productlist}">
							 <input class="form-check-input products"
		                        style="margin-left: 10px;" type="hidden"
		                        value="${product.product_id}" name="products" checked> 
								<div>${product.product_name}</div>
							</c:forEach>
						</div>
						<div class="pay_content_right_content_3_2">
							<c:set var="sum" value="0" />
							<c:forEach var="product" items="${productlist}">
								<div>
									<text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>${product.product_price}</div>
								<c:set var="sum" value="${sum + product.product_price}" />
							</c:forEach>
						</div>

					</div>


					<div class="pay_content_right_content_4">
						<div class="content_4_1">총 합계</div>

						<div class="content_4_2">
							<text style="font-family:'Cafe24Dangdanghae';">&#8361;</text>
							<c:out value="${sum}" />
							<input type="hidden" name="order_price" value="${sum}" />
						</div>
					</div>
					<button type="button" class="btn btn-lg btn-info"
						style="width: 82%; height: 30%; color: white" onclick="success()">결제하기</button>

					<button type="button" class="btn btn-lg btn-light"
						style="width: 82%; height: 30%; color: black" onclick="cancel()">취소하기</button>
				</div>
			</div>
		</div>
		
		 
		 
		<input type="hidden" name="sabangid" value="${sabang.sabang_id}"/>
		
		  
	</form>
</div>
<script>
/*  function pay(){
	   event.preventDefault();
	   if($('input:checkbox[name=products]:checked').length>=1){
   	 $("form").attr("action", "payNow");
   	 $("form").submit();
	   } else{
	  	   alert("1개 품목 이상을 체크해주세요.");
	   }
}  */
	function success() {
		let payElem = $('#payForm');
		payElem.submit();
		// console.log("suc");
	}
	function cancel() {
		location.href = "sabang_main";
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