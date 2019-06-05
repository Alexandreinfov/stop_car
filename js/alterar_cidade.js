$(function(){

		function funcao_alterar(){
			
			nome = $(this).closest("tr").children("td:nth-child(2)").html();
			uf = $(this).closest("tr").children("td:nth-child(3)").html();
			
			$("input[name=nome]").val(nome);
			$("select[name=cod_estado] option").each(function(){
				this.selected = $(this).html()==uf;
			});
			
		}


		$('.alterar').click(funcao_alterar);


})