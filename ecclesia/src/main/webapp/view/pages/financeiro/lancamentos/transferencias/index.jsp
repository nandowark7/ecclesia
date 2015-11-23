<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>

<layout:template>
	<jsp:body>
		<div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">Movimentações</h2>
                    </div>
            
        </div>
               <div class="row">
                    <div class="col-lg-12">
                        <a href="simples/" class="btn btn-primary">Lançamento Simples</a>
                        <span style="padding-left:20px"></span>
                        <a href="entrecontas/" class="btn btn-primary">Movimentação Entre contas</a>
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
              					<td>Doc</td>
              					<td>Descrição</td>
              					<td>Valor</td>
              					<td>Data</td>
              					<td>Origem</td>
              					<td>Destino</td>
              					<td>Tipo</td>
              					<td></td>
              					<td></td>
              				</tr>
               		</thead>
               		<tbody>
               			<c:forEach items="${movimentos}" var="movimento">
                			<tr>
               					<td>${movimento.documento}</td>
               					<td>${movimento.descricao}</td>
               					<td>${movimento.valor}</td>
               					<td>${movimento.data}</td>
               					<td>${movimento.contaOrigem.nome}</td>
               					<td>${movimento.contaDestino.nome}</td>
               					<td>
               					<c:if test="${movimento.tipo=='ENTRECONTAS'}">
               						Entre Contas
               					</c:if>
               					<c:if test="${movimento.tipo=='SIMPLES'}">
               						Simples
               					</c:if>
               					</td>
               					<td><a href="/financeiro/lancamentos/transferencias/simples/${movimento.codigo}">Alterar</a></td>
								<td><a href="/financeiro/lancamentos/transferencias/${movimento.codigo}/excluir">Excluir</a></td>
               				</tr>
              				</c:forEach>
              				
               		</tbody>
               	</table>


</jsp:body>
</layout:template>
