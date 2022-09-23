<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
header .admin_page_btn {
	font-size: 13px;
	position: absolute;
	right: 10px;
	top: 10px;
	font-weight: bold;
}

header .admin_page_btn a {
	border: 1px solid #ddd;
	border-radius: 10px;
	padding: 5px;
	background: #fff;
	font-size: 13px;
	display: block;
	text-align: center;
}
</style>

</head>
<body >
	<!-- <body> -->
	<header>
		<div id="header">
			<a href="/category"><img src="/img/baemin.jpg" alt="이미지"> </a>
			<!-- 임시 -->
			<div class="admin_page_btn">
				<div>
					${userNickname} 님
					<a href="/memberList/orderType=0">회원관리</a>
				</div>
			</div>
			<div class="menu_tab_box active">
				<div class="menu_tab">
					<span> </span>
					<span> </span>
					<span> </span>
				</div>
			</div>

		</div>
	</header>
	<!-- 헤더 -->
 

