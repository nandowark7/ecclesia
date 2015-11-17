<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="../../../../static/bower_components/jquery/dist/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
	var parcelas = [];
	var codigo = -1;
	
	jQuery(document).ready(function ($) {
		parcelas = JSON.parse('${parcelas}');
		
		adicionarHidden();
		adicionarGrid();
		calculaValorTotal();
	});
	
	function adicionarParcela() {
		var valor = parseFloat($("#valor").val());
		var acrescimo = parseFloat($("#acrescimo").val());
		var desconto = parseFloat($("#desconto").val());
		
		if (!valor) {
			valor = 0.0;
		}
		if (! acrescimo) {
			acrescimo = 0.0;
		}
		if (!desconto) {
			desconto = 0.0;
		}
		
		var parcela = {
			codigo: codigo,
			descricao: $("#descricao").val(),
			vencimento: $("#vencimento").val(),
			valor: valor,
			acrescimo: acrescimo,
			desconto: desconto,
			total: valor + acrescimo - desconto
		}
		
		parcelas.push(parcela);
		codigo --;
		
		removeHidden();
		removeGrid();
		adicionarHidden();
		adicionarGrid();
		calculaValorTotal();
		limpaTela();
	}
	
	function limpaTela(){
		$("#descricao").val("");
		$("#vencimento").val("");
		$("#valor").val("");
		$("#acrescimo").val("");
		$("#desconto").val("");
	}
	
	function removeHidden() {
		$("input[name*='parcelas[']").remove();
	}
	
	function removeGrid() {
		$("#gridParcelas tbody").html("");
	}
	
	function adicionarHidden(){
		for (var i = 0; i < parcelas.length; i++) {
			$("<input>").attr({type: "hidden", id: "parcelas[" + i + "].codigo", name: "parcelas[" + i + "].codigo",}).val(parcelas[i].codigo).appendTo("form");
			$("<input>").attr({type: "hidden", id: "parcelas[" + i + "].descricao", name: "parcelas[" + i + "].descricao",}).val(parcelas[i].descricao).appendTo("form");
			$("<input>").attr({type: "hidden", id: "parcelas[" + i + "].valor", name: "parcelas[" + i + "].valor",}).val(parcelas[i].valor).appendTo("form");
			$("<input>").attr({type: "hidden", id: "parcelas[" + i + "].acrescimo", name: "parcelas[" + i + "].acrescimo",}).val(parcelas[i].acrescimo).appendTo("form");
			$("<input>").attr({type: "hidden", id: "parcelas[" + i + "].desconto", name: "parcelas[" + i + "].desconto",}).val(parcelas[i].desconto).appendTo("form");
			$("<input>").attr({type: "hidden", id: "parcelas[" + i + "].vencimento", name: "parcelas[" + i + "].vencimento",}).val(parcelas[i].vencimento).appendTo("form");
			$("<input>").attr({type: "hidden", id: "parcelas[" + i + "].total", name: "parcelas[" + i + "].total",}).val(parcelas[i].total).appendTo("form");
		}
	}
	
	function adicionarGrid(){
		console.log(parcelas);
		for (var i = 0; i < parcelas.length; i++) {
			$("#gridParcelas tbody").last().append($("<tr/>"));
			$("#gridParcelas tbody tr").last().append($("<td/>").text(parcelas[i].descricao));
			$("#gridParcelas tbody tr").last().append($("<td/>").text(parcelas[i].vencimento));
			$("#gridParcelas tbody tr").last().append($("<td/>").text(parcelas[i].valor));
			$("#gridParcelas tbody tr").last().append($("<td/>").text(parcelas[i].acrescimo));
			$("#gridParcelas tbody tr").last().append($("<td/>").text(parcelas[i].desconto));
			$("#gridParcelas tbody tr").last().append($("<td/>").text(parcelas[i].total));
		}
	}
	
	function calculaValorTotal(){
		var valor = 0.0;
		for (var i = 0; i < parcelas.length; i++) {
			valor += parcelas[i].total;
		}
		$("#total").val(valor);
	}
