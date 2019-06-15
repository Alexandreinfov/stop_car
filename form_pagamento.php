<?php
	
	include("classeForm.php");
	include("conexao.php");
	include("autenticacao.php");

	$parametros = null;
	$parametros["action"] = "insere.php?tabela=";
	$parametros["method"] = "post";
	$parametros["tipoForm"] = "Ordem de Serviço";
	$f = new Form($parametros);

	//SELECT PAGAMENTO
	$consulta = "SELECT COD_PAGAMENTO as value, NOME as label FROM TIPO_PAGAMENTO";
	$stmt = $conexao->prepare($consulta);
	$stmt->execute();
	$funcionarios = null;
	while($linha = $stmt->fetch()){ //pegando os valores linha por linha.
		$funcionarios[] = $linha;
	}
	$parametros["name"] = "COD_FUNCIONARIO";
	$parametros["label"] = "Pagamento";
	$p->add_pagamento($parametros, $funcionarios, null); 


	$parametros = "Cadastrar";
	$f->add_button($parametros);

	$f->exibe();
?>