<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../temp/header_css.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
   <div class="breadcrumbs overlay">
      <div class="container">
         <div class="row align-items-center">
            <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
               <div class="breadcrumbs-content">
                  <h1 class="page-title">Registration</h1>
               </div>
               <ul class="breadcrumb-nav">
                  <li><a href="/">Home</a></li>
                  <li>Registration</li>
               </ul>
            </div>
         </div>
      </div>
   </div>

<div class="container mt-4">
	<div class="row mt-4">
		<div class="alert alert-primary" role="alert">
	  		<h4 class="text-center" style="text-transform: uppercase;">${board} List</h4>
		</div>
	</div>
	<input type="hidden" name="id" value="${sessionScope.user.id }">
	<div class="row mt-4">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>상호명</th>
					<th>예약일</th>
					<th>예약시간</th>
					<th>예약상태</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>영업시간</th>
					<th>선택</th>
				</tr>
			</thead>
			<tbody>
			
			<c:forEach items="${confirmList}" var="cl">
			<input type="hidden" name="serNum" value="${cl.serviceVO.serNum }">	
				<tr>
					<td><a class="link-success text-decoration-none" href="../service/detail?serNum=${cl.serNum}">${cl.serviceVO.serName}</a></td>
					<td>${cl.resDate}</td>
					<td><c:set var="time" value="${cl.resTime}" />
					${fn:split(time,':')[0]}시 ${fn:split(time,':')[1]}분</td>
		
					<td><span>
						<c:choose>
							<c:when test="${cl.resState==0}">
								<span>예약진행중</span> 
							</c:when>
							<c:when test="${cl.resState==1}">
								<span>예약완료</span><</c:when>
							<c:when test="${cl.resState==2}">
								<span>예약실패</span><</c:when>
							<c:when test="${cl.resState==3}">
								<span>방문완료</span> <</c:when>
						</c:choose>
					</span></td>
					<td>${cl.serviceVO.serTel}</td>
					<td>${cl.serviceVO.serAddress}</td>
					<td>${cl.serviceVO.serTime}</td>
					<!-- 예약 수정 버튼 -->
					<td><span><a href="appointmentUpdate?resNum=${cl.resNum }&serNum=${cl.serviceVO.serNum}" role="button" class="btn btn-success mx-1">예약수정</a></span></td>
				</tr>
			</c:forEach>
			</tbody>
			
		</table>
		
	</div>
	
	

   <!-- jquery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   
   <c:import url="../temp/header_script.jsp"></c:import>
   <c:import url="../temp/footer.jsp"></c:import>


</body>
</html>