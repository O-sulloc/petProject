<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
<c:import url="../temp/header_css.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<div class="container">
	<h1>Mypage</h1>

 <div class="row">
	<!-- side bar -->
	<div class="d-flex flex-column flex-shrink-0 p-3 bg-light col-md-auto" style="width: 280px;">
    <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-4">판매자 Menu</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="./mypage" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
         마이 서비스
        </a>
      </li>
      <li>
        <a href="#" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
         어쩌고 
        </a>
      </li>
    <li class="border-top my-3"></li>
      <li class="nav-item">
        <a href="./reservationList" class="nav-link link-dark" >
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
          예약리스트 
        </a>
      </li>
      <li>
        <a href="#" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
         대기중인 예약 보기 
        </a>
      </li>
      <li>
        <a href="#" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"></use></svg>
          날짜별 예약 현황 보기 
        </a>
      </li>
      <li>
        <a href="#" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"></use></svg>
          월별 예약 현황 보기 
        </a>
      </li>
      <li class="border-top my-3"></li>
      <li>
        <a href="./reservationSetting" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
         	예약 시간 설정하기 
        </a>
      </li>

       
      
      
      
    </ul>
    <hr>
    <div class="dropdown">
      <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
        <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
        <strong>mdo</strong>
      </a>
      <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
        <li><a class="dropdown-item" href="#">New project...</a></li>
        <li><a class="dropdown-item" href="#">Settings</a></li>
        <li><a class="dropdown-item" href="#">Profile</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" href="#">Sign out</a></li>
      </ul>
    </div>
  </div>



	
	<div class="row col-md-auto" >
		<div class="card">
			    	
				<ul class="list-group list-group-flush">
				   	<li class="list-group-item">
				   		<h5>대표이미지</h5>
				   		<img alt="" src="../resources/upload/service/${vo.serviceFileVO.fileName}">
				   	</li>
				</ul>
		
			<ul class="list-group list-group-flush">
				<li class="list-group-item">${vo.serName}</li>
		   		<li class="list-group-item">${vo.serAddress} </li>
		   		<li class="list-group-item">${vo.hospitalField} </li>
		   		<li class="list-group-item">${vo.serTel} </li>
			   	<li class="list-group-item">${vo.homepage}</li>
			   	
			   	<div class="container my-4">
					<div class="col-2 d-flex">
						<a href="update" role="button" class="btn btn-success mx-1">Update</a>
						<a href="delete?serNum=${vo.serNum}" role="button" class="btn btn-danger mx-1" id="delete">delete</a>
					</div>
				</div>
			</ul>
		  
		

    	 
		</div>
	
	</div>
	
</div>

	
	
	
	



<!-- <img alt="" src="../resources/upload/service/$"> -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/mypage.js"></script>
</body>
</html>