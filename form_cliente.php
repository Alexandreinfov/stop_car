<?php

	include("classeForm.php");
	include("conexao.php");
	include("autenticacao.php");
	
	$parametros = null;
	$parametros["action"] = "insere.php?tabela=Cliente"; //"tabela" é o indice o vetor GET, e "cliente" é o elemento do indice "tabela".
	$parametros["method"] = "post";
	$parametros["tipoForm"] = "Cliente";
	
	$f = new Form($parametros); //f = objeto de Form

	$parametros = null;
	$parametros["name"] = "nome";
	$parametros["type"] = "text";
	$parametros["placeholder"] = "Digite o Nome";	
	$f->add_input($parametros); //adcionando os parametros passados para o add_input.

	$parametros = null;
	$parametros["name"] = "cpf";
	$parametros["type"] = "number";
	$parametros["placeholder"] = "Digite o CPF"; 
	$f->add_input($parametros); //adcionando os parametros passados para o add_input.

	$parametros = null;
	$parametros["name"] = "endereco";
	$parametros["type"] = "text";
	$parametros["placeholder"] = "Digite o Endereço";	
	$f->add_input($parametros); //adcionando os parametros passados para o add_input.

	$parametros = null;
	$parametros["name"] = "telefone";
	$parametros["type"] = "text";
	$parametros["placeholder"] = "Digite o Telefone";	
	$f->add_input($parametros); //adcionando os parametros passados para o add_input.

	$parametros = "Enviar";
	$f->add_button($parametros);
	
	
	$f->exibe();
	
?>
