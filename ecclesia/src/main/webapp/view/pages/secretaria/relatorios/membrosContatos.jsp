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
                        <h2 class="page-header">Contas Recebidas</h2>
                    </div>
            
                </div>
                        <div class="row">
                    <div class="col-lg-12">
                        <a href="/" class="btn btn-primary">Voltar ao Íncio</a>
                        </br></br>
                    </div>
                </div>
                
       <form:form method="POST" action="membrosContatos.do" commandName="jasperInputForm">
               
            		
            		<input type="hidden" name="rptFmt" value="PDF">
       			    <button type="submit" class="btn btn-primary">Gerar</button>
					<span style="padding-left: 20px"></span>
					<a href="/financeiro/lancamentos/receitas/" class="btn btn-primary">Cancelar</a>
 
    </form:form>
                  


</jsp:body>
</layout:template>
