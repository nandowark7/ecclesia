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
						<h2 class="page-header">Membros</h2>
					</div>

				</div>
				
						<div class="row">
					<div class="col-md-12">
						<spring:hasBindErrors name="pessoa">
						<ul>
							<c:forEach var="error" items="${errors.allErrors}">
							<li><spring:message code="${error.code}"
									text="${error.defaultMessage}" /></li>
							</c:forEach>						
						
						</ul>
						</spring:hasBindErrors>
					</div>
				</div>
				
			<form action="/secretaria/cadastro/pessoa/" method="post">
				
				<div class="row">
					<div class="form-group col-md-4">
						<label for="nome">Nome</label> 
						<input type="text" class="form-control" name="nome" id="nome"
						placeholder="Digite um nome..." value="${pessoa.nome}">
						<form:errors path="pessoa.nome" />
					</div>
				
					<div class="form-group col-md-3">
						<label for="nome">E-Mail</label> 
						<input type="text" class="form-control" name="email" id="email"
						placeholder="Digite o e-mail..." value="${pessoa.email}">
						<form:errors path="pessoa.email" />
					</div>
						
					<div class="form-group col-md-3">
						<label for="nome">Fone</label> 
						<input type="text" class="form-control" name="fone" id="fone"
						placeholder="Digite o telefone..." value="${pessoa.fone}">
						<form:errors path="pessoa.fone" />
					</div>
						
					<div class="form-group col-md-3">
						<label for="nome">Congrega��o</label> 
						<form:select path="pessoa.congregacao.codigo" class="form-control">
	           				<form:option value="0" label="Selecione a Congrega��o" />
	            			<form:options items="${congregacoes}" itemValue="codigo" itemLabel="nome" />
	        			</form:select>
	        			<form:errors path="pessoa.congregacao"/>
					</div>
						
					<div class="form-group col-md-4">
						<label for="nome">Endere�o</label> 
						<input type="text" class="form-control" name="endereco" id="endereco"
						placeholder="Digite o endere�o..." value="${congregacao.endereco}">
						<form:errors path="congregacao.endereco" />
					</div>
						<div class="form-group col-md-3">
						<label for="nome">N�mero</label> 
						<input type="text" class="form-control" name="numero" id="numero"
						placeholder="Digite o n�mero..." value="${congregacao.numero}">
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
					<a href="/secretaria/cadastro/pessoa/" class="btn btn-primary">Voltar</a>
			</form>






</jsp:body>


</layout:template>