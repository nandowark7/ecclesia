<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>

<layout:template>
	<jsp:body>
<div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">Clientes</h2>
                    </div>
            
                </div>
                        <div class="row">
                    <div class="col-lg-12">
                        <a href="novo/" class="btn btn-primary">Novo Cliente</a>
                        <span style="padding-left:20px"></span>
                        <a href="/" class="btn btn-primary">Voltar ao Íncio</a>
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
               			<c:forEach items="${clientes}" var="cliente">
                			<tr>
               					<td>${cliente.codigo}</td>
               					<td>${cliente.nome}</td>
               					<td>${cliente.email}</td>
               					<td>${cliente.fone}</td>
               					<td>${cliente.responsavel}</td>
               					<td>
               					<c:if test="${cliente.situacao=='ATIVA'}">
               						Ativa
               					</c:if>
               					<c:if test="${cliente.situacao=='INATIVA'}">
               						Inativa
               					</c:if>
               					</td>
               					<td><a href="/financeiro/cadastro/clientes/${cliente.codigo}">Detalhar</a></td>
								<td><a href="/financeiro/cadastro/clientes/${cliente.codigo}/excluir">Excluir</a></td>
               				</tr>
              				</c:forEach>
              				
               		</tbody>
               	</table>


</jsp:body>
</layout:template>
