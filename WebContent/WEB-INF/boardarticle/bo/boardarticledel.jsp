<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/include/jsp/commonimport.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@include file="/include/jsp/commonhead.jsp"%>

<script type="text/javascript">

	$(function(){
		$('form[name="frm"]').validate();
	});

	function dataAjax(){
	var param = '';

		$.ajax({
			async : false,
			data : param,
			error : function(){
				alert( '처리 중 오류가 발생되었습니다.' );
				errorCnt += 1;
				checkYn = 'N';
				return false;
			},
			success : function( data ){
			},
			type : 'POST',
			url : '${cpath}/'
		});
	}

	function dataAdd(){
		handling.submit( '', 'boardarticleadd' );
	}

	function dataDel(){
		handling.submit( '', 'boardarticledel' );
	}

	function dataDown(){
		handling.submit( '', 'boardarticledel' );
	}

	function dataEdit(){
		handling.submit( '', 'boardarticleedit' );
	}

	function dataIn(){
		handling.submit( '', 'boardarticlein' );
	}

	function dataView(){
		handling.submit( '', 'boardarticleview' );
	}

	function dataList(){
		handling.submit( '', 'boardarticlelist' );
	}

	function dataSort(){
		handling.submit( '', 'boardarticlelist' );
	}

	function dataUp(){
		handling.submit( '', 'boardarticleup' );
	}

	function formSubmit( fName, url ){
		handling.submit( '', url );
	}

	function pager( fName, url ){
		$('input[name="r_page"]').val( r_page );
		handling.submit( fName, url );
	}

	function pageMove(  ){
		handling.pageMove(url,param);
	}

</script>
</head>
<body>

	<div class="container">

	<%@ include file="/include/jsp/header.jsp" %>

	<form action="boardarticledel" id="frm" name="frm" method="post" >

		<fieldset>
			<legend>boardarticledel</legend>
			<p>
				<label for="r_bdaseq">아이디</label>
				<input id="r_bdaseq" name="r_bdaseq" placeholder="아이디" type="text" value="" required />
			</p>
			<p>
				<label for="r_bdabdid">게시판아이디</label>
				<input id="r_bdabdid" name="r_bdabdid" placeholder="게시판아이디" type="text" value="" required />
			</p>
			<p>
				<label for="r_bdabdcseq">게시글분류</label>
				<input id="r_bdabdcseq" name="r_bdabdcseq" placeholder="게시글분류" type="text" value="" />
			</p>
			<p>
				<label for="r_bdacontent">내용</label>
				<input id="r_bdacontent" name="r_bdacontent" placeholder="내용" type="text" value="" />
			</p>
			<p>
				<label for="r_bdafilenum">파일개수</label>
				<input id="r_bdafilenum" name="r_bdafilenum" placeholder="파일개수" type="text" value="" />
			</p>
			<p>
				<label for="r_bdagroupnum">그룹번호</label>
				<input id="r_bdagroupnum" name="r_bdagroupnum" placeholder="그룹번호" type="text" value="" />
			</p>
			<p>
				<label for="r_bdalevelnum">레벨번호</label>
				<input id="r_bdalevelnum" name="r_bdalevelnum" placeholder="레벨번호" type="text" value="" />
			</p>
			<p>
				<label for="r_bdastepnum">스텝번호</label>
				<input id="r_bdastepnum" name="r_bdastepnum" placeholder="스텝번호" type="text" value="" />
			</p>
			<p>
				<label for="r_bdambid">작성자아이디</label>
				<input id="r_bdambid" name="r_bdambid" placeholder="작성자아이디" type="text" value="" />
			</p>
			<p>
				<label for="r_bdaname">제목</label>
				<input id="r_bdaname" name="r_bdaname" placeholder="제목" type="text" value="" />
			</p>
			<p>
				<label for="r_bdaownername">작성자명</label>
				<input id="r_bdaownername" name="r_bdaownername" placeholder="작성자명" type="text" value="" />
			</p>
			<p>
				<label for="r_bdapswd">비밀문자</label>
				<input id="r_bdapswd" name="r_bdapswd" placeholder="비밀문자" type="text" value="" />
			</p>
			<p>
				<label for="r_bdareadcnt">조회수</label>
				<input id="r_bdareadcnt" name="r_bdareadcnt" placeholder="조회수" type="text" value="" />
			</p>
			<p>
				<label for="r_bdarecommendcnt">추천수</label>
				<input id="r_bdarecommendcnt" name="r_bdarecommendcnt" placeholder="추천수" type="text" value="" />
			</p>
			<p>
				<label for="r_bdastatus">상태값</label>
				<input id="r_bdastatus" name="r_bdastatus" placeholder="상태값" type="text" value="" />
			</p>
			<p>
				<label for="r_bdalevel">레벨</label>
				<input id="r_bdalevel" name="r_bdalevel" placeholder="레벨" type="text" value="" />
			</p>
			<p>
				<label for="r_bdatype">타입</label>
				<input id="r_bdatype" name="r_bdatype" placeholder="타입" type="text" value="" />
			</p>
			<p>
				<label for="r_bdause">사용여부</label>
				<input id="r_bdause" name="r_bdause" placeholder="사용여부" type="text" value="" />
			</p>
			<p>
				<label for="r_bdamoid">수정아이디</label>
				<input id="r_bdamoid" name="r_bdamoid" placeholder="수정아이디" type="text" value="" />
			</p>
			<p>
				<label for="r_bdainid">등록아이디</label>
				<input id="r_bdainid" name="r_bdainid" placeholder="등록아이디" type="text" value="" />
			</p>
			<!--<p>
				<label for="r_bdamodate">수정일</label>
				<input id="r_bdamodate" name="r_bdamodate" placeholder="수정일" type="text" value="" required />
			</p>-->
			<!--<p>
				<label for="r_bdaindate">등록일</label>
				<input id="r_bdaindate" name="r_bdaindate" placeholder="등록일" type="text" value="" required />
			</p>-->

		<a href="#" onclick="dataDel()">삭제</a><br/>
	</form>
	<%@ include file="/include/jsp/footer.jsp" %>

	</div>

</body>
</html>