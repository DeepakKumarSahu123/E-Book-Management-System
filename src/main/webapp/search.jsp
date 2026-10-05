<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Books</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #e8e6e6;
}
</style>
</head>
<body>

	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-3">
			<%
			String ch = request.getParameter("ch");

			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getCon());
			List<BookDtls> list2 = dao2.getBookBySearch(ch);

			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>

						<p>

							<%
							if (b.getBookCategory().equals("Old Book")) {
							%>
							Categories:<%=b.getBookCategory()%>

						</p>
						<div class="row">

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>

						<%
						} else {
						%>
						Categories:<%=b.getBookCategory()%></p>

						<div class="row">
							<div class="d-flex gap-2 flex-nowrap overflow-auto">
								<%
								if (u == null) {
								%>
								<a href="login.jsp"
									class="btn btn-danger btn-sm text-nowrap d-flex align-items-center">
									<i class="fa-solid fa-cart-plus me-1"></i> Add Cart
								</a>
								<%
								} else {
								%>
								<a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>"
									class="btn btn-danger btn-sm text-nowrap d-flex align-items-center">
									<i class="fa-solid fa-cart-plus me-1"></i> Add Cart
								</a>
								<%
								}
								%>

								<a href="view_books.jsp?bid=<%=b.getBookId()%>"
									class="btn btn-success btn-sm text-nowrap d-flex align-items-center">View
									Details</a> <a href=""
									class="btn btn-danger btn-sm text-nowrap d-flex align-items-center"><%=b.getPrice()%>&nbsp;<i
									class="fa-solid fa-indian-rupee-sign"></i></a>
							</div>
						</div>

						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>