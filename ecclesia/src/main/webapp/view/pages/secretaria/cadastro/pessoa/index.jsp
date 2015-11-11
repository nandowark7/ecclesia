<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>

<layout:template>
	<jsp:body>
<div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">Membros</h2>
                    </div>
            
                </div>
                        <div class="row">
                    <div class="col-lg-12">
                        <a href="novo/" class="btn btn-primary">Novo Membro</a>
                        <span style="padding-left:20px"></span>
                        <a href="/" class="btn btn-primary">Voltar ao Íncio</a>
                        </br></br>
                    </div>
                </div>
                  
                <table
			class="table table-striped table-bordered table-hover table-responsive">
               		<thead>
              				<tr>
              					<td>Código</td>
              					<td>Nome</td>
              					<td>E-Mail</td>
              					<td>Fone</td>
              					<td>Congregacao</td>
              					<td>Situação</td>
              					<td>Função</td>
              					<td>Grupo</td>
              					<td></td>
              					<td></td>
              				</tr>
               		</thead>
               		<tbody>
               			<c:forEach items="${pessoas}" var="pessoa">
                			<tr>
               					<td>${pessoa.codigo}</td>
               					<td>${pessoa.nome}</td>
               					<td>${pessoa.email}</td>
               					<td>${pessoa.fone}</td>
               					<td>${pessoa.congregacao.nome}</td>
               					<td>
               					<c:if test="${pessoa.situacao=='ATIVA'}">
               						Ativa
               					</c:if>
               					<c:if test="${pessoa.situacao=='INATIVA'}">
               						Inativa
               					</c:if>
               					</td>
               					<td>${pessoa.funcao}</td>
               					<td>${pessoa.grupo}</td>
               					<td><a href="/secretaria/cadastro/pessoa/${pessoa.codigo}">Detalhar</a></td>
								<td><a href="/secretaria/cadastro/pessoa/${pessoa.codigo}/excluir">Excluir</a></td>
               				</tr>
              				</c:forEach>
              				
               		</tbody>
               	</table>


</jsp:body>
</layout:template>
