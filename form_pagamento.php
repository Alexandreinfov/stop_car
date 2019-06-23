<?php

	include("classeCabecalho.php");
	$c->exibe_menu();
	include("classeTabela.php");
	include("classeBancoDeDados.php");

	include("classeForm.php");
	include("conexao.php");
	include("autenticacao.php");

	

	$parametros = null;
	$parametros["action"] = "insere.php?tabela=venda";
	$parametros["method"] = "post";
	$parametros["tipoForm"] = "Ordem de Serviço";
	$f = new Form($parametros);

	echo '<input type="button" value="Carregar clientes"
			id="btn" class="botao"/>';

	 $parametros["name"] = "COD_OS";
	 $parametros["label"] = "COD_OS";
	 $f->add_select($parametros,null,null);
	
	 $parametros["name"] = "VALOR_TOTAL";
	 $parametros["label"] = "VALOR_TOTAL";
	 $f->add_select($parametros,null,null);

	$parametros = null;
	$parametros["name"] = "TIPO_PAGAMENTO";
	$parametros["type"] = "radio";
	$parametros["opcoes"] = array("cartao"=>"Cartão de crédito","boleto"=>"Boleto","prazo"=>"A Prazo","crediario"=>"Crediário");
	$parametros["label"] = "Forma de Pagamento";
	$f->add_inputOpcoes($parametros);

	for($i=1;$i<=10;$i++){
		$parcela[] = array("label"=>$i."X  sem juros");
	}
	$parametros["name"] = "PARCELAS";
	$parametros["label"] = "Parcelas";
	$f->add_select($parametros, $parcela, null);


	$parametros = "PAGAR";
	$f->add_button($parametros);

	$f->exibe();
?>
	<script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
     <script src="js/pagamento.js"></script>
</body>
</html>