<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>

<layout:template>
	<jsp:body>
<div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">Departamentos</h2>
                    </div>
            
                </div>
                        <div class="row">
                    <div class="col-lg-12">
                        <a href="novo/" class="btn btn-primary">Novo Departamento</a>
                        <span style="padding-left:20px"></span>
                        <a href="/" class="btn btn-primary">Voltar ao In�cio</a>
                        </br></br>
                    </div>
                </div>
                  
                <table
			class="table table-striped table-bordered table-hover table-responsive">
               		<thead>
               		<p class="bg-sucess">${mensagem}</p>
              				<tr>
              					<td>C�digo</td>
              					<td>Nome</td>
              					<td>Tipo</td>
              					<td>Congrega��o</td>
              					<td></td>
              					<td></td>
              				</tr>
               		</thead>
               		<tbody>
               			<c:forEach items="${departamento}" var="departamento">
                			<tr>
               					<td>${departamento.codigo}</td>
               					<td>${departamento.nome}</td>
               					<td>
               					<c:if test="${departamento.tipo=='INFANTIL'}">
               						Infantil
               					</c:if>
               					<c:if test="${departamento.tipo=='ADOLECENTE'}">
               						Adolecentes
               					</c:if>
               					<c:if test="${departamento.tipo=='MOCIDADE'}">
               						Mocidade
               					</c:if>
               					<c:if test="${departamento.tipo=='CIRCULO'}">
               						Circulo de Ora��o
               					</c:if>
               					<c:if test="${departamento.tipo=='MISSAO'}">
               						Miss�o
               					</c:if>
               					</td>
               					
               					<td>${departamento.congregacao.nome}</td>
               					<td><a href="/departamento/cadastro/tipos/${departamento.codigo}">Detalhar</a></td>
								<td><a href="/departamento/cadastro/tipos/${departamento.codigo}/excluir">Excluir</a></td>
               				</tr>
              				</c:forEach>
              				
               		</tbody>
               	</table>


</jsp:body>
</layout:template>
