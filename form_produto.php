<?php
	
	include("classeForm.php");
	include("conexao.php");

	$parametros = null;
	$parametros["action"] = "insere.php?tabela=Produto";
	$parametros["method"] = "post";
	$parametros["tipoForm"] = "Produto";

	$f = new Form($parametros);

	$parametros = null;
	$parametros["name"] = "descricao";
	$parametros["type"] = "text";
	$parametros["placeholder"] = "Descrição do Produto";
	$f->add_input($parametros);

	$parametros = null;
	$parametros["name"] = "preco";
	$parametros["type"] = "text";
	$parametros["step"] = "0.1";
	$parametros["placeholder"] = "Preço do Produto";
	$f->add_input($parametros);

	$parametros = "Cadastrar";
	$f->add_button($parametros);

	$f->exibe();
?>