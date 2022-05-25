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
 	<hr />
 	
 	
 	<div class="container">
		<div class="row">
			<form method="post" id="modifyForm1" action="${appRoot }/ex11/board/write" >
			<!-- <input type="text" name="title" value="new title" /> -->
				<table class="table table" style="text-align: center; border: 1px solid #0000ff">
					<tbody>
						<tr>
							<td><input type="text" class="form-control" value="${board.title }" name="title" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control"  name="body" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
						
					</tbody>
				</table>
				
				<button class="btn btn-secondary">REGISTRATION</button>
			</form>
		</div>
	</div> 
	
	

<%-- 			<c:url value="/ex11/board/write" var="writeLink" />
			<form action="${writeLink }" method="post">
				TITLE : <input type="text" name="title" value="new title" /> <br />
				BODY : <textarea name="body" id="" cols="30" rows="10">New Post</textarea> <br />
				
				<button class="btn btn-secondary">REGISTRATION</button>
			</form>
 --%>
</body>
</html>

