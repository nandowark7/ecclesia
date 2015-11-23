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
						<h2 class="page-header">Lançamento Simples de Saldo</h2>
					</div>

				</div>
				
			<form action="/financeiro/lancamentos/transferencias/" method="post"	enctype="multipart/form-data">
				
				<div class="row">
					<div class="form-group col-md-2">
						<label for="documento">Doc</label> 
						<input type="text" class="form-control" name="documento" id="nome"
						placeholder="Doc. nº..." value="${movimento.documento}">
					</div>
					<div class="form-group col-md-4">
						<label for="descricao">Descrição</label> 
						<input type="text" class="form-control" name="descricao" id="nome"
						placeholder="Informe a Descrição..." value="${movimento.descricao}">
					</div>
					<div class="form-group col-md-2">
						<label for="valor">Valor</label> 
						<input type="text" class="form-control" name="valor" id="nome"
						placeholder="Informe Valor..." value="${movimento.valor}">
					</div>
					<div class="form-group col-md-2">
						<label for="data">Data</label> 
						<input type="text" class="form-control" name="data" id="nome"
						placeholder="Data Lanc..." value="${movimento.data}">
					</div>
					<div class="form-group col-md-3">
						<label for="nome">Banco/Conta</label> 
						<form:select path="movimento.contaDestino.codigo" class="form-control">
	           				<form:option value="0" label="Selecione uma Conta" />
	            			<form:options items="${contas}" itemValue="codigo"
							itemLabel="nome" />
	        			</form:select>
					</div>
					
					</div>
					<input type="hidden" value="${movimento.codigo}" name="codigo" id="codigo">
					<input type="hidden" path="movimento.tipo" value="SIMPLES" name="tipo" id="tipo">
					<input type="hidden" path="movimento.contaOrigem.codigo" value="-1" name="contaOrigem.codigo" id="nome">
					
					<button type="submit" class="btn btn-primary">Confirmar</button>
					<span style="padding-left: 20px"></span>
					<a href="/financeiro/lancamentos/transferencias/" class="btn btn-primary">Voltar</a>
			</form>






</jsp:body>


</layout:template>
