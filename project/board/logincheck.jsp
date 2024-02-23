<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="config.jsp" %>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
	Statement stmt = null;
    StringBuffer SQL = new StringBuffer("SELECT * FROM author WHERE userid = ? and userpwd = ?");

	int id = 0;
	String userid = null;
	String userpwd = null;
	String username = null;
	String useremail = null;

	try {
		String encoding    = "EUC-KR";
		//String username    = request.getParameter("username");

	    Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, dbID, dbPW);

		pstmt = con.prepareStatement(SQL.toString());
		pstmt.setString(1, request.getParameter("userid"));
		pstmt.setString(2, request.getParameter("userpwd"));

		//out.println(pstmt.toString());
		ResultSet result = pstmt.executeQuery();       

		if (result.next())
		{
			id = result.getInt("id");
			userid = result.getString("userid");
			userpwd = result.getString("userpwd");
			username = result.getString("username");
			useremail = result.getString("useremail");

			session.setAttribute("member", "ok");

			session.setAttribute("id", id);
			session.setAttribute("userid", userid);
			session.setAttribute("userpwd", userpwd);
			session.setAttribute("username", username);
			session.setAttribute("useremail", useremail);
%>
            <script>
				location.href="board_list.jsp";
			</script>
<%            
		}
		else
		{
%>
			<script>
				alert("Login failed");
				location.href="index.jsp";
			</script>
<%
		}			
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	finally {
		if (pstmt != null) pstmt.close();
		if (con != null) con.close();
	}
%> 