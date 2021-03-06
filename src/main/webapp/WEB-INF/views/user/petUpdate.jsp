<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>My Page - MediGrids</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/assets/images/favicon.svg" />
<!-- Place favicon.ico in the root directory -->

<c:import url="../temp/header_css.jsp"></c:import>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<div class="breadcrumbs overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">My Page</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>My Page</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="service-details">
		<div class="container">
			<div class="content">
				<div class="row">
					<!-- Start Of SideBar -->
					<c:import url="../temp/sidebar.jsp"></c:import>
					<!-- End Of SideBar -->

					<div class="col-lg-8 col-md-12 col-12">
						<!-- section start -->
						<section class="appointment page">
							<!-- <section class="appointment page section"> -->
							<div class="container">
								<div class="row">
								
								<form action="petUpdate" method="post">
									<div class="appointment-form">
										<div class="row">
											<div class="col-12">
												<div class="appointment-title">
													<h2>Update Your Pet's Profile</h2>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<label for=petName><i class="lni lni-user"></i></label> 
													<input type="text" name="petName" id="petName" value="${pet.petName}">
													<input id="petNum" class="form-control" name="petNum" value="${pet.petNum}" hidden="">
												</div>
											</div>
											
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<c:if test="${pet.petKind eq 0}">
													<div class="appointment-input">
														<label for="petKind"><i class="lni lni-notepad"></i></label>
														<select name="petKind" id="petKind">
															<option value="none" selected disabled>Dog / Cat</option>
															<option value="0" id="petKind" selected="selected">Dog</option>
															<option value="1" id="petKind">Cat</option>
														</select>
													</div>
												</c:if>
												<c:if test="${pet.petKind eq 1}">
													<div class="appointment-input">
														<label for="petKind"><i class="lni lni-notepad"></i></label>
														<select name="petKind" id="petKind">
															<option value="none" selected disabled>Dog / Cat</option>
															<option value="0" id="petKind">Dog</option>
															<option value="1" id="petKind" selected="selected">Cat</option>
														</select>
													</div>
												</c:if>
											</div>
											
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-input">
													<label for="petBirth"><i class="lni lni-calendar"></i></label>
													<input type="date" name="petBirth" id="petBirth" min="2000-01-01" max="" value="${pet.petBirth}">
												</div>
											</div>
											
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<c:if test="${pet.petSex eq 0}">											
													<div class="appointment-input">
														<label for="petSex"><i class="lni lni-magnifier"></i></label>
														<select name="petSex" id="petSex">
															<option value="none" selected disabled>Girl / Boy</option>
															<option value="0" id="petSex" selected="selected">Girl</option>
															<option value="1" id="petSex">Boy</option>
														</select>
													</div>
												</c:if>
												<c:if test="${pet.petSex eq 1}">											
													<div class="appointment-input">
														<label for="petSex"><i class="lni lni-magnifier"></i></label>
														<select name="petSex" id="petSex">
															<option value="none" selected disabled>Girl / Boy</option>
															<option value="0" id="petSex">Girl</option>
															<option value="1" id="petSex" selected="selected">Boy</option>
														</select>
													</div>
												</c:if>
											</div>
											<div class="col-lg-6 col-md-6 col-12 p-0">
												<div class="appointment-btn button">
													<button class="btn" type="submit">Add</button>
													<button class="btn" onclick="location.href='/user/petDelete'">Delete</button>
												</div>
											</div>
										</div>
									</div>
								</form>

								</div>
							</div>
						</section>
						<!-- section end -->
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<script type="text/javascript">
		let now_utc = Date.now()	//?????? ????????? ???????????? ??????
		let timeOff = new Date().getTimezoneOffset()*60000; 	//??? ????????? ???????????? ??????
		let today = new Date(now_utc-timeOff).toISOString().split("T")[0];
		// new Date(now_utc-timeOff).toISOString()?????? '2022-05-12T14:09:38.134Z'??? ????????????
		// ????????? T??? ???????????? split?????? T ???????????? ????????? today??? ????????????
		
		document.getElementById("petBirth").setAttribute("max", today);
		//?????? ?????? max??? today??? ??????????????? ?????? ????????? ????????? ???????????? ????????? ??????.
	</script>
	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>