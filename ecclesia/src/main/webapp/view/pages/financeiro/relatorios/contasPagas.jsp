<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="../../../../static/bower_components/jquery/dist/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">

jQuery(function($){
	$('#campoData').mask("99/99/9999");
	$('#campoData2').mask("99/99/9999");
});

</script>




<layout:template>
	<jsp:body>
<div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">Contas Pagas</h2>
                    </div>
            
                </div>
                        <div class="row">
                    <div class="col-lg-12">
                        <a href="/" class="btn btn-primary">Voltar ao Início</a>
                        </br></br>
                    </div>
                </div>
                
                <form:form method="POST" action="generateReportD.do" commandName="jasperInputForm">
 <div class="row">
        
           <div class="form-group col-md-2">
						<label for="inicio">Data Inicial</label> 
						<input type="text" class="form-control" name="inicio" OnKeyUp="mascaraData(this);" id="campoData"
						placeholder="Informe o inicio" value="${JasperInputForm.inicio}">
			</div>
			
			<div class="form-group col-md-2">
						<label for="fim">Data Final</label> 
						<input type="text" class="form-control" name="fim" OnKeyUp="mascaraData(this);" id="campoData2"
						placeholder="Informe o fim" value="${JasperInputForm.fim}">
			</div>
	
	
	</div>           
            		
            		<input type="hidden" name="rptFmt" value="PDF">
       			    <button type="submit" class="btn btn-primary">Gerar</button>
					<span style="padding-left: 20px"></span>
					<a href="/financeiro/lancamentos/despesas/" class="btn btn-primary">Cancelar</a>
 
    </form:form>
                  


</jsp:body>
</layout:template>
