<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>

<%@ page import="com.vo.*"%>
<%@ page import="com.biz.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>3조 게시판 만들기 프로젝트</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID ==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
			
		}
		BbsVo bbsVo = new BbsBiz().getBBSByID(bbsID);
		int viewNum= new BbsBiz().getBBSView(bbsVo.getBbsID());
		int resView=new BbsBiz().plusBbsView(bbsVo.getBbsID(), viewNum);
		ArrayList<BbsCommentVo> CommentList= new BbsCommentBiz().getAllComments(bbsVo.getBbsID());
		
	%>
  <nav class="navbar navbar-default">
  <div class="navbar-header">
   <button type="button" class="navbar-toggle collapsed"
    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
    aria-expanded="false">
   <span class="icon-bar"></span>
   <span class="icon-bar"></span>
   <span class="icon-bar"></span>
  </button>  
  <a class="navbar-brand" href="main.jsp">3조 게시판 만들기 프로젝트</a>
 </div>
 <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
  <ul class="nav navbar-nav">
   <li><a href="main.jsp">메인</a></li>
   <li><a href="bbs.jsp">영양제 소개</a>
   <li><a href="bbs.jsp">가격 비교</a>
   <li class="active"><a href="bbs.jsp">소통 게시판</a>
   <li><a href="main.jsp">NEWS & VIDEO</a></li>
   <li><a href="main.jsp">마이페이지</a></li>
  </ul>
  <%
  	if(userID == null){
  		  	
  %>
    <ul class="nav navbar-nav navbar-right">
   <li class="dropdown">
    <a href="#" class="dropddown-toggle"
    data-toggle="dropdown" role="button" aria-haspopup="true"
    aria-expanded="false">접속하기<span class="caret"></span></a>
   <ul class="dropdown-menu">
    <li class="active"><a href="login.jsp">로그인</a></li>        <!-- active : 선택이 됨을 알려줌 -->
    <li ><a href="join.jsp">회원가입</a></li>
   </ul>
  </li>
  </ul>
  <%
  	} else {
  %>
  
      <ul class="nav navbar-nav navbar-right">
   <li class="dropdown">
    <a href="#" class="dropddown-toggle"
    data-toggle="dropdown" role="button" aria-haspopup="true"
    aria-expanded="false">회원관리<span class="caret"></span></a>
   <ul class="dropdown-menu">
    <li><a href="logoutAction.jsp">로그아웃</a></li>       

   </ul>
  </li>
  </ul>
 <%
 

 }
  %>
 </div>
 </nav>
<div class="container">
<div class="row">
	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
		
				</tr>
				</thead>
				<tbody>
				<tr>
					<td style="width: 20%;">글 제목</td>
					<td colspan="2"><%= bbsVo.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll("\n", "<br>") %></td>
				</tr>
					<tr>
					<td>작성자</td>
					<td colspan="2"><%= bbsVo.getUserID() %></td>
				</tr>
				<tr>
				<td>작성일자</td>
				<td colspan="2"><%= bbsVo.getBbsDate().substring(0, 11) + bbsVo.getBbsDate().substring(11, 13) + "시" + bbsVo.getBbsDate().substring(14, 16) + "분"%></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbsVo.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
					.replaceAll("\n", "<br>")%></td>
				</tr>
				</tbody>
				</table>
				<a href="bbs.jsp" class="btn btn-primary">목록</a>
				<%
					if(userID != null && userID.equals(bbsVo.getUserID())){
				%>
				<a onClick="return confirm('정말로 수정하시겠습니까?')" href="find?bbsID=<%=bbsID %>" class="btn btn-primary">수정</a>
				<a onClick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
				<%
					}
				%>
				
				
	</div>
</div>
댓글입력
<br>
<form method="post" action="comment">
<input type="hidden" class="a" placeholder="게시글ID" name="bbsID" value="<%=bbsID%>">
<input type="hidden" class="a" placeholder="유저ID" name="userID" value="<%=userID%>">
<input type="text" class="a" placeholder="댓글" name="comment" maxlength="100">
<input type="submit" class="a" value="댓글추가">
</form>

<%
	if(CommentList!=null){
%>
<div style="font-size: 2.0em; margin: 100px 100px 100px 100px;">
	<table border=1 style="width: 50%">
		<tr>
			<th> 유저 이름</th> <th> 댓글 </th> <th> update</th> <th> delete</th>
		</tr>
		<%for(BbsCommentVo ar: CommentList){
			out.print("<tr><td>"+ar.getUserID()+"</td>");
			out.print("<td>"+ar.getCommentText()+"</td>");
			if(ar.getUserID().equals(userID)){
			out.print("<td> <a href =findComment?no="+ar.getCommentID()+"> 수정</a></td>");
			out.print("<td> <a href =deleteComment?no="+ar.getCommentID()+"> 삭제</a></td>");
			}
			out.print("</tr>");
		}
}%>

 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
</body>
</html>