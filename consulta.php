<?php

function Conectar(){
    try{
        $opcoes = array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES UTF8');
        $con = new PDO("mysql:host=localhost:3307; dbname=os;", "root", "usbw", $opcoes);
        return $con;
    } catch (Exception $e){
        echo 'Erro: '.$e->getMessage();
        return null;
    }
}

$opcao = isset($_GET['opcao']) ? $_GET['opcao'] : '';
$valor = isset($_GET['valor']) ? $_GET['valor'] : ''; 

if (! empty($opcao)){   
    switch ($opcao)
    {
        case 'cliente':
        {

            echo getAllCliente();

            break;
        }
        case 'produto':
        {
            echo getFilterProduto($valor);
            break;
        }
    }
}




function getAllCliente(){
    $pdo = Conectar();
    $sql = 'SELECT COD_OS, NOME_CLIENTE FROM OS';
    //$sql = 'SELECT COD_OS, NOME_CLIENTE FROM os WHERE STATUS = "finalizado"';
    $stm = $pdo->prepare($sql);
    $stm->execute();
        //sleep(1);
    echo json_encode($stm->fetchAll(PDO::FETCH_ASSOC));
    $pdo = null;    

    
}
function getFilterProduto($produto){
    $pdo = Conectar();
    $sql =  'SELECT S.COD_SERVICO_PRODUTO, 
    S.DESCRICAO,
    S.PRECO,
    OI.QTDE,
    OI.COD_ITEM
    FROM 
    servico_produto S,
    os_item OI
    WHERE OI.COD_OS = ? 
    AND OI.COD_ITEM = S.COD_SERVICO_PRODUTO';

    $stm = $pdo->prepare($sql);
    $stm->bindValue(1, $produto);
    $stm->execute();
        //sleep(1);
    echo json_encode($stm->fetchAll(PDO::FETCH_ASSOC));
    $pdo = null;    
}

?>