<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="<%=request.getContextPath()%>" />
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${root}/css/main/teamstory.css">
</head>
<body>
<div class="teamstory_wrapper">
	<div class="teamstory_container">
		
		<!-- LEFT MENU [S] -->
		<div class="teamstory_left_menu">
			<a class="left_menu_logo" href="/main.do">
				<span class="left_menu_logo_icon">
					<img src="${root}/image/common/home_logo_white.png">
				</span>
				<span class="left_menu_logo_title">
					<img src="${root}/image/common/logo.png">
				</span>
			</a>
			
			<div class="teamstory_left_menu_list">
				<ul class="menu_list_item">
					<li class="menu_list_team_story">
						<a class="team_story_title">Team Story</a>
					</li>
					<li class="menu_list_team_member">
						<a class="team_story_title">Member</a>
					</li>				
				</ul>
			</div>
		</div>
		<!-- LEFT MENU [E] -->
		
		<!-- TEAM STORY - MAIN [S] -->
		<div class="teamstory_main_wrapper">
			<div class="teamstory_main_container">
				<!-- member 1 - 태영 -->
				<div class="teamstory_member_list">
					<div class="teamstory_member_image">
						<span class="member_image_wrap">
							<img src="${root}/image/common/zip_member01.jpg">
						</span>
					</div>
					<div class="teamstory_member_info">
						<span class="member_info_text">
							조 장<br>
							<h2>장 태 영</h2> 
							가나다라<br>
						</span>
					</div>
				</div>
				<!-- member 2 - 한결 -->
				<div class="teamstory_member_list">
					<div class="teamstory_member_image">
						<span class="member_image_wrap">
							<img src="${root}/image/common/zip_member02.jpg">
						</span>
					</div>
					<div class="teamstory_member_info">
						<span class="member_info_text">
							조 원<br>
							<h2>김 한 결</h2> 
							가나다라<br>
						</span>
					</div>
				</div>
				<!-- member 3 - 소원 -->
				<div class="teamstory_member_list">
					<div class="teamstory_member_image">
						<span class="member_image_wrap">
							<img src="${root}/image/common/zip_member03.jpg">
						</span>
					</div>
					<div class="teamstory_member_info">
						<span class="member_info_text">
							조 원<br>
							<h2>박 소 원</h2> 
							가나다라<br>
						</span>
					</div>
				</div>
				<!-- member 4 - 준우 -->
				<div class="teamstory_member_list">
					<div class="teamstory_member_image">
						<span class="member_image_wrap">
							<img src="${root}/image/common/zip_member04.jpg">
						</span>
					</div>
					<div class="teamstory_member_info">
						<span class="member_info_text">
							조 원<br>
							<h2>박 준 우</h2> 
							가나다라<br>
						</span>
					</div>
				</div>
				
			</div>
		</div>
		<!-- TEAM STORY - MAIN [E] -->
	</div>
</div>
</body>
</html>