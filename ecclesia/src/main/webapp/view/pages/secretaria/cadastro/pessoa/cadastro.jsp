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
	
});

</script>

<layout:template>
	<jsp:body>
<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">Membros</h2>
					</div>

				</div>
				
			<form action="/secretaria/cadastro/pessoa/" method="post" name= "cadPessoa" enctype="multipart/form-data">
				
				<div class="row">
					<div class="form-group col-md-3">
						<label for="nome">Nome</label> 
						<input type="text" class="form-control" name="nome" id="nome"
						placeholder="Digite um nome..." value="${pessoa.nome}">
						<form:errors path="pessoa.nome" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">CPF</label> 
						<input type="text" class="form-control" name="cpf" id="cpf"
						placeholder="Digite o CPF..." value="${pessoa.cpf}">
						<form:errors path="pessoa.cpf" />
					</div>	
					<div class="form-group col-md-3">
						<label for="nome">RG</label> 
						<input type="text" class="form-control" name="rg" id="rg"
						placeholder="Digite o RG..." value="${pessoa.rg}">
						<form:errors path="pessoa.rg" />
					</div>	
					<div class="form-group col-md-3">
						<label for="dataNascimento">Nascimento</label> 
						<input type="text" class="form-control" name="dataNascimento" OnKeyUp="mascaraData(this);" id="campoData" placeholder="Digite a data nasc..."
						value="${pessoa.dataNascimento}">
						<form:errors path="pessoa.dataNascimento" />
					</div>
					
					<div class="form-group col-md-3">
						<label for="nome">Sexo</label> 
						<form:select path="pessoa.sexo" class="form-control">
							<form:option value="" label="Selecione o Sexo" />
	           				<form:option value="MASCULINO" label="Masculino" />
	           				<form:option value="FEMININO" label="Feminino" />
	        			</form:select>
						<form:errors path="pessoa.sexo" />
					</div>
					
					<div class="form-group col-md-3">
						<label for="nome">Estado Civil</label> 
						<form:select path="pessoa.estado_civil" class="form-control">
							<form:option value="" label="Selecione o estado civil" />
	           				<form:option value="SOLTEIRO" label="Solteiro" />
	           				<form:option value="CASADO" label="Casado" />
	           				<form:option value="SEPARADO" label="Separado" />
	           				<form:option value="DIVORCIADO" label="Divorciado" />
	           				<form:option value="VIUVO" label="Viuvo" />
	           				<form:option value="UNIAO_ESTAVEL" label="União Estável" />
	        			</form:select>
						<form:errors path="pessoa.estado_civil" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">Grupo</label> 
						<form:select path="pessoa.grupo" class="form-control">
							<form:option value="" label="Selecione o Grupo..." />
	           				<form:option value="MEMBRO" label="Membro" />
	           				<form:option value="FUNCIONARIO" label="Funcionário" />
	           				<form:option value="COOPERADOR" label="Cooperador" />
	        			</form:select>
						<form:errors path="pessoa.grupo" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">Função</label> 
						<form:select path="pessoa.funcao" class="form-control">
							<form:option value="" label="Selecione a função" />
	           				<form:option value="PASTOR" label="Pastor" />
	           				<form:option value="PRESBITERO" label="Presbítero" />
	           				<form:option value="DIACOMO" label="Diácono" />
	           				<form:option value="AUXILIAR" label="Auxiliar" />
	           				<form:option value="PROFESSOR" label="Professor" />
	        			</form:select>
						<form:errors path="pessoa.funcao" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">Situação</label> 
						<form:select path="pessoa.situacao" class="form-control">
							<form:option value="" label="Selecione a Situação" />
	           				<form:option value="ATIVA" label="Ativa" />
	           				<form:option value="INATIVA" label="Inativa" />
	        			</form:select>
						<form:errors path="pessoa.situacao" />
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
						<label for="nome">Celular</label> 
						<input type="text" class="form-control" name="celular"
						id="celular" placeholder="Digite o telefone..."
						value="${pessoa.celular}">
						<form:errors path="pessoa.celular" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">Congregação</label> 
						<form:select path="pessoa.congregacao.codigo" class="form-control">
	           				<form:option value="0" label="Selecione a Congregação" />
	            			<form:options items="${congregacoes}" itemValue="codigo"
							itemLabel="nome" />
	        			</form:select>
	        			<form:errors path="pessoa.congregacao" />
					</div>
						
					<div class="form-group col-md-3">
						<label for="nome">Endereço</label> 
						<input type="text" class="form-control" name="endereco"
						id="endereco" placeholder="Digite o endereço..."
						value="${pessoa.endereco}">
						<form:errors path="pessoa.endereco" />
					</div>
						<div class="form-group col-md-3">
						<label for="nome">Número</label> 
						<input type="text" class="form-control" name="numero" id="numero"
						placeholder="Digite o número..." value="${pessoa.numero}">
						<form:errors path="pessoa.numero" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">Bairro</label> 
						<input type="text" class="form-control" name="bairro" id="bairro"
						placeholder="Digite o bairro..." value="${pessoa.bairro}">
						<form:errors path="pessoa.bairro" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">CEP</label> 
						<input type="text" class="form-control" name="cep" id="cep"
						placeholder="Digite o CEP..." value="${pessoa.cep}">
						<form:errors path="pessoa.cep" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">Cidade</label> 
						<form:select path="pessoa.cidade.codigo" class="form-control">
	           				<form:option value="0" label="Selecione uma Cidade" />
	            			<form:options items="${cidades}" itemValue="codigo"
							itemLabel="nome" />
	        			</form:select>
	        			<form:errors path="pessoa.cidade" />
					</div>
					</div>

					
					
					
					<input type="hidden" value="${pessoa.codigo}" name="codigo"
				id="codigo">
					<button type="submit" class="btn btn-primary">Confirmar</button>
					<span style="padding-left: 20px"></span>
					<a href="/secretaria/cadastro/pessoa/" class="btn btn-primary">Voltar</a>
			</form>






</jsp:body>


</layout:template>
