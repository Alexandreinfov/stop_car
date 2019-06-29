$(function(){
		
	//https://blog.education-ecosystem.com/javascript-como-verificar-se-uma-string-contem-outra-substring/
	$("#busca").click(function(){
		var tbody = $("#tabela-list tr");
		$.each( tbody, function( key, value ) {
		  t = $(value).html();
		  if(t.indexOf($("#input_busca").val())>-1){
			  $(value).fadeIn();
			}
			else{
				$(value).fadeOut();
			}
		});
	});

	cod_os = "";
	$("input[name='cadastrar']").click(function(){

			var cod_produto = $("select[name='PRODUTO']").val();
			var cod_servico = $("select[name='SERVICO']").val();
			var qtde = $("input[name='QTDE']").val();;

			if (cod_servico == 0 && cod_produto == 0){
				alert("Selecione um produto ou serviço.");		
			}
			else if (cod_produto > 0 && qtde == 0) {
				alert("Produto informado sem quantidade.");
			}
			else if (qtde > 0 && cod_produto == 0){
				alert("Quantidade sem produto informado.");	
			}
			else{

			var url = 'insere_os.php?tabela=ordem_servico';

			var cod_funcionario = $("select[name='COD_FUNCIONARIO']").val();
			var cod_cliente = $("select[name='COD_CLIENTE']").val();
			var cod_veiculo = $("select[name='COD_VEICULO']").val();

			var parametros = {cod_funcionario: cod_funcionario, cod_cliente:cod_cliente, cod_veiculo: cod_veiculo};

			$.post(url,parametros)
			.done(function(data){
				cod_os = data;
				console.log(cod_produto + " | " + cod_servico);
				

				var url = 'insere_os.php?tabela=os_item';

				var parametros = {cod_os: cod_os, cod_item: cod_produto, qtde:qtde};
				
				if(cod_produto>0){
					$.post(url,parametros)
					.done(function(data){

					}).fail(function(){

					});		
		 		}


				var parametros = {cod_os: cod_os, cod_item: cod_servico};
					
				if(cod_servico>0){
					$.post(url,parametros)
						.done(function(data){
	
						}).fail(function(){

						});		
				}

				alert("Ordem de serviço "+cod_os+" cadastrada com sucesso.");
				location.reload();
			});
		}	
	});

	function editDados(){

		alert("EDITA");
		alert(produto+" | "+qtde+" | "+servico);

		var linha=$(this).closest('.dados');

		var cliente 	= linha.children('.CLIENTE').text();
		var funcionario = linha.children('.FUNCIONARIO').text();
		var veiculo 	= linha.children('.PLACA').text();
		var produto 	= linha.children('.PRODUTO').text();
		var qtde 		= linha.children('.QTDE').text();
		var servico 	= linha.children('.SERVICO').text();

		

		switch(status){

			case "Nova": status="1";
			break;

			case "Em andamento": status="2";
			break;

			case "Finalizada": status="3";
			break;
		}

		$('#id').val(id);
		$('#descricao').val(texto);
		$('#data').val(data);
		$('#status option').removeAttr('selected').filter('[value='+status +']').prop('selected', 'selected');

		$('#NovaTarefa').modal();
	}

	function mudarStatus()
	{
		var linha = $(this).closest('.dados');

		var cod_os 	= linha.children('.CODIGO').text();
		var status 	= linha.children('.STATUS').text();

		switch(status)
		{
			case 'Orçamento': status='Aprovado';
			break;

			case 'Aprovado': status='Finalizado';
			break;

			case 'Finalizado': status='Finalizado';
			break;
		}

		var url = 'http://localhost:8081/stop_car/insere_status.php';
		var parametros = {cod_os:cod_os, status:status};

		$.post(url,parametros, 
		function(){
			location.reload(true);
		});
	}

	$('.mudar').click(mudarStatus);
	$('.alterar').click(editDados);
});