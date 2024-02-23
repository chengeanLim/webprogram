<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>

<nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" id="sidenavAccordion">
   
<div id = icon>
   

            <ul class="navbar-nav align-items-center ms-auto">
                <li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
                    <% 
                        String username = (String)session.getAttribute("username");
                        if(username == null || username.equals("")) {
                            out.println("로그인");
                        } else {
                            out.println((String)session.getAttribute("username"));
                        }
                    %>

                    <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="user"></i></a>
                    <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownUserImage">
                        <h6 class="dropdown-header d-flex align-items-center">
                        
                        <% if(username != null) { %>                            
                            <div class="dropdown-user-details">
                                <div class="dropdown-user-details-name" id = "user1"><%= (String)session.getAttribute("username")%>님</div><br>
                            </div>
                        </h6>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="logout.jsp">
                            <div class="dropdown-item-icon"><i data-feather="log-out"></i></div>
                            로그아웃
                        </a>

                        <% } else { %>                            
                            <div class="dropdown-user-details">
                                <div class="dropdown-user-details-name">로그인이 필요합니다.</div>
                            </div>
                        </h6>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="index.jsp">
                            <div class="dropdown-item-icon"><i data-feather="log-in"></i></div>
                            로그인
                        </a>
                        <% } %>

					</div>
                </li>
            </ul>
        </div>

        <style>
            #icon {
            position: absolute;
            top: 125px;
            left: 1700px;
            transform: translate( -50%, -50% );
            
          }
          

          #user1 {
            position: absolute;
            font-weight: 400;
            font-size: 20px;
            line-height: 25px;
            color: black !important;
            
          }

       

        </style>
        
</nav>