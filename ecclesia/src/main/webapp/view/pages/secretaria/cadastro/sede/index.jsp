<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>

<layout:template>
	<jsp:body>
<div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">Cadastro de Sede</h2>
                    </div>
            
                </div>
                        <div class="row">
                    <div class="col-lg-12">
                        <a href="novo/" class="btn btn-primary">Novo</a>
                    </div>
            
                </div>
                  
                <table
			class="table table-striped table-bordered table-hover table-responsive">
               		<thead>
              				<tr>
              					<td>Id</td>
              					<td>Nome</td>
              				</tr>
               		</thead>
               		<tbody>
               			<c:forEach items="${sedes}" var="sede">
                			<tr>
               					<td>${sede.id}</td>
               					<td>${sede.nome}</td>
               				</tr>
              				</c:forEach>
               		</tbody>
               	</table>


</jsp:body>
</layout:template>
