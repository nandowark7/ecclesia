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
						<h2 class="page-header">Congregações</h2>
					</div>

				</div>
				
						<div class="row">
					<div class="col-md-12">
						<spring:hasBindErrors name="congregacao">
						<ul>
							<c:forEach var="errors" items="${errors.allErrors}">
							<li><spring:message code="${error.code}"
									text="${error.defaultMessage}" /></li>
							</c:forEach>						
						
						</ul>
						</spring:hasBindErrors>
					</div>
				</div>
				
			<form action="/secretaria/cadastro/congregacao/" method="post">
				
				<div class="row">
					<div class="form-group col-md-4">
						<label for="nome">Nome</label> 
						<input type="text" class="form-control" name="nome" id="nome"
						placeholder="Digite um nome..." value="${congregacao.nome}">
						<form:errors path="congregacao.nome" />
					</div>
				
					<div class="form-group col-md-3">
						<label for="nome">Regional</label> 
						<form:select path="congregacao.regional.codigo" class="form-control">
	           				<form:option value="0" label="Selecione a Regional" />
	            			<form:options items="${regionais}" itemValue="codigo" itemLabel="nome" />
	        			</form:select>
	        			<form:errors path="congregacao.regional"/>
					</div>
					
					<div class="form-group col-md-3">
						<label for="nome">Fone</label> 
						<input type="text" class="form-control" name="fone" id="fone"
						placeholder="Digite o telefone..." value="${congregacao.fone}">
						<form:errors path="congregacao.fone" />
					</div>
					<div class="form-group col-md-4">
						<label for="nome">Endereço</label> 
						<input type="text" class="form-control" name="endereco" id="endereco"
						placeholder="Digite o endereço..." value="${congregacao.endereco}">
						<form:errors path="congregacao.endereco" />
					</div>
						<div class="form-group col-md-3">
						<label for="nome">Número</label> 
						<input type="text" class="form-control" name="numero" id="numero"
						placeholder="Digite o número..." value="${congregacao.numero}">
						<form:errors path="congregacao.numero" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">Bairro</label> 
						<input type="text" class="form-control" name="bairro" id="bairro"
						placeholder="Digite o bairro..." value="${congregacao.bairro}">
						<form:errors path="congregacao.bairro" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">CEP</label> 
						<input type="text" class="form-control" name="cep" id="cep"
						placeholder="Digite o CEP..." value="${congregacao.cep}">
						<form:errors path="congregacao.cep" />
					</div>
					</div>

					
					
					
					<input type="hidden" value="${congregacao.codigo}" name="codigo" id="codigo">
					<button type="submit" class="btn btn-primary">Confirmar</button>
					<span style="padding-left: 20px"></span>
					<a href="/secretaria/cadastro/congregacao/" class="btn btn-primary">Cancelar</a>
			</form>






</jsp:body>


</layout:template>
