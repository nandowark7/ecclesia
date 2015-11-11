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
				
			<form action="/secretaria/cadastro/pessoa/" method="post" enctype="multipart/form-data">
				
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
						<label for="nome">Nascimento</label> 
						<input type="text" class="form-control" name="nascimento" id="nascimento"
						placeholder="Digite a data nasc..." value="${pessoa.dataNascimento}">
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
						<input type="text" class="form-control" name="estado" id="estado"
						placeholder="Digite a data nasc..." value="${pessoa.estado_civil}">
						<form:errors path="pessoa.estado_civil" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">Grupo</label> 
						<input type="text" class="form-control" name="grupo" id="grupo"
						placeholder="Selecione o Grupo..." value="${pessoa.grupo}">
						<form:errors path="pessoa.grupo" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">Função</label> 
						<input type="text" class="form-control" name="funcao" id="funcao"
						placeholder="Selecione a Função..." value="${pessoa.funcao}">
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
						<input type="text" class="form-control" name="celular" id="celular"
						placeholder="Digite o telefone..." value="${pessoa.celular}">
						<form:errors path="pessoa.celular" />
					</div>
					<div class="form-group col-md-3">
						<label for="nome">Congregação</label> 
						<form:select path="pessoa.congregacao.codigo" class="form-control">
	           				<form:option value="0" label="Selecione a Congregação" />
	            			<form:options items="${congregacoes}" itemValue="codigo" itemLabel="nome" />
	        			</form:select>
	        			<form:errors path="pessoa.congregacao"/>
					</div>
						
					<div class="form-group col-md-3">
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
					<div class="form-group col-md-3">
						<label for="nome">Cidade</label> 
						<form:select path="pessoa.cidade.codigo" class="form-control">
	           				<form:option value="0" label="Selecione uma Cidade" />
	            			<form:options items="${cidades}" itemValue="codigo" itemLabel="nome" />
	        			</form:select>
	        			<form:errors path="pessoa.cidade"/>
					</div>
					</div>

					
					
					
					<input type="hidden" value="${congregacao.codigo}" name="codigo" id="codigo">
					<button type="submit" class="btn btn-primary">Confirmar</button>
					<span style="padding-left: 20px"></span>
					<a href="/secretaria/cadastro/pessoa/" class="btn btn-primary">Voltar</a>
			</form>






</jsp:body>


</layout:template>
