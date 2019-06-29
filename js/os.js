$(document).ready(function(){
     
    $('#COD_CLIENTE').change(function(e){
        var cliente = $('#COD_CLIENTE').val();
         
        $.getJSON('consulta.php?opcao=veiculo&valor='+cliente, 
        function (dados){ 
         
                var option = '<option>Selecione os Veiculos</option>';       
              $.each(dados, function(i, obj){
                   option += '<option value="'+obj.COD_VEICULO+'">'+obj.PLACA+','+obj.MODELO+','+obj.MARCA+'</option>';    
                  
              })
         
           $('#COD_VEICULO').html(option).show(); 
          
        })
    })
     
});