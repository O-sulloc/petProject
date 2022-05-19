<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/reviewPop.css">
</head>
<body>

	<!-- 상품이름, 상품사진 필요 -->
	<!-- 별점(star), 좋았던점(contents), 사진첨부 -->
	<div class="wrapper_div">
		<div class="subject_div">
			리뷰 수정
		</div>
		
		<div class="input_wrap">			
			<div class="productName_div">
				<h2>${productInfo}</h2>
				<!-- 임시값 -->
				<input type="hidden" class="id" value="${id}">
				<input type="hidden" class="productInfo" value="${productInfo}">
				<!-- 업데이트에 새로추가 -->
				<input type="hidden" class="replyNum" value="${vo.replyNum}">
				<!-- 여기까지 -->
			</div>
			
			<!-- 별점부여 -->
			<div class="mb-3" id="myform">
				<div>
					<span class="text-bold">상품을 사용해보셨나요?</span>
				</div>
				<fieldset class="clickStar">
					<input type="radio" name="reviewStar" value="5" id="rate1"><label
						for="rate1">★</label>
					<input type="radio" name="reviewStar" value="4" id="rate2"><label
						for="rate2">★</label>
					<input type="radio" name="reviewStar" value="3" id="rate3"><label
						for="rate3">★</label>
					<input type="radio" name="reviewStar" value="2" id="rate4"><label
						for="rate4">★</label>
					<input type="radio" name="reviewStar" value="1" id="rate5"><label
						for="rate5">★</label>
				</fieldset>	
				<div class="textStar">
					<span>선택해주세요</span><!-- 1점(별로에요) 빨간글씨 2점(그저그래요) 3점(괜찮아요) 4점(좋아요) 5점(최고에요)-->
				</div>
				
				<div class="content_div reviewComment">
					<!-- 동적으로 바뀌기 만족도 1점을 주셨네요. --> <!-- 만족도 3점을 주셨네요. --> <!-- 어떤점이 아쉬웠나요? --> <!-- 어떤점이 좋았나요? -->
					<h4 class="comment">어떤점이 좋았나요?</h4>
				</div>
				
				<div class="content_div">
					<textarea class="col-auto form-control"  id="contents" name="contents"
					placeholder="상품을 받아보시고 만족도에 대한 후기를 남겨주세요.(최소 10자 이상)">${vo.contents}</textarea>
				</div>
			</div>			
			
		</div>
		
		<div class="btn_wrap">
			<button class="cancel_btn">취소</button> <button class="update_btn" disabled="true">수정</button>
		</div>

	</div>


<c:import url="../temp/header_script.jsp"></c:import>
<script type="text/javascript" src="/resources/js/reviewPop.js"></script>
<script type="text/javascript">
	//기존값 불러오는 코드
	$(document).ready(function(){
		//평점부여한값 가져오기
		let starVal = '${vo.star}';
		
		//평점부여한값 checked로 바꾸기
		$("input[name='reviewStar'][value='" + starVal + "']").attr('checked', true);
		
		//리뷰 밑 평점삭제후 재등록
		$(".textStar").children().remove();
		
		//h4태그 삭제후 재등록
		$("h4").remove(".comment");
		
		if(starVal == 1){
			$(".textStar").append("<span class='text-red'>1점(별로에요)</span>");
			$(".reviewComment").append("<h4 class='comment'>만족도 1점을 주셨네요</h4>");
			$(".reviewComment").append("<h4 class='comment'>어떤점이 아쉬웠나요?</h4>");
		}else if(starVal == 2){
			$(".textStar").append("<span class='text-red'>2점(그저그래요)</span>");
			$(".reviewComment").append("<h4 class='comment'>만족도 2점을 주셨네요</h4>");
			$(".reviewComment").append("<h4 class='comment'>어떤점이 아쉬웠나요?</h4>");
		}else if(starVal == 3){
			$(".textStar").append("<span class='text-red'>3점(괜찮아요)</span>");
			$(".reviewComment").append("<h4 class='comment'>만족도 3점을 주셨네요</h4>");
			$(".reviewComment").append("<h4 class='comment'>어떤점이 좋았나요?</h4>");
		}else if(starVal == 4){
			$(".textStar").append("<span class='text-red'>4점(좋아요)</span>");
			$(".reviewComment").append("<h4 class='comment'>만족도 4점을 주셨네요</h4>");
			$(".reviewComment").append("<h4 class='comment'>어떤점이 좋았나요?</h4>");
		}else{
			$(".textStar").append("<span class='text-red'>5점(최고에요)</span>");
			$(".reviewComment").append("<h4 class='comment'>만족도 5점을 주셨네요</h4>");
			$(".reviewComment").append("<h4 class='comment'>어떤점이 좋았나요?</h4>");
		}
	});
	
	updateCheck();
</script>
</body>
</html>



