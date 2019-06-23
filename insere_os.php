<?php

	include("classeBancoDeDados.php");

	$operacao = new BancoDeDados($conexao);
	$operacao->insercao($_GET["tabela"],$_POST);
	
	
	$tabela[]="ordem_servico";
	$coluna[] = "MAX(COD_OS) as id";
	$condicao = null;
	$ordem = null;

	$r = $operacao->select($tabela,$coluna,$condicao,$ordem);
		
	$cod_os = $r[0]["id"];
	
	echo $cod_os;	
	
?>