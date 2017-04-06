<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payment And Delivery</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/Navigation-Clean1.css">
<link href="https://fonts.googleapis.com/css?family=Forum"
	rel="stylesheet">
<link rel="stylesheet" href="css/master.css">
<link rel="icon" href="images/favicon.ico">

</head>

<body>

	<div>
		<nav class="navbar navbar-default navigation-clean">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand navbar-link" href="Home.do"><img
						src="images/logo.png" width="125" height="50"> </a>
					<button class="navbar-toggle collapsed" data-toggle="collapse"
						data-target="#navcol-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="navcol-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="active" role="presentation"><a href="#">About</a></li>
						<li role="presentation"><a href="Logout.do">Logout</a></li>

						<!-- <li role="presentation"><a href="#">B</a></li>
						<li role="presentation"><a href="#">C</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" aria-expanded="false" href="#">D</a>
							<ul class="dropdown-menu" role="menu">
								<li role="presentation"><a href="#">First Item</a></li>
								<li role="presentation"><a href="#">Second Item</a></li>
								<li role="presentation"><a href="#">Third Item</a></li>
							</ul></li> -->
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="container">
		<div class="row padding-top">
			<div class="col-md-offset-3 col-md-6">
				<form action="FinalizeOrder.do">
					<div class="row padding-top clear-area">

						Select a saved Credit Card: <select name="creditcardId">
						<option disabled selected value> --select a credit card-- </option>
							<c:forEach var="creditcard" items="${creditcards}">
								<option value="${creditcard.id}">${creditcard.creditcardNumber}</option>
							</c:forEach>
						</select><br>

						<h4>Or add new card</h4>
						<br> <label for="creditcardNumber">CreditCard Number</label>
						<input type="text" name="creditcardNumber"><br> <label
							for="fullName">Name on CreditCard</label> 
							<input type="text" name="fullName"><br> 
							<label>Expiration Date</label> 
							<input type="number" name="expirationMonth">
							<input type="number" name="expirationYear"><br>
							<label for="securityCode">CSV</label>
						    <input type="text" name="securityCode"><br>
							

					</div>

					<div class="row padding-top clear-area">

						Select a saved Address: <select name="addressId"> 
						<option disabled selected value> --select an address-- </option>
						
							<c:forEach var="address" items="${addresses}">
								<option value="${address.id}">${address.streetAddress}</option>
							</c:forEach>
						</select><br>


						<h4>Or add a new delivery address</h4>
						<br> <label for="streetAddress">Street Address</label> <input
							type="text" name="streetAddress"><br> <label
							for="postalCode">ZipCode</label> <input type="text"
							name="postalCode"><br> <label for="city">City</label>
						<input type="text" name="city"><br> <label
							for="state">State</label> <input type="text" name="state"><br>

						<input type="submit" value="Finalize Order">
					</div>
				</form>
			</div>

		</div>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
