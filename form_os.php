<?php
	
	include("classeForm.php");
	include("conexao.php");
	include("autenticacao.php");

	$parametros = null;
	$parametros["action"] = "insere.php?tabela=OS";
	$parametros["method"] = "post";
	$parametros["tipoForm"] = "Ordem de Serviço";
	$f = new Form($parametros);

	$consulta = "SELECT COD_CLIENTE as value, NOME as label FROM CLIENTE";
	$stmt = $conexao->prepare($consulta);
	$stmt->execute();
	while($linha = $stmt->fetch()){ //pegando os valores linha por linha.
		$clientes[] = $linha;
	}
	$parametros["name"] = "Cliente";
	$parametros["label"] = "Cliente";
	$f->add_select($parametros, $clientes, null);


	$consulta = "SELECT COD_VEICULO as value, PLACA as label FROM VEICULO";
	$stmt = $conexao->prepare($consulta);
	$stmt->execute();
	$veiculos = null;
	while($linha = $stmt->fetch()){ //pegando os valores linha por linha.
		$veiculos[] = $linha;
	}
	$parametros["name"] = "Veiculo";
	$parametros["label"] = "Veículo";
	$f->add_select($parametros, $veiculos, null);	


	$consulta = "SELECT COD_PRODUTO as value, DESCRICAO as label FROM PRODUTO";
	$stmt = $conexao->prepare($consulta);
	$stmt->execute();
	while($linha = $stmt->fetch()){ //pegando os valores linha por linha.
		$produtos[] = $linha;
	}
	$parametros["name"] = "Produto";
	$parametros["label"] = "Produto";
	$f->add_select($parametros, $produtos, null);


	$consulta = "SELECT COD_SERVICO as value, DESCRICAO as label FROM SERVICO";
	$stmt = $conexao->prepare($consulta);
	$stmt->execute();
	$servicos = null;
	while($linha = $stmt->fetch()){ //pegando os valores linha por linha.
		$servicos[] = $linha;
	}
	$parametros["name"] = "Servico";
	$parametros["label"] = "Serviço";
	$f->add_select($parametros, $servicos, null);


	$consulta = "SELECT COD_FUNCIONARIO as value, NOME as label FROM FUNCIONARIO";
	$stmt = $conexao->prepare($consulta);
	$stmt->execute();
	while($linha = $stmt->fetch()){ //pegando os valores linha por linha.
		$funcionarios[] = $linha;
	}
	$parametros["name"] = "Funcionario";
	$parametros["label"] = "Funcionário";
	$f->add_select($parametros, $funcionarios, null);

	$parametros = "Cadastrar";
	$f->add_button($parametros);

	$f->exibe();
?>