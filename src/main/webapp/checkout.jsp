<%@page import="com.mycompany.ebookstore.entities.*"%>
<%
	User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! login first to access checkout page");
	response.sendRedirect("login.jsp");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark custom-bg justify-content-between">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active "><a class="nav-link"
				href="index.jsp"><i class="fa fa-home mr-1 " aria-hidden="true"></i>Home</a></li>

		</ul>

		<ul class="navbar-nav ">
			<li class="nav-item active"><a class="nav-link" href=" #!"><i
					class="fa fa-user mr-1" aria-hidden="true"></i><%=user.getUserName()%></a>
			</li>

			<li class="nav-item active"><a class="nav-link text-danger"
				href="logout.jsp"><i class="fa fa-sign-out"></i>Logout</a></li>


		</ul>
	</nav>
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<!-- card -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-5">Your selected books</h3>
						<div class="cart-body"></div>
					</div>
				</div>

			</div>
			<div class="col-md-6">
				<!-- form details -->
				<div class="card">
				<div class="card-header custom-bg text-white">
						<h3 style="text-align: center;">Your details for order</h3>

					</div>
					<div class="card-body">
						
						<form action="#!">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" value="<%=user.getUserEmail()%>"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="name">Your name</label> <input type="text"
									value="<%=user.getUserName()%>" class="form-control" id="name"
									placeholder="Enter name">
							</div>
							<div class="form-group"><label for="phone">Your phone number</label>
								<input name="user_phone" value="<%=user.getUserPhone()%>"
									type="number" class="form-control" id="phone"
									placeholder="Enter your contact number">
							</div>
							<div class="form-group">
								<label for="address">Your shipping address</label>
								<textarea class="form-control" id="address"
									placeholder="Enter your address" rows="3"></textarea>
							</div>
							<div class="container text-center">
								<button class="btn btn-outline-success">Order Now</button>
								<button class="btn btn-outline-primary">Continue
									Shopping</button>
							</div>

						</form>
					</div>
				</div>



			</div>
		</div>
	</div>



	<%@include file="components/common_modals.jsp"%>
</body>
</html>