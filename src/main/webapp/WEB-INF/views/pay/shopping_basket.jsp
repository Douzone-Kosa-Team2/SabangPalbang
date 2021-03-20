<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
	 /* 선택삭제 및 총 가격 */

            .shopping_basket_select_cancle_totalPrice{
                display: flex;
                flex-direction: row;
               
            }
            .select_cancle_totalPrice_button{
                margin-left:15%;
            }

            /* 테이블 간격 */
            .shopping_basket_title{
                margin-bottom: 2%;
            }
            .shopping_basket_header{
                font-size: 1.4em;
            }
            table{
                margin-left: 10%;
            }
            col{
                
               text-align: center;
            }
            td{

                padding: 25px;
            }
            .shopping_basket_list{
                margin-left: 10.5%;
            }
</style>


<!-- 장바구니 -->
   <div class="shopping_basket_title"><strong>장바구니</strong></div>
    <table class="shopping_basket_header">
        <colgroup>
            <col width="6%">
            <col width="8%">
            <col width="16%">
            <col width="15%">
            <col width="14%">
            <col width="15%">
            <col width="15%">
            <col width="1%">
        </colgroup>
        <tr>
            <td>번호</td>
            <td><input class="table_header2" type="checkbox" name="xxx" value="yyy" checked></td>
            <td></td>
            <td>상품명</td>
            <td>수량</td>
            <td>판매가</td>
            <td>배송비</td>
            <td></td>
        </tr>
    </table>
    <table class="shopping_basket_list">
        <colgroup>
            <col width="6.5%">
            <col width="12%">
            <col style="align-content: center;">
            <col width="28%">
            <col width="16.5%">
            <col width="19%">
            <col width="20%">
            <col >
        </colgroup>
        <tr>
            <td>1</td>
            <td><input class="table_header2" type="checkbox" name="xxx" value="yyy" checked></td>
            <td style="padding: 20px;"> <img class="table_list5" src="resources/images/sb1_0.png" height="80" width="70" ></td>
            <td style="text-align: center;">아늑하고 따뜻한 방</td>
            <td><img class="table_list5" src="resources/images/sb1_5.png" height="30" width="70" ></td>
            <td>W 500,000</td>
            <td>배송비무료</td>
            <td> <a href='javascript:window.close();'>X</a></td>
        </tr>
        <br/>
        <tr>
            <td>2</td>
            <td><input class="table_header2" type="checkbox" name="xxx" value="yyy" checked></td>
            <td  style="padding: 20px;"><img class="table_list5" src="resources/images/sb1_0.png" height="80" width="70" ></td>
            <td style="text-align: center;">온종일 편안하게 꿀잠 방 </td>
            <td><img class="table_list5" src="resources/images/sb1_5.png" height="30" width="70" ></td>
            <td>W 500,000</td>
            <td>배송비무료</td>
            <td> <a href='javascript:window.close();'>X</a></td>
        </tr>


    </table>
     
        
        <div class="shopping_basket_select_cancle_totalPrice">
            <div class="select_cancle_totalPrice_button"><button type="button" class="btn btn-outline-info">선택 삭제</button></div>
        
            <strong class="shopping_basket_totalPrice1">총가격</strong >
            <strong class="shopping_basket_totalPrice2"><text style="font-family: 'Cafe24Dangdanghae';">&#8361;</text> 1,000,000</strong >
            
        </div>

        <div class="shopping_basket_buy_button">
            <a href="pay">
                <button type="button" class="btn btn-lg btn-info" style="width: 30%; height: 30%; color:white">결제하기</button>
            </a>
            
        </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>