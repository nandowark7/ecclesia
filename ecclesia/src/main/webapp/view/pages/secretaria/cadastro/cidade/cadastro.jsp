<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:template>
	<jsp:body>
<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">Cidade</h2>
					</div>

				</div>
				<div class="row">
					<div class="col-md-12">
						<spring:hasBindErrors name="cidade">
						<ul>
							<c:forEach var="error" items="${errors.allErrors}">
							<li><spring:message code= "${error.code}"
								text="${error.defaultMessage}"/></li>
							</c:forEach>						
						
						</ul>
						</spring:hasBindErrors>
					</div>
				</div>
				<form action="/secretaria/cadastro/cidade/" method="post">
				<div class="row">
					<div class="form-group col-md-5">
						<label for="nome">Nome</label> 
						<input type="text" class="form-control" name="nome" id="nome"
						placeholder="Digite um nome..." value="${cidade.nome}">
						<form:errors path="cidade.nome"/>
					</div>
						<div class="form-group col-md-5">
						<label for="nome">UF</label> 
						<input type="text" class="form-control" name="uf" id="uf"
						placeholder="Digite um UF..." value="${cidade.uf}">
						<form:errors path="cidade.uf"/>
					</div>
					</div>
					<input type="hidden" value="${cidade.codigo}" name="codigo" id="codigo">
					<button type="submit" class="btn btn-default">Confirmar</button>
					<a href="/secretaria/cadastro/cidade/" class="btn btn-default">Voltar</a>
					
				</form>






</jsp:body>


</layout:template>
