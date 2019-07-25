<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<link rel="stylesheet" href="${root}/css/photo/photo_write.css">
<script type="text/javascript" src="${root }/js/photo/photowrite.js"></script>
<link rel="shortcut icon" href="#">
</head>
<body>
	<div class="PhotoWriteForm">
		<div class="PhotoWriteForm-logo-wrap">
			<img class="icon" src="../image/common/logo.png" onclick="location.href='${root}/main.do'">
		</div>
		<form id="writeForm" class="Photo-Write-Form container" action="write.do" accept-charset="UTF-8" method="post" enctype="multipart/form-data">
			<h1 class="Photo-Write-Form_Title">사진 올리기</h1>
			<div class="Photo-Write-Form_Metadata">
				<div class="select-input Photo-Write-Form_Metadata_entry" >
					<select class="form-control" id="photo_pyeong" name="photo_pyeong">
						<option selected value="">평수</option>
						<option value="10평이하">10평이하</option>
						<option value="20평이하">20평이하</option>
					</select>
				</div>
				<div class="select-input Photo-Write-Form_Metadata_entry">
					<select class="form-control" id="photo_hometype" name="photo_hometype">
						<option selected value="">주거형태</option>
						<option value="원룸">원룸</option>
						<option value="투룸">투룸</option>
					</select>
				</div>
			</div>
			<section class="Photo-Write-Form_photo-section">
				<div class="Photo-Write-Form_photo-section_overview_container">
					<div class="Photo-Write-Form_photo-section_overview-wrap" style="position: sticky; top: 0px;">
						<div class="Photo-Write-Form_photo-section_overview" style="position: absoulte; box-sizing: border-box; height: 300px;"></div>
					</div>
				</div>
				<div class="Photo-Write-Form_photo-section_content">
					<ol class="Photo-Write-Form_photo-section_list">
						<li class="Photo-Write-Form_photo-section_list_item">
							<div class="Photo-Write-Form_photo-item">
								<div class="Photo-Write-Form_photo-item_image-wrap">
									<button id="uploadButton" class="Photo-Write-Form_photo-image-upload" type="button">
										<span class="content">
											<img id="icon" src="${root }/image/common/photo-camera.svg">
											<span class="text" style="font-size:15pt">
											사진올리기
											</span>
										</span>
									</button>
									<input type="file" name="photo" class="file" style="display: none;"/>
								</div>
								<div class="Photo-Write-Form_photo-item_content">
									<div class="Photo-Write-Form_photo-item_content_row">
										<textarea class="form-control text-area-input" id="photo_content"
										placeholder="사진에 대해서 설명해주세요" style="height:160px;" name="photo_content">${pvo.photo_content }</textarea>
									</div>
									<div class="Photo-Write-Form_photo-item_content_row">
										<div class="keyword-input">
											<div class="keyword-input_input-item" style="display:inline-block">
												<input class="keyword-input_input-item_input" value="" placeholder="해쉬태그" name="hashtag"
												style="box-sizing: context-box; width: 55px;">
											</div>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ol>
				</div>
			</section>
			<div class="sticky-container Photo-Write-Form_footer_wrap" style="height:70px;">
				<div class="sticky-child Photo-Write-Form_footer" style="position: fixed; right:0px; bottom:0px;">
					<input type="hidden" value="${sessionScope.member_no }" id="member_no">
					<button class="button button-color-blue Photo-Write-Form_footer_submit" type="submit" id="submit">올리기</button>
				</div>
			</div>
		</form>
	</div>
	<button class="card-collection-form__card-section__upload-button" type="button" style="display:none;">추가하기</button>
	<div class="card-collection-form__card-image card-collection-form__card-item__image focused" style="padding-bottom: 88%; display:none;" >
		<img class="card-collection-form__card-image__image" src="#" style="display:none;">
	</div>
</body>
</html>
