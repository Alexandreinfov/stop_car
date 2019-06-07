<?php

	include("classeCabecalho.php");
	include("parametros_cabecalho.php");
	$c = new Cabecalho($parametros);
	$c->exibe();
	include("autenticacao.php");
	$c->exibe_menu();	
	
	include("classeBancoDeDados.php");	
	
	$operacao = new BancoDeDados($conexao);
	$operacao->insercao($_GET["tabela"],$_POST);

	echo "<br/><h2><center>".$_GET["tabela"]." cadastrado(a) com sucesso.</h2></center><br />";
?>