<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>


<layout:template>
	<jsp:body>
<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">Nova Cidade</h2>
					</div>

				</div>
				<form action="/" method="post">
				<div class="row">
					<div class="form-group col-md-5">
						<label for="nome">Nome</label> 
						<input type="text" class="form-control" name="nome" id="nome"
						placeholder="Digite um nome...">
					</div>
						<div class="form-group col-md-5">
						<label for="nome">UF</label> 
						<input type="text" class="form-control" name="uf" id="uf"
						placeholder="Digite um UF...">
					</div>
					</div>
					
					<button type="submit" class="btn btn-default">Confirmar</button>
				</form>






</jsp:body>


</layout:template>
