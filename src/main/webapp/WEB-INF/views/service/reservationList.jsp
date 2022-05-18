<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>예약 리스트 페이지</h1>

	<div class="card-body">
		<div
			class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
			<div class="dataTable-top">
				<div class="dataTable-dropdown">
					<label><select class="dataTable-selector"><option
								value="5">5</option>
							<option value="10" selected="">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							<option value="25">25</option></select> entries per page</label>
				</div>
				<div class="dataTable-search">
					<input class="dataTable-input" placeholder="Search..." type="text">
				</div>
			</div>
			<div class="dataTable-container">
				<table id="datatablesSimple" class="dataTable-table">
					<thead>
						<tr>
							<th data-sortable="" style="width: 19.1946%;"><a href="#"
								class="dataTable-sorter">Name</a></th>
							<th data-sortable="" style="width: 29.1275%;"><a href="#"
								class="dataTable-sorter">Position</a></th>
							<th data-sortable="" style="width: 15.8389%;"><a href="#"
								class="dataTable-sorter">Office</a></th>
							<th data-sortable="" style="width: 8.85906%;"><a href="#"
								class="dataTable-sorter">Age</a></th>
							<th data-sortable="" style="width: 15.0336%;"><a href="#"
								class="dataTable-sorter">Start date</a></th>
							<th data-sortable="" style="width: 11.9463%;"><a href="#"
								class="dataTable-sorter">Salary</a></th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>ㄴㅇㄹㅇㄹㄴㄹ</td>
							<td>System Architect</td>
							<td>Edinburgh</td>
							<td>61</td>
							<td>2011/04/25</td>
							<td>$320,800</td>
						</tr>
						<tr>
							<td>Garrett Winters</td>
							<td>Accountant</td>
							<td>Tokyo</td>
							<td>63</td>
							<td>2011/07/25</td>
							<td>$170,750</td>
						</tr>
						<tr>
							<td>Ashton Cox</td>
							<td>Junior Technical Author</td>
							<td>San Francisco</td>
							<td>66</td>
							<td>2009/01/12</td>
							<td>$86,000</td>
						</tr>
						<tr>
							<td>Cedric Kelly</td>
							<td>Senior Javascript Developer</td>
							<td>Edinburgh</td>
							<td>22</td>
							<td>2012/03/29</td>
							<td>$433,060</td>
						</tr>
						<tr>
							<td>Airi Satou</td>
							<td>Accountant</td>
							<td>Tokyo</td>
							<td>33</td>
							<td>2008/11/28</td>
							<td>$162,700</td>
						</tr>
						<tr>
							<td>Brielle Williamson</td>
							<td>Integration Specialist</td>
							<td>New York</td>
							<td>61</td>
							<td>2012/12/02</td>
							<td>$372,000</td>
						</tr>
						<tr>
							<td>Herrod Chandler</td>
							<td>Sales Assistant</td>
							<td>San Francisco</td>
							<td>59</td>
							<td>2012/08/06</td>
							<td>$137,500</td>
						</tr>
						<tr>
							<td>Rhona Davidson</td>
							<td>Integration Specialist</td>
							<td>Tokyo</td>
							<td>55</td>
							<td>2010/10/14</td>
							<td>$327,900</td>
						</tr>
						<tr>
							<td>Colleen Hurst</td>
							<td>Javascript Developer</td>
							<td>San Francisco</td>
							<td>39</td>
							<td>2009/09/15</td>
							<td>$205,500</td>
						</tr>
						<tr>
							<td>Sonya Frost</td>
							<td>Software Engineer</td>
							<td>Edinburgh</td>
							<td>23</td>
							<td>2008/12/13</td>
							<td>$103,600</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="dataTable-bottom">
				<div class="dataTable-info">Showing 1 to 10 of 57 entries</div>
				<nav class="dataTable-pagination">
					<ul class="dataTable-pagination-list">
						<li class="active"><a href="#" data-page="1">1</a></li>
						<li class=""><a href="#" data-page="2">2</a></li>
						<li class=""><a href="#" data-page="3">3</a></li>
						<li class=""><a href="#" data-page="4">4</a></li>
						<li class=""><a href="#" data-page="5">5</a></li>
						<li class=""><a href="#" data-page="6">6</a></li>
						<li class="pager"><a href="#" data-page="2">›</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>


	<c:forEach items="${list}" var="vo">
		<h5>${vo.name}</h5>
		<h5>${vo.reservationVO.resDate}</h5>
		<h5>${vo.reservationVO.resTime}</h5>
		<c:choose>
			<c:when test="${vo.reservationVO.resState==0}">
				<h5>대기</h5>
			</c:when>
			<c:when test="${vo.reservationVO.resState==1}">
				<h5>승인</h5><</c:when>
			<c:when test="${vo.reservationVO.resState==2}">
				<h5>거부</h5><</c:when>
			<c:when test="${vo.reservationVO.resState==3}">
				<h5>완료</h5><</c:when>
		</c:choose>

=======================================

 </c:forEach>
 <script src="js/scripts.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</body>
</html>