<?php
	
	include("classeForm.php");
	include("conexao.php");
	include("autenticacao.php");
	//include("classSelect.php");
	
	$parametros = null;
	$parametros["action"] = "insere.php?tabela=Veiculo";
	$parametros["method"] = "post";
	$parametros["tipoForm"] = "Veiculo";
	$f = new Form($parametros);

	$consulta = "SELECT COD_CLIENTE as value, NOME as label FROM CLIENTE";
	$stmt = $conexao->prepare($consulta);
	$stmt->execute();
	$clientes = null;
	while($linha = $stmt->fetch()){ //pegando os valores linha por linha.
		$clientes[] = $linha;
	}
	$parametros["name"] = "COD_CLIENTE";
	$parametros["label"] = "Clientes";
	$f->add_select($parametros, $clientes, null);

	$parametros = null;
	$parametros["name"] = "placa";
	$parametros["type"] = "text";
	$parametros["placeholder"] = "Placa do Veiculo";
	$f->add_input($parametros);

	$parametros = null;
	$parametros["name"] = "modelo";
	$parametros["type"] = "text";
	$parametros["placeholder"] = "Modelo do Veiculo";
	$f->add_input($parametros);

	$parametros = null;
	$parametros["name"] = "marca";
	$parametros["type"] = "text";
	$parametros["placeholder"] = "Marca do Veiculo";
	$f->add_input($parametros);

	for($i=1950;$i<=@date("Y");$i++){
		$ano[] = array("label"=>$i);
	}
	$parametros["name"] = "Ano";
	$parametros["label"] = "Ano Veiculo";
	$f->add_select($parametros, $ano, null);

	$parametros = "Cadastrar";
	$f->add_button($parametros);

	$f->exibe();
?>