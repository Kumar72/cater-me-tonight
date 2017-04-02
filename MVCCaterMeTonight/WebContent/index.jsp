<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
</head>
<body>
Welcome to the Film Management System

<form action="GetFilm.do" method="GET">
	<input type="text" name="id"/>
	<input type="submit" value="Get Film"/>

</form>
<form action="GetFilms.do" method="GET">
	<input type="submit" value="Get All Films"/>
</form>

</body>
</html>