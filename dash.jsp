<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:#f4f6f9;
    font-family:Arial, Helvetica, sans-serif;
}

.sidebar{
    width:240px;
    height:100vh;
    position:fixed;
    background:#0d6efd;
}

.sidebar h3{
    color:#fff;
    text-align:center;
    padding:25px 0;
    border-bottom:1px solid rgba(255,255,255,.2);
}

.sidebar a{
    display:block;
    color:#fff;
    text-decoration:none;
    padding:15px 25px;
    font-size:17px;
}

.sidebar a:hover{
    background:rgba(255,255,255,.2);
}

.content{
    margin-left:240px;
}

.topbar{
    background:#fff;
    padding:15px 30px;
    box-shadow:0 2px 8px rgba(0,0,0,.1);
}

.dashboard-card{
    border:none;
    border-radius:15px;
    color:white;
    padding:20px;
    box-shadow:0 5px 12px rgba(0,0,0,.15);
}

.blue{background:#0d6efd;}
.green{background:#198754;}
.orange{background:#fd7e14;}
.red{background:#dc3545;}

.dashboard-card h2{
    font-weight:bold;
}

.dashboard-card p{
    margin:0;
    font-size:18px;
}

.table-box{
    background:#fff;
    border-radius:12px;
    padding:20px;
    margin-top:30px;
    box-shadow:0 3px 10px rgba(0,0,0,.1);
}

</style>

</head>

<body>

<div class="sidebar">

<h3>Dashboard</h3>

<a href="#">🏠 Home</a>
<a href="#">👨 Students</a>
<a href="#">📚 Courses</a>
<a href="#">📝 Enquiry</a>
<a href="#">👤 Profile</a>
<a href="#">🚪 Logout</a>

</div>

<div class="content">

<div class="topbar d-flex justify-content-between">
<h4>Welcome Admin</h4>
<h5>Dashboard</h5>
</div>

<div class="container mt-4">

<div class="row">

<div class="col-md-3">
<div class="dashboard-card blue">
<h2>120</h2>
<p>Total Students</p>
</div>
</div>

<div class="col-md-3">
<div class="dashboard-card green">
<h2>45</h2>
<p>Total Courses</p>
</div>
</div>

<div class="col-md-3">
<div class="dashboard-card orange">
<h2>32</h2>
<p>Enquiries</p>
</div>
</div>

<div class="col-md-3">
<div class="dashboard-card red">
<h2>15</h2>
<p>New Admissions</p>
</div>
</div>

</div>

<br>

<!-- Modal Button -->

<button type="button"
class="btn btn-primary"
data-bs-toggle="modal"
data-bs-target="#exampleModal">
Launch Demo Modal
</button>

<!-- Modal -->

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">

<div class="modal-dialog">

<div class="modal-content">

<div class="modal-header">

<h5 class="modal-title" id="exampleModalLabel">
Student Information
</h5>

<button type="button"
class="btn-close"
data-bs-dismiss="modal"></button>

</div>

<div class="modal-body">

<form action="res.jsp" method="get">

<div class="model-body">
<label class="form-label">Student Name</label>
<input type="text" name="nm" required  class="form-control">

<label class="form-label">Seat no</label>
<input type="number" name="seatno" required  class="form-control">

<label class="form-label">Enter English marks</label>
<input type="number" min="0" max="100" required name="eng" class="form-control">

<label class="form-label">Enter Marathi marks</label>
<input type="number" min="0" max="100" required  name="mar" class="form-control">

<label class="form-label">Enter Physics marks</label>
<input type="number" min="0" max="100" required  name="phy" class="form-control">

<label class="form-label">Enter Chemistry marks</label>
<input type="number" min="0" max="100" required name="chem" class="form-control">

<label class="form-label">Enter Maths marks</label>
<input type="number" min="0" max="100" required  name="math" class="form-control">


</div>




</div>

<div class="modal-footer">
 
<button type="submit"
class="btn btn-secondary"
>
Add results
</button>


</div>

</div>

</div>

</div>
</form>

<div class="table-box">

<h4 class="mb-3">Student Results</h4>

<table class="table table-bordered table-hover">

<thead class="table-primary">

<tr>
<th>ID</th>
<th>Roll no</th>
<th>Name</th>
<th>English</th>
<th>Marathi</th>
<th>Physics</th>
<th>Chemistry</th>
<th>Maths</th>
<th>TOtal</th>
<th>Percentage</th>
<th>Grade</th>
<th>Result</th>
</tr>

</thead>

<%
Connection con;
Statement stmt;
ResultSet rs;
try
{
	Class.forName("org.postgresql.Driver");
	String url="jdbc:postgresql://localhost:5432/demostud";
	String unm="postgres";
	String pwd="Sam1625";
	con=DriverManager.getConnection(url, unm, pwd);
	stmt=con.createStatement();
	rs= stmt.executeQuery("select * from studres");
	while(rs.next()){
	%>
	
	<tbody>
	<tr>
	<td><%=rs.getInt("id") %></td>
	<td><%=rs.getInt("seatno") %></td>
	<td><%=rs.getString("name") %></td>
	<td><%=rs.getInt("eng") %></td>
	<td><%=rs.getInt("mar") %></td>
	<td><%=rs.getInt("phy") %></td>
	<td><%=rs.getInt("chem") %></td>
	<td><%=rs.getInt("math") %></td>
	<td><%=rs.getInt("ttl") %></td>
	<td><%=rs.getFloat("per") %></td>
	<td><%=rs.getString("grd") %></td>
	<td><%=rs.getString("res") %></td>
	</tr>
	</tbody>
	
		
	
	<%
	}
}
catch(Exception e)
{
	System.out.println(e);
}

%>


</table>

</div>

</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>