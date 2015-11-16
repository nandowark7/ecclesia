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
                        <a href="novo/" class="btn btn-primary">Nova Conta</a>
                        <span style="padding-left: 20px"></span>
                        <a href="/" class="btn btn-primary">Voltar ao Íncio</a>
                        </br></br>
                    </div>
            
                </div>
                  
              <div class="esquerda" >
              <label for="nome">Contas de Receitas</label> 
                <table class="table table-striped table-bordered table-hover table-responsive">
               		<thead>
              				<tr>
              					<td>Código</td>
              					<td>Nome</td>
              					<td>Tipo</td>
              					<td></td>
              					<td></td>
              				</tr>
               		</thead>
               		<tbody>
               		
               	<c:forEach items="${planoR}" var="plano">
               	<tr>
					<td>${plano.codigo}</td>
					<td>${plano.nome}</td>
					<td>
         				<c:if test="${plano.tipo=='RECEITAS'}">
         					Receita
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
               	</div>
               	
               	 <div class="direita">
                <table	class="table table-striped table-bordered table-hover table-responsive">
                 <label for="nome">Contas de Despesas</label> 
               		<thead>
              				<tr>
              					<td>Código</td>
              					<td>Nome</td>
              					<td>Tipo</td>
              					<td></td>
              					<td></td>
              				</tr>
               		</thead>
               		<tbody>
               		
               	<c:forEach items="${planoD}" var="plano">
               	<tr>
					<td>${plano.codigo}</td>
					<td>${plano.nome}</td>
					<td>
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
               	</div>


</jsp:body>
</layout:template>