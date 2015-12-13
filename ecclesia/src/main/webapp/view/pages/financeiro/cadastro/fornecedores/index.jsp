<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>

<layout:template>
	<jsp:body>
<div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">Fornecedores</h2>
                    </div>
            
                </div>
                        <div class="row">
                    <div class="col-lg-12">
                        <a href="novo/" class="btn btn-primary">Novo Fornecedor</a>
                        <span style="padding-left:20px"></span>
                        <a href="/" class="btn btn-primary">Voltar ao Início</a>
                        </br></br>
                    </div>
                </div>
                  
                <table
			class="table table-striped table-bordered table-hover table-responsive">
               		<thead>
               		<p class="bg-sucess">${mensagem}</p>
              				<tr>
              					<td>Código</td>
              					<td>Nome</td>
              					<td>E-Mail</td>
              					<td>Fone</td>
              					<td>Responsável</td>
              					<td>Situação</td>
              					<td></td>
              					<td></td>
              				</tr>
               		</thead>
               		<tbody>
               			<c:forEach items="${fornecedores}" var="fornecedor">
                			<tr>
               					<td>${fornecedor.codigo}</td>
               					<td>${fornecedor.nome}</td>
               					<td>${fornecedor.email}</td>
               					<td>${fornecedor.fone}</td>
               					<td>${fornecedor.responsavel}</td>
               					<td>
               					<c:if test="${fornecedor.situacao=='ATIVA'}">
               						Ativa
               					</c:if>
               					<c:if test="${fornecedor.situacao=='INATIVA'}">
               						Inativa
               					</c:if>
               					</td>
               					<td><a href="/financeiro/cadastro/fornecedores/${fornecedor.codigo}">Detalhar</a></td>
								<td><a href="/financeiro/cadastro/fornecedores/${fornecedor.codigo}/excluir">Excluir</a></td>
               				</tr>
              				</c:forEach>
              				
               		</tbody>
               	</table>


</jsp:body>
</layout:template>
