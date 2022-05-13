window.onload=function(){
	document.getElementById("address").addEventListener("click", function(){
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 예제를 참고하여 다양한 활용법을 확인해 보세요.
				document.getElementById("address").value=data.address;
			}
		}).open();
	})
}

$("#all").click(function(){
	$(".ch").prop("checked", $("#all").prop("checked"));
	//all에 checked되어 있으면 나머지 체크박스들에도 해당 속성인 checked를 넣는다.
});

$(".ch").on("click",function(){
	//모든 체크박스에 checked 되어 있으면 true return
	let check=true;

	$(".ch").each(function(index, item){
		if(!$(item).prop("checked")){
			//한 개라도 체크 안되어 있으면 false return
			check=false;
		}
	});

	$("#all").prop("checked", check);
	//checkAll에 check의 값을 넣는다.(true or false)

});