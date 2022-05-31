<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="current" %>

<c:url value="/ex11/board/list" var="listUrl" ></c:url>
<c:url value="/ex11/board/write" var="writeUrl" ></c:url>
<c:url value="/member/signup" var="signupUrl"></c:url>
<c:url value="/member/list" var="memberListUrl"></c:url>

<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-3">
	<div class="container">
		<a class="navbar-brand" href="${listUrl }"><i class="fa-solid fa-chess-board"></i></a>
	    
    	<button class="navbar-toggler" 
    	        data-bs-toggle="collapse" 
    	        data-bs-target="#navbarSupportedContent">
    		<span class="navbar-toggler-icon"></span>
    	</button>
		
		 <div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			     <li class="nav-item">
			         <a class="nav-link ${current == 'list' ? 'active' : '' }" href="${listUrl }">목록보기</a>
			     </li>
			     <li class="nav-item">
			         <a class="nav-link ${current == 'write' ? 'active' : '' }" href="${writeUrl }">글쓰기</a>
			     </li>
				 <li class="nav-item">
		        	<a href="${signupUrl }" class="nav-link ${current == 'signup' ? 'active' : '' }">회원가입</a>
		        </li>
		        
		        <li class="nav-item">
		        	<a href="${memberListUrl }" class="nav-link ${current == 'memberList' ? 'active' : '' }">회원목록</a>
		        </li>
						
			</ul>
	
			<form class="d-flex" role="search">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-primary" type="submit">Search</button>
			</form>
		</div>
	</div>
</nav>