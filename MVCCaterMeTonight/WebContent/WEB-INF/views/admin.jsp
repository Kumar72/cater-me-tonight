<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cater Me Tonight</title>

<link rel="stylesheet" href="css/Navigation-Clean1.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
	integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
	integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
	integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
	crossorigin="anonymous"></script>

<link href="https://fonts.googleapis.com/css?family=Forum"
	rel="stylesheet">
<link rel="stylesheet" href="css/master.css">
<link rel="stylesheet" href="css/navBar.css">
<link rel="icon" href="images/favicon.ico">


</head>

<body>

	<div>
		<nav class="navbar navbar-default navigation-clean">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand navbar-link" href="#"><img
						src="images/logo.png"> </a>
					<button class="navbar-toggle collapsed" data-toggle="collapse"
						data-target="#navcol-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
				</div>
				<ul class="nav navbar-right nav-tabs">
					<li class="nav-item"><a class="nav-link active"
						href="KitchenPage.do">Kitchen</a></li>
					<!-- <li class="nav-item"><a class="nav-link" href="#">Appetizer</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Entree</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Dessert</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Drink</a></li> -->
					<li role="presentation"><a href="About.do">About</a></li>
					<li role="presentation"><a href="Logout.do">Logout</a></li>
				</ul>
				<%-- <div class="collapse navbar-collapse" id="navcol-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="active" role="presentation"><a href="#">About</a></li>
						<li role="presentation"><a href="#">${user.username}</a></li>
						<!--  <li role="presentation"><a href="#">C</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" aria-expanded="false" href="#">D</a>
							<ul class="dropdown-menu" role="menu">
								<li role="presentation"><a href="#">First Item</a></li>
								<li role="presentation"><a href="#">Second Item</a></li>
								<li role="presentation"><a href="#">Third Item</a></li>
							</ul></li> -->
					</ul>
				</div> --%>
			</div>
		</nav>
	</div>

	<div class="container">
		<div class="row padding-top">
			<div class="col-md-offset-3 col-md-6 clear-area">
				<h1>Admin Kitchen</h1>
				<form action="CreateKitchen.do" method="GET">
					<button>Create New Kitchen</button>
					<hr>
				</form>
				<label for="kitchenId"></label><br>
				<c:forEach var="kitchen" items="${kitchens}">
					<div class="btn-group">
						<button size=25% type="button"
							class="btn btn-danger dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">
							${kitchen.name}</button>
						
						
						
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

							<a class="dropdown-item"
								href="KitchenController.do?action=All&kitchenId=${kitchen.id}">All</a>
							<div class="dropdown-divider"></div>
						
						
							<a class="dropdown-item"
								href="KitchenController.do?action=Appetizer&kitchenId=${kitchen.id}">Appetizer</a>
							<a class="dropdown-item"
								href="KitchenController.do?action=Entree&kitchenId=${kitchen.id}">Entree</a>
							<a class="dropdown-item"
								href="KitchenController.do?action=Dessert&kitchenId=${kitchen.id}">Dessert</a>
							<a class="dropdown-item"
								href="KitchenController.do?action=Drink&kitchenId=${kitchen.id}">Drink</a>
							<div class="dropdown-divider"></div>
							
							
							
							<a class="dropdown-item"
								href="UpdateKitchen.do?kitchenId=${kitchen.id}">Update</a>
						
							<a class="dropdown-item" href="RemoveKitchen.do?kitchenId=${kitchen.id}"> 
								<c:choose>
									<c:when test="${kitchen.status}">
       									Close
    								</c:when>
    								<c:otherwise>
        								Open
    								</c:otherwise>
    							</c:choose>
    								</a>
    								

						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>