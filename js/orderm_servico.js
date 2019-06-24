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
			});
		}	
	});
});