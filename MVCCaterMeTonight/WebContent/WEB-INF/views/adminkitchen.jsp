<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cater Me Tonight</title>

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
						src="images/logo.png"> </a>
					<button class="navbar-toggle collapsed" data-toggle="collapse"
						data-target="#navcol-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="navcol-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="active" role="presentation"><a href="About.do">About</a></li>
						<li role="presentation"><a href="Logout.do">Logout</a></li>
						<!--  <li role="presentation"><a href="#">C</a></li>
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
	<container>
	<div class="row padding-top">
		<div class="col-md-offset-3 col-md-6 clear-area">
			<h1>
		
			</h1>
				
			<c:forEach var="menu" items="${selectedMenu}">
				<tbody>
				<tr>
					<img style="width: 25%" src="${menu.picture}" />
					<td></td>
					<td>${menu.name}</td>
					<td>${menu.price}</td>
					<td><button value="UpdateKitchen.do?action=menuId=${menu.id}">EDIT</button>
					<td><button value="RemoveKitchen.do?action=menuId=${menu.id}">DELETE</button>
				</tr>
				<p>${menu.description}</p>
				</tbody>
				<br>
				<p></p>
				<br>
			</c:forEach>
			<!-- <form action="ViewMenuOptions.do" method="GET">
			<label for="kitchenId">Kitchen: </label>
		</form> -->

		</div>
	</div>
	</container>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
