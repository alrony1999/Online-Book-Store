<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login - Bookstore</title>
<%@include file="components/common_css_js.jsp"%>


</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container ">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card-md-6 mt-3">
					<div class="card-header custom-bg text-white">
						<h3 style="text-align: center;">Login here</h3>

					</div>
					<div class="card-body">
						<%@include file="components/message.jsp"%>

						<form action="LoginServlet" method="post">
							<div class="form-group">
								<input name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter Your Email">
							</div>
							<div class="form-group">
								<input name="password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Enter Your Password">

							</div>
							<a href="register.jsp" class="text-center d-block mb-3">if
								not registered click here</a>

							<div class="container text-center">
								<button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
								<button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
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