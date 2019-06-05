<?php

	include("classeForm.php");
	include("conexao.php");
	include("autenticacao.php");

	$parametros = null;
	$parametros["action"] = "insere.php?tabela=Funcionario";
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

	$parametros = null;
	$parametros["name"] = "salario";
	$parametros["type"] = "number";
	$parametros["step"] = "0.1";
	$parametros["placeholder"] = "Digite o Salário";	
	$f->add_input($parametros); //adcionando os parametros passados para o add_input.

	$parametros = "Enviar";
	$f->add_button($parametros); //Adicionando um Botão "Enviar"
	
	
	$f->exibe(); //Exibindo o formulario.
?>