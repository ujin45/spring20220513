<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
	integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	referrerpolicy="no-referrer"></script>
	
<script>

	// reply-edit-toggle 버튼 클릭시 댓글 보여주는 div 숨기고,
	// 수정 form 보여주기
	$(".reply-edit-toggle-button").click(function() {
		console.log("버튼클릭");
		const replyId = $(this).attr("data-reply-id");
		const displayDivId = "#replyDisplayContainer" + replyId;
		const editFormId = "#replyEditFormContainer" + replyId;
		console.log(replyId);
		console.log(displayDivId);
		console.log(editFormId);
		$(displayDivId).hide();
		$(editFormId).show();
	});
	// reply-delete-button 클릭시
	$(".reply-delete-button").click(function() {
		const replyId = $(this).attr("data-reply-id");
		const message = "댓글을 삭제하시겠습니까?";
		if (confirm(message)) {
			$("#replyDeleteInput1").val(replyId);
			$("#replyDeleteForm1").submit();
		}
	});
	
</script>
	
<title>Insert title here</title>


</head>
<body>


	<my:navbar></my:navbar>

	<hr />

	<div class="container-sm">
		<div class="row">
			<div class="col">
				<form method="post" id="modifyForm1" action="${appRoot }/ex11/board/modify">
					<input type="hidden" name="id" value="${board.id }" />
					<table class="table table" style="text-align: center; border: 1px solid #0000ff">
						<thead>
							<tr>
								<th colspan="2" style="background-color: #ffffff; text-align: center; font-size: 40px;">
									  Article Body
								</th>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td>
									<input type="text" class="form-control" value="${board.title }" name="title" maxlength="50">
								</td>
							</tr>
							<tr>
								<td>
									<textarea class="form-control" name="body" maxlength="2048" style="height: 350px;">${board.body }</textarea>
								</td>
							</tr>
							<tr>
								<td>
									<input type="datetime-local" style="text-align: center; float: right;" value="${board.inserted }" />
								</td>
							</tr>
						</tbody>
					</table>
				</form>


				<c:url value="/ex11/board/list" />
				<%-- <form action="${modifyLink }" method="post" > --%>
				<div class="d-grid gap-2 col-6 mx-auto">
					<button type="submit" form="modifyForm1" class="btn btn-light">MODIFY</button>
				</div>
				<%-- </form> --%>


				<c:url value="/ex11/board/remove" var="removeLink" />
				<form action="${removeLink }" method="post">
					<input type="hidden" name="id" value="${board.id }" />

					<div class="d-grid gap-2 col-6 mx-auto">
						<button class="btn btn-dark">DELETE</button>
					</div>
				</form>



				<hr />

				<!--<h1 style="text-align: center;">COMMENT</h1>  -->
				<div style="text-align: center;">
					<c:url value="/ex12/reply/add" var="replyAddLink" />
					<form action="${replyAddLink }" method="post">
						<input type="hidden" name="boardId" value="${board.id }" />
						comment :
						<input type="text" name="content" size="50" />

						<button class="btn btn-outline-Dark">Writing</button>
					</form>
				</div>

				<hr />

			
	<div class="container mt-3">
		<div class="row">
			<div class="col">
				<h3>댓글 ${board.numOfReply } 개</h3>
				
						<c:forEach items="${replyList }" var="reply">

							<div style="border: 1px solid skyblue; border-radius: 5px; padding: 8px; margin-bottom: 3px;">
									${reply.inserted } :

									<c:url value="ex12/reply/modify" var="replyModifyLink"></c:url>
									<form action="${replyModifyLink }" method="post">
										<input type="hidden" value="${reply.id }" name="id" />
										<input type="hidden" name="boarId" value="${board.id }" />
										<input type="text" value="${reply.content }" name="content" />
										<br />
									</form>
								
									<c:url value="ex12/reply/remove" var="replyRemoveLink"></c:url>
									<form id="replyDeleteForm1" action="${replyRemoveLink }" method="post">
										<input id="replyDeleteInput1" type="hidden" name="id" value="${reply.id }" />
										<input type="hidden" name="boarId" value="${board.id }" />
										
										<button class="btn btn-outline-dark btn-sm">Modify</button>
										<button class="btn btn-outline-danger btn-sm">Delete</button>
									</form>
								</div>
							</c:forEach>
					
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>		
				
				


</body>
</html>

















