<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cater Me Tonight: About us</title>

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
						<li class="active" role="presentation"><a href="#">About</a></li>
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
	<div class="header"></div>
	<div class="aboutUs">
		<div class="container">
			<div class="row padding-top">
				<div class="col-md-offset-3 col-md-6 clear-area">
				
				<h3>About us</h3>
					<div class="inner-clear-area">


<img class="centered" src="images/logo.png" alt="Cater Me Tonight" width="220" height="88"/>

						<form action="Login.do">
							<p>We started this company with visions of one stop shop
								catering for all of your events. Be it a wedding, corporate
								event, family reunion, or even a small gathering with some close
								friends. We wanted to make getting a lot food quickly less of a
								pain, and more of a click-and-forget kind of experience. So we
								got together and after some brain storming came up with the
								revolutionary catering company you see now. "Cater Me Tonight"</p>
							<p>Using, "Cater Me Tonight" getting food for your 120 person
								wedding is as easy as logging in, selecting a cuisine, selecting
								how many courses you want, and selecting the food! Your order is
								sent to our kitchen, and our world class chefs will whip it up
								lickety-split and have it at your front door faster than you can
								say, "What on earth did we do to cater our events before Cater
								Me Tonight?"</p>
								
								<input type="hidden" name="username"
							value="${user.username}"> <input
							type="hidden" name="password"
							value="${user.password}"> <input
							type="submit" class="btn btn-primary btn-md" value="Home">
					</div>
				</div>
			</div>
		</div>


		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
