<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>FAQ - MediGrids</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon" href="../resources/assets/images/favicon.svg" />
<c:import url="../temp/header_css.jsp"></c:import>
<c:import url="../temp/header_script.jsp"></c:import>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Place favicon.ico in the root directory -->

</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<div class="breadcrumbs overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">Frequently Asked Questions</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>FAQ</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<section class=" section latest-news-area blog-list">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-12 col-12">
					<div class="accordion" id="accordionExample">
						<div class="accordion-item">
							<c:forEach items="${list}" var="faq">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button collapsed numCatch" type="button" data-bs-toggle="collapse" data-num="${faq.num}" data-bs-target="#collapseOne${faq.rowNum}" aria-expanded="false" aria-controls="collapseOne${faq.rowNum}">
										<span class="title"><span class="serial">${faq.faqCateVO.cateName}</span>
										${faq.title}</span><i class="lni lni-plus"></i>
									</button>
								</h2>
								
								<div id="collapseOne${faq.rowNum}" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<p>${faq.contents}</p>
										
										<!-- ????????? ???????????? -->
										<c:if test="${user.role eq 0}">
											<div class="modalTotal" style="text-align: center">
												<!-- modal  ????????? -->
												<br>
												<button class="btn btn-outline-success mx-1" id="modifyTotal${faq.num}">????????????</button>
											
												<input type="hidden" name="num" value="${faq.num}" id="num${faq.num}">
												<input type="hidden" name="grade" value="${faq.grade}" id="grade${faq.num}">
												<!-- FAQ ?????? Modal-->
												<div class="modal fade" id="modify${faq.num}" tabindex="-1" role="dialog" 
												aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">FAQ ????????????</h5>
																<button class="close" type="button" data-dismiss="modal" aria-label="Close">
																	<span aria-hidden="true">X</span>
																</button>
															</div>
															
															<!-- CSS ?????? -->
															<h3>${faq.faqCateVO.cateName}</h3>
															
															
															<div class="modal-body">
																<label for="title" class="col-sm-2 col-form-label">Title</label>
																<input type="text" class="form-control title_check" data-title="${faq.title}" 
																id="title${faq.num}" name="title" value="${faq.title}">
															</div>
															<div class="modal-body">
																<label for="contents" class="col-sm-2 col-form-label">Contents</label>
																<textarea style="height:300px;" class="form-control" id="contents${faq.num}" 
																name="contents">${faq.contents}</textarea>
															</div>
															
															<div class="modal-footer">
																<button type="button" class="btn btn-outline-success close" 
																data-dismiss="modal">??????</button>
																<button type="button" class="btn btn-success" id="modifyBtn${faq.num}">
																??????</button>
															</div>
														</div>
													</div>
												</div>	
												<button type="button" class="btn btn-outline-danger mx-1 deleteBtn" data-num="${faq.num}">????????????</button>
												<br>
											</div>
										</c:if>
										<!-- ????????? ??????????????? ?????? ???????????? -->
									</div>
								</div>
								
											
							</c:forEach>
						</div>
					</div>
					
					<!-- ????????? ????????? ?????? -->
					<c:if test="${user.role eq 0}">
						<div class="row justify-content-between">
							<div class="col-1">
								<a href="./add" type="button" class="btn btn-outline-primary">WRITE</a>
							</div>
						</div>
					</c:if>
					<!-- ???????????? -->
					
					<!-- Start of pagination -->
					<div class="pagination left blog-grid-page">
						<ul class="pagination-list">
							<c:choose>
								<c:when test="${empty pager.grade}">
									<li><a class="page-link" href="./list?pn=${pager.pre?pager.startNum-1:1}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">
									Prev</a></li>
									
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
										<li>
											<a class="page-link" href="./list?pn=${i}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">
											${i}</a>
										</li>
									</c:forEach>
									
									<li><a class="page-link" href="./list?pn=${pager.next?pager.lastNum+1:pager.lastNum}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">
									Next</a></li>
								</c:when>
								
								<c:otherwise>
									<li><a class="page-link" href="./list?pn=${pager.pre?pager.startNum-1:1}&grade=${pager.grade}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">
									Prev</a></li>
									
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
										<li>
											<a class="page-link" href="./list?pn=${i}&grade=${pager.grade}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">
											${i}</a>
										</li>
									</c:forEach>
									
									<li><a class="page-link" href="./list?pn=${pager.next?pager.lastNum+1:pager.lastNum}&grade=${pager.grade}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">
									Next</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<!-- End of pagination -->
					
				</div>
				
				<aside class="col-lg-4 col-md-12 col-12">
					<div class="sidebar blog-grid-page">
					
						<div class="widget search-widget popular-tag-widget">
							<h5 class="widget-title">Search This Page</h5>
							<form class="searchFrm" action="./list" method="get">
								<input type="hidden" name="kind" value="col1">
								<input value="${pager.search}" id="search" name="search" type="search" placeholder="Search Here..." aria-label="Search">
								<button type="button" class="searchBtn">
									<i class="lni lni-search-alt"></i>
								</button>
								
								<!-- ?????? ????????? ?????? ????????? -->
								<div class="tags my-2" id="keyWord">
									<c:forEach items="${key}" var="key">
										<a onclick="searchKey(this);">${key.keyName}</a>
									</c:forEach>
								</div>
							</form>
						</div>

					<!-- ???????????? search??? ?????? tags ???????????? -->
					<c:choose>
						<c:when test="${empty search}">
							<div class="widget popular-tag-widget">
								<h5 class="widget-title">Popular Tags</h5>
								<div class="tags">
									<a href="./list?gradeRef=400">Top most asked questions</a>
									<a href="./list?gradeRef=100">HomePage</a>
									<a href="./list?gradeRef=200">Product</a>
									<a href="./list?gradeRef=300">Reservation Service</a>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<br><br>
							<h3><span class="text-blue">${search}</span> ???????????? ??? <span class="text-blue">${pager.totalCountC}</span>???</h3>
						</c:otherwise>
					</c:choose>
					
					<!-- popular tag ????????? ???, ?????? ?????? ??????????????? ????????????. ex)product ????????? ??????/????????????/??????????????? subCategory??? ?????????-->
					<!-- gradeRef=99?????? ?????????, total empty??? ????????? -->
					<c:if test="${total ne 400 && not empty total}">
						<div class="widget categories-widget">
							<h5 class="widget-title">Categories</h5>
							<ul class="custom">
								<li><a class="btn" href="./list?gradeRef=${total}">All</a></li>
								<c:forEach items="${cate}" var="cate">
									<li><a class="btn" href="./list?gradeRef=${cate.gradeRef}&grade=${cate.grade}">${cate.cateName}</a></li>
								</c:forEach>
							</ul>
						</div>
					</c:if>
					
					</div>
				</aside>
			</div>
		</div>
		
		<div class="form-head">
			<p class="outer-link">???????????? ????????? ?????????? Can't find what you looking for? 
				<div class="col-lg-12 col-md-12 col-12 p-0 my-2" style="text-align-last: center;">
					<div class="appointment-btn button">
						<button class="btn faqList" >FAQ ????????????</button>
						<button class="btn" >1:1 ????????????</button>
					</div>
				</div>
			</p>
		</div>
	</section>
	
	<script type="text/javascript" src="../resources/js/notice_list.js"></script>
	<script type="text/javascript" src="../resources/js/notice_ajax.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		$('.menu').each(function(index){
			$(this).attr('menu-index', index);
		}).click(function(){
			var index = $(this).attr('menu-index');
			$('.menu[menu-index=' + index + ']').addClass('clicked_menu');
			$('.menu[menu-index!=' + index + ']').removeClass('clicked_menu');
		});
	
	
	});
	</script>
	
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>