<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
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
                    <div class="pay_content_left_delivery_content">
                        <div class="pay_content_left_delivery_content_select">
                            <div class="pay_content_left_delivery_content_select_1" onclick="document.querySelector('.pay_content_left_delivery_content_select_1').style.color='black';">
                                <input id="id1" type="radio" name="name" value="default_location" style="width:30px; height:30px; vertical-align: -5px;" checked><label for="id1"
                                >기본배송지</label>
                                
                            </div>
                            <div class="pay_content_left_delivery_content_select_2" onclick="document.querySelector('.pay_content_left_delivery_content_select_2').style.color='black';">    
                               <input id="id2" type="radio" name="name" value="direct_input" style="width:30px; height:30px; vertical-align: -5px;"><label for="id2"
                              >직접입력</label>
                                
                            </div>    
                        </div>
                        <hr/>
                        <div class="pay_content_left_delivery_content_address">
                            조민상</br>
                            경기도 의정부시 오목로 252, 휴스토리 202동 1004호</br>
                            010-8550-7078
                           
                            
                        </div>
                        
                    </div>
                </div>

                <div class="pay_content_left_way">
                    <div class="pay_content_left_way_header">
                        결제방법
                    </div>
                    <hr/>
                    <div class="pay_content_left_way_content">
                        <div class="pay_content_left_way_content_select btn-group btn-group-lg">
                            <button type="button" class="btn btn-outline-info">카드 결제</button>
                        
                      
                            <button type="button" class="btn btn-outline-secondary">무통장 입금</button>
                            
                          
                            <button type="button" class="btn btn-outline-secondary">휴대폰 결제</button>
                            
                        </div>
                        
                            <div class="pay_content_left_way_content_bank_1">
                                <img id="bank_default_image" src="common/images/bank_kb.png"/>
                                <img src="common/images/bank_samsung.png"/>
                                <img src="common/images/bank_hyundai.png"/>
                                <img src="common/images/bank_shinhan.png"/>
                                <img src="common/images/bank_lotte.png"/>
                                <img src="common/images/bank_nh.png"/>
                                <img src="common/images/bank_bc.png"/>
                                <img src="common/images/bank_citi.png"/>
                                <img src="common/images/bank_kakao.png"/>
                                <img src="common/images/bank_sc.png"/>
                                <img src="common/images/bank_hana.png"/>
                                <img src="common/images/bank_uri.png"/>
                            </div>
                          
                        
                    </div>
                </div>
            </div>

            <div class="pay_content_right">
                <div class="pay_content_right_header"></div>
                <div class="pay_content_right_content">
                    <div class="pay_content_right_content_1">주문상품 정보</div> 
                    <div class="pay_content_right_content_2">
                        <img src="common/images/sb1_0.png" width="150"/>
                        <div>아늑하고 따뜻한 방</div>
                    </div>
                    <div class="pay_content_right_content_3">
                        
                            <div class="pay_content_right_content_3_1">
                               <div>스카르스타</div>
                               <div>크란스크라게</div>
                               <div>글라돔</div>
                               <div>테르티알</div>
                            </div>
                            <div class="pay_content_right_content_3_2">
                               <div><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text> 150,000</div>
                               <div><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text> 50,000</div>
                               <div><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text> 100,000</div>
                               <div><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text> 50,000</div>
                            </div>
                            <div class="pay_content_right_content_3_3">
                               <div>
                                  <img src="common/images/sb1_5.png">
                               </div>
                               <div>
                                  <img src="common/images/sb1_5.png">
                               </div>
                               <div>
                                  <img src="common/images/sb1_5.png">
                               </div>
                               <div>
                                  <img src="common/images/sb1_5.png">
                               </div>
                            </div>             

                    </div>
                    <div class="pay_content_right_content_4">
                        <div class="content_4_1">총 합계</div>
                        <div class="content_4_2"><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text> 350,000</div>
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