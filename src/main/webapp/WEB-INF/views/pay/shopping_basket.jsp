<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 장바구니 -->
    <div class="shopping_basket">
        <div class="shopping_basket_title"><strong>장바구니</strong></div>
        <div class="shopping_basket_table_header">
            
                <span class="table_header1">번호</span>
                <input class="table_header2" type="checkbox" name="xxx" value="yyy" checked>
                <span class="table_header3">상품명</span>
                <span class="table_header4">수량</span>
                <span class="table_header5">판매가</span>
                <span class="table_header6">배송비</span>
              
        </div>
        <div class="shopping_basket_table_list1">
                <span class="table_list1">1</span>
                <input class="table_list2" type="checkbox" name="xxx" value="yyy" checked>
                <img class="table_list3" src="resources/images/basket_list1.jpg" height="60" width="45">
                <span class="table_list4">아늑한 분위기의 방</span>
                <img class="table_list5" src="resources/images/sb1_5.png" height="30" width="50" >
                <span class="table_list6"><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text> 500,000</span>
                <span class="table_list7">배송비무료</span>
                <a class="table_list8" href='javascript:window.close();'>X</a>   
        </div>

        <div class="shopping_basket_table_list1">
                <span class="table_list1">2</span>
                <input class="table_list2" type="checkbox" name="xxx" value="yyy" checked>
                <img class="table_list3" src="resources/images/basket_list2.jpg" height="60" width="45">
                <span class="table_list4">화려한 분위기의 방</span>
                <img class="table_list5" src="resources/images/sb1_5.png" height="30" width="50" >
                <span class="table_list6"><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text> 500,000</span>
                <span class="table_list7">배송비무료</span>
                <a class="table_list8" href='javascript:window.close();'>X</a>
        </div>

        </div>
        
        <div class="shopping_basket_select_cancle_totalPrice">
            <div class="select_cancle_totalPrice_button"><button type="button" class="btn btn-outline-info">선택 삭제</button></div>
        
            <strong class="shopping_basket_totalPrice1">총가격</strong >
            <strong class="shopping_basket_totalPrice2"><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text> 1,000,000</strong >
            
        </div>

        <div class="shopping_basket_buy_button">
            <a href="pay" >
                <button type="button" class="btn btn-lg btn-info" style="width: 30%; height: 30%; color:white">결제하기</button>
            </a>
            
        </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>