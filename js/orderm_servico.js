$(function(){

	cod_os = "";
	$("input[name='cadastrar']").click(function(){
		var url = 'insere_os.php?tabela=ordem_servico';

		var cod_funcionario = $("select[name='COD_FUNCIONARIO']").val();
		var cod_cliente = $("select[name='COD_CLIENTE']").val();
		var cod_veiculo = $("select[name='COD_VEICULO']").val();		

		var parametros = {cod_funcionario: cod_funcionario, cod_cliente:cod_cliente, cod_veiculo: cod_veiculo};

		$.post(url,parametros)
		.done(function(data){
			cod_os = data;
			
			
			var url = 'insere_os.php?tabela=os_item';

			var cod_item = $("select[name='COD_SERVICO']").val();
			var qtde = $("select[name='QTDE']").val();

			var parametros = {cod_os: cod_os, cod_item: cod_item, qtde:qtde};

			$.post(url,parametros)
			.done(function(data){
				var url = 'insere_os.php?tabela=os_item';

				var cod_item = $("select[name='COD_SERVICO_PRODUTO']").val();
				var qtde = $("select[name='QTDE']").val();

				var parametros = {cod_os: cod_os, cod_item: cod_item, qtde:qtde};

				$.post(url,parametros)
				.done(function(data){
					alert();
				})
				.fail(function(){
					alert("Erro na conexão com o servidor");
				});
			})
			.fail(function(){
				alert("Erro na conexão com o servidor");
			});
			
		})
		.fail(function(){
			alert("Erro na conexão com o servidor");
		});

	});
});	