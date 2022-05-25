<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<title>Insert title here</title>
</head>
<body>

	<my:navbar></my:navbar>
					
	<table class="table table-hover" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th>ID</th>
				<th>TITLE</th>
				<th>INSERTED</th>
			</tr>
		</thead>
		
		<tbody>
			 <c:forEach items="${boardList }" var="board">
				<tr>
					<td>${board.id }
					</td>
					
					<td>
					<c:url value="/ex11/board/${board.id }" var="link"></c:url>
						
						<a href="${link }" >
							${board.title } 
						</a>
						<c:if test="${board.numOfReply > 0 }">
							[${board.numOfReply }]
							<i class="fa-brands fa-replyd"></i>
						</c:if>
					
					</td>
						<td>${board.inserted } 
						</td>
					</tr>
				 </c:forEach>
		 </tbody>
	</table>
	
	
<%-- 	<div class="mt-3">
		<ex:PageNation path="list" />
	</div> --%>


	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			
			
			<c:forEach begin="${pageInfo.left }" end="${pageInfo.right }" var="pageNum">
				<li class="page-item ${pageInfo.current == page ? 'active' : '' }">
					<a class="page-link" href="${appRoot }/ex11/board/list?page=${pageNum }">${pageNum }</a>
				</li>
			</c:forEach>	
			
			
			
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</ul>
	</nav>


</body>
</html>






