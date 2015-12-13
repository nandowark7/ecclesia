<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="../../../../static/bower_components/jquery/dist/jquery.min.js" type="text/javascript"></script>



<layout:template>
	<jsp:body>
<div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">Listagem de Membros - Dados para Contato</h3>
                    </div>
            
                </div>
                       
                
       <form:form method="POST" action="membrosContatos.do" commandName="jasperInputForm">
               
            		
            		<input type="hidden" name="rptFmt" value="PDF">
       			    <button type="submit" class="btn btn-primary">Gerar Relatório</button>
					<span style="padding-left: 20px"></span>
					<a href="/secretaria/cadastro/pessoa/" class="btn btn-primary">Ir para Cadadastros</a>
 
    </form:form>
                  


</jsp:body>
</layout:template>
