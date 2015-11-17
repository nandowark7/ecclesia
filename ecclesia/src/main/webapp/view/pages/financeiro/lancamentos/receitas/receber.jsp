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
						<h2 class="page-header">Recebimento</h2>
					</div>

				</div>
			
			<div class="row">
				<div class="form-group col-md-4">
					<label for="descricao">Descrição</label> 
					<input type="text" class="form-control" name="descricao" id="descricao"
					placeholder="Informe o histórico..." readonly value="${parcela.descricao}">
				</div>
				<div class="form-group col-md-2">
					<label for="vencimento">Vencimento</label> 
					<input type="text" class="form-control" name="vencimento" id="vencimento"
					placeholder="Informe o vencimento..." readonly value="${parcela.vencimento}">
				</div>
				<div class="form-group col-md-2">
					<label for="valor">Valor</label> 
					<input type="text" class="form-control" id="valor"
					placeholder="Informe o valor..."  readonly value="${parcela.valor}">
				</div>
				<div class="form-group col-md-2">
					<label for="acrescimo">Acréscimo</label> 
					<input type="text" class="form-control" id="acrescimo"
					placeholder="Informe o acrescimo..." readonly value="${parcela.acrescimo}">
				</div>
				<div class="form-group col-md-2">
					<label for="desconto">Desconto</label> 
					<input type="text" class="form-control" name="desconto" 
							id="desconto" placeholder="Informe o desconto..." readonly value="${parcela.desconto}">
				</div>
			</div>
						 
			<form action="/financeiro/lancamentos/receitas/receber/" method="post"	enctype="multipart/form-data">
			
			<div class="form-group col-md-3">
						<label for="nome">Conta de Entrada</label> 
						<form:select path="parcela.banco.codigo" class="form-control">
	           				<form:option value="0" label="Selecione uma Conta" />
	            			<form:options items="${bancos}" itemValue="codigo"
							itemLabel="nome" />
	        			</form:select>
					</div>
					<div class="form-group col-md-3">
						<label for="recebimento">Data Recebimento</label> 
						<input type="text" class="form-control" name="recebimento" id="recebimento"
						placeholder="Informe a data de recebimento...">
					</div>
				
	    
					<input type="hidden" value="${parcela.codigo}" name="codigo" id="codigo">
					<button type="submit" class="btn btn-primary">Confirmar</button>
					<span style="padding-left: 20px"></span>
					<a href="/financeiro/lancamentos/receitas/" class="btn btn-primary">Voltar</a>
			</form>






</jsp:body>


</layout:template>