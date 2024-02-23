<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ include file="config.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="EUC-KR" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>게시글 수정</title>
    <link href="css/styles.css" rel="stylesheet" />
</head>

<body class="text-center">
<%
    Connection con = null;
    PreparedStatement pstmt = null;
	Statement stmt = null;
    StringBuffer SQL = new StringBuffer("update board set title = ?, content = ? where boardid = ?"); 

    String encoding    = "euc-kr";

    Class.forName(driverName);
    con = DriverManager.getConnection(dbURL, dbID, dbPW);

    pstmt = con.prepareStatement(SQL.toString());
    pstmt.setString(1, request.getParameter("title"));
    pstmt.setString(2, request.getParameter("content"));
    int pno = Integer.parseInt(request.getParameter("pno"));
    pstmt.setInt(3, pno);
    
    //out.println(pstmt.toString());
    int rowCount = pstmt.executeUpdate();        
    if (rowCount == 1) out.println("게시글 수정이 완료 되었습니다.");
    else out.println("레코드 수정에 문제가 있습니다.");

    //다시 조회
    stmt = con.createStatement();

	try {
    }
    catch (Exception e) {
    	out.println("데이터베이스 조회에 문제가 있습니다. <hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }
	out.println("<meta http-equiv='Refresh' content='1;URL=board_list.jsp'>");  
%>

</body>
</html>