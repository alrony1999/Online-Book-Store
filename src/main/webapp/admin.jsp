<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.mycompany.ebookstore.entities.*"%>
<%@page import="com.mycompany.ebookstore.dao.*"%>
<%@page import="com.mycompany.ebookstore.helper.*"%>

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

<%
	CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
List<Category> clist = cdao.getCategories();
BookDao bdao = new BookDao(FactoryProvider.getFactory());
List<Book> blist = bdao.getAllBooks();
UserDao udao = new UserDao(FactoryProvider.getFactory());
List<User> ulist = udao.getAllUsers();
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Panel</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark custom-bg justify-content-between">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active "><a class="nav-link"
				href="index.jsp"><i class="fa fa-home mr-1 " aria-hidden="true"></i>Home
					page</a></li>

		</ul>

		<ul class="navbar-nav ">

			<li class="nav-item active"><a class="nav-link" href="# "><i
					class="fa fa-user mr-1" aria-hidden="true"></i>ADMIN</a></li>
			<li class="nav-item active"><a class="nav-link text-danger"
				href="logout.jsp"><i class="fa fa-sign-out"></i>Logout</a></li>


		</ul>
	</nav>
	<%--  <%@include file="components/navbar.jsp"%>  --%>

	<div class="container col-6 admin">
		<div class="h-100 d-inline-block bg-info">
			<div class="container-fluid mt-3">
				<%@include file="components/message.jsp"%>
			</div>

			<!-- first row -->

			<div class="row mt-3">

				<!-- first row first col -->

				<div class="col-md-4">

					<!-- first box -->

					<div class="card">
						<div class="card-body test-center">
							<div class="container text-center">
								<img style="max-width: 100px" class="img-fluid "
									src="img/user.png" alt="user_icon">
							</div>
							<h1 style="text-align: center;"><%=ulist.size()%></h1>
							<h5 class="text-uppercase text-muted text-center">Users</h5>

						</div>
					</div>

				</div>

				<!-- first row second col -->

				<div class="col-md-4">
					<div class="card">
						<div class="card-body test-center">
							<div class="container text-center">
								<img style="max-width: 100px" class="img-fluid "
									src="img/list.png" alt="user_icon">
							</div>
							<h1 style="text-align: center;">
								<%=clist.size()%>
							</h1>
							<h5 class="text-uppercase text-muted text-center">Categories</h5>

						</div>
					</div>

				</div>

				<!-- first row third col -->

				<div class="col-md-4">
					<div class="card">
						<div class="card-body test-center">

							<div class="container text-center">
								<img style="max-width: 100px" class="img-fluid "
									src="img/books.png" alt="user_icon">
							</div>
							<h1 style="text-align: center;"><%=blist.size()%></h1>
							<h5 class="text-uppercase text-muted text-center">Books</h5>

						</div>
					</div>

				</div>
			</div>

			<!-- second row -->

			<div class="row mt-3">

				<!--  second row first col -->
				<div class="col-md-6">
					<div class="card" data-toggle="modal"
						data-target="#add-category-modal">
						<div class="card-body test-center">
							<div class="container text-center">

								<img style="max-width: 100px" class="img-fluid "
									src="img/category.png" alt="user_icon">
							</div>
							<p style="text-align: center;" class="mt-2">Click here to add
								new category</p>
							<h5 class="text-uppercase text-muted text-center">Add
								Category</h5>

						</div>
					</div>
				</div>



				<!--  second row third col -->
				<div class="col-md-6">
					<div class="card" data-toggle="modal" data-target="#add-book-modal">

						<div class="card-body test-center">
							<div class="container text-center">

								<img style="max-width: 100px" class="img-fluid "
									src="img/plus.png" alt="user_icon">
							</div>
							<p style="text-align: center;" class="mt-2">Click here to add
								new books</p>
							<h5 class="text-uppercase text-muted text-center">Add Book</h5>

						</div>
					</div>
				</div>
			</div>
			<div class="row mt-3">

				<div id="edit" class="col-md-12 my-auto ">
					<div class="card ml-6">
						<a style="text-decoration: none;" href="adminbookoperation.jsp">
							<div class="card-body test-center">
								<div class="container text-center">
									<img style="max-width: 100px" class="img-fluid "
										src="img/programmer.png" alt="user_icon">
								</div>

								<h1 class="text-uppercase text-muted text-center">Edit</h1>

							</div>
						</a>
					</div>

				</div>

			</div>
		</div>

	</div>

	<!-- add category modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="add-category-modal" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill category
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="BookOperationServlet" method="post">
						<input type="hidden" name="operation" value="addcategory">

						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter category title" required />
						</div>
						<div class="form-group">
							<textarea style="height: 100px;" class="form-control"
								placeholder="Enter category description" name="catDescription"></textarea>

						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Add</button>
							<button class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
					</form>


				</div>

			</div>
		</div>
	</div>
	<!-- End category model -->
	<!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--!>                                                   
                                                       <!-- book modal --!>
    <!--***********************************************************************************************************************************-->
	<!-- Modal -->
	<div class="modal fade" id="add-book-modal" tabindex="-1" role="dialog"
		aria-labelledby="add-book-modal" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill category
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="BookOperationServlet" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="operation" value="addbook">

						<div class="form-group">
							<input type="text" class="form-control" name="bName"
								placeholder="Enter title of book" required />
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="bAuthor"
								placeholder="Enter AuthorName of book" required />
						</div>

						<div class="form-group">
							<textarea style="height: 50px;" class="form-control"
								placeholder="Enter book description" name="bDesc" required></textarea>

						</div>
						<div>
							<p>Please Select Language of book</p>
							<input type="radio" name="bLanguage" value="English" id="English"
								checked> <label for="English">English</label> <input
								type="radio" name="bLanguage" value="Chinese" id="Chinese">
							<label for="Chinese">Chinese</label> <input type="radio"
								name="bLanguage" value="Bangla" id="Bangla"> <label
								for="Bangla">Bangla</label>

						</div>

						<div class="form-group">
							<input type="number" class="form-control" name="bPrice"
								placeholder="Enter price of book" required />
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="bDiscount"
								placeholder="Enter book discount" required />
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="bQuantity"
								placeholder="Enter book Quantity" required />
						</div>

						<!-- book category -->

						<div class="form-group">
							<select name="catId" class="form-control" id="">
								<%
									for (Category c : clist) {
								%>
								<option value="<%=c.getCategoryId()%>">
									<%=c.getCategoryTitle()%>
								</option>
								<%
									}
								%>
							</select>
						</div>

						<div class="form-control">
							<label for="bPic">Select Picture of book</label> <br> <input
								type="file" name="bPic" required />
						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Add</button>
							<button class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
					</form>


				</div>

			</div>
		</div>
	</div>


	<!-- end book modal -->
</body>
</html>
