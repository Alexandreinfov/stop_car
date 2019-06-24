<?php
	//manual dos tipos de graficos:
	//http://phplot.sourceforge.net/phplotdocs/
	include 'phplot-6.2.0/phplot.php';

	include("conexao.php");

	$consulta = 'SELECT COUNT( 
	STATUS ) 
	FROM os
	WHERE STATUS =  "orçamento"';
	$stmt = $conexao->prepare($consulta);
	$stmt->execute();
	$orcamento = null;
	$orcamento = $stmt->fetch();


	$consulta = 'SELECT COUNT( 
	STATUS ) 
	FROM os
	WHERE STATUS =  "aprovado"';
	$stmt = $conexao->prepare($consulta);
	$stmt->execute();
	$aprovado = null;
	$aprovado = $stmt->fetch();


	$consulta = 'SELECT COUNT( 
	STATUS ) 
	FROM os
	WHERE STATUS =  "finalizado"';
	$stmt = $conexao->prepare($consulta);
	$stmt->execute();
	$finalizado = null;
	$finalizado = $stmt->fetch();


	$consulta = 'SELECT COUNT( 
	STATUS ) 
	FROM os
	WHERE STATUS =  "faturado"';
	$stmt = $conexao->prepare($consulta);
	$stmt->execute();
	$faturado = null;
	$faturado = $stmt->fetch();

	$title = 'Andamentos das ordens de servico';
	$data = array(
		array('orcamento' , $orcamento[0] ), 
		array('aprovado' , $aprovado[0] ),
		array('finalizado' , $finalizado[0] ),
		array('faturado' , $faturado[0] )   
	);     
	function mycallback($str)
	{
		list($percent, $label) = explode(' ', $str, 2);
		return sprintf('%s (%.1f%%)', $label, $percent);
	}

	$plot = new PHPlot(500, 350);
	$plot->SetImageBorderType('plain'); // Improves presentation in the manual
	$plot->SetPlotType('pie');
	$plot->SetDataType('text-data-single');
	$plot->SetDataValues($data);
	$plot->SetTitle($title);
	# Set label type: combine 2 fields and pass to custom formatting function
	$plot->SetPieLabelType(array('percent', 'label'), 'custom', 'mycallback');
	$plot->DrawGraph();



  	//echo "<pre>";
//  	echo $funcionarios[0]["STATUS"];
  	//print_r($funcionarios);

// requisição da classe PHPlot
// Array com dados de Ano x Índice de fecundidade Brasileira 1940-2000
// Valores por década
/*
$data = array(
             array('orcamento' , $orcamento[0] ), 
             array('aprovado' , $aprovado[0] ),
             array('finalizado' , $finalizado[0] ),
             array('faturado' , $faturada[0] )   
             );     
# Cria um novo objeto do tipo PHPlot com 500px de largura x 350px de altura                 
$plot = new PHPlot(500 , 350);     
  
// Organiza Gráfico -----------------------------
$plot->SetTitle("Numeros de ordem de Servico \n");
# Precisão de uma casa decimal
$plot->SetPrecisionY(1);
# tipo de Gráfico em barras (poderia ser linepoints por exemplo)
$plot->SetPlotType("bars");
# Tipo de dados que preencherão o Gráfico text(label dos anos) e data (valores de porcentagem)
$plot->SetDataType("text-data");
# Adiciona ao gráfico os valores do array
$plot->SetDataValues($data);
// -----------------------------------------------
  
// Organiza eixo X ------------------------------
# Seta os traços (grid) do eixo X para invisível
$plot->SetXTickPos('none');
# Texto abaixo do eixo X
$plot->SetXLabel("Fonte: Stop Car\n 24/06/2019");
# Tamanho da fonte que varia de 1-5
$plot->SetXLabelFontSize(2);
$plot->SetAxisFontSize(2);
// -----------------------------------------------
  
// Organiza eixo Y -------------------------------
# Coloca nos pontos os valores de Y
$plot->SetYDataLabelPos('plotin');
// -----------------------------------------------
  
// Desenha o Gráfico -----------------------------
$plot->DrawGraph();
// -----------------------------------------------

*/


?>