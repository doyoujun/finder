<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf" content="${_csrf.token}"/>
<%@ include file="../include/head.jsp"%>


<!--start wrapper-->
<div class="wrapper">
	<%@ include file="../include/navbar.jsp"%>
	<%@ include file="../include/sidebar.jsp"%>
	
	<main class="page-content bg-w">
		<!--breadcrumb-->
		<div class="page-breadcrumb mb-3">
			<div class="breadcrumb-title pe-3 mb-3">
				<b>
					<img src="${pageContext.request.contextPath}/resources/assets/img/icon_title.png" class="page-icon" alt="">
					문의사항
				</b>
			</div>
			<div class="sub-contents ">
				<div class="row underline_point">
					<div class="col-6 text-left pd-l-n notice-title">
						<b>${contactDetail[0].question_title}</b>
					</div>
					
					<div class="col-3 text-center pd-t-1">
						<b class="lightGrayColor">작성자</b>
						<span class="bold blackColor">${contactDetail[0].account_name}</span>
					</div>
					
					<div class="col-3 text-center pd-t-1">
						<b class="lightGrayColor">작성일</b>
						<span class="bold blackColor">${contactDetail[0].formatted_createtime}</span>
					</div>
				</div>
				
				<div class="row board-cotents">
					<div class="col-12">
						${contactDetail[0].question_description}
					</div>
					<div class="col-12" style="display:none;" id="adminname">${adminname}</div>
				</div>
				<div class="col-3 text-center pd-t-1">
					<span class="bold blackColor"><img class="thumImg" src="http://codebrosdev.cafe24.com:8080/media/shuttleking/question/${contactDetail[0].question_img}" class="user" alt=""></span>
				</div>
				
				<div class="board-comments">
					<table>
					
					<c:forEach items="${questionanswerlist}" var = "questionanswerlist" varStatus="status">
					<c:if test="${not empty questionanswerlist.question_answer_writer}">	
						<tr>
							<th>${questionanswerlist.question_answer_writer}</th>
							<td>${questionanswerlist.question_answer_description}</td>
							<td>${questionanswerlist.formatted_createtime}</td>
							
							<td>
								<a href="javascript:void(0);" onclick="commentsEditor(this)"><img src="${pageContext.request.contextPath}/resources/assets/img/icon_01.png"></a>
								<a href="javascript:void(0);" onclick="delete_comments(${questionanswerlist.question_answer_idx})"><img src="${pageContext.request.contextPath}/resources/assets/img/icon_02.png"></a>
							</td>
							<td style="display:none;" id="questionNum">${questionanswerlist.question_answer_idx}</td>
						</tr>
						
					</c:if>	
					</c:forEach>	
					</table>
					
					<div class="board-coments-form">
						<form action="comentsAdd" name="comentsForm" id="comentsForm" class=" d-flex">
							<textarea rows="3" cols="20" name="" class="form-control mr-5" id="textarea"></textarea>
							<button type="button" class="btn btn-dark" onclick="checkidx(${contactDetail[0].question_idx})">댓글작성</button>
						</form>
					</div>
				</div>
				
				<div class="page board-control">
					<ul>
						<li onclick="location.href='${pageContext.request.contextPath}/contact/${contactBef[0].question_idx }'">
							<div class="d-flex vertical">
								<img src="/project/resources/assets/img/icon_arrow_01.png" class="arrow">
								<c:if test="${not empty contactBef[0].question_title}">
								    <span class="centered-text">${contactBef[0].question_title }</span>
								</c:if>
								<c:if test="${empty contactBef[0].question_title}">
								    <span class="centered-text">-</span>
								</c:if>
							</div>
						</li>
						<li onclick="location.href='${pageContext.request.contextPath}/contact/${contactAft[0].question_idx }'">
							<div class="d-flex vertical">
								<img src="/project/resources/assets/img/icon_arrow_02.png" class="arrow">
								<c:if test="${not empty contactAft[0].question_title}">
								    <span class="centered-text">${contactAft[0].question_title}</span>
								</c:if>
								<c:if test="${empty contactAft[0].question_title}">
								    <span class="centered-text">-</span>
								</c:if>
							</div>
						</li>
					</ul>
					
					<div class="text-right">
						<button class="btn mt-2 btn-bor-default btn-radius" type="button" onclick="delete_board(1)">
							<img src="/project/resources/assets/img/icon_03.png" class="arrow">
							삭제
						</button>
					</div>
					
					<div class="row mt-5">
						<div class="col-12 btn-bottom text-center">
							<button class="btn-point btn-radius" type="button" onclick="history.back()">목록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
			<c:forEach items="${questionanswerlist}" var = "questionanswerlist" varStatus="status">
			<div class="modal fade" id="deleteModal${questionanswerlist.question_answer_idx}" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header text-center pd-b-n">
						</div>
						<div class="modal-body text-left" id="deleteModalBody">
							<div class="text-center">
								<p class="mt-3"><b>삭제하시겠습니까?</b></p>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary width100 btn-radius" data-bs-dismiss="modal" onclick="deleted(${questionanswerlist.question_answer_idx})">확인</button>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header text-center pd-b-n">
						</div>
						<div class="modal-body text-left" id="deleteModalBody">
							<div class="text-center">
								<p class="mt-3"><b>삭제하시겠습니까?</b></p>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary width100 btn-radius" data-bs-dismiss="modal" onclick="deleteDetails(${contactDetail[0].question_idx})">확인</button>
						</div>
					</div>
				</div>
			</div>
		<!--end breadcrumb-->
	</main>
