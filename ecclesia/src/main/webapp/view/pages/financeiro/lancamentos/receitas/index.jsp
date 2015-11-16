<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>


<layout:template>
	<jsp:body>
				<div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">Contas Bancárias e Locais</h3>
                    </div>
            
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <a href="novo/" class="btn btn-primary">Nova Conta</a>
                        <span style="padding-left: 20px"></span>
                        <a href="/" class="btn btn-primary">Voltar ao Íncio</a>
                        </br></br>
                    </div>
            
                </div>
                  
                <table
			class="table table-striped table-bordered table-hover table-responsive">
               		<thead>
              				<tr>
              					<td>Código</td>
              					<td>Tipo</td>
              					<td>Nome</td>
              					<td>Agência</td>
              					<td>Conta</td>
              					<td></td>
              					<td></td>
              				</tr>
               		</thead>
               		<tbody>
               		
               	<c:forEach items="${banco}" var="banco">
               	<tr>
					<td>${banco.codigo}</td>
					<td>
         				<c:if test="${banco.tipoconta=='CAIXA'}">
         					Caixa Local
         				</c:if>
         				<c:if test="${banco.tipoconta=='CC'}">
         					Corrente
         				</c:if>
         				<c:if test="${banco.tipoconta=='PP'}">
         					Poupança
         				</c:if>
         				<c:if test="${banco.tipoconta=='AP'}">
         					Aplicação
         				</c:if>
         			</td>
         			<td>${banco.nome}</td>
         			<td>${banco.agencia}</td>
         			<td>${banco.conta}</td>
					<td><a
							href="/financeiro/cadastro/bancos_contas/${banco.codigo}">Alterar</a></td>
					<td><a
							href="/financeiro/cadastro/bancos_contas/${banco.codigo}/excluir">Excluir</a></td>
				</tr>	
	
				</c:forEach>
               			
               		</tbody>
               	</table>


</jsp:body>
</layout:template>