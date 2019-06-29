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
	$ordenacao = "'DATA ABERTURA'";
	$m = $bd->select($tabela,$coluna,$condicao,$ordenacao);

	echo "<hr/><hr/>";

	$parametros=null;
	$parametros["type"]="text";
	$parametros["name"]="input_busca";
	$i = new Input($parametros);
	$i->exibe();

	$parametros=null;
	$parametros["type"]="button";
	$parametros["name"]="busca";
	$parametros["value"]="buscar";
	$i = new Input($parametros);
	$i->exibe();

	$t = new Tabela($m,"os",0, null, true);

	$t->exibe();
?>	
	<script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/alterar_cidade.js"></script>
    <script src="js/orderm_servico.js"></script>
    <script src="js/os.js"></script>

</body>
</html>