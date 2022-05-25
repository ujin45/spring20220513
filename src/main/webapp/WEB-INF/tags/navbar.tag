<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="current" %>


<nav class="navbar navbar-expand-lg bg-dark">
	<div class="container-fluid">
		<c:url value="/ex11/board/list" var="list" />
		<a class="navbar-brand" href="${list }">BOARD LIST</a>

		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			<li class="nav-item">
				<c:url value="/ex11/board/write" var="writeLink" />
				<a class="nav-link" href="${writeLink }">Writing</a>
			</li>
		</ul>

		<form class="d-flex" role="search">
			<input class="form-control me-2" type="search" placeholder="Search"
				aria-label="Search">
			<button class="btn btn-outline-primary" type="submit">Search</button>
		</form>
	</div>
</nav>