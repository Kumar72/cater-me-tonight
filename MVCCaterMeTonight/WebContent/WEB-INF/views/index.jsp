<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chumly</title>

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="fonts/ionicons.min.css">
    <link rel="stylesheet" href="css/Navigation-Clean1.css">
    <link rel="stylesheet" href="css/master.css">
   <link href="https://fonts.googleapis.com/css?family=Finger+Paint|Fontdiner+Swanky|Irish+Grover|Mystery+Quest" rel="stylesheet">

</head>

<body>
	<div>
		<nav class="navbar navbar-default navigation-clean">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand navbar-link" href="#"><strong>Chumly
					</strong></a>
					<button class="navbar-toggle collapsed" data-toggle="collapse"
						data-target="#navcol-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="navcol-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="active" role="presentation"><a href="#"> </a></li>
						<li role="presentation"><a href="#"> </a></li>
						<li role="presentation"><a href="#"> </a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" aria-expanded="false" href="#"> </a>
							<ul class="dropdown-menu" role="menu">
								<li role="presentation"><a href="#">First Item</a></li>
								<li role="presentation"><a href="#">Second Item</a></li>
								<li role="presentation"><a href="#">Third Item</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	
	<div class="login-dark">
		<form id="user" action="login.do" method="POST">
			<h2 class="sr-only">Login Form</h2>
			<div class="illustration">
				<i class="icon ion-ios-locked-outline"></i>
			</div>
			<div class="form-group">
				<input id="username" name="username" placeholder="username" class="form-control" type="text" value=""/>
			</div>
			
			<br />
			<div class="form-group">
				<input id="password" name="password" placeholder="password" type="password" class="form-control" value=""/>
			</div>
			
			<br />
			<button class="btn btn-primary btn-block" type="submit">Log
				In</button>
			<a href="createUser.do" class="forgot">Create User</a>
		</form>

	<p>A friend knows the song in my heart and sings it to me when my memory fails.</p>
	</div>
	
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
