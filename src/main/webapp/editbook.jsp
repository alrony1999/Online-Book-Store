<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mycompany.ebookstore.dao.*"%>
<%@page import="com.mycompany.ebookstore.helper.*"%>
<%@page import="com.mycompany.ebookstore.entities.*"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.*"%>

<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !!");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You are not admin!Do not access this page");
		response.sendRedirect("index.jsp");
		return;
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edition</title>
<%@include file="components/common_css_js.jsp"%>

<style>

</style>
</head>
<body>

	<nav
		class="navbar navbar-expand-lg navbar-dark custom-bg justify-content-between">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active "><a class="nav-link"
				href="adminbookoperation.jsp"><i class="fa fa-home mr-1 "
					aria-hidden="true"></i>All Book</a></li>

		</ul>
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active "><a class="nav-link"
				href="admin.jsp"><i class="fa fa-user mr-1 " aria-hidden="true"></i>Admin
					Panel</a></li>

		</ul>
		<ul class="navbar-nav ">

			<li class="nav-item active"><a class="nav-link"
				href="profile.jsp?user_id=<%=user.getUserId()%> "><i
					class="fa fa-user mr-1" aria-hidden="true"></i>ADMIN</a></li>
			<li class="nav-item active"><a class="nav-link text-danger"
				href="logout.jsp"><i class="fa fa-sign-out"></i>Logout</a></li>


		</ul>
	</nav>
 
	<div class="container col-3 mt-3">

		<%
		int bookId = Integer.parseInt(request.getParameter("book_id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		Book book = (Book) s.get(Book.class, bookId);
		%>
		<div  class="card ">
			 <div class="container mt-1 text-center">
				<img src="img/books/<%=book.getbPhoto()%>"
					style="max-height: 200px; max-width: 100%; width: auto;"
					class="card-img-top" mt-2 alt="Card image cap">
			</div>

			<form action="UpdateServlet" method="post" enctype="multipart/form-data">
				<input value="<%=book.getbId()%> " name="book_id"  type="hidden" />
				<div class="card-body">


					<div class="form-group">
						<label for="bookname">Book Name</label> <input name="bName"
							type="text" class="form-control" id="title"
							placeholder="Edit here" value="<%=book.getbName()%> " >
					</div>

					<div class="form-group">
						<label for="bookprice">Book Price</label> <input type="number"
							class="form-control" name="bPrice"
							placeholder="Edit here" value="<%=book.getbPrice()%>"  >
					</div>
					<div class="form-group">
						<label for="bookdiscount">Book Discount</label> <input type="number"
							class="form-control" name="bDiscount"
							placeholder="Edit here"
							value="<%=book.getbDiscount()%>" >
					</div>
					<div class="form-group">
						<label for="bookquantity">Book Quantity</label> <input type="number"
							class="form-control" name="bQuantity"
							placeholder="Edit here"
							value="<%=book.getbQuantity()%>" required >
					</div>

				</div>
				<div class="card-footer text-center">
					<div class="container text-center ">

						<button type="submit" class="btn btn-success">SAVE</button>
						<button class="btn btn-secondary" data-dismiss="modal">Close</button>

					</div>
				</div>
			</form>
		</div>
	</div> 

</body>
</html>