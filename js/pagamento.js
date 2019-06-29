$(document).ready(function(){
     
    $('#COD_OS').change(function(e){
        var cliente = $('#COD_OS').val();
         
        $.getJSON('consulta.php?opcao=produto&valor='+cliente, 
        function (dados){ 
         
              var option ;
              var produto = 0;
              var servico = 0;
              var total = 0;
          if (dados.length > 0){  
              $.each(dados, function(i, obj){
                  option += '<tr><td>'+obj.QTDE+'</td><td>'+obj.DESCRICAO+'</td><td> R$'+obj.PRECO+'</td></tr>';
                  if(parseFloat(obj.QTDE) > 1){
                    produto += parseFloat(obj.QTDE) * parseFloat(obj.PRECO);
                  }else{
                    servico += parseFloat(obj.PRECO);
                  }
                  
              })
        
              total = parseFloat(produto) + parseFloat(servico) ;
         
           $('#VALOR').html(option).show(); 
            document.getElementById('VALOR_TOTAL').value = total.toFixed(2);

          }else{
           
              $('#VALOR').hide();
               document.getElementById('VALOR_TOTAL').value = 'Total a Pagar';


            }
        })
    })
     
});