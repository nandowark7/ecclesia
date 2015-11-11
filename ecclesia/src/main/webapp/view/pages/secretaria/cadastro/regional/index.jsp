<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>

<layout:template>
	<jsp:body>
<div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">Regionais</h2>
                    </div>
            
                </div>
                        <div class="row">
                    <div class="col-lg-12">
                        <a href="novo/" class="btn btn-primary">Nova Regional</a>
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
              					<td>Cidade Sede</td>
              					<td>UF</td>
              					<td></td>
              					<td></td>
              				</tr>
               		</thead>
               		<tbody>
               			<c:forEach items="${regionais}" var="regional">
                			<tr>
               					<td>${regional.codigo}</td>
               					<td>${regional.nome}</td>
               					<td>${regional.cidade.nome}</td>
								<td>${regional.cidade.uf}</td>               					
               					<td><a href="/secretaria/cadastro/regional/${regional.codigo}">Alterar</a></td>
								<td><a href="/secretaria/cadastro/regional/${regional.codigo}/excluir">Excluir</a></td>
               				</tr>
              				</c:forEach>
              				
               		</tbody>
               	</table>


</jsp:body>
</layout:template>
