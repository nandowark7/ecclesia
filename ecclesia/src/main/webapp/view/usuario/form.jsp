<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Ecclesia - Sistema para Igrejas</title>

<!-- Bootstrap Core CSS -->
<link
	href="/static/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/static/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/static/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="/static/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Novo Usu�rio - Sistema Ecclesia</h3>
					</div>
					<div class="panel-body">

						<form action="/usuario/" method="POST">
						<fieldset>
						
						<div class="form-group" for="nome">
                                    <input  name="nome" class="form-control" type="text" placeholder="Informe seu Nome">
                         </div>
                         <div class="form-group" for="username">
                                    <input  name="username" class="form-control" type="text" placeholder="Informe o Login">
                         </div>
                         <div class="form-group" for="password">
                                    <input  name="password" class="form-control" type="password" placeholder="Informe uma Senha">
                         </div>
                          <input type="submit" name="submit" id="submit" class="btn-lg btn-success btn-block" value="Criar">
																					
							</fieldset>
						</form>

						
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="/static/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="/static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/static/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/static/dist/js/sb-admin-2.js"></script>

</body>

</html>

