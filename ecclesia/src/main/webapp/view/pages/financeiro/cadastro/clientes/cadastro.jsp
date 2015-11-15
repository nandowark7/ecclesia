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
						<h2 class="page-header">Clientes</h2>
					</div>

				</div>
				
			<form action="/financeiro/cadastro/clientes/" method="post"
			enctype="multipart/form-data">
				
				<div class="row">
					<div class="form-group col-md-3">
						<label for="nome">Nome</label> 
						<input type="text" class="form-control" name="nome" id="nome"
						placeholder="Digite um nome..." value="${cliente.nome}">
						<form:errors path="cliente.nome" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">CNPJ</label> 
						<input type="text" class="form-control" name="cnpj" id="cnpj"
						placeholder="Digite o CNPJ..." value="${cliente.cnpj}">
						<form:errors path="cliente.cnpj" />
					</div>	
					<div class="form-group col-md-3">
						<label for="nome">Inscrição Estadual</label> 
						<input type="text" class="form-control" name="ie" id="ie"
						placeholder="Informe a Inscrição..." value="${cliente.inscricaoEstadual}">
						<form:errors path="cliente.inscricaoEstadual" />
					</div>	
					<div class="form-group col-md-3">
						<label for="nome">Responsável/Contato</label> 
						<input type="text" class="form-control" name="resp" id="resp" 
						placeholder="Informe o responsável..."
						value="${cliente.responsavel}">
						<form:errors path="cliente.responsavel" />
					</div>
					
					<div class="form-group col-md-3">
						<label for="nome">Situação</label> 
						<form:select path="cliente.situacao" class="form-control">
							<form:option value="" label="Selecione a Situação" />
	           				<form:option value="ATIVA" label="Ativa" />
	           				<form:option value="INATIVA" label="Inativa" />
	        			</form:select>
						<form:errors path="cliente.situacao" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">E-Mail</label> 
						<input type="text" class="form-control" name="email" id="email"
						placeholder="Digite o e-mail..." value="${cliente.email}">
						<form:errors path="cliente.email" />
					</div>
						
					<div class="form-group col-md-3">
						<label for="nome">Fone</label> 
						<input type="text" class="form-control" name="fone" id="fone"
						placeholder="Digite o telefone..." value="${cliente.fone}">
						<form:errors path="cliente.fone" />
					</div>
						<div class="form-group col-md-3">
						<label for="nome">Fax</label> 
						<input type="text" class="form-control" name="fax"
						id="fax" placeholder="Digite o telefone..."
						value="${cliente.celular}">
						<form:errors path="cliente.celular" />
					</div>
						
					<div class="form-group col-md-3">
						<label for="nome">Endereço</label> 
						<input type="text" class="form-control" name="endereco"
						id="endereco" placeholder="Digite o endereço..."
						value="${cliente.endereco}">
						<form:errors path="cliente.endereco" />
					</div>
						<div class="form-group col-md-3">
						<label for="nome">Número</label> 
						<input type="text" class="form-control" name="numero" id="numero"
						placeholder="Digite o número..." value="${cliente.numero}">
						<form:errors path="cliente.numero" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">Bairro</label> 
						<input type="text" class="form-control" name="bairro" id="bairro"
						placeholder="Digite o bairro..." value="${cliente.bairro}">
						<form:errors path="cliente.bairro" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">CEP</label> 
						<input type="text" class="form-control" name="cep" id="cep"
						placeholder="Digite o CEP..." value="${cliente.cep}">
						<form:errors path="cliente.cep" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">Cidade</label> 
						<form:select path="cliente.cidade.codigo" class="form-control">
	           				<form:option value="0" label="Selecione uma Cidade" />
	            			<form:options items="${cidades}" itemValue="codigo"
							itemLabel="nome" />
	        			</form:select>
	        			<form:errors path="cliente.cidade" />
					</div>
<!-- 					<div class="form-group col-md-3"> -->
<%-- 						<form:select path="cliente.grupo" class="form-control"> --%>
<%-- 	           				<form:option value="CLIENTE"/> --%>
<%-- 	        			</form:select> --%>
<%-- 						<form:errors path="cliente.grupo" /> --%>
<!-- 					</div> -->
					
					
					
					<input type="hidden" value="${cliente.codigo}" name="codigo" id="codigo">
					<input type="hidden" path="cliente.grupo" value="CLIENTE"" name="grupo" id="grupo"></div>
					<button type="submit" class="btn btn-primary">Confirmar</button>
					<span style="padding-left: 20px"></span>
					<a href="/financeiro/cadastro/clientes/" class="btn btn-primary">Voltar</a>
			</form>






</jsp:body>


</layout:template>
