/**
 * 
 */
 function selectCategory(){
	
 $("#pcategoryNum").change(function(){
	if(this.value==1){
	$("#cResult").empty();
	let f='<div class="cate2">'; 
	f=f+'<label>카테고리 분류</label> <select name="categoryNum" class="form-control" id="categoryNum">';
	f=f+'<option value="">선택해주세요.</option>';
	f=f+'<option value="100">사료</option>';
	f=f+'<option value="200">간식</option>';
	f=f+'<option value="300">장난감</option>';
	f=f+'<option value="400">건강관리</option>';
	f=f+'<option value="500">용품</option>';
	f=f+'</select>';
	f=f+'</div>';
	$("#cResult").append(f);
}
if(this.value==2){
	$("#cResult").empty();
	let f='<div class="cate2">';
	f=f+'<label>카테고리 분류</label> <select name="categoryNum" class="form-control empty" id="categoryNum">';
	f=f+'<option value="">선택해주세요.</option>';
	f=f+'<option value="100">사료</option>';
	f=f+'<option value="200">간식</option>';
	f=f+'<option value="300">장난감</option>';
	f=f+'<option value="400">건강관리</option>';
	f=f+'<option value="500">용품</option>';
	f=f+'</select>';
	f=f+'</div>';
	$("#cResult").append(f);
}
});
}