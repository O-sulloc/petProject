/**
 * 
 */
 
var CDate = new Date(); 
var today = new Date();
var selectCk = 0;

var buildcalendar = function(){
	var htmlDates = ''; 
	var prevLast = new Date(CDate.getFullYear(), CDate.getMonth(), 0); //지난 달의 마지막 날 
	var thisFirst = new Date(CDate.getFullYear(), CDate.getMonth(), 1); //이번 달의 첫쨰 날
	var thisLast = new Date(CDate.getFullYear(), CDate.getMonth() + 1, 0); //이번 달의 마지막 날
	document.querySelector(".year").innerHTML = CDate.getFullYear() + "년";  // year에 년도 출력
	document.querySelector(".month").innerHTML = (CDate.getMonth() + 1) + "월";  //month에 월 출력
	const dates = []; 
	if(thisFirst.getDay()!=0){ 
		for(var i = 0; i < thisFirst.getDay(); i++){
			dates.unshift(prevLast.getDate()-i); // 지난 달 날짜 채우기
		} 
	} 
	for(var i = 1; i <= thisLast.getDate(); i++){
			 dates.push(i); // 이번 달 날짜 채우기 
	} 
	for(var i = 1; i <= 13 - thisLast.getDay(); i++){ 
			 dates.push(i); // 다음 달 날짜 채우기 (나머지 다 채운 다음 출력할 때 42개만 출력함)
	} 
	
	for(var i = 0; i < 42; i++){
		if(i < thisFirst.getDay()){
			htmlDates += '<div class="date last">'+dates[i]+'</div>'; 
		}else if(today.getDate()==dates[i] && today.getMonth()==CDate.getMonth() && today.getFullYear()==CDate.getFullYear()){
			 htmlDates += '<div id="date_'+dates[i]+'" class="date today" onclick="fn_selectDate('+dates[i]+');">'+dates[i]+'</div>'; 
		} else{
			htmlDates += '<div id="date_'+dates[i]+'" class="date" onclick="fn_selectDate('+dates[i]+');">'+dates[i]+'</div>'; 
		}
	 } 
document.querySelector(".dates").innerHTML = htmlDates; 
} 

function prevCal(){
	 CDate.setMonth(CDate.getMonth()-1); 
	 buildcalendar(); 
} 
function nextCal(){
	 CDate.setMonth(CDate.getMonth()+1);
	 buildcalendar(); 
}

function fn_selectDate(date){
	
	var year = CDate.getFullYear();
	var month = CDate.getMonth() + 1;
	var date_txt = "";
	if(CDate.getMonth + 1 < 10){
		month = "0" + (CDate.getMonth() + 1);
	}
	if(date < 10){
		date_txt = "0" + date;
	}
	
	if(selectCk == 0){
		$(".date").css("background-color", "");
		$(".date").css("color", "");
		$("#date_"+date).css("background-color", "red");
		$("#date_"+date).css("color", "white");
		
	
		selectCk = date;
		
		console.log(year,"년",month,"월",selectCk,"일");

	}else{
		$("#date_"+date).css("background-color", "white");
		$("#date_"+date).css("color", "black");
		selectCk = 0;
		console.log(selectCk);
	}
	
}

buildcalendar();


