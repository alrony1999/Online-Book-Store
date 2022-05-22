<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mycompany.ebookstore.dao.*"%>
<%@page import="com.mycompany.ebookstore.helper.*"%>
<%@page import="com.mycompany.ebookstore.entities.*"%>
<%@page import="java.util.List"%>

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
<title>Book Operation</title>
<%@include file="components/common_css_js.jsp"%>

<style>
.cat-card:hover {
	background: #e2e2e2;
	cursor: pointer;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	width: 100px;
	margin: auto;
	text-align: center;
	font-family: arial;
}
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
	<%-- <%@include file="components/navbar.jsp"%> --%>
	 <div class="container-fluid">
		<div class="row mt-3 mx-2">

			<%
				String cat = request.getParameter("cat_id");
			BookDao dao = new BookDao(FactoryProvider.getFactory());
			List<Book> list = null;
			if (cat == null) {
				list = dao.getAllBooks();

			} else {

				int cid = Integer.parseInt(cat.trim());
				list = dao.getAllBooksById(cid);
			}

			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist = cdao.getCategories();
			%>


			<!-- show Categories -->

			<div class="col-md-2 ">
				<div class="container-fluid mt-3">
					<%@include file="components/message.jsp"%>
				</div>
				<div class="list-group mt-4">
					<a href="#!" class="list-group-item list-group-item-action active">
						All Categories </a>


					<%
						for (Category c : clist) {
					%>

					<a href="adminbookoperation.jsp?cat_id=<%=c.getCategoryId()%>"
						class="list-group-item list-group-item-action cat-card"><%=c.getCategoryTitle()%></a>

					<%
						}
					%>
				</div>

			</div>

			<!-- show Books -->

			<div class="col-md-10">

				<div class="row mt-4">

					<div class="col-md-12">

						<div class="card-columns">

							<!-- traversing books -->

							<%
								for (Book b : list) {
							%>

							<!-- book card -->

							<div class="card ">


								<div class="container">
									<img src="img/books/<%=b.getbPhoto()%>"
										style="max-height: 100px; max-width: 50%; width: auto;"
										class="card-img-top" mt-2 alt="Card image cap">
								</div>

								<div class="card-body">

									<h6 class="card-title">
										<%=b.getbName()%></h6>
									<%-- <h6>
										Written by :
										<%=b.getbAuthor()%></h6> --%>
								</div>

								<div class="card-footer link"">

									<button class="btn btn-outline">
										&#2547
										<%=b.getPriceAfterApplyingDiscount()%>/- <span
											class="text-secondary discount-label"> &#36; <%=b.getbPrice()%>,<%=b.getbDiscount()%>
											off
										</span>
									</button>

								</div>
								<div class="container text-center">
									<button class="btn btn-outline-success">
										<a style="text-decoration: none;" href="editbook.jsp?book_id=<%=b.getbId()%>">Edit</a>
									</button>
									
									<button class=" btn btn-outline-danger ">
										<a style="text-decoration: none;" href="DeleteServlet?book_id=<%=b.getbId()%>">Delete</a>
									</button>
								</div>

							</div>

							<%
								}

							if (list.size() == 0) {
							out.println("<h3> No Book in this Category</h3>");
							}
							%>

						</div>

					</div>

				</div>
			</div>
		</div>
	</div> 

</body>
</html>