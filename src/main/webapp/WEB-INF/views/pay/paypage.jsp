<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

 <script>
 const totalSum = function (price) {
    //console.log(event.target);
    console.log($("#sum_price").text());
    var sum = $("#sum_price").text();
    sum = parseInt(sum);
    console.log(price);
    console.log(event.target.checked);
    if(event.target.checked == true){
       
       document.getElementById("sum_price").innerHTML = sum + price;
       console.log($("#sum_price").text());
    }
    else{
       
       document.getElementById("sum_price").innerHTML = sum - price;
       console.log($("#sum_price").text());
    }
 };
 
$(function (){
$('input[type=radio][name=post_way]').on('click',function(){
	
	var chkValue = $('input[type=radio][name=post_way]:checked').val();
	
	if(chkValue == 'default_location'){
		$('#pop1').css('display', 'block');
		$('#pop2').css('display', 'none');
	}
	else if (chkValue == 'direct_input'){
		$('#pop1').css('display', 'none');
		$('#pop2').css('display', 'block');	
	}	
});
});

$(function (){
	$('input[type=radio][name=post_way]').on('click',function(){
		
		var chkValue = $('input[type=radio][name=post_way]:checked').val();
		
		if(chkValue == 'default_location'){
			$('#pop1').show();
			$('#pop2').hide();
		}
		else if (chkValue == 'direct_input'){
			$('#pop1').hide();
			$('#pop2').show();	
		}	
	});
});

