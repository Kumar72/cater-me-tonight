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
					<a class="navbar-brand navbar-link" href="#"><img
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
						<li class="active" role="presentation"><a href="About.do">About</a></li>
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
			<div class="col-md-offset-3 col-md-6 clear-area">
				<form action="SubmitOrder.do">
					<h2>Items in shopping cart</h2>
			<c:forEach var="item" items="${shoppingCart.orderItemsAddedToCart}">
			${item.value.menuItem.name}, ${item.value.quantity} $${item.value.totalForOrderItem}<br>
			</c:forEach>
			<hr>
			Cart Total: $${shoppingCart.runningTotalOfOrderItems()}
			
				<h2>CreditCard chosen</h2>
				<em>Name on card:</em> <strong>${ creditcard.fullName}</strong><br>
				<em>Credit Card number:</em> <strong>${ creditcard.creditcardNumber}</strong>
											
				<h2>Address chosen</h2>
				<em>Delivery address:</em><strong>${ address.streetAddress}</strong> <br>
				<em>Delivery Zip Code:</em><strong>${ address.postalCode}</strong> <br>
				<em>Delivery City:</em> <strong>${ address.city}</strong><br>
				<em>Delivery State:</em> <strong>${ address.state}</strong><br>
				
						<input type="submit" class="btn btn-primary btn-md" value="Submit Order">
					</div>
				</form>
			</div>

		</div>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
