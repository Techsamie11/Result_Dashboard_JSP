<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String nm= request.getParameter("nm");
String mob= request.getParameter("mob");
String email=request.getParameter("email");
String city=request.getParameter("city");
int age=Integer.parseInt(request.getParameter("age"));
String course=request.getParameter("cc");

//out.println(nm+"<br>");
//out.println(mob+"<br>");
//out.println(email+"<br>");
//out.println(city +"<br>");
//out.println(age +"<br>");
//out.println(cc+ "<br>");

Connection con;
PreparedStatement psmt;
try
{
	Class.forName("org.postgresql.Driver");
	String url="jdbc:postgresql://localhost:5432/demostud";
	String unm="postgres";
	String pwd="Sam1625";
	con=DriverManager.getConnection(url, unm, pwd);
	String sql="insert into  enquiry (name, mob, email, city, age, course)values (?,?,?,?,?,?)";
	psmt=con.prepareStatement(sql);
	psmt.setString(1,nm);
	psmt.setString(2,mob);
	psmt.setString(3,email);
	psmt.setString(4,city);
	psmt.setInt(5,age);
	psmt.setString(6,course);
	int r=psmt.executeUpdate();
	if(r>0)
	{
		out.print("insert sucess");
	}
	else
	{
		out.println("insert failed");
	}
}catch(Exception e)
{
	System.out.println(e);
}


%>
</body>
</html>