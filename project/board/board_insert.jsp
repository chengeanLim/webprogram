<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="config.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="EUC-KR" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>???? ???</title>
    <link href="css/styles.css" rel="stylesheet" />
</head>

<body class="text-center">
<%
    Connection con = null;
    PreparedStatement pstmt = null;
	Statement stmt = null;
    StringBuffer SQL = new StringBuffer("insert into board(id, title, content, regdate) "); 
    SQL.append("values (?, ?, ?, now() )");

    try {
        String encoding    = "EUC-KR";

		Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, dbID, dbPW);

        pstmt = con.prepareStatement(SQL.toString());

        int id = (Integer)session.getAttribute("id");
        pstmt.setInt(1, (id));
        pstmt.setString(2, request.getParameter("title"));
        pstmt.setString(3, request.getParameter("content"));

		out.println(pstmt.toString());
        int rowCount = pstmt.executeUpdate();        
        if (rowCount == 1) out.println("?????? ??? ????????.");
        else out.println("????? ????? ?????? ??????.");
        
        //??? ???
        stmt = con.createStatement();

    }
    catch (Exception e) {
    	out.println("?????????? ????? ?????? ??????.");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }
	out.println("<meta http-equiv='Refresh' content='1;URL=board_list.jsp'>");
%>
       
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>

</body>
</html>
