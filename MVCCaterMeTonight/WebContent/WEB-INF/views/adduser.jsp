<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User</title>

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
					<a class="navbar-brand navbar-link" href="Home.do"><img src="images/logo.png" width="125" height="50">
					</a>
					<button class="navbar-toggle collapsed" data-toggle="collapse"
						data-target="#navcol-1">
						<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
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
	<div class="container">
	<div class="row padding-top">
		<div class="col-md-offset-3 col-md-6">
            <div class="form-login">
            <h4>Welcome back.</h4>
            <form action="CreateUser.do" method="get">
            <input type="text" id="username" name="username" class="form-control input-sm chat-input" placeholder="username" />
            </br>
            <input type="test" id="password" name="password" class="form-control input-sm chat-input" placeholder="password" />
            </br>
            <input type="text" id="email" name="email" class="form-control input-sm chat-input" placeholder="email" />
            </br>
            <input type="text" id="firstName" name="firstName" class="form-control input-sm chat-input" placeholder="first name" />
            </br>
            <input type="text" id="lastName" name="lastName" class="form-control input-sm chat-input" placeholder="last name" />
            </br>
            <input type="tel" id="phone" name="phone" class="form-control input-sm chat-input" placeholder="phone number" />
            </br>
            <input type="text" id="pictureUrl" name="pictureUrl" class="form-control input-sm chat-input" placeholder="picture URL" />
            </br>
            
            <div class="wrapper">
            <span class="group-btn"> 
            	<input type="submit" class="btn btn-primary btn-md" value="Add User">
            </span>
            </div>
            </form>
            
            </div>
        
        </div>
		
    </div>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
