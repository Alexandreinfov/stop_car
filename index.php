<?php


	include("classeCabecalho.php");
	include("parametros_cabecalho.php");
	$c = new Cabecalho($parametros);
	$c->exibe();
	include("autenticacao.php");
	$c->exibe_menu();	
	
	
	

?>