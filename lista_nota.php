<?php

	$parametros["links"][]="css/nota_fiscal.css";
	include("classeCabecalho.php");
	$c->exibe_menu();
	include("classeTabela.php");
	include("classeBancoDeDados.php");
	include("classeForm.php");
	include("classeNotaFiscal.php");

	$tabela[]="ordem_servico";
	$colunas[]="DATA_ABERTURA";
	$colunas[]="COD_CLIENTE";
	$condicao[]="cod_os = ".$_GET["os"];
	$ordenacao = null;
	$op = new BancoDeDados($conexao);
	$p = $op->select($tabela,$colunas,$condicao,$ordenacao);
	
	$parametros["dataAbertura"] = $p[0]["DATA_ABERTURA"];


	$tabela[]="ordem_servico";
	$colunas[]="COD_CLIENTE";
	$condicao[]="cod_os = 1";
	$ordenacao = null;
	$op = new BancoDeDados($conexao);
	$p = $op->select($tabela,$colunas,$condicao,$ordenacao);

	$parametros["cliente"] = $p[0]["COD_CLIENTE"];


	$f = new Nota($parametros);

	
	$f->exibe();




	/*
	$tabela[]="ordem_servico";
	$colunas[]="DATA_ABERTURA AS 'Data Abertura'";
	$condicao[]="cod_os=1";
	$ordenacao = null;
	$op = new BancoDeDados($conexao);
	$data = $op->select($tabela,$colunas,$condicao,$ordenacao);




	echo $data[0]["Data Abertura"];
	
*/

	?>