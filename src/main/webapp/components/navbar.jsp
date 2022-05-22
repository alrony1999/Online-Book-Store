<%@page import="com.mycompany.ebookstore.entities.User"%>
<%
	User u = (User) session.getAttribute("current-user");
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg ">
	<%
		if (u == null || u.getUserType().equals("normal")) {
	%>
	<div class="container col-12">

		<a class="navbar-brand" href="about.jsp">Contact Us</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active "><a class="nav-link"
					href="index.jsp"><i class="fa fa-home mr-1 " aria-hidden="true"></i>Home
						<span class="sr-only">(current)</span></a></li>

			</ul>

			<ul class="navbar-nav ml-auto">

				<li class="nav-item active"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#cart"> <i
						class=" fa fa-cart-plus" style="font-size: 20px;"> </i><span
						class="ml-1 cart-items">(0)</span>
				</a></li>


				<%
					if (u == null) {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="login.jsp"> <i class="fa fa-sign-in" aria-hidden="true"
						style="font-size: 20px;"> </i><span class="ml-1 ">Login</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="register.jsp"> <i class="fa fa-registered"
						aria-hidden="true" style="font-size: 20px;"> </i><span
						class="ml-1">Register</span>
				</a></li>

				<%
					} else {
				%>
				<li class="nav-item active"><a class="nav-link"
					href=" #!"><i
						class="fa fa-user mr-1" aria-hidden="true"></i><%=u.getUserName()%></a>
				</li>
				<li class="nav-item active"><a class="nav-link text-danger"
					href="logout.jsp"><i class="fa fa-sign-out"></i>Logout</a></li>
				<%
					}
				%>


			</ul>
		</div>

	</div>

	<%
		} else {
	%>

	<ul class="navbar-nav mr-auto">
		<li class="nav-item active "><a class="nav-link" href="index.jsp"><i
				class="fa fa-home mr-1 " aria-hidden="true"></i>All Book</a></li>

	</ul>
	<ul class="navbar-nav mr-auto">
		<li class="nav-item active "><a class="nav-link" href="admin.jsp"><i
				class="fa fa-user mr-1 " aria-hidden="true"></i>Admin Panel</a></li>

	</ul>
	<ul class="navbar-nav ">

		<li class="nav-item active"><a class="nav-link"
			href="#"><i
				class="fa fa-user mr-1" aria-hidden="true"></i>ADMIN</a></li>
		<li class="nav-item active"><a class="nav-link text-danger"
			href="logout.jsp"><i class="fa fa-sign-out"></i>Logout</a></li>


	</ul>

	<%
		}
	%>
</nav>
