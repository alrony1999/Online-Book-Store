<%
HttpSession httpSession = request.getSession();
httpSession.removeAttribute("current-user");
response.sendRedirect("login.jsp"); 
%>