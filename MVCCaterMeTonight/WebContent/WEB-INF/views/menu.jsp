
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
	<container>
	<div class="row padding-top">
		<div class="col-md-offset-3 col-md-6 clear-area">
			<div class="menuItems">
				<c:if test="${appetizerItems !=null }">
					<div id="appetizerMenuItems">
						<h2>
							Appetizers
							</h3>
							<c:forEach items="${appetizerItems}" var="appItem">
								<ul>
									<li>${appItem.name},<%-- ${appItem.description}, --%>
										${appItem.price}
									</li>
									<input type="number" min="0" value="0" />
									<button>Add ${appetizerItem.name}</button>
									<br>
								</ul>
							</c:forEach>
					</div>
				</c:if>
				<c:if test="${entreeItems !=null }">
					<div id="entreeMenuItems">
						<h2>
							Entreés
							</h3>
							<c:forEach items="${entreeItems}" var="entreeItem">
								<ul>
									<li>${entreeItem.name},<%-- ${entreeItem.description}, --%>
										${entreeItem.price}
									</li>
									<input type="number" min="0" value="0" />
									<button>Add ${entreeItem.name} To Order</button>
									<br>
								</ul>
							</c:forEach>
					</div>
				</c:if>
				<c:if test="${dessertItems !=null }">
					<div id="dessertMenuItems">
						<h2>
							Desserts
							</h3>
							<c:forEach items="${dessertItems}" var="dessertItem">
								<ul>
									<li>${dessertItem.name},<%-- ${dessertItem.description}, --%>
										${dessertItem.price}
									</li>
									<input type="number" min="0" value="0" />
									<button>Add ${dessertItem.name} To Order</button>
									<br>
								</ul>
							</c:forEach>
					</div>
				</c:if>

				<c:if test="${drinkItems !=null }">
					<div id="drinkMenuItems">
						<h2>
							Drinks
							</h3>
							<c:forEach items="${drinkItems}" var="drinkItem">
								<ul>
									<li>${drinkItem.name},<%-- ${drinkItem.description},  --%>
										${drinkItem.price}
									</li>
									<input type="number" min="0" value="0" />
									<button>Add ${drinkItem.name} To Order</button>
									<br>
								</ul>
							</c:forEach>
					</div>
				</c:if>
			</div>
			<!--closing div tag for menuItems  -->
		</div>
	</div>
	</container>
</body>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</html>
