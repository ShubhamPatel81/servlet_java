<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! int a = 10; %>
<%! String name=null;
name.length();

%>
<h1> Value of a is : <%= a %></h1>

<%= name  %>

</body>
</html>