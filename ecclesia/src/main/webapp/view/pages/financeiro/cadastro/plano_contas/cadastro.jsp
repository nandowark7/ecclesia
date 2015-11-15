<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:template>
	<jsp:body>
<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">Plano de Contas - DRE</h3>
					</div>

				</div>
				<form action="/financeiro/cadastro/plano_contas/" method="post">
				
				<div class="row">
					<div class="form-group col-md-5">
						<label for="nome">Nome</label> 
						<input type="text" class="form-control" name="nome" id="nome"
						placeholder="Digite um nome..." value="${plano.nome}">
						<form:errors path="plano.nome"/>
					</div>
					
					<div class="form-group col-md-3">
						<label for="nome">Tipo</label> 
						<form:select path="plano.tipo" class="form-control">
							<form:option value="" label="Selecione o Tipo" />
	           				<form:option value="RECEITAS" label="Receita" />
	           				<form:option value="DESPESAS" label="Despesa" />
	        			</form:select>
						<form:errors path="plano.tipo" />
					</div>
				</div>
					
					<input type="hidden" value="${plano.codigo}" name="codigo" id="codigo">
					<button type="submit" class="btn btn-primary">Confirmar</button>
					<span style="padding-left:20px"></span>
					<a href="/financeiro/cadastro/plano_contas/" class="btn btn-primary">Voltar</a>
					
				</form>






</jsp:body>


</layout:template>
