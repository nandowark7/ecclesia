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
						<h2 class="page-header">Regionais</h2>
					</div>

				</div>
				
						<div class="row">
					<div class="col-md-12">
						<spring:hasBindErrors name="regional">
						<ul>
							<c:forEach var="error" items="${errors.allErrors}">
							<li><spring:message code="${error.code}"
									text="${error.defaultMessage}" /></li>
							</c:forEach>						
						
						</ul>
						</spring:hasBindErrors>
					</div>
				</div>
				
			<form action="/secretaria/cadastro/regional/" method="post">
				
				<div class="row">
					<div class="form-group col-md-5">
						<label for="nome">Nome</label> 
						<input type="text" class="form-control" name="nome" id="nome"
						placeholder="Digite um nome..." value="${regional.nome}">
						<form:errors path="regional.nome" />
					</div>
				
					<div class="form-group col-md-3">
						<label for="nome">Cidade Sede</label> 
						<form:select path="regional.cidade.codigo" class="form-control">
	           				<form:option value="0" label="Selecione uma Cidade" />
	            			<form:options items="${cidades}" itemValue="codigo" itemLabel="nome" />
	        			</form:select>
	        			<form:errors path="regional.cidade"/>
					</div>
				</div>
					
					
					
					<input type="hidden" value="${regional.codigo}" name="codigo"
				id="codigo">
					<button type="submit" class="btn btn-primary">Confirmar</button>
					<span style="padding-left: 20px"></span>
					<a href="/secretaria/cadastro/regional/" class="btn btn-primary">Voltar</a>
			</form>






</jsp:body>


</layout:template>
