<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>

<layout:template>
	<jsp:body>
<div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">Secretaria - Congregações</h3>
                    </div>
            
                </div>
                        <div class="row">
                    <div class="col-lg-12">
                        <a href="novo/" class="btn btn-primary">Nova Congregação</a>
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
              					<td>Regional</td>
              					<td>Fone</td>
              					<td>Endereço</td>
              					<td>Nº</td>
              					<td>Bairro</td>
              					<td>Cidade</td>
              					<td>UF</td>
              					<td></td>
              					<td></td>
              				</tr>
               		</thead>
               		<tbody>
               			<c:forEach items="${congregacoes}" var="congregacao">
                			<tr>
               					<td>${congregacao.codigo}</td>
               					<td>${congregacao.nome}</td>
               					<td>${congregacao.regional.nome}</td>
               					<td>${congregacao.fone}</td>
               					<td>${congregacao.endereco}</td>
               					<td>${congregacao.numero}</td>
               					<td>${congregacao.bairro}</td>
								<td>${congregacao.regional.cidade.nome}</td>
								<td>${congregacao.regional.cidade.uf}</td>
               					<td><a href="/secretaria/cadastro/congregacao/${congregacao.codigo}">Alterar</a></td>
								<td><a href="/secretaria/cadastro/congregacao/${congregacao.codigo}/excluir">Excluir</a></td>
               				</tr>
              				</c:forEach>
              				
               		</tbody>
               	</table>


</jsp:body>
</layout:template>
