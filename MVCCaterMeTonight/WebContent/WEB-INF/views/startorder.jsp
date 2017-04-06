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
<link href="https://fonts.googleapis.com/css?family=Forum" rel="stylesheet">
    <link rel="stylesheet" href="css/master.css">
        <link rel="icon" href="images/favicon.ico">
    
   
</head>

<body>
	<div>
		<nav class="navbar navbar-default navigation-clean">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand navbar-link" href="#"><img src="images/logo.png">
					</a>
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
	<div class="container">
	<div class="row padding-top">
		<div class="col-md-offset-3 col-md-6 clear-area">
		<h1>Start Your Order</h1>
		<form action="ViewMenuOptions.do" method="GET">
			<label for="kitchenId">Kitchen: </label>
			<select name="kitchenId">
			<c:forEach var="kitchen" items="${kitchens}">
				<option value="${kitchen.id}">${kitchen.name}</option>
			</c:forEach>
			</select><br>
			<!--removed users ability to add how many people will be in party, no use for it  -->
			<!-- <label for="numberOfPeople">Number of People in Your Party: </label> 
			<input type="number" min="1" name="numberOfPeople" value="1"/><br> -->
			<label>Include Courses: </label><br>
			<input type="checkbox" name="appetizer" checked/> Appetizer<br>
			<input type="checkbox" name="entree" checked/> Entree<br>
			<input type="checkbox" name="dessert" checked/> Dessert<br>
			<input type="checkbox" name="drink" checked/> Drink<br>
			<input type="submit" value="View Menu Options"/>
		</form>
			
		</div>
    </div>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
