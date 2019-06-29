<?php
	
	include("classeForm.php");
	include("conexao.php");
	include("autenticacao.php");

	$parametros = null;
	$parametros["action"] = "insere.php?tabela=servico_produto";
	$parametros["method"] = "post";
	$parametros["tipoForm"] = "Servico";
	$f = new Form($parametros);

	$parametros = null;
	$parametros["name"] = "descricao";
	$parametros["type"] = "text";
	$parametros["placeholder"] = "Descrição do Serviço";
	$f->add_input($parametros);

	$parametros = null;
	$parametros["name"] = "preco";
	$parametros["type"] = "text";
	$parametros["step"] = "0.1";
	$parametros["placeholder"] = "Preço do Serviço";
	$f->add_input($parametros);

	$parametros = null;
	$parametros["name"] = "tipo";
	$parametros["type"] = "radio";
	$parametros["opcoes"] = array("produto"=>"Produto","servico"=>"Serviço");
	$parametros["label"] = "Tipo";	
	$parametros["value"] = "s";	
	$f->add_inputOpcoes($parametros);

	$parametros = "Cadastrar";
	$f->add_button($parametros);

	$f->exibe();
?>