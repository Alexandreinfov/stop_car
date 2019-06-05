<?php
	include("classeCabecalho.php");
	$c->exibe_menu();
	include("classeTabela.php");
	include("classeBancoDeDados.php");

	include("form_veiculo.php");

	$tabela[]="veiculo";

	$bd = new BancoDeDados($conexao);
	
	$coluna[]= "COD_VEICULO AS Codigo";
	$coluna[]= "Placa";
	$coluna[]= "Modelo";
	$coluna[]= "Marca";
	$coluna[]= "Ano";
	
	$condicao = null;
	$ordenacao = null;
	$m = $bd->select($tabela,$coluna,$condicao,$ordenacao);

	$t = new Tabela($m,"veiculo",0, null);
	
	$t->exibe();
?>

	<script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/alterar_cidade.js"></script>
</body>
</html>