<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String nm=request.getParameter("nm");
int mob=Integer.parseInt(request.getParameter("mob"));

Connection con;
PreparedStatement psmt;
ResultSet rs;
try
{
Class.forName("org.postgresql.Driver");
String url="jdbc:postgresql://localhost:5432/demostud";
String unm="postgres";
String pwd="Sam1625";
con=DriverManager.getConnection(url, unm, pwd);
String sql="select name,mob from enquiry where name=? and mob=?";
psmt=con.prepareStatement(sql);
psmt.setString(1,nm);
psmt.setInt(2,mob);
rs=psmt.executeQuery();
int cnt=0;
while(rs.next())
{
	cnt++;
}
if(cnt>0)
{
	response.sendRedirect("dash.jsp");
}else
{
	response.sendRedirect("login.html");
}
} 
 	catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
</html>