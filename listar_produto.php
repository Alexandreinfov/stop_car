<?php
	include("classeCabecalho.php");
	$c->exibe_menu();
	include("classeTabela.php");
	include("classeBancoDeDados.php");

	include("form_produto.php");

	$tabela[]="produto";

	$bd = new BancoDeDados($conexao);
	
	$coluna[]= "COD_PRODUTO AS Codigo";
	$coluna[]= "Descricao";
	$coluna[]= "Preco";
	
	$condicao = null;
	$ordenacao = null;
	$m = $bd->select($tabela,$coluna,$condicao,$ordenacao);

	$t = new Tabela($m,"produto",0, null, false);
	
	$t->exibe();
?>

	<script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/alterar_cidade.js"></script>
</body>
</html>