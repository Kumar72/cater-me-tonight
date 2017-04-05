
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu</title>

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
					<li role="presentation"><a href="Logout.do">Logout</a></li>

				</ul>
			</div>
		</div>
		</nav>
	</div>
	<div class="container">
	<div class="row padding-top">
		<div class="col-md-offset-2 col-md-6 clear-area">
			<div class="menuItems">
				<c:if test="${appetizerItems !=null }">
					<div id="appetizerMenuItems">
						<h2>Appetizers</h2>
						<c:forEach items="${appetizerItems}" var="appItem">
							<form action="ItemsAddedToShoppingCart.do">
								<input type="hidden" name="kitchenId" value="${kitchenId}">
								<input type="hidden" name="menuItemId" value="${appItem.id}">
								<ul>
									<li>${appItem.name},${appItem.description},
										${appItem.price}, <img style="width: 25%"
										src="${appItem.picture}" />
									</li>
								</ul>
								<c:choose>
									<c:when
										test="${not empty shoppingCart.orderItemsAddedToCart[appItem.id]}">
									Quantity<input type="number" name="quantity" min="0"
											value="${shoppingCart.orderItemsAddedToCart[appItem.id].quantity}">
									</c:when>
									<c:otherwise>
									Quantity<input type="number" name="quantity" min="0" value="0">

									</c:otherwise>
								</c:choose>
								<input type="submit" value="Add to order" /> <br>
							</form>
						</c:forEach>
					</div>
				</c:if>
				<c:if test="${entreeItems !=null }">
					<div id="entreeMenuItems">
						<h2>Entreés</h2>
						<c:forEach items="${entreeItems}" var="entreeItem">
							<form action="ItemsAddedToShoppingCart.do">
								<input type="hidden" name="kitchenId" value="${kitchenId}">
								<input type="hidden" name="menuItemId" value="${entreeItem.id}">
								<ul>
									<li>${entreeItem.name},${entreeItem.description},
										${entreeItem.price}, <img style="width: 25%"
										src="${entreeItem.picture}" />
									</li>
								</ul>
								<c:choose>
									<c:when
										test="${not empty shoppingCart.orderItemsAddedToCart[entreeItem.id]}">
									Quantity<input type="number" name="quantity" min="0"
											value="${shoppingCart.orderItemsAddedToCart[entreeItem.id].quantity}">
									</c:when>
									<c:otherwise>
									Quantity<input type="number" name="quantity" min="0" value="0">

									</c:otherwise>
								</c:choose>
								<input type="submit" value="Add to order" /> <br>
							</form>
						</c:forEach>
					</div>
				</c:if>
				<c:if test="${dessertItems !=null }">
					<div id="dessertMenuItems">
						<h2>Desserts</h2>
						<c:forEach items="${dessertItems}" var="dessertItem">
							<form action="ItemsAddedToShoppingCart.do">
								<input type="hidden" name="kitchenId" value="${kitchenId}">
								<input type="hidden" name="menuItemId" value="${dessertItem.id}">
								<ul>
									<li>${dessertItem.name},${dessertItem.description},
										${dessertItem.price}, <img style="width: 25%"
										src="${dessertItem.picture}" />
									</li>
								</ul>
								<c:choose>
									<c:when
										test="${not empty shoppingCart.orderItemsAddedToCart[dessertItem.id]}">
									Quantity<input type="number" name="quantity" min="0"
											value="${shoppingCart.orderItemsAddedToCart[dessertItem.id].quantity}">
									</c:when>
									<c:otherwise>
									Quantity<input type="number" name="quantity" min="0" value="0">

									</c:otherwise>
								</c:choose>
								<input type="submit" value="Add to order" /> <br>
							</form>
						</c:forEach>
					</div>
				</c:if>
				<c:if test="${drinkItems !=null }">
					<div id="drinkMenuItems">
						<h2>Drinks</h2>
						<c:forEach items="${drinkItems}" var="drinkItem">
							<form action="ItemsAddedToShoppingCart.do">
								<input type="hidden" name="kitchenId" value="${kitchenId}">
								<input type="hidden" name="menuItemId" value="${drinkItem.id}">

								<ul>
									<li>${drinkItem.name},<%-- ${drinkItem.description},  --%>
										${drinkItem.price}
									</li>
								</ul>
								<c:choose>
									<c:when
										test="${not empty shoppingCart.orderItemsAddedToCart[drinkItem.id]}">
									Quantity<input type="number" name="quantity" min="0"
											value="${shoppingCart.orderItemsAddedToCart[drinkItem.id].quantity}">
									</c:when>
									<c:otherwise>
									Quantity<input type="number" name="quantity" min="0" value="0">

									</c:otherwise>
								</c:choose>
								<input type="submit" value="Add to order" /> <br>
							</form>
						</c:forEach>
					</div>
				</c:if>
			</div>
			<!--closing div tag for menuItems  -->
		</div>
		<div class="col-md-3 clear-area">
			<h2>Items in shopping cart</h2>
			<c:forEach var="item" items="${shoppingCart.orderItemsAddedToCart}">
			${item.value.menuItem.name}, ${item.value.quantity} $${item.value.totalForOrderItem}<br>
			</c:forEach>
			<hr>
			Cart Total $${shoppingCart.runningTotalOfOrderItems()}
			<form action="PaymentAndDelivery.do">
			<input type="submit" value="Proceed to payment and delivery" />
			</form>
		</div>
	</div>
	</div>
</body>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</html>
