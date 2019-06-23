$(document).ready(function(){
     
    <!-- Carrega os Clientes -->

    $('#btn').click(function(e){
       

        $('#btn').hide();
        $('#mensagem').html('<span class="mensagem">Aguarde,carregando ...</span>');  
         
        $.getJSON('consulta.php?opcao=cliente', function (dados){
             
           if (dados.length > 0){    
              var option = '<option>Selecione os Clientes</option>';
              $.each(dados, function(i, obj){
                  option += '<option value="'+obj.COD_OS+'">'+obj.NOME_CLIENTE+'</option>';
              })
              //$('#mensagem').html('<span class="mensagem">Total   encontrados.: '+dados.length+'</span>'); 
              $('#COD_OS').html(option).show();
           }//else{
            //   Reset();
            //   $('#mensagem').html('<span class="mensagem">Não foram encontrados!</span>');
           //}
        })
    })
  
     
    <!-- Carrega os Produtos -->
    $('#COD_OS').change(function(e){
        var cliente = $('#COD_OS').val();
        $('#mensagem').html('<span class="mensagem">Aguarde,carregando ...</span>');  
         
        $.getJSON('consulta.php?opcao=produto&valor='+cliente, 
        function (dados){ 
         
           if (dados.length > 0){    
              var option = '<option>Selecione o Produto</option>';
              $.each(dados, function(i, obj){
                  option += '<option value="'+obj.PRECO+'">'+obj.DESCRICAO+' R$'+obj.PRECO+'</option>';
              })
             // $('#mensagem').html('<span class="mensagem">Total de produto encontrados.: '+dados.length+'</span>'); 
           }//else{
            //  Reset();
           //   $('#mensagem').html('<span class="mensagem">Não foram encontrados produto !</span>');  
          // }
           $('#VALOR_TOTAL').html(option).show(); 
        })
    })
     
    /*<!-- Carrega as Cidades -->
    $('#cmbProduto').change(function(e){
        var produto = $('#cmbProduto').val();
        $('#mensagem').html('<span class="mensagem">Aguarde, carregando ...</span>');  
         
        $.getJSON('consulta.php?opcao=tipo&valor='+produto, 
        function (dados){
             
            if (dados.length > 0){   
                var option = '<option>Selecione a Cidade</option>';
                $.each(dados, function(i, obj){
                    option += '<option>'+obj.nome+'</option>';
                })
                $('#mensagem').html('<span class="mensagem">Total de cidades encontradas.: '+dados.length+'</span>');
            }else{
                Reset();
                $('#mensagem').html('<span class="mensagem">Não foram encontradas cidades para esse produto!</span>');  
            }
            $('#cmbCidade').html(option).show();
        })
    })
     
    <!-- Resetar Selects -->
    function Reset(){
        $('#cmbCliente').empty().append('<option>Carregar Clientes</option>>');
        $('#cmbProduto').empty().append('<option>Carregar Produtos</option>>');
        $('#cmbCidade').empty().append('<option>Carregar pagamento</option>');
    }*/
});