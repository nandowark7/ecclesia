<%@ tag pageEncoding="UTF-8"%>

<%@ attribute name="cssEspecificos" fragment="true" required="false"%>
<%@ attribute name="scriptsEspecificos" fragment="true" required="false"%>



<!DOCTYPE html>
<html lang="pt-br">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Ecclesia - Sistema para Igrejas</title>

<!-- Bootstrap Core CSS -->
<link
	href="../../../../static/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="../../../../static/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Timeline CSS -->
<link href="../../../../static/dist/css/timeline.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../../../../static/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="../../../../static/bower_components/morrisjs/morris.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="../../../../static/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">Ecclesia 1.0 <span style="padding-left:500px">Assembléia de Deus - São Lourenço do Oeste SC</span></a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
<!-- 		
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i>Perfil do Usuário</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i>Configurações</a>
						</li>
						<li class="divider"></li>
						<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>Sair</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="Pesquisar...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div> <!-- /input-group -->
						</li>
						<li><a href="#"><i class="fa fa-desktop"></i>
								MÓDULOS DO SISTEMA</a></li>
						<li><a href="#"><i class="fa fa-folder-open-o"></i> Secretaria<span
								class="fa arrow"></span></a>
							<ul class="nav nav-second-level">

								<li><a href="#"><i class="fa fa-book"></i> Cadastros <span
										class="fa arrow"></span></a>
									<ul class="nav nav-third-level">
										<li><a href="/secretaria/cadastro/cidade/">Cidades</a></li>
										<li><a href="/secretaria/cadastro/regional/">Regionais</a></li>
										<li><a href="/secretaria/cadastro/congregacao/">Congregações</a></li>
										<li><a href="/secretaria/cadastro/pessoa/">Membros</a></li>
										<li><a href="#">Famílias</a></li>
										<li><a href="#">Visitantes</a></li>
									</ul> <!-- /.nav-third-level --></li>
								<li><a href="#"class="fa fa-file-o"> Relatórios <span ></span></a>
									<ul class="nav nav-third-level">
										<li><a href="#">Congregações</a></li>
										<li><a href="#">Membros</a></li>
										<li><a href="#">Famílias</a></li>
										<li><a href="#">Visitantes</a></li>
									</ul> <!-- /.nav-third-level --></li>
								<li><a href="#">Agenda <span class="fa arrow"></span></a>
									<ul class="nav nav-third-level">
										<li><a href="#">Registro por Congregações</a></li>

									</ul> <!-- /.nav-third-level --></li>
							</ul> <!-- /.nav-second-level --></li>

						<li><a href="#"><i class="fa fa-money"></i> Tesouraria<span
								class="fa arrow"></span></a>
							<ul class="nav nav-second-level">

								<li><a href="#"><i class="fa fa-book"></i> Cadastros <span
										class="fa arrow"></span></a>
									<ul class="nav nav-third-level">
										<li><a href="/financeiro/cadastro/plano_contas/">Plano de Contas (DRE)</a></li>
										<li><a href="/financeiro/cadastro/bancos_contas/">Bancos e Contas</a></li>
										<li><a href="/financeiro/cadastro/fornecedores/">Fornecedores</a></li>
										<li><a href="/financeiro/cadastro/clientes/">Clientes</a></li>
										<li><a href="#">Patrimônios</a></li>
									</ul> <!-- /.nav-third-level --></li>

								<li><a href="#">Transferências <span class="fa arrow"></span></a>
									<ul class="nav nav-third-level">
										<li><a href="#">Entre Contas</a></li>
										<li><a href="#">Ajuste de Saldo</a></li>
									</ul> <!-- /.nav-third-level --></li>

								<li><a href="#">Lançamentos <span class="fa arrow"></span></a>
									<ul class="nav nav-third-level">
										<li><a href="#">Lançamento de Receitas</a></li>
										<li><a href="#">Lançamento de Despesas</a></li>
										<li><a href="#">Contas á Receber</a></li>
										<li><a href="#">Contas á Pagar</a></li>
									</ul> <!-- /.nav-third-level --></li>

							<li><a href="#"class="fa fa-file-o"> Relatórios <span ></span></a>
									<ul class="nav nav-third-level">
										<li><a href="#">Relatório de Receitas</a></li>
										<li><a href="#">Relatório de Despesas</a></li>
										<li><a href="#">Relatório de Resultados</a></li>
										<li><a href="#">Extrato de Bancos e Contas</a></li>
										<li><a href="#">Relatório de Patrimônios</a></li>
									</ul> <!-- /.nav-third-level --></li>
							</ul> <!-- /.nav-second-level --></li>

						<li><a href="#"><i class="fa fa-university"></i> Faculdade Teológica<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">

								<li><a href="#"><i class="fa fa-book"></i> Cadastros<span
										class="fa arrow"></span></a>
									<ul class="nav nav-third-level">
										<li><a href="#">Cadastro de Níveis</a></li>
										<li><a href="#">Montagem de Classe</a></li>
										<li><a href="#">Grade Curricular</a></li>
										<li><a href="#">Lançamento de Presença</a></li>
									</ul> <!-- /.nav-third-level --></li>

						<li><a href="#"class="fa fa-file-o"> Relatórios <span ></span></a>
									<ul class="nav nav-third-level">
										<li><a href="#">Alunos</a></li>
										<li><a href="#">Classes</a></li>
										<li><a href="#">Presenças</a></li>
									</ul> <!-- /.nav-third-level --></li>
							</ul> <!-- /.nav-second-level --></li>
							
									<li><a href="#"><i class="fa fa-graduation-cap"></i> Escola Bíblica<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">

								<li><a href="#"><i class="fa fa-book"></i> Cadastros<span
										class="fa arrow"></span></a>
									<ul class="nav nav-third-level">
										<li><a href="#">Cadastro de Escola</a></li>
										<li><a href="#">Montagem de Classe</a></li>
										<li><a href="#">Grade Curricular</a></li>
										<li><a href="#">Lançamento de Presença</a></li>
									</ul> <!-- /.nav-third-level --></li>

							<li><a href="#"class="fa fa-file-o"> Relatórios <span ></span></a>
									<ul class="nav nav-third-level">
										<li><a href="#">Alunos</a></li>
										<li><a href="#">Classes</a></li>
										<li><a href="#">Presenças</a></li>
									</ul> <!-- /.nav-third-level --></li>
							</ul> <!-- /.nav-second-level --></li>
							
								<li><a href="#"><i class="fa fa-archive"></i> Departamentos<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">

								<li><a href="#"><i class="fa fa-book"></i> Cadastros<span
										class="fa arrow"></span></a>
									<ul class="nav nav-third-level">
										<li><a href="#">Tipos de Departamentos</a></li>
										<li><a href="#">Montagem do Grupo</a></li>
									</ul> <!-- /.nav-third-level --></li>

								<li><a href="#"class="fa fa-file-o"> Relatórios <span ></span></a>
									<ul class="nav nav-third-level">
										<li><a href="#">Departamentos</a></li>
									</ul> <!-- /.nav-third-level --></li>
							</ul> <!-- /.nav-second-level --></li>


					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
		<div id="page-wrapper">
			<div class="container-fluid">
				<jsp:doBody></jsp:doBody>
			</div>
			<!-- /.container-fluid -->
		</div>

	</div>

	<!-- jQuery -->
	<script
		src="../../../../static/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="../../../../static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="../../../../static/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<!--     <script src="../../../../static/bower_components/raphael/raphael-min.js"></script>
    <script src="../../../../static/bower_components/morrisjs/morris.min.js"></script>
    <script src="../../../../static/js/morris-data.js"></script> -->

	<!-- Custom Theme JavaScript -->
	<script src="../../../../static/dist/js/sb-admin-2.js"></script>

</body>

</html>