</script>
<layout:template>
	<jsp:body>
	
				<div class="row">
					<div class="col-lg-12">
						<h4 class="page-header">Cabeçalho da Nota</h4>
					</div>

				</div>
				
				<form action="/financeiro/lancamentos/receitas/" method="post" enctype="multipart/form-data">
				
				<div class="row">
					<div class="form-group col-md-1">
						<label for="documento">Nº Doc.</label> 
						<input type="text" class="form-control" name="documento" id="documento"
						placeholder="Doc...">
					</div>
					<div class="form-group col-md-2">
						<label for="emissao">Emissão</label> 
						<input type="text" class="form-control" name="emissao" id="emissao"
						placeholder="Informe a Data...">
					</div>
					<div class="form-group col-md-3">
						<label for="nome">Cliente</label> 
						<form:select path="receita.clientes.codigo" class="form-control">
	           				<form:option value="0" label="Selecione um Cliente" />
	            			<form:options items="${clientes}" itemValue="codigo"
							itemLabel="nome" />
	        			</form:select>
					</div>
					<div class="form-group col-md-2">
						<label for="nome">Plano de Contas</label> 
						<form:select path="receita.plano.codigo" class="form-control">
	           				<form:option value="0" label="Selecione um Plano" />
	            			<form:options items="${plano}" itemValue="codigo"
							itemLabel="nome" />
	        			</form:select>
					</div>
					<div class="form-group col-md-2">
						<label for="nome">Congregação</label> 
						<form:select path="receita.congregacoes.codigo" class="form-control">
	           				<form:option value="0" label="Selecione..." />
	            			<form:options items="${congregacoes}" itemValue="codigo"
							itemLabel="nome" />
	        			</form:select>
					</div>
					<div class="form-group col-md-2">
						<label for="nome">Departamento</label> 
						<form:select path="receita.departamentos.codigo" class="form-control">
	           				<form:option value="0" label="Selecione..." />
	            			<form:options items="${departamentos}" itemValue="codigo"
							itemLabel="nome" />
	        			</form:select>
					</div>
					</div>
					
<!--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->

				<div class="row">
					<div class="col-lg-12">
						<h4 class="page-header">Parcelas da Nota</h4>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group col-md-4">
						<label for="descricao">Descrição</label> 
						<input type="text" class="form-control" name="descricao" id="descricao"
						placeholder="Informe o histórico...">
						<form:errors path="parcela.descricao"/>
					</div>
					<div class="form-group col-md-2">
						<label for="vencimento">Vencimento</label> 
						<input type="text" class="form-control" name="vencimento" id="vencimento"
						placeholder="Informe o vencimento...">
					</div>
					<div class="form-group col-md-2">
						<label for="valor">Valor</label> 
						<input type="text" class="form-control" id="valor"
						placeholder="Informe o valor..." >
					</div>
					<div class="form-group col-md-2">
						<label for="acrescimo">Acréscimo</label> 
						<input type="text" class="form-control" id="acrescimo"
						placeholder="Informe o acrescimo...">
						<form:errors path="parcela.acrescimo"/>
					</div>
					
					
					<div class="form-group col-md-2">
						<label for="desconto">Desconto</label> 
						<input type="text" class="form-control" name="desconto" id="desconto"
						placeholder="Informe o desconto...">
						<form:errors path="parcela.desconto"/>
					</div>
					</div>
					<div class="row">
						<div class="form-group col-md-2">
							<button type="button" class="btn btn-primary" onclick="adicionarParcela();">Adicionar</button>
						</div>
					</div>
					
					<table id="gridParcelas" class="table table-striped table-bordered table-responsive">
						<thead>
							<tr>
								<td>Descrição</td>
								<td>Vencimento</td>
								<td>Valor</td>
								<td>Acréscimo</td>
								<td>Desconto</td>
								<td>Total</td>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					
					<div class="row">
					<div class="form-group col-md-2">
						<label for="valorTotal">Valor Total</label> 
						<input type="text" class="form-control" name="total" id="total"
						readonly value="${total}">
						<form:errors path="total"/>
					</div></div>
					
					<input type="hidden" value="${codigo}" name="codigo" id="codigo">
					<button type="submit" class="btn btn-primary">Confirmar</button>
					<span style="padding-left:20px"></span>
					<a href="/financeiro/lancamentos/receitas/" class="btn btn-primary">Cancelar</a>
					
				</form>


</jsp:body>


</layout:template>
