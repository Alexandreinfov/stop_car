$(function(){

		function funcao_alterar(){
			
			nome = $(this).closest("tr").children("td:nth-child(2)").html();
			sigla = $(this).closest("tr").children("td:nth-child(3)").html();
			
			$("input[name=nome]").val(nome);
			$("#sigla").val(sigla);
			
		}


		$('.alterar').click(funcao_alterar);


})