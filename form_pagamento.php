<?php

	include("classeCabecalho.php");
	$c->exibe_menu();
	include("classeTabela.php");
	include("classeBancoDeDados.php");

	include("classeForm.php");
	include("conexao.php");
	include("autenticacao.php");

	

	$parametros = null;
	$parametros["action"] = "insere.php?tabela=tipo_pagamento";
	$parametros["method"] = "post";
	$parametros["tipoForm"] = "Ordem de Serviço";
	$f = new Form($parametros);

	$parametros = null;
	$parametros["name"] = "DESCRICAO_TIPO";
	$parametros["type"] = "radio";
	$parametros["opcoes"] = array("cartao"=>"Cartão de crédito","boleto"=>"Boleto","prazo"=>"A Prazo","crediario"=>"Crediário");
	$parametros["label"] = "Forma de Pagamento";
	$f->add_inputOpcoes($parametros);

	for($i=1;$i<=10;$i++){
		$parcela[] = array("label"=>$i."X  sem juros");
	}
	$parametros["name"] = "PARCELAS";
	$parametros["label"] = "Parcelas";
	$f->add_select($parametros, $parcela, null);

	$parametros = "Cadastrar";
	$f->add_button($parametros);

	$f->exibe();
?>