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
String nm= request.getParameter("nm");
int seatno=Integer.parseInt(request.getParameter("seatno"));
int eng=Integer.parseInt(request.getParameter("eng"));
int mar=Integer.parseInt(request.getParameter("mar"));
int phy=Integer.parseInt(request.getParameter("phy"));
int chem=Integer.parseInt(request.getParameter("chem"));
int math=Integer.parseInt(request.getParameter("math"));

int ttl=eng+mar+phy+chem+math;
int per = ttl/5;
String grd="";
String res="";
if(eng<40 || mar<40 || phy<40 || chem<40 || math<40)
{
	res="Fail";
	grd="D";
	out.println(nm+ "<br>");
	out.println(seatno+ "<br>");
	out.println(eng+ "<br>");
	out.println(mar+ "<br>");
	out.println(phy+ "<br>");
	out.println(chem+ "<br>");
	out.println(math+ "<br>");
	
	out.println("Total:"+ ttl+ "<br>");
	out.println("Percentage: "+ per+ "<br>");
	out.println("Grade:"+ grd+ "<br>");
	out.println("Result:"+ res+ "<br>");
}
else
{
	
if(per>75)
	{	res="pass";
		grd="A+";
	}
	else if(per<=75 && per> 60)
	{
		res="pass";
		grd="A";
	}
	else if (per<=60 && per>50)
	{
		res="pass";
		grd="B";
	}
	else if (per<=50 && per>40)
	{
		res="pass";
		grd="C";
	}
	else 
	{
		res="pass";
		grd="D";
	}
}
out.println(nm+ "<br>");
out.println(seatno+ "<br>");
out.println(eng+ "<br>");
out.println(mar+ "<br>");
out.println(phy+ "<br>");
out.println(chem+ "<br>");
out.println(math+ "<br>");
out.println("Total:"+ ttl+ "<br>");
out.println("Percentage: "+ per+ "<br>");
out.println("Grade:"+ grd+ "<br>");
out.println("Result:"+ res+ "<br>");

Connection con;
PreparedStatement psmt;
try
{
	Class.forName("org.postgresql.Driver");
	String url="jdbc:postgresql://localhost:5432/demostud";
	String unm="postgres";
	String pwd="Sam1625";
	con=DriverManager.getConnection(url, unm, pwd);
	String sql="insert into studres (seatno, name, eng, mar, phy, chem, math, ttl, per, grd, res ) values(?,?,?,?,?,?,?,?,?,?,?)";
	psmt=con.prepareStatement(sql);
	psmt.setInt(1, seatno);
	psmt.setString(2, nm);
	psmt.setInt(3, eng);
	psmt.setInt(4, mar);
	psmt.setInt(5, phy);
	psmt.setInt(6, chem);
	psmt.setInt(7, math);
	psmt.setInt(8, ttl);
	psmt.setFloat(9, per);
	psmt.setString(10, grd);
	psmt.setString(11, res);
	int r=psmt.executeUpdate();
	if(r>0)
	{
		%>
		<script>
		alert("insert success");
		window.location.href="dash.jsp";
		</script>
		<%
		
		//out.println("insert sucess");
		//response.sendRedirect("dash.jsp");
	}
	else
	{
		%>
		<script>
		alert("insert failed");
		window.location.href="dash.jsp";
		</script>
		<%
		
		//out.println("insert failed");
		//response.sendRedirect("dash.jsp");
	}
}catch(Exception e)
{
	System.out.println(e);
}

%>

</body>
</html>