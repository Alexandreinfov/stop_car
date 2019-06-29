<?php 
 include("mpdf60/mpdf.php");
 include("conexao.php");

 $cod_os = $_GET["cod_os"];

	/*$consulta = "SELECT NOME, ENDERECO, CPF, TELEFONE as value FROM CLIENTE WHERE COD_CLIENTE = 3";
	$stmt = $conexao->prepare($consulta);
	$stmt->execute();
	$c_nome = null;
	while($linha = $stmt->fetch()){ //pegando os valores linha por linha.
		$cliente = $linha;
	}*/

	$consulta = "SELECT C.NOME, C.TELEFONE, C.CPF, C.ENDERECO FROM Venda V
					INNER JOIN ORDEM_SERVICO OS ON (V.COD_OS = OS.COD_OS)
					INNER JOIN CLIENTE C ON (OS.COD_CLIENTE = C.COD_CLIENTE)
					WHERE OS.COD_OS = $cod_os";
	$stmt = $conexao->prepare($consulta);
	$stmt->execute();
	$c_nome = null;
	while($linha = $stmt->fetch()){ //pegando os valores linha por linha.
		$cliente = $linha;
	}

	$consulta = "SELECT VALOR_TOTAL FROM Venda
					WHERE COD_OS = $cod_os";
	$stmt = $conexao->prepare($consulta);
	$stmt->execute();
	$c_nome = null;
	while($linha = $stmt->fetch()){ //pegando os valores linha por linha.
		$venda = $linha;
	}

 $html = "
 <fieldset>
 <h1>Recibo de Pagamento</h1>
 <p class='center sub-titulo'>
 Ordem de Serviço <strong> $cod_os </strong>
 <br/> 
 VALOR <strong>R$ $venda[0]</strong>
 </p>
	 <p>Recebi(emos) de <strong>$cliente[0]</strong></p>
	 <p>a quantia de <strong>Setecentos Reais</strong></p>
	 <p>e para clareza firmo(amos) o presente.</p>
	 <p class='direita'>$cliente[3]</p>
	 <p>Assinatura ......................................................................................................................................</p>
	 <p>Nome <strong>$cliente[0]</strong> CPF/CNPJ: <strong>$cliente[2]</strong></p>
	 <p>Endereço <strong>$cliente[3], Araraquara - São Paulo</strong></p>
	 <p>Telefone <strong>$cliente[1]</strong></p>
 </fieldset>";



 /*$html = '<center><table class="printer-ticket">
			 	<thead>
					<tr>
						<th class="title" colspan="3" align="center">STOP CAR</th>
					</tr>
					<tr>
						<th colspan="3"  align="center"></th>
					</tr>
					<tr>
						<th colspan="3"  align="center"><br />
							000.000.000-00
						</th>
					</tr>
					<tr>
						<th class="ttu" colspan="3"  align="center">
							<b>Cupom não fiscal</b>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr class="top">
						<td colspan="3"  align="center">#</td>
					</tr>
					<tr>
						<td>R$7,99</td>
						<td>2.0</td>
						<td>R$15,98</td>
					</tr>
					<tr>
						<td colspan="3">Opcional Adicicional: grande</td>
					</tr>
					<tr>
						<td>R$0,33</td>
						<td>2.0</td>
						<td>R$0,66</td>
					</tr>
				</tbody>
				<tfoot>
					<tr class="sup ttu p--0">
						<td colspan="3">
							<b>Totais</b>
						</td>
					</tr>
					<tr class="ttu">
						<td colspan="2">Sub-total</td>
						<td align="right">R$43,60</td>
					</tr>
					<tr class="ttu">
						<td colspan="2">Taxa de serviço</td>
						<td align="right">R$4,60</td>
					</tr>
					<tr class="ttu">
						<td colspan="2">Desconto</td>
						<td align="right">5,00%</td>
					</tr>
					<tr class="ttu">
						<td colspan="2">Total</td>
						<td align="right">R$45,56</td>
					</tr>
					<tr class="sup ttu p--0">
						<td colspan="3">
							<b>Pagamentos</b>
						</td>
					</tr>
					<tr class="ttu">
						<td colspan="2">Voucher</td>
						<td align="right">R$10,00</td>
					</tr>
					<tr class="ttu">
						<td colspan="2">Dinheiro</td>
						<td align="right">R$10,00</td>
					</tr>
					<tr class="ttu">
						<td colspan="2">Total pago</td>
						<td align="right">R$10,00</td>
					</tr>
					<tr class="ttu">
						<td colspan="2">Troco</td>
						<td align="right">R$0,44</td>
					</tr>
					<tr class="sup">
						<td colspan="3" align="center">
							<b>Pedido:</b>
						</td>
					</tr>
					<tr class="sup">
						<td colspan="3" align="center">
							www.stop_car.com
						</td>
					</tr>
				</tfoot>
			</table></center>
			</body>
			</html>';*/



 $mpdf=new mPDF(); 
 $mpdf->SetDisplayMode('fullpage');
 $css = file_get_contents("css/estiloNota.css");
 $mpdf->WriteHTML($css,1);
 $mpdf->WriteHTML($html);
 $mpdf->Output();

 exit;

 ?>