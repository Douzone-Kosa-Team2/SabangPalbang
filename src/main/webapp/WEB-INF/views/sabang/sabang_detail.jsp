<%@ page contentType="text/html; charset=UTF-8"%>
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
               bigImg.src= "resources/images/sabang_detail/"+${sabang.sabang_id}+"-"+i+".jpg";
               smallImg[i].style.opacity = "1";
            }
         }
         else{
            smallImg[i].style.opacity = "0.6";
         }
      }
   }
   function cart(){
      event.preventDefault();
      if($('input:checkbox[name=products]:checked').length>=1){
    	  console.log($('input:checkbox[name=products]:checked').length);
    	  $("form").attr("action", "shopping_basket_fromdetail");
	  	  $("form").submit();
      } else{
    	  console.log($('input:checkbox[name=products]:checked').length);
    	  alert("1개 품목 이상을 체크해주세요.");
      }
	 
      
   };
   
   function pay(){
	   event.preventDefault();
	   if($('input:checkbox[name=products]:checked').length>=1){
      	 $("form").attr("action", "payNow");
      	 $("form").submit();
  	   } else{
 	  	   alert("1개 품목 이상을 체크해주세요.");
   	   }
   }
   

 const updateSum = function (price) {
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
   
</script>

<!-- 상세페이지 1 -->
<div class="sabang_detail_1">
   <div class="sabang_detail_1_main_image">
      <img src="resources/images/sabang_post/${sabang.sabang_imgoname}"
         id="changeImg_big" height="500px" width="500px">
   </div>

   <div class="sabang_detail_1_price_list">
      <div class="sabang_detail_1_list_title">
         <strong>${sabang.sabang_name}</strong>
      </div>
      <form name="form" method="post">
         <input type="hidden" name="${_csrf.parameterName}"
            value="${_csrf.token}" />
         <c:set var="sum" value="0" />
         <c:forEach var="product" items="${productList}">
            <div class="sabang_detail_1_list_name d-flex justify-content-center"
               style="margin: 10px 70px; border-bottom: 1px solid #ced4da">
               <div class="sabang_detail_1_list_name_name">
                  <div>${product.product_name}</div>
               </div>
               <div class="sabang_detail_1_list_name_price">
                  <div>
                     <span style="font-family: 'Cafe24Dangdanghae';">&#8361;</span>
                     <span id="${product.product_id}"><fmt:formatNumber value="${product.product_price}" pattern="#,###"/></span>
                     <c:set var="sum" value="${sum + product.product_price}" />
                  </div>
               </div>
               <div class="sabang_detail_1_list_name_price">
                  <div>
                     <input class="form-check-input products"
                        style="margin-left: 10px;" type="checkbox"
                        value="${product.product_id}" name="products" onchange="updateSum(${product.product_price})"  checked>
                  </div>
               </div>
            </div>
         </c:forEach>

  
 
         <div class="sabang_detail_1_total_price">
            <div class="sabang_detail_1_total_font">총합</div>
            <div class="sabang_detail_1_total_price_font ">
               <strong><span style="font-family: 'Cafe24Dangdanghae';">&#8361;</span>
                  <span id="sum_price"> 
                     <c:out value="${sum}" />
                  </span></strong>
                 
            </div>
         </div>
         <div class="sabang_detail_1_trolley_buyButton">
            <div class="trolley_button">
               <button onclick="cart()" style="border: none; background-color: white;">
                  <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
                     fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
                       <path
                        d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                  </svg>
               </button>
            </div>
            <div class="sabang_detail_1_buyButton">
               <button onclick="pay()" class="btn btn-info">바로구매</button>
            </div>
         </div>
      </form>
   </div>




</div>

<div class="sabang_detail_1_good_Explanatin">
   <div class="sabang_detail_1_goods_div">
      <div>
         <img class="sabang_detail_1_goods_div_img"
            src="resources/images/sabang_post/${sabang.sabang_imgoname}"
            width="100" onmouseover="changeImg(0)">
      </div>
      <c:forEach var="product" items="${productList}" varStatus="status">
         <div>
            <img class="sabang_detail_1_goods_div_img"
               src="resources/images/sabang_detail/${product.product_imgsname}"
               width="100" onmouseover="changeImg(${status.count})">
         </div>
      </c:forEach>
   </div>
   <div class="sabang_detail_1_Explanatin">
      <div class="sabang_detail_1_Explanatin_top">
         ${productList[0].product_explain1}
      </div>
      <div class="sabang_detail_1_Explanatin_down">${productList[0].product_explain2}</div>
   </div>

</div>

<!-- 상세페이지 2 -->

<!-- 상품1 -->

<div class="sabang_detail_2">
   <c:forEach var="product" items="${productList}">
      <div class="sabang_detail_2_content">

         <div class="sabang_detail_2_content_img">
            <img
               src="resources/images/sabang_detail/${product.product_imgsname}" />
         </div>

         <div class="sabang_detail_2_content_txt">

            <div class="sabang_detail_2_content_txt_header"></div>
            <h3>${product.product_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <span style="font-family:'Cafe24Dangdanghae';">&#8361;</span>
               &nbsp;<fmt:formatNumber value="${product.product_price}" pattern="#,###"/>
            </h3>
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
<br />
<br />
<br />
<hr />
<br />

<!-- 문의 게시판  -->
<div class="sabang_detail_3" id="inquirypart">

   <br />
</div>
<script>

   $(function() {
      console.log("success");
      getList(${sid},1);
   });
   
   const getList = (sid,pageNo) => {
      console.log("success2");
      const args = {url:"inquirylist",method:"get"}
      if(pageNo){
         args.data = {sid, pageNo};
      }
      $.ajax(args)
      .then(data => {
         console.log("success3");
         $("#inquirypart").html(data);
      });
      
   };
   
   

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>