$(function (){
	$('input[type=radio][name=pay_way]').on('click',function(){
		
		var chkValue = $('input[type=radio][name=pay_way]:checked').val();
		
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
 
 </script>

<!-- 메인 결제부분 -->

    <div class="pay_main">
        
        <div class="pay_header">
            <div>주문결제</div>
        </div>
        
        <div class="pay_content">
            <div class="pay_content_left">
                <div class="pay_content_left_delivery">
                    <div class="pay_content_left_delivery_header">
                        배송정보
                    </div>
                    <hr/>
                    <form action="">
	                    <div class="pay_content_left_delivery_content">
	                        <div class="pay_content_left_delivery_content_select">
	                            <div class="pay_content_left_delivery_content_select_1" onclick="document.querySelector('.pay_content_left_delivery_content_select_1').style.color='black';">
	                                <input id="basicPost" type="radio" name="post_way" value="default_location" style="width:30px; height:30px; vertical-align: -5px;" checked><label for="id1"
	                                >기본배송지</label>
	                                
	                            </div>
	                            <div class="pay_content_left_delivery_content_select_2" onclick="document.querySelector('.pay_content_left_delivery_content_select_2').style.color='black';">    
	                               <input id="directPost" type="radio" name="post_way" value="direct_input" style="width:30px; height:30px; vertical-align: -5px;"><label for="id2"
	                              >직접입력</label>
	                                
	                            </div>    
	                        </div>
	                        <hr/>
	                        <div class="pay_content_left_delivery_content_address d-flex flex-column">
	                        	
		                        	<div id="pop1">
			                        	
					                           <div >${member.member_name}</div>
					                           <div ><span>${member.roadaddress}</span><span>${member.detailaddress}</span></div>
					                           <div >${member.member_phone}</div>
				                        
		                            </div>
	       
	                            <div id="pop2" style="display:none; width:60%">
	                            	
	                            		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									      <div class="form-group">
									         <label for="btitle">주문자</label> <input
									            type="text" class="form-control" id="oderer" name="oderer" value="${member.member_name}">
									      </div>
									      <div class="form-group">
									         <label for="bcontent">주소</label> <input
									            type="text" class="form-control" id="address" name="address">
									      </div>
									      <div class="form-group">
									         <label for="bcontent">번호</label> <input
									            type="text" class="form-control" id="phone" name="phone" value="${member.member_phone}">
									      </div>								      
	                            	                            
	                            </div>                            
	                        </div>                          
	                    </div>
                    </form>
                </div>

                <div class="pay_content_left_way">
                    <div class="pay_content_left_way_header">
                        결제방법
                    </div>
                    <hr/>
                    <div class="pay_content_left_way_content">
                        <div class="pay_content_left_way_content_select btn-group btn-group-lg" data-toggle="buttons">
                           
                        	<label class="btn btn-outline-info rmAudio">
					   			 <input type="radio" name="pay_way" value="payByCard" checked> 카드 결제
					 		</label>
					 		<label class="btn btn-outline-info rmAudio">
					   			 <input type="radio" name="pay_way" value="payByDeposit"> 무통장 입금
					 		</label>
					 		<label class="btn btn-outline-info rmAudio">
					   			 <input type="radio" name="pay_way" value="payByPhone"> 휴대폰 결제
					 		</label>
                         </div>
                 		 <form action="">
	                         <div class="pay_content_left_way_content_bank_1">
	                         
	                         	<div id="card" class="btn btn-group-lg">
	                         		<button type="button" class="btn_image" id="img_btn"><img src="resources/images/pay_bank/bank_kb.png"></button>
	                         		<button type="button" class="btn_image" id="img_btn"><img src="resources/images/pay_bank/bank_samsung.png"></button>
	                         		<button type="button" class="btn_image" id="img_btn"><img src="resources/images/pay_bank/bank_hyundai.png"></button>
	                         		<button type="button" class="btn_image" id="img_btn"><img src="resources/images/pay_bank/bank_shinhan.png"></button>
	                         		<button type="button" class="btn_image" id="img_btn"><img src="resources/images/pay_bank/bank_lotte.png"></button>
	                         		<button type="button" class="btn_image" id="img_btn"><img src="resources/images/pay_bank/bank_nh.png"></button>
	                         		<button type="button" class="btn_image" id="img_btn"><img src="resources/images/pay_bank/bank_bc.png"></button>
	                         		<button type="button" class="btn_image" id="img_btn"><img src="resources/images/pay_bank/bank_citi.png"></button>
	                         		<button type="button" class="btn_image" id="img_btn"><img src="resources/images/pay_bank/bank_kakao.png"></button>
	                         		<button type="button" class="btn_image" id="img_btn"><img src="resources/images/pay_bank/bank_sc.png"></button>
	                         		<button type="button" class="btn_image" id="img_btn"><img src="resources/images/pay_bank/bank_hana.png"></button>
	                         		<button type="button" class="btn_image" id="img_btn"><img src="resources/images/pay_bank/bank_uri.png"></button>
	                             </div>
	                             
	                             <div id="deposit" style="display: none;">
		                               <div class="form-group" style="width:30%">
										         <label for="btitle">입금자명</label> <input
										            type="text" class="form-control" id="depositer" name="depositer">
									   </div>
									   <div class="form-group mt-4" style="width:60%">
										         <label for="bcontent">입금은행</label>
										            <select class="ml-2 d-block" id="depositBank" name="depositBank">
													     <option value="basicDeposit1">카카오뱅크 : 3333-13-5087920 조민상</option>
													     <option value="basicDeposit2">국민은행: 218301-04-295558 조민상</option>
													</select>
									   </div>
									   <div class="form-group " style="width:60%">
									   			<label class="btn rmAudio">
										   			  현금영수증 
										 		</label>
										        <label class="btn rmAudio">
										   			 <input type="radio" name="#" value="#"> 현금영수증 신청
										 		</label>
										 		<label class="btn rmAudio">
										   			 <input type="radio" name="#" value="#" checked> 신청안함
										 		</label>
									   </div>
	                             </div>
	                             
	                             <div id="phone22" style="display: none;">
	                              	<div class="form-group" style="width:30%">
										         <label for="btitle">휴대폰 번호</label> <input
										            type="text" class="form-control" id="phone22" name="phone22">
										            <small>"-"생략하고 입력하시오.</small>
									   </div>
	                             </div>
	                             
	                         </div>
                           </form>                       
                    </div>
                </div>
            </div>

            <div class="pay_content_right">
                <div class="pay_content_right_header"></div>
                <div class="pay_content_right_content">
                    <div class="pay_content_right_content_1">주문상품 정보</div> 
                    <div class="pay_content_right_content_2">
                        <img src="resources/images/sabang_post/${sabang.sabang_imgoname}" width="150"/>
                        <div>${sabang.sabang_name}</div>
                    </div>
                    <div class="pay_content_right_content_3">
                        
                            <div class="pay_content_right_content_3_1">
                            <c:forEach  var="product" items="${productlist}">
                               <div>${product.product_name}</div>
                              </c:forEach>
                            </div>
                            <div class="pay_content_right_content_3_2">
                            <c:set var="sum" value="0"/>
                           	 <c:forEach  var="product" items="${productlist}">
                               <div><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text>${product.product_price}</div>
                               <c:set var="sum" value="${sum + product.product_price}"/>
                             </c:forEach>
                            </div>   

                    </div>
                    <div class="pay_content_right_content_4">
                        <div class="content_4_1">총 합계</div>
                          
                        <div class="content_4_2"><text style="font-family:'Cafe24Dangdanghae';">&#8361;</text><c:out value="${sum}"/></div>
                    </div>
                    <a href="pay_success">
                        <button type="button" class="btn btn-lg btn-info" style="width: 82%; height: 30%; color:white">결제하기</button>
                    </a>
                    <a href="shopping_basket">
                        <button type="button" class="btn btn-lg btn-light" style="width: 82%; height: 30%; color:black">취소하기</button>
                    </a>
                </div>
            </div>
        </div>
    </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>