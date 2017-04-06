<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
			<div class="col-md-offset-1 col-md-6 clear-area">
			<h1 class="text-centered">Menu</h1>
				<div class="menuItems">
					<c:if test="${appetizerItems !=null }">
						<div id="appetizerMenuItems" class="inner-clear-area">
							<h2>Appetizers</h2>
							<c:forEach items="${appetizerItems}" var="appItem">
								<form action="ItemsAddedToShoppingCart.do">
									<input type="hidden" name="kitchenId" value="${kitchenId}">
									<input type="hidden" name="menuItemId" value="${appItem.id}">
									<div class="media">
										<div class="media-left">
										<a href="#"> <img style="width: 110px; height: 110px" 
										src="${appItem.picture}" alt="${appItem.name}" ></a>
										</div>
										<div class="media-body">
											<h4 class="media-heading">${appItem.name}
												$${appItem.price}</h4>
											<p>${appItem.description}</p>
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
											<input type="submit" value="Add to order" />
										</div>
									</div>


								</form>
							</c:forEach>
						</div>
					</c:if>
					<c:if test="${entreeItems !=null }">
						<div id="entreeMenuItems" class="inner-clear-area">
							<h2>Entreés</h2>
							<c:forEach items="${entreeItems}" var="entreeItem">
								<form action="ItemsAddedToShoppingCart.do">
									<input type="hidden" name="kitchenId" value="${kitchenId}">
									<input type="hidden" name="menuItemId" value="${entreeItem.id}">
									<div class="media">
										<div class="media-left">
										<a href="#"> <img style="width: 110px; height: 110px" 
										src="${entreeItem.picture}" alt="${entreeItem.name}" ></a>
										</div>
										<div class="media-body">
											<h4 class="media-heading">${entreeItem.name}
												$${entreeItem.price}</h4>
											<p>${entreeItem.description}</p>
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
											<input type="submit" value="Add to order" />
										</div>
									</div>


								</form>
							</c:forEach>
						</div>
					</c:if>
					<c:if test="${dessertItems !=null }">
						<div id="dessertMenuItems" class="inner-clear-area">
							<h2>Desserts</h2>
							<c:forEach items="${dessertItems}" var="dessertItem">
								<form action="ItemsAddedToShoppingCart.do">
									<input type="hidden" name="kitchenId" value="${kitchenId}">
									<input type="hidden" name="menuItemId" value="${dessertItem.id}">
									<div class="media">
										<div class="media-left">
										<a href="#"> <img style="width: 110px; height: 110px" 
										src="${dessertItem.picture}" alt="${dessertItem.name}" ></a>
										</div>
										<div class="media-body">
											<h4 class="media-heading">${dessertItem.name}
												$${dessertItem.price}</h4>
											<p>${dessertItem.description}</p>
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
											<input type="submit" value="Add to order" />
										</div>
									</div>


								</form>
							</c:forEach>
						</div>
					</c:if>
					<c:if test="${drinkItems !=null }">
						<div id="drinkMenuItems" class="inner-clear-area">
							<h2>Desserts</h2>
							<c:forEach items="${drinkItems}" var="drinkItem">
								<form action="ItemsAddedToShoppingCart.do">
									<input type="hidden" name="kitchenId" value="${kitchenId}">
									<input type="hidden" name="menuItemId" value="${drinkItem.id}">
									<div class="media">
										<div class="media-left">
										<a href="#"> <img style="width: 110px; height: 110px" 
										src="${drinkItem.picture}" alt="${drinkItem.name}" ></a>
										</div>
										<div class="media-body">
											<h4 class="media-heading">${drinkItem.name}
												$${drinkItem.price}</h4>
											<p>${drinkItem.description}</p>
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
											<input type="submit" value="Add to order" />
										</div>
									</div>


								</form>
							</c:forEach>
						</div>
					</c:if>
					
				</div>
				<!--closing div tag for menuItems  -->
			</div>
			<div class="shopping-cart col-md-4 clear-area ">
				<table class="table inner-clear-area">
					<caption>
						<h3>Shopping Cart</h3>
					</caption>
					<thead>
						<tr>
							<th>Item</th>
							<th>Quantity</th>
							<th>Total</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item"
							items="${shoppingCart.orderItemsAddedToCart}">
							<tr>
								<td>${item.value.menuItem.name}</td>
								<td>${item.value.quantity}</td>
								<td><fmt:formatNumber
										value="${item.value.totalForOrderItem}" type="currency" /></td>
								<td><form action="RemoveItemsFromCart.do" method="GET">
										<input type="hidden" name="menuItemId"
											value="${item.value.menuItem.id}" /> <input type="submit"
											value="Remove Item" />
									</form></td>
							</tr>
						</c:forEach>

					</tbody>
					<tfoot>
						<tr>
							<td colspan="3">Cart Total</td>
							<td><fmt:formatNumber
									value="${shoppingCart.runningTotalOfOrderItems()}"
									type="currency" /></td>
						</tr>
					</tfoot>
				</table>

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
