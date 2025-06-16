<%-- 
    Document   : deleteQuiz
    Created on : 11 Jun 2025, 6:04:22 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Quiz</title>
    </head>
    <body>
        <%
            int quizId = Integer.parseInt(request.getParameter("id"));

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ThinQuizSystem", "root", "");

            PreparedStatement stmt = conn.prepareStatement("DELETE FROM quiz_question WHERE quiz_id=?");
            stmt.setInt(1, quizId);
            stmt.executeUpdate();

            stmt = conn.prepareStatement("DELETE FROM quiz WHERE quiz_id=?");
            stmt.setInt(1, quizId);
            stmt.executeUpdate();

            conn.close();
            response.sendRedirect("ListQuiz.jsp");
        %>
    </body>
</html>
