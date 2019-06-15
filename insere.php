<?php

	include("classeCabecalho.php");
	$c->exibe_menu();
	include("classeBancoDeDados.php");

	$operacao = new BancoDeDados($conexao);
	$operacao->insercao($_GET["tabela"],$_POST);
	
	switch ($_GET["tabela"]) {
		case 'servico_produto':
			if($_POST["tipo"] == 'p'){
				echo "<br/><h2><center> Produto cadastrado(a) com sucesso.</h2></center><br />";
			}else{
				echo "<br/><h2><center> Serviço cadastrado(a) com sucesso.</h2></center><br />";
			}
		break;
		case 'Veiculo':
			echo "<br/><h2><center> Automovel ".$_POST["modelo"]."  cadastrado com sucesso.!</h2></center><br />";
			break;

			default:
			echo "<br/><h2><center>".$_GET["tabela"]." cadastrado(a) com sucesso.</h2></center><br />";
			
			break;
	}
	
?>