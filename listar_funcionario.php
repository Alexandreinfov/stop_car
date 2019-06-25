<?php
	include("classeCabecalho.php");
	$c->exibe_menu();
	include("classeTabela.php");
	include("classeBancoDeDados.php");
	
	include("form_funcionario.php");

	$tabela[]="funcionario";

	$bd = new BancoDeDados($conexao);
	
	$coluna[]= "COD_FUNCIONARIO AS Codigo";
	$coluna[]= "Nome";
	$coluna[]= "CPF";
	$coluna[]= "Endereco";
	$coluna[]= "Telefone";
	$coluna[]= "Salario";
	
	$condicao = null;
	$ordenacao = null;
	$m = $bd->select($tabela,$coluna,$condicao,$ordenacao);

	$t = new Tabela($m,"funcionario",0, null, false);
	
	$t->exibe();
?>

	<script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/alterar_cidade.js"></script>
</body>
</html>