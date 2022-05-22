<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mycompany.ebookstore.helper.Helper"%>
<%@page import="com.mycompany.ebookstore.entities.Category"%>
<%@page import="com.mycompany.ebookstore.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ebookstore.entities.Book"%>
<%@page import="com.mycompany.ebookstore.dao.BookDao"%>
<%@page import="com.mycompany.ebookstore.helper.FactoryProvider"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bookstore-home</title>
<%@include file="components/common_css_js.jsp"%>
<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	width: 100px;
	margin: auto;
	text-align: center;
	font-family: arial;
}

.discount-label {
	font-size: 10px !important;
	font-style: italic !important;
	text-decoration: line-through !important;
}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid ">
		<div class="row mt-3 mx-2">

			<%
				String id = request.getParameter("n");
			BookDao dao = new BookDao(FactoryProvider.getFactory());
			List<Book> list = null;
			if (id == null || id.trim().equals("all")) {
				list = dao.getAllBooks();
			} else if(id==null ||id.trim().equals("English")){	
				
				list = dao. getAllBookByLn(id);	
				
			}else if(id==null ||id.trim().equals("Chinese")){	
				
				list = dao. getAllBookByLn(id);	
				
			}else if(id==null ||id.trim().equals("Bangla")){	
				
				list = dao. getAllBookByLn(id);	
				
			}else  {
				
				int cid = Integer.parseInt(id.trim());
				list = dao.getAllBooksById(cid);
			}
			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist = cdao.getCategories();
			%>


			<!-- show Categories -->

			<div class="col-md-2">
				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">All Categories
					</button>

					<div class="dropdown-menu " aria-labelledby="navbarDropdown">

						<%
							for (Category c : clist) {
						%>

						<a href="index.jsp?n=<%=c.getCategoryId()%>"
							class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>

						<%
							}
						%>

					</div>
				</div>
				<div class="dropdown mt-2">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">All Languages
					</button>

					<div class="dropdown-menu " aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="index.jsp?n=English">English</a> 
						<a class="dropdown-item" href="index.jsp?n=Chinese">Chinese</a>
					    <a class="dropdown-item" href="index.jsp?n=Bangla">Bangla</a>
					</div>
				</div>
			</div>


			<!-- show Books -->
			<div class="col-md-10">

				<div class="row mt-1 ">

					<div class="col-md-12">

						<div class="card-columns">

							<!-- traversing books -->

							<%
								for (Book b : list) {
							%>

							<!-- book card -->

							<div class="card book-card">


								<div class="container text-center ">
									<a href="bookdetails.jsp?book_id=<%=b.getbId()%>"><img
										src="img/books/<%=b.getbPhoto()%>"
										style="max-height: 200px; max-width: 100%; width: auto;"
										class="card-img-top mt-2" alt="Card image cap"> </a>
								</div>



								<h6 class="card-title">
									<%=b.getbName()%></h6>
								<h6>
									Written by :
									<%=b.getbAuthor()%></h6>


								<div class="card-footer  link">

									<button style="width: 75%; font-size: 12px;"
										class="btn btn-outline-success ">
										&#36
										<%=b.getPriceAfterApplyingDiscount()%>/- <span
											class="text-secondary discount-label ml-0"> &#36 <%=b.getbPrice()%>
										</span> &nbsp
										<%=b.getbDiscount()%>&#37off
									</button>

									<button style="width: 20%;"
										class="btn custom-bg text-white mt-1 text-center"
										onclick="add_to_cart(<%=b.getbId()%>,'<%=b.getbName()%>',<%=b.getPriceAfterApplyingDiscount()%> )">
										<i class=" fa fa-cart-plus" style="font-size: 12px;"> </i>
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
			<div class="col-md-2">
				
		</div>
	</div>
	<%@include file="components/common_modals.jsp"%>
</body>
</html>

