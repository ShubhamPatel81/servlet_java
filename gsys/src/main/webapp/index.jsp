<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>HII SHUBH</h1>
	<h1>Creating session factory factory</h1>
	<%
	out.println(FactoryProvider.getFactory());
	%>
</body>
</html>