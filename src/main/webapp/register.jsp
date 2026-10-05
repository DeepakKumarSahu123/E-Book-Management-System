<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Register</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration Page</h4>
						
						<!-- It is Display for Success Message -->
						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<!-- It is Display for Failed Message -->
						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session"/>
						</c:if>

						<form action="register" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter your Full Name"
									required="required" name="fname">

							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									required="required" name="email">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Phone No</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp"
									placeholder="Enter your Mobile no." required="required"
									name="phno">

							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Enter your Password" required="required"
									name="password">
							</div>


							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="check"> <label
									class="form-check-label" for="exampleCheck1">Agree
									terms & Conditions</label>
							</div>
							
							<div class="text-center p-2">
								<button type="submit" class="btn btn-primary">Register</button>
							</div>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>
 --%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>EBook: Register</title>

<%@ include file="all_component/allCss.jsp"%>

</head>

<body style="background-color: #f0f1f2">

	<%@ include file="all_component/navbar.jsp"%>

	<div class="container p-2">

		<div class="row">

			<div class="col-md-4 offset-md-4">

				<div class="card">

					<div class="card-body">

						<h4 class="text-center">Registration Page</h4>


						<!-- Success Message -->

						<c:if test="${not empty succMsg}">

							<p class="text-center text-success">${succMsg}</p>

							<c:remove var="succMsg" scope="session" />

						</c:if>


						<!-- Failed Message -->

						<c:if test="${not empty failedMsg}">

							<p class="text-center text-danger">${failedMsg}</p>

							<c:remove var="failedMsg" scope="session" />

						</c:if>


						<form action="register" method="post"
							onsubmit="return validateForm()">


							<!-- Full Name -->

							<div class="form-group">

								<label for="fullName"> Enter Full Name </label> <input
									type="text" class="form-control" id="fullName" name="fname"
									placeholder="Enter your Full Name" minlength="2" maxlength="50"
									pattern="[A-Za-z ]{2,50}"
									title="Name should contain only letters and spaces." required>

							</div>


							<!-- Email -->

							<div class="form-group">

								<label for="email"> Email Address </label> <input type="email"
									class="form-control" id="email" name="email"
									placeholder="example@gmail.com" maxlength="100"
									<%--  pattern="[A-Za-z0-9._%+-]+@gmail\.com"
                                    title="Please enter a valid Gmail address, for example: example@gmail.com"
                                    --%>
                                    pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}"
									title="Please enter a valid email address, for example: example@gmail.com"
									required> <small class="text-muted"> Enter a
									valid email address. </small>

							</div>


							<!-- Phone -->

							<div class="form-group">

								<label for="phone"> Phone No </label> <input type="tel"
									class="form-control" id="phone" name="phno"
									placeholder="Enter 10-digit mobile number" maxlength="10"
									minlength="10" pattern="[6-9][0-9]{9}" inputmode="numeric"
									title="Enter a valid 10-digit Indian mobile number starting with 6, 7, 8 or 9."
									required> <small class="text-muted"> Enter a
									valid 10-digit mobile number. </small>

							</div>


							<!-- Password -->

							<!--	<div class="form-group">

								<label for="password"> Password </label> <input type="password"
									class="form-control" id="password" name="password"
									placeholder="Enter your Password" minlength="8" maxlength="50"
									required> <small class="text-muted"> Minimum 8
									characters with a letter, number and special character. </small>

							</div>

						-->


							<div class="form-group">

								<label for="password"> Password </label> <input type="password"
									class="form-control" id="password" name="password"
									placeholder="Enter your Password" minlength="8" maxlength="50"
									required> <small class="text-muted"> Minimum 8
									characters. You can use letters, numbers and special
									characters. </small>

							</div>


							<!-- Terms and Conditions -->

							<div class="form-check">

								<input type="checkbox" class="form-check-input" id="check"
									name="check"> <label class="form-check-label"
									for="check"> Agree Terms & Conditions </label>

							</div>


							<!-- Register Button -->

							<div class="text-center p-2">

								<button type="submit" class="btn btn-primary">Register

								</button>

							</div>

						</form>

					</div>

				</div>

			</div>

		</div>

	</div>


	<%@ include file="all_component/footer.jsp"%>


	<!-- JavaScript Validation -->

	<script>
		function validateForm() {

			var name = document.getElementById("fullName").value.trim();

			var email = document.getElementById("email").value.trim();

			var phone = document.getElementById("phone").value.trim();

			var password = document.getElementById("password").value;

			var check = document.getElementById("check").checked;

			// Name validation

			var namePattern = /^[A-Za-z ]{2,50}$/;

			if (!namePattern.test(name)) {

				alert("Please enter a valid name.");

				return false;
			}

			// Gmail validation

			//var emailPattern = /^[A-Za-z0-9._%+-]+@gmail\\.com$/;

			var emailPattern = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

			if (!emailPattern.test(email)) {

				alert("Please enter a valid Gmail address.");

				return false;
			}

			// Phone validation

			var phonePattern = /^[6-9][0-9]{9}$/;

			if (!phonePattern.test(phone)) {

				alert("Please enter a valid 10-digit mobile number.");

				return false;
			}

			// Reject repeated digits

			if (/^(\\d)\\1{9}$/.test(phone)) {

				alert("Mobile number cannot contain the same digit repeatedly.");

				return false;
			}

			// Password validation

			/*	var passwordPattern = /^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$/;

				if (!passwordPattern.test(password)) {

					alert("Password must contain at least 8 characters, "
							+ "one letter, one number and one special character.");

					return false;
				}
			 */

			if (password.length < 8) {

				alert("Password must contain at least 8 characters.");

				return false;
			}
			// Terms validation

			if (!check) {

				alert("Please agree to the Terms & Conditions.");

				return false;
			}

			return true;
		}

		// Prevent non-numeric characters in phone field

		document.getElementById("phone").addEventListener("input", function() {

			this.value = this.value.replace(/[^0-9]/g, "");

			if (this.value.length > 10) {
				this.value = this.value.substring(0, 10);
			}

		});
	</script>

</body>

</html>
