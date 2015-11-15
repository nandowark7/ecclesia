<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>


<layout:template>
	<jsp:body>
				<div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">Plano de Contas - DRE</h3>
                    </div>
            
                </div>
                        <div class="row">
                    <div class="col-lg-12">
                        <a href="novo/" class="btn btn-primary">Novo Plano</a>
                        <span style="padding-left: 20px"></span>
                        <a href="/" class="btn btn-primary">Voltar ao �ncio</a>
                        </br></br>
                    </div>
            
                </div>
                  
                <table
			class="table table-striped table-bordered table-hover table-responsive">
               		<thead>
              				<tr>
              					<td>C�digo</td>
              					<td>Nome</td>
              					<td>Tipo</td>
              					<td></td>
              					<td></td>
              				</tr>
               		</thead>
               		<tbody>
               		
               	<c:forEach items="${plano}" var="plano">
               	<tr>
					<td>${plano.codigo}</td>
					<td>${plano.nome}</td>
					<td>
         				<c:if test="${plano.tipo=='RECEITAS'}">
         					Receita
         				</c:if>
         				<c:if test="${plano.tipo=='DESPESAS'}">
         					Despesa
         				</c:if>
         			</td>
					<td><a
							href="/financeiro/cadastro/plano_contas/${plano.codigo}">Alterar</a></td>
					<td><a
							href="/financeiro/cadastro/plano_contas/${plano.codigo}/excluir">Excluir</a></td>
				</tr>	
	
				</c:forEach>
               			
               		</tbody>
               	</table>


</jsp:body>
</layout:template>