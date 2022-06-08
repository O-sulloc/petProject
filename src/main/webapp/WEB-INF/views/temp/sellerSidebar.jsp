<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<style>
      #sss {
        display: inline-block;
      }
    </style>
</head>
<body>
	<main>
		<div id="sss" class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;" >
		    <a href="/user/sellerList" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
		      <span class="fs-4">판매자페이지</span>
		    </a>
		    <hr>
		    <ul class="nav nav-pills flex-column mb-auto">
		      <li class="nav-item">
		        <a href="/user/sellerList" class="nav-link active" aria-current="page">
		          상품 목록
		        </a>
		      </li>
		      <li>
		        <a href="/product/add" class="nav-link link-dark">
		          상품 등록
		        </a>
		      </li>
		      <li>
		        <a href="/user/sellerOrder" class="nav-link link-dark">
		          주문 목록
		        </a>
		      </li>
		    </ul>
	  </div>
	</main>

	<!-- bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>