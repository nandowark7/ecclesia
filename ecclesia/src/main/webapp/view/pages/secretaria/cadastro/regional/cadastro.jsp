<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<layout:template>
	<jsp:body>
<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">Regionais</h2>
					</div>

				</div>
				<form action="/" method="post">
				<div class="row">
					<div class="form-group col-md-5">
						<label for="nome">Nome</label> 
						<input type="text" class="form-control" name="nome" id="nome"
						placeholder="Digite um nome...">
					</div>
				</div>
					<div class="row">
					<div class="form-group col-md-5" >
						<label for="nome">Cidade</label> 
						<form:select path="regional.cidade">
           				<form:option value="0" label="Selecione uma Cidade" />
            			<form:options items="${cidades}" itemValue="codigo"
							itemLabel="nome" />
        			</form:select>
					</div>
					</div>
					
					
					
					
					<button type="submit" class="btn btn-default">Cadastrar</button>
				</form>






</jsp:body>


</layout:template>
