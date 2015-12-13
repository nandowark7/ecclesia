<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="../../../../static/bower_components/jquery/dist/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">

jQuery(function($){
	$('#campoData').mask("99/99/9999");
	$('#CPF').mask("999.999.999-99");
	$('#cnpj').mask("99.999.999/9999-99");
	$('#RG').mask("9.999.999-9");
	$('#fone').mask("(99) 9999 9999");
	$('#celular').mask("(99) 9999 9999");
	$('#cep').mask("99.999-999");

});

</script>

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
						<input type="text" class="form-control" name="cnpj" OnKeyUp="mascaraData(this);" id="cnpj"
						placeholder="Digite o CNPJ..." value="${fornecedor.cnpj}">
						<form:errors path="fornecedor.cnpj" />
					</div>	
					<div class="form-group col-md-3">
						<label for="inscricaoEstadual">Inscrição Estadual</label> 
						<input type="text" class="form-control" name="inscricaoEstadual" id="inscricaoEstadual"
						placeholder="Informe a Inscrição..." value="${fornecedor.inscricaoEstadual}">
						<form:errors path="fornecedor.inscricaoEstadual" />
					</div>	
					<div class="form-group col-md-3">
						<label for="responsavel">Responsável/Contato</label> 
						<input type="text" class="form-control" name="responsavel" id="resp" 
						placeholder="Informe o responsável..." value="${fornecedor.responsavel}">
						<form:errors path="fornecedor.responsavel" />
					</div>
					
					<div class="form-group col-md-3">
						<label for="nome">Situação</label> 
						<form:select path="fornecedor.situacao" class="form-control">
							<form:option value="" label="Selecione a Situação" />
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
						<label for="fone">Fone</label> 
						<input type="text" class="form-control" name="fone" OnKeyUp="mascaraData(this);" id="fone"
						placeholder="Digite o telefone..." value="${fornecedor.fone}">
						<form:errors path="fornecedor.fone" />
					</div>
						<div class="form-group col-md-3">
						<label for="celular">Fax</label> 
						<input type="text" class="form-control" name="celular" OnKeyUp="mascaraData(this);" id="celular" placeholder="Digite o telefone..."
						value="${fornecedor.celular}">
						<form:errors path="fornecedor.celular" />
					</div>
						
					<div class="form-group col-md-3">
						<label for="endereco">Endereço</label> 
						<input type="text" class="form-control" name="endereco"
						id="endereco" placeholder="Digite o endereço..."
						value="${fornecedor.endereco}">
						<form:errors path="fornecedor.endereco" />
					</div>
						<div class="form-group col-md-3">
						<label for="numero">Número</label> 
						<input type="text" class="form-control" name="numero" id="numero"
						placeholder="Digite o número..." value="${fornecedor.numero}">
						<form:errors path="fornecedor.numero" />
					</div>
					<div class="form-group col-md-3">
						<label for="bairro">Bairro</label> 
						<input type="text" class="form-control" name="bairro" id="bairro"
						placeholder="Digite o bairro..." value="${fornecedor.bairro}">
						<form:errors path="fornecedor.bairro" />
					</div>
					<div class="form-group col-md-3">
						<label for="cep">CEP</label> 
						<input type="text" class="form-control" name="cep" OnKeyUp="mascaraData(this);" id="cep"
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
