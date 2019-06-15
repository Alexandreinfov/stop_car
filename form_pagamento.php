<?php
<<<<<<< HEAD
	
=======
	include("classeCabecalho.php");
	$c->exibe_menu();
	include("classeTabela.php");
	include("classeBancoDeDados.php");

>>>>>>> 50f5c5dc0beb8004fb6449da1816173a4391061b
	include("classeForm.php");
	include("conexao.php");
	include("autenticacao.php");

<<<<<<< HEAD
	$parametros = null;
	$parametros["action"] = "insere.php?tabela=";
=======
		$parametros = null;
	$parametros["action"] = "insere.php?tabela=tipo_pagamento";
>>>>>>> 50f5c5dc0beb8004fb6449da1816173a4391061b
	$parametros["method"] = "post";
	$parametros["tipoForm"] = "Ordem de Serviço";
	$f = new Form($parametros);

<<<<<<< HEAD
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
=======
	$parametros = null;
	$parametros["name"] = "DESCRICAO_TIPO";
	$parametros["type"] = "radio";
	$parametros["opcoes"] = array("cartao"=>"Cartão de crédito","boleto"=>"Boleto","debito"=>"Debito");
	$parametros["label"] = "tipo de pagamento";
	$f->add_inputOpcoes($parametros);

	for($i=1;$i<=10;$i++){
		$parcela[] = array("label"=>$i."X  sem juro");
	}
	$parametros["name"] = "PARCELAS";
	$parametros["label"] = "Parcelas";
	$f->add_select($parametros, $parcela, null);
>>>>>>> 50f5c5dc0beb8004fb6449da1816173a4391061b


	$parametros = "Cadastrar";
	$f->add_button($parametros);

	$f->exibe();
?>