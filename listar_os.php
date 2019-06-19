<?php
	include("classeCabecalho.php");
	$c->exibe_menu();
	include("classeTabela.php");
	include("classeBancoDeDados.php");

	include("form_os.php");

	$tabela[]="os";

	$bd = new BancoDeDados($conexao);
	
	$coluna[]= "*";
	
	$condicao = null;
	$ordenacao = null;
	$m = $bd->select($tabela,$coluna,$condicao,$ordenacao);

	$t = new Tabela($m,"os",0, null);
	
	$t->exibe();
?>

	<script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/alterar_cidade.js"></script>
     <script src="js/orderm_servico.js"></script>
</body>
</html>