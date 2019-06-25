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
	
	$parametros["name"] = "COD_OS";
	$parametros["label"] = "devedores";
	$f->add_select($parametros,null,null);

	$parametros = null;
	$parametros["value"] = "Carregar clientes";
	$parametros["type"] = "button";
	$parametros["name"] = "btn";
	$parametros["id"] = "btn";
	$f->add_input($parametros);
	

	  		
	  echo "<center><div class='table-responsive'>
	  <table border='1' class='table-hover '>
		    <thead>
		        <tr>
		            <th>Quantidade</th>
		            <th>Descricação</th>
		            <th>Preço</th>
		        </tr>
		    </thead>
		    <tbody id='VALOR'>
		    </tbody>
		</table>
		</div></center>";
	// $parametros["name"] = "VALOR_TOTAL";
	// $parametros["label"] = "VALOR_TOTAL";
	// $f->add_select($parametros,null,null);
	//echo '<input type="text" name="VALOR_TOTAL" id="VALOR_TOTAL" disabled>';

	$parametros = null;
	$parametros["label"] = "Total a Pagar";
	$parametros["name"] = "VALOR_TOTAL";
	$parametros["type"] = "text";
	$parametros["modo"] = "readonly";
	$parametros["placeholder"] = "Total a pagar";	
	$f->add_input($parametros); //adcionando os parametros passados para o add_input.

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
	$parametros["label"] = "Total De Parcelas";
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