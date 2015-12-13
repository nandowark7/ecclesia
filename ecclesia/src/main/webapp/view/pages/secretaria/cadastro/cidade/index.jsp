<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>


<layout:template>
	<jsp:body>
				<div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">Cidades</h3>
                    </div>
            
                </div>
                        <div class="row">
                    <div class="col-lg-12">
                        <a href="novo/" class="btn btn-primary">Nova Cidade</a>
                        <span style="padding-left:20px"></span>
                        <a href="/" class="btn btn-primary">Voltar ao Início</a>
                        </br></br>
                    </div>
            
                </div>
                  
                <table
			class="table table-striped table-bordered table-hover table-responsive">
               		<thead>
              				<tr>
              					<td>Código</td>
              					<td>Nome</td>
              					<td>UF</td>
              					<td></td>
              					<td></td>
              				</tr>
               		</thead>
               		<tbody>
               		
               	<c:forEach items="${cidades}" var="cidade">
               	<tr>
					<td>${cidade.codigo}</td>
					<td>${cidade.nome}</td>
					<td>${cidade.uf}</td>
					<td><a href="/secretaria/cadastro/cidade/${cidade.codigo}">Alterar</a></td>
					<td><a href="/secretaria/cadastro/cidade/${cidade.codigo}/excluir">Excluir</a></td>
				</tr>	
	
				</c:forEach>
               			
               		</tbody>
               	</table>


</jsp:body>
</layout:template>

