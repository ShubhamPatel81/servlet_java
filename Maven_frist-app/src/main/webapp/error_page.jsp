<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body>
<h1>An Error Occurred</h1>
<p>Sorry, an unexpected error occurred.</p>
<p><b>Error Details:</b></p>
<pre>
<% 
    if (exception != null) {
        out.println("Exception: " + exception.toString());
        out.println("Message: " + exception.getMessage());
        exception.printStackTrace(new java.io.PrintWriter(out));
    } else {
        out.println("No exception available");
    }
%>
</pre>
</body>
</html>
