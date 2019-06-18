<?php

	$parametros["links"][]="js/busca.js";
	include("classeForm.php");
	include("conexao.php");
	include("autenticacao.php");

	
	$parametros = null;
	$parametros["action"] = "";
	$parametros["method"] = "get";
	$parametros["tipoForm"] = "Busca Cliente";
	$f = new Form($parametros);

	$parametros = null;
	$parametros["name"] = "palavra";
	$parametros["type"] = "text";
	$parametros["id"] = "busca";
	$parametros["placeholder"] = "Cliente...";
	$f->add_input($parametros);

	$parametros = "Buscar";
	$f->add_button($parametros);

	$f->exibe();
?>