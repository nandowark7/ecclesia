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
						<h2 class="page-header">Fornecedores</h2>
					</div>

				</div>
				
			<form action="/financeiro/cadastro/fornecedores/" method="post"	enctype="multipart/form-data">
				
				<div class="row">
					<div class="form-group col-md-3">
						<label for="nome">Nome</label> 
						<input type="text" class="form-control" name="nome" id="nome"
						placeholder="Digite um nome..." value="${fornecedor.nome}">
						<form:errors path="fornecedor.nome" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">CNPJ</label> 
						<input type="text" class="form-control" name="cnpj" id="cnpj"
						placeholder="Digite o CNPJ..." value="${fornecedor.cnpj}">
						<form:errors path="fornecedor.cnpj" />
					</div>	
					<div class="form-group col-md-3">
						<label for="nome">Inscri��o Estadual</label> 
						<input type="text" class="form-control" name="ie" id="ie"
						placeholder="Informe a Inscri��o..." value="${fornecedor.inscricaoEstadual}">
						<form:errors path="fornecedor.inscricaoEstadual" />
					</div>	
					<div class="form-group col-md-3">
						<label for="nome">Respons�vel/Contato</label> 
						<input type="text" class="form-control" name="resp" id="resp" 
						placeholder="Informe o respons�vel..." value="${fornecedor.responsavel}">
						<form:errors path="fornecedor.responsavel" />
					</div>
					
					<div class="form-group col-md-3">
						<label for="nome">Situa��o</label> 
						<form:select path="fornecedor.situacao" class="form-control">
							<form:option value="" label="Selecione a Situa��o" />
	           				<form:option value="ATIVA" label="Ativa" />
	           				<form:option value="INATIVA" label="Inativa" />
	        			</form:select>
						<form:errors path="fornecedor.situacao" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">E-Mail</label> 
						<input type="text" class="form-control" name="email" id="email"
						placeholder="Digite o e-mail..." value="${fornecedor.email}">
						<form:errors path="fornecedor.email" />
					</div>
						
					<div class="form-group col-md-3">
						<label for="nome">Fone</label> 
						<input type="text" class="form-control" name="fone" id="fone"
						placeholder="Digite o telefone..." value="${fornecedor.fone}">
						<form:errors path="fornecedor.fone" />
					</div>
						<div class="form-group col-md-3">
						<label for="nome">Fax</label> 
						<input type="text" class="form-control" name="fax"
						id="fax" placeholder="Digite o telefone..."
						value="${fornecedor.celular}">
						<form:errors path="fornecedor.celular" />
					</div>
						
					<div class="form-group col-md-3">
						<label for="nome">Endere�o</label> 
						<input type="text" class="form-control" name="endereco"
						id="endereco" placeholder="Digite o endere�o..."
						value="${fornecedor.endereco}">
						<form:errors path="fornecedor.endereco" />
					</div>
						<div class="form-group col-md-3">
						<label for="nome">N�mero</label> 
						<input type="text" class="form-control" name="numero" id="numero"
						placeholder="Digite o n�mero..." value="${fornecedor.numero}">
						<form:errors path="fornecedor.numero" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">Bairro</label> 
						<input type="text" class="form-control" name="bairro" id="bairro"
						placeholder="Digite o bairro..." value="${fornecedor.bairro}">
						<form:errors path="fornecedor.bairro" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">CEP</label> 
						<input type="text" class="form-control" name="cep" id="cep"
						placeholder="Digite o CEP..." value="${fornecedor.cep}">
						<form:errors path="fornecedor.cep" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">Cidade</label> 
						<form:select path="fornecedor.cidade.codigo" class="form-control">
	           				<form:option value="0" label="Selecione uma Cidade" />
	            			<form:options items="${cidades}" itemValue="codigo"
							itemLabel="nome" />
	        			</form:select>
	        			<form:errors path="fornecedor.cidade" />
					</div>
					
					
					
					<input type="hidden" value="${fornecedor.codigo}" name="codigo" id="codigo">
					<input type="hidden" path="fornecedor.grupo" value="FORNECEDOR"" name="grupo" id="grupo"></div>
					<button type="submit" class="btn btn-primary">Confirmar</button>
					<span style="padding-left: 20px"></span>
					<a href="/financeiro/cadastro/fornecedores/" class="btn btn-primary">Voltar</a>
			</form>






</jsp:body>


</layout:template>
