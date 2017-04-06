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
	<div class="container">
	<div class="row padding-top">
		<div class="col-md-offset-1 col-md-3">
            <div class="form-login">
              <label class="control-label" for="inputError">Invalid username or password</label>

            <form action="Login.do" method="get">
            <input type="text" id="username" name="username" class="form-control input-sm chat-input" placeholder="username" />
            </br>
            <input type="text" id="password" name="password" class="form-control input-sm chat-input" placeholder="password" />
            </br>
            <div class="wrapper">
            <span class="group-btn"> 
            	<input type="submit" class="btn btn-primary btn-md" value="Login">
            </span>
            </div>
            </form>
            <form action="AddUser.do">
            <div class="wrapper">
            <span class="group-btn"> 
            	<input type="submit" class="btn btn-primary btn-md" value="Add User">
            </span>
            </div>
            </form>
            </div>
        
        </div>
		<div class="col-md-offset-1 col-md-6 clear-area">
			<h3>Your one stop shop to cater all your corporate and family
				events. We offer same day catering from a wide selection of foods
				from all over the world.</h3>
		</div>
    </div>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
