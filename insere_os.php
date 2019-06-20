<?php

	include("classeBancoDeDados.php");

	$operacao = new BancoDeDados($conexao);
	$operacao->insercao($_GET["tabela"],$_POST);
	
	
	$tabela[]="ordem_servico";
	$coluna[] = "MAX(COD_OS) as id";
	$condicao = null;
	$ordem = null;

	$r = $operacao->select($tabela,$coluna,$condicao,$ordem);
		
	$cod_os[] = $r[0]["id"];
	$cod_os[] = 10;
	//$cod_os[] = $r[0]["id"];

	foreach ($cod_os as $i => $v) {
		echo $cod_os[$v];	
	}
?>