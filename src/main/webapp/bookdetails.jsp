<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mycompany.ebookstore.dao.*"%>
<%@page import="com.mycompany.ebookstore.helper.*"%>
<%@page import="com.mycompany.ebookstore.entities.*"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Details</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>
	<%
		int bookId = Integer.parseInt(request.getParameter("book_id").trim());
	BookDao dao = new BookDao(FactoryProvider.getFactory());
	List<Book> list = dao.getBookById(bookId);
	System.out.println(list);
	%>

	<%@include file="components/navbar.jsp"%>


	<div class="container-fluid">
		<%
			for (Book b : list) {
		%>
		<div class="row mt-0 mx-2">

			<div class="col-md-2 mt-1 "></div>
			<div class="col-md-4  mt-3">
				<div class="container mt-1 text-center">
					<img src="img/books/<%=b.getbPhoto()%>"
						style="max-height: 300px; max-width: 100%; width: auto; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); margin: auto; text-align: center;"
						class="card-img-top" mt-2 alt="Card image cap">
				</div>
				<div class="card-body text-center">
					<h3 class="card-title">
						<%=b.getbName()%></h3>
					<h3 class="card-title">
						Written by :<%=b.getbAuthor()%></h3>
					<p class=" text-center mt-0">
						<%=Helper.get10Words(b.getbDesc())%>
					</p>
				</div>

			</div>
			<div style="height: auto;" class="col-md-4 mt-3 ">
				<div class="card" style="width: 18rem;">
					<div class="card-header">Book Details</div>
					<div class="card-body">
						<ul class="list-group list-group-flush">
							<li class="list-group-item ">Book Name :<%=b.getbName()%>
							</li>
							<li class="list-group-item">Written By :<%=b.getbAuthor()%></li>
							<li class="list-group-item">Language :<%=b.getbLanguage()%></li>
							<li class="list-group-item">Original Price :<%=b.getbPrice()%></li>
							<li class="list-group-item">Discount :<%=b.getbDiscount()%>%
							</li>
							<li class="list-group-item">Price After Discount :<%=b.getPriceAfterApplyingDiscount()%></li>
						</ul>
					</div>
					<div class="card-footer text-center">
						<button class="btn btn-primary custom-bg border-0"
							onclick="add_to_cart(<%=b.getbId()%> , '<%=b.getbName()%>' , <%=b.getPriceAfterApplyingDiscount()%> )">Add
							to Cart</button>
					</div>
				</div>
			</div>
			<div class="col-md-2 "></div>
		</div>

		<%
			}
		%>
	</div>
	<%@include file="components/common_modals.jsp"%>
</body>
</html>