</div>

<%@ include file="../include/footer.jsp"%>

<script>
    function commentsEditor(link) {
    	let text = null;
        const $tr = $(link).closest('tr');
        const $td = $tr.find('td');
        const $input = $('<input type="text" class="form-control" id="textupdate">');
        const $button = $('<button type="submit" class="btn btn-dark">완료</button>');

        const existingComment = $td.eq(0).text();
        $input.val(existingComment);
		
      /*   $td.eq(2).remove(); */
        
        $td.eq(0).empty().append($input);
        $td.eq(0).attr('colspan', '2');
        $td.eq(1).empty().append($button);
		
        console.log($("#questionNum").text());
        console.log($("#textupdate").val());
        text = $("#textupdate").val();
        /* if ($tr.find('td a').length === 0) {
            $tr.append('<td><a href="#" onclick="commentsEditor(this)"><img src="${pageContext.request.contextPath}/resources/assets/img/icon_01.png" class="mr-5"></a><a href="#"><img src="${pageContext.request.contextPath}/resources/assets/img/icon_02.png"></a></td>');
        }
 */
        // Hide other buttons
        $tr.find('td a').hide();
        
        $button.on('click', function () {
            const editedComment = $input.val();
			const text = $("#textupdate").val();
            console.log(text);
            
            $td.eq(0).text(editedComment);
            $td.eq(0).removeAttr('colspan'); 
            $td.eq(1).html('<td>2023.09.10 (11:31:00)</td>');
            $tr.find('td a').show();
            
            update($("#questionNum").text(), text);
        });
    }
    
    
</script>
<script>
	function delete_board(idx) {
		
		
		var show_text = "";
		
		$("#deleteModal").modal("show"); // 모달 팝업 열기
	}
	function delete_comments(idx) {
		var show_text = "";
		
		console.log(idx);
		
		var index = "deleteModal" + idx;
		
		const showbox = document.getElementById(index);
		
		$("#"+index).modal("show"); // 모달 팝업 열기
		
	}
    jQuery(document).ready(function() {
        var table = $('#routelist').DataTable({
            lengthChange: false,
            dom: 'Bfrtip',
            buttons: [ { extend: 'csv', charset: 'UTF-8', bom: true, text:"CSV 다운로드" }],
            language : lang_kor
        } );
     
        table.buttons().container()
            .appendTo( '#routelist_wrapper .col-sm-6:eq(0)' );
    } );
</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/questiondetails.js"></script>