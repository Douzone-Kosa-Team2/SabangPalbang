<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="resources/bootstrap-4.6.0-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/main_4989.css">
<link rel="stylesheet" href="resources/css/main_4989_2.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="resources/jquery/jquery-3.5.1.min.js"></script>
<script src="resources/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js"></script>
<script src="resources/bootstrap-4.6.0-dist/js/bootstrap.min.js"></script>


<body onload="window.resizeTo(830,650)" onresize="window.resizeTo(830,650)">
<div class="pop_ask_main">
		<div class="pop_ask_header">
			<h4>문의작성</h4>
		</div>
		<hr>
		<form>
			<div class="pop_ask_table">

				<div class="pop_ask_type">
					<div class="pop_ask_menu">문의 유형</div>

					<select name="ask_type" class="pop_ask_box" name="askType">
						<option selected="" value="" disabled="">문의 유형 선택</option>
						<option value="prod_info">상품정보</option>
						<option value="delivery">배송정보</option>
						<option value="change">환불/교환</option>
					</select>
				</div>

				<div class="pop_ask_prod">
					<div class="pop_ask_menu">문의 상품</div>
					<select name="ask_type" class="pop_ask_box" name="askProd">
						<option selected="" value="" disabled="">문의 상품 선택</option>
						<option value="prod_1">1.상품</option>
						<option value="prod_2">2.상품</option>
						<option value="prod_3">3.상품</option>
					</select>
				</div>

				<div class="pop_ask_human">
					<div class="pop_ask_menu">문의자</div>
					<input type="text" class="pop_ask_box" value="이종현" placeholder="이름을 입력하세요." name="asker" />
				</div>

				<div class="pop_ask_tel">
					<div class="pop_ask_menu">전화번호</div>
					<input type="tel" class="pop_ask_box" value="010-9947-7430" placeholder="전화번호를 입력하세요."
						name="askTel" />
				</div>

				<div class="pop_ask_email">
					<div class="pop_ask_menu">이메일</div>
					<input type="email" class="pop_ask_box" value="ant9406@naver.com" placeholder="이메일을 입력하세요."
						name="askEmail" />
				</div>

				<div class="pop_ask_title">
					<div class="pop_ask_menu">제목</div>
					<input type="text" class="pop_ask_box" value="" placeholder="제목을 입력해주세요." name="askTitle" />
				</div>

				<div class="pop_ask_content">
					<div class="pop_ask_menu">문의 내용</div>
					<textarea value="" placeholder="내용을 입력해주세요." class="pop_ask_box" name="askContent"></textarea>
				</div>

			</div>

			<div class="pop_ask_btn">
				<button class="pop_ask_btn_cancel" onclick="cancel()">취소</button>
				<button class="pop_ask_btn_create" onclick="confirm()">작성하기</button>
			</div>
		</form>
</div>
</body>
<script>

const cancel = () => { /* 취소하기 버튼 클릭 시 */
	//window.opener.location.href="sabang_detail"; 
	window.close();
};

const confirm = () => {  /* 작성하기 버튼 클릭 시 - 문의창에서 입력받은 것들 요청경로에 파라미터로 넘겨줘야 함  */
	window.opener.location.href="sabang_detail_insert";
	/* 
	너는 요청 경로가 나중에는 문의내용 insert 디비 작업을 포함한 컨트롤러로 요청해야함 
		예를 들면 window.opener.location.href="sabang_detail_insert";
	*/
	window.close();
};

</script>
