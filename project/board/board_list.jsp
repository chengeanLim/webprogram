<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<%@ include file="config.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<% request.setCharacterEncoding("EUC-KR"); %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="euc-kr" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Able</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
    <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Able.css.css" /> <!-- CSS ���� ��ũ -->

    <style>
        body{
            background-color:#FFFFFF;
        }
    </style>
</head>

<body class="nav-fixed" >



    <div id="vector1">
        <a href="��ũ�ּ�"></a>
      </div>
      
      <div id="rectangle1">
        <a href="��ũ�ּ�"></a>
      </div>
      
      <div id="home">
        <a href="��ũ�ּ�">Home</a>
      </div>
      
      <div id="notifications">
        <a href="��ũ�ּ�"></a>
      </div>
      
      <div id="manage_search">
        <a href="��ũ�ּ�"></a>
      </div>
      
      <div id="account_circle">
        <a href="��ũ�ּ�"></a>
      </div>
      

      
      <div id="able">
        <a href="��ũ�ּ�">ABLE</a>
      </div>
      
      <div id="snowboarding">
        <a href="��ũ�ּ�"></a>
      </div>
      
      <div id="ellipse1">
        <a href="��ũ�ּ�"></a>
      </div>
      
      <div id="challenge">
        <a href="��ũ�ּ�">Challenge Yourself</a>
      </div>
      
      <div id="ellipse2">
        <a href="��ũ�ּ�"></a>
      </div>
      
      <div id="stories">
        <a href="��ũ�ּ�">Share Your Stories</a>
      </div>
      
      <div id="ellipse3">
        <a href="��ũ�ּ�"></a>
      </div>
      
      <div id="friendship">
        <a href="��ũ�ּ�">Build New Friendships</a>
      </div>
      
      <div id="group_talk">
        <a href="��ũ�ּ�">Group Talk</a>
      </div>
      
      <div id="bulletin_board">
        <a href="��ũ�ּ�">Bulletin Board</a>
      </div>
      
      <div id="schedule">
        <a href="http://58.232.79.151:8080/jsp14/calendar.html">Schedule</a>
      </div>
      
      <div id="introduction">
        <a href="��ũ�ּ�">Introduction</a>
      </div>
      
      <div id="FAQ">
        <a href="able faq.html">FAQ</a>
      </div>
      <div id="group_talk">
        <a href="group_chat.html">Group Talk</a>
      </div>

      <div id = "img1">
        <img src="./img1.png">
      </div>

      <div id = "img2">
        <img src="./img2.png">
      </div>
      

      <div id = "img3">
        <img src="./img3.png">
      </div>






<%
    Connection con = null;
    PreparedStatement pstmt = null;
	String sql;

	sql = "select * from author a inner join board b on a.id = b.id order by b.boardid desc";

    int rowCount = 1;
    try {
		Class.forName(driverName);
		con = DriverManager.getConnection(dbURL, dbID, dbPW);
		pstmt = con.prepareStatement(sql);

        ResultSet result = pstmt.executeQuery();
%>

    <%@ include file="topbar.jsp" %>
    <div id="layoutSidenav">
   

       
            <main>
               

                
                    
                        
                                    <%
                                        while (result.next()) {
                                    %>
                                   
                                    <%	
										rowCount++;
										}
										result.close();
                                        }
                                        catch (Exception e) {
                                            out.println("[board] ���̺� ��ȸ�� ������ �ֽ��ϴ�. <hr>");
                                            out.println(e.toString());
                                            e.printStackTrace();
                                        }
                                        finally {
                                            if (pstmt != null) pstmt.close();
                                            if (con != null) con.close();
                                        }
									    %>
                                </tbody>
                            </table>
                        </div>
                    
                

            </main>
        
    </div>



      

    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables/datatables-simple-demo.js"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>

</body>
</html>
