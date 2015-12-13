<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>


<layout:template>
	<jsp:body>
				<div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">Contas a Receber/Recebidas</h3>
                    </div>
            
                </div>
                <div class="row">
                    <div class="col-lg-12">
                    	<a href="novo/" class="btn btn-primary">Nova Receita</a>
                        <span style="padding-left:20px"></span>
                        <a href="/" class="btn btn-primary">Voltar ao Início</a>
                        </br></br>
                    </div>
            
                </div>
                  
                <table
			class="table table-striped table-bordered table-hover table-responsive">
               		<thead>
              				<tr>
              					<td>Doc</td>
              					<td>Cliente</td>
              					<td>Descrição</td>
              					<td>Emissao</td>
              					<td>Vencimento</td>
              					<td>Data Rec.</td>
              					<!-- <td>Valor</td>
              					<td>Acréscimo</td>
              					<td>Desconto</td> -->
              					<td>Total</td>
              				
              					<td></td>
              					<td></td>
              					<td></td>
              				</tr>
               		</thead>
               		<tbody>
               		
               	<c:forEach items="${parcelas}" var="parcela">
               	<tr>
					<td>${parcela.receita.documento}</td>
					<td>${parcela.receita.clientes.nome}</td>
					
					<td>${parcela.descricao}</td>
					
         			<td>${parcela.receita.emissao}</td>
         			<td>${parcela.vencimento}</td>
         			<%-- <td>${parcela.valor}</td>
         			<td>${parcela.acrescimo}</td>
         			<td>${parcela.desconto}</td> --%>
         			<td>${parcela.recebimento}</td>
         			<td>${parcela.total}</td>
         			
					<td>
						<a href="/financeiro/lancamentos/receitas/receber/${parcela.codigo}">Receber</a>
					</td>
					<td>
						<a href="/financeiro/lancamentos/receitas/${parcela.receita.codigo}">Alterar</a>
					</td>
					<td>
						<a href="/financeiro/lancamentos/receitas/${parcela.receita.codigo}/excluir">Excluir</a>
					</td>
				</tr>	
	
				</c:forEach>
               			
               		</tbody>
               	</table>


</jsp:body>
</layout:template>