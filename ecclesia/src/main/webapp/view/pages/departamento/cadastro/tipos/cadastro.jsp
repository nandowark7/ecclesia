<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<layout:template>
	<jsp:body>
<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">Departamentos</h2>
					</div>

				</div>
				
			<form action="/departamento/cadastro/tipos/" method="post"	enctype="multipart/form-data">
				
				<div class="row">
					<div class="form-group col-md-4">
						<label for="nome">Nome</label> 
						<input type="text" class="form-control" name="nome" id="nome"
						placeholder="Digite um nome..." value="${departamento.nome}">
					</div>
					<div class="form-group col-md-3">
						<label for="tipo">Tipo do Departamento</label> 
						<form:select path="departamento.tipo" class="form-control">
							<form:option value="" label="Selecione um grupo" />
	           				<form:option value="INFANTIL" label="Infantil" />
	           				<form:option value="ADOLECENTE" label="Adolescente" />
	           				<form:option value="MOCIDADE" label="Mocidade" />
	           				<form:option value="CIRCULO" label="Circulo de Oração" />
	           				<form:option value="MISSAO" label="Missão" />
	        			</form:select>
					</div>
					<div class="form-group col-md-3">
						<label for="nome">Congregação</label> 
						<form:select path="departamento.congregacao.codigo" class="form-control">
	           				<form:option value="0" label="Selecione uma Congregação" />
	            			<form:options items="${congregacao}" itemValue="codigo"
							itemLabel="nome" />
	        			</form:select>
					</div>
			</div>		
					<input type="hidden" value="${departamento.codigo}" name="codigo" id="codigo">
					<button type="submit" class="btn btn-primary">Confirmar</button>
					<span style="padding-left: 20px"></span>
					<a href="/departamento/cadastro/tipos/" class="btn btn-primary">Cancelar</a>
			</form>


</jsp:body>


</layout:template>
