<?php
	include("classeCabecalho.php");
	$c->exibe_menu();
	include("classeTabela.php");
	include("classeBancoDeDados.php");

	include("busca.php");

	$tabela[]="SERVICO_PRODUTO";

	$bd = new BancoDeDados($conexao);
	//$coluna[]=  "SELECT COD_CLIENTE as value, NOME as label FROM CLIENTE";
	$coluna[]= "COD_SERVICO_PRODUTO AS Codigo";
	$coluna[]= "DESCRICAO";
	$coluna[]= "PRECO";
	
	$condicao[] = "TIPO = 'p'";
	$ordenacao = NULL;
	$m = $bd->select($tabela,$coluna,$condicao,$ordenacao);

	$t = new Tabela($m,"SERVICO_PRODUTO",0, null, false);
	
	$t->exibe();
?>