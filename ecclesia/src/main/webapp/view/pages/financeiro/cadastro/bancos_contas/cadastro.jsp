<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:template>
	<jsp:body>
<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">Contas Bancárias e Internas</h3>
					</div>

				</div>
				<form action="/financeiro/cadastro/bancos_contas/" method="post">
				
				<div class="row">
					<div class="form-group col-md-5">
						<label for="nome">Tipo da Conta</label> 
						<form:select path="banco.tipoconta" class="form-control">
							<form:option value="" label="Selecione o Tipo" />
	           				<form:option value="CAIXA" label="Caixa Local" />
	           				<form:option value="CC" label="Conta Corrente" />
	           				<form:option value="PP" label="Conta Poupança" />
	           				<form:option value="AP" label="Conta Aplicação" />
	        			</form:select>
						<form:errors path="banco.tipoconta" />
					</div>
					<div class="form-group col-md-5">
						<label for="nome">Nome</label> 
						<input type="text" class="form-control" name="nome" id="nome"
						placeholder="Digite um nome..." value="${banco.nome}">
						<form:errors path="banco.nome"/>
					</div>
						<div class="form-group col-md-5">
						<label for="nome">Agência</label> 
						<input type="text" class="form-control" name="agencia" id="agencia"
						placeholder="Informe a agência..." value="${banco.agencia}">
						<form:errors path="banco.agencia"/>
					</div>
						<div class="form-group col-md-5">
						<label for="nome">Conta</label> 
						<input type="text" class="form-control" name="conta" id="conta"
						placeholder="Informe o nº da conta..." value="${banco.conta}">
						<form:errors path="banco.conta"/>
					</div>
					
			
				</div>
					
					<input type="hidden" value="${banco.codigo}" name="codigo" id="codigo">
					<button type="submit" class="btn btn-primary">Confirmar</button>
					<span style="padding-left:20px"></span>
					<a href="/financeiro/cadastro/bancos_contas/" class="btn btn-primary">Voltar</a>
					
				</form>


</jsp:body>


</layout:template>
