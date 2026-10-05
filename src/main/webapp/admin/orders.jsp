<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Orders</title>
<%@include file="allCss.jsp"%>

</head>
<body>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>

	<table class="table table-striped ">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">OrderId</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Ph No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment type</th>
			</tr>
		</thead>

		<tbody>

			<%
			BookOrderImpl dao = new BookOrderImpl(DBConnect.getCon());
			List<Book_Order> blist = dao.getAllOrder();
			for (Book_Order b : blist) {
			%>
			<tr>
				<th scope="row"><%=b.getOrderId()%></th>
				<th scope="row"><%=b.getUserName()%></th>
				<th><%=b.getEmail()%></th>
				<th><%=b.getFulladd()%>></th>
				<th><%=b.getPhno()%>></th>
				<th><%=b.getBookName()%>></th>
				<th><%=b.getAuthor()%></th>
				<th><%=b.getPrice()%></th>
				<th><%=b.getPaymentType()%></th>


			</tr>
			<%
			}
			%>




		</tbody>

	</table>

	<div style="margin-top: 260px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>