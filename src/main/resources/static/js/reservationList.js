let pn="";
let perPage="5";
let resNum=null;






$(function() {
    	getList(1,5);
    });

console.log("여기")

//모두 승인 버튼 클릭 시 
$("#list").on("click",".allApprovedBtn",function(){
	if(confirm("대기 중인 예약을 모두 승인하시겠습니까?")){
		console.log('yes')
		$.ajax({
			type:"GET",
			url:"./allApproved",
			data:{
	
			},
			success:function(data){
				if(data.trim()==1){
					
					console.log('성공')
				}
			}
		})//ajax로 데이터 전송 	 
		getList(pn,perPage);
		
	}else{
		console.log('no')
	}
	   
})

//예약상태 변경 버튼 클릭시 
$("#list").on("click",".modalBtn",function(){
 	$('#myModal').modal('show')
 	resNum=$(this).attr("data");
 	
 	console.log("resNum:"+resNum)
})


 //모달창 변경버튼 -> 데이터 보내기 
$('.modalSubmit').click(function(){
	 let resState= $('input[name="resState"]:checked').val()
	 console.log("resState:"+resState)
	 console.log("resNum:"+resNum)
	 //1:승인 2:거절 
	
		$.ajax({
			type:"POST",
			url:"./setUpdateResState",
			data:{
				resNum:resNum,
				resState:resState
			},
			success:function(data){
			if(data.trim()==1){
				if(resState==1){//승인시에 이메일 보내기 
					$.ajax({
						type:"POST",
						url:"./sendEmail",
						data:{
							resNum:resNum,
						},
						
					})
				}
					getList(pn,perPage);
			}else{
				alert("변경 실패했습니다. 다시 시도해주십시오.")
			}
				
			}
		})//ajax로 데이터 전송 	 
		
	
		
	$('#myModal').modal('hide')
	

})//저장버튼 클릭시 

//모달창 닫기 
$('.modalClose').click(function(){
	 $('#myModal').modal('hide')
})

//사이드바에서 예약리스트 눌렀을때 상태1로 변경하기 
$('#reservationList').click(function(){
	state=1;
})

//=======================================================
//pager

//페이지 로딩이 끝났을때 js 실행하는데ajax로 불러오는 페이지가 없는상태에서 .pager를 찾으려니까 없음
//따라서 이벤트 위임해줘야함 
$("#list").on("click",".pager",function(){
	pn=$(this).attr("data-pn");
		if(pn > 0){
			//pn=checkPn;
			console.log("===========")
			console.log(pn)
			console.log(perPage)
			console.log("===========")
			getList(pn,perPage);
			
		}else {
			//이전 또는 다음 Block이 X
			alert("마지막 페이지 입니다");
		}
})

//perPage 변경시
$("#list").on("change",".perPage",function(){
	console.log($(this).val())
	perPage=$(this).val();
			console.log("===========")
			console.log(pn)
			console.log(perPage)
			console.log("===========")
	getList(pn,perPage);	

})

//common/reservationList.jsp에 table생성 
//최신 추가된순으로 예약리스트 가져오는 ajax 
	function getList(pn,perPage){
		$.ajax({
			type:"GET",
			url:"./ajaxReservationList",
			data:{
				pn:pn,
				perPage:perPage
			},
			success:function(data){
				console.log(pn)
				console.log(perPage)
				$("#list").html(data.trim());
				
				//perPage 5로 초기화 되는것 방지 코드 
				if(perPage=="5"){
		       	 	$('#5').attr('selected',true);      
			    } else if(perPage=="10"){
			        $('#10').attr('selected',true);
			    }else if(perPage==15){
			        $('#15').attr('selected',true);
			    }else if(perPage==20){
			        $('#20').attr('selected',true);
			    } else{
			        $('#25').attr('selected',true);
			    }
				
			}
		})	
};




/*!
    * Start Bootstrap - SB Admin v7.0.5 (https://startbootstrap.com/template/sb-admin)
    * Copyright 2013-2022 Start Bootstrap
    * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
    */
    // 
// Scripts
// 
window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});
