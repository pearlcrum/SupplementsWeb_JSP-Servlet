<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.biz.BbsBiz"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 건너오는 데이터를 UTF-8로 사용 -->
<jsp:useBean id="bbs" class="com.vo.BbsVo" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>3조 게시판 만들기 프로젝트</title>
</head>
<body>
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null ) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else{
	BbsBiz bbsBiz = new BbsBiz();
	int result = bbsBiz.insertBbs(bbs.getBbsTitle(), userID, bbs.getBbsContent(),1);
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} 
	else {
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");

	}
	}
	
	%>
</body>
</html>