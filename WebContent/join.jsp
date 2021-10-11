<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device" ,initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>

<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">3조 게시판 만들기 프로젝트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a>
				<li><a href="bbs.jsp">게시판</a>
				<li><a href="main.jsp">후기</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropddown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<!-- active : 선택이 됨을 알려줌 -->
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>

	<%--회원가입--%>
		<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<%-- <div class="jumbotron" style="padding-top: 20px;"> 삭제할까? 일단 주석처리 --%>
				<form method="post" action="JoinController">
					<h2 class="join-title">만나서 반가워요!</h2>
					<h6 style="text-align: center;">회원가입 후 더 많은 정보를 확인해보세요 :)</h6>

					<div class="form-group">
						<label for="userName">이름 </label> 
						<input type="text" class="form-control" placeholder="이름"
										name="userName" maxlength="20">
					</div>
                        
					<div class="form-group">
						<label for="userID">아이디 </label> 
						<input type="text" class="form-control"
										placeholder="4~10자, 영문, 숫자" name="userID" maxlength="10">
					</div>

					<div class="form-group">
						<label for="userPassword">비밀번호 </label> 
						<input type="password" class="form-control"
										placeholder="8~12자리 숫자, 영문자, 특수문자 중 2개 조합" name="userPassword"
										maxlength="12">
					</div>

					<label for="user-id">성별 </label>
				<div class="form-group">
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-primary active"> 
						<input type="radio" name="userGender" autocomplete="off"
											value="남자" checked>남자 </label> 
						<label class="btn btn-primary active"> 
						<input type="radio" name="userGender" autocomplete="off"
											value="여자" checked>여자 </label>
					</div>
				</div>
					
					<div class="form-group">
						<label for="userEmail">이메일 </label> <input type="email"
										class="form-control" placeholder="ID" name="userEmail">
					</div>

					<div class="form-group">
						<label for="userBirth">생년월일 </label> <input type="date"
										class="form-control" name="userBirth">
					</div>

					<input type="submit" class="btn btn-primary form-control"
									value="회원가입">
			</form>
			</div>
		</div>

	<%-- JS --%>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

				</body>
</html>