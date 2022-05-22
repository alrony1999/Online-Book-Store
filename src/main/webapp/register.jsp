<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card-md-6 mt-3">
					<div class="card-header custom-bg text-white">
						<h3 style="text-align: center;">Sigh up here</h3>

					</div>
					<div class="card-body">
						<%@include file="components/message.jsp"%>
						<form action="RegisterServlet" method="post">

							<div class="form-group">
								<input name="user_name" type="text" class="form-control"
									id="name" placeholder="Enter Your Name">
							</div>
							<div class="form-group">
								<input name="user_email" type="email" class="form-control"
									id="email" aria-describedby="emailHelp"
									placeholder="Enter Your Email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<input name="user_password" type="password" class="form-control"
									id="password" placeholder="Enter Your Password"><small
									id="emailHelp" class="form-text text-muted">We'll never
									share your password with anyone else.</small>

							</div>
							<div class="form-group">
								<input name="user_phone" type="number" class="form-control"
									id="phone" placeholder="Enter Your Phone Number">
							</div>
							<div class="form-group">

								<textarea name="user_address" style="height: 50px;"
									class="form-control" placeholder="Enter your address"></textarea>
							</div>
							<div class="container text-center">
								<button class="btn btn-outline-success custom-bg">Register</button>
								<button class="btn btn-outline-warning custom-bg">Reset</button>
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