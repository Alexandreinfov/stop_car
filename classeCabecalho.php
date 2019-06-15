<?php

	include("interfaceExibicao.php");

	class Cabecalho implements Exibicao{
	
		private $charset;
		private $title;
		private $links;
		private $scripts;
		
		public function __construct($parametros){
			$this->charset = $parametros["charset"];
			$this->title = $parametros["title"];
			if(isset($parametros["links"])){
				$this->links = $parametros["links"];
			}
			if(isset($parametros["scripts"])){
				$this->scripts = $parametros["scripts"];
			}
		}
		
		public function exibe(){
			session_start();
			echo "<!DOCTYPE html>
					<html>
					<head>
						 <meta name='viewport' 
							content='width=device-width, initial-scale=1' />
						<meta charset='$this->charset' />
						 <title>$this->title</title>";
			if($this->links!=null){
					foreach($this->links as $i=>$l){
						echo "<link rel='stylesheet' href='$l' />";
					}
			}			 
			if($this->scripts!=null){
					foreach($this->scripts as $i=>$s){
						echo "<script type='text/javascript' src='$s'></script>";
					}
			}
			echo "
					</head>	
						<body>";
		}
		
		
public function exibe_menu(){
			
			echo "<nav class='navbar navbar-dark bg-dark navbar-inverse navbar-static-top'>
			        <div class='container'>
			            <div class='navbar-header'>
			                <button type='button' class='navbar-toggler'
			                    data-toggle='collapse' 
			                    data-target='#menu'>
			                    <span class='navbar-toggler-icon'></span>
			                </button>
			                <a href='todo.php'
			                    class='navbar-brand logotipo'>
			                    <img src='img/to-do.jpg' alt='Logotipo'/>
			                </a>
			            </div>
			            <div class='collapse' id='menu'>
			                <div class='bg-dark p-4'>
			                    <ul class='navbar-nav'>
			                        <li>
									<a href='listar_cliente.php'>
										Cliente
									</a>
								</li>
								<li>
									<a href='listar_funcionario.php'>
										Funcionário
									</a>
								</li>
								<li>
									<a href='listar_servico_produto.php'>
										Serviços / Produto
									</a>
								</li>
								<li>
									<a href='listar_veiculo.php'>
										Veículos
									</a>
								</li>
								<li>
									<a href='listar_os.php'>
										Ordem de Serviços
									</a>
								</li>
								<li>
									<a href='form_nota.php'>
										Gerar nota fiscal
									</a>
								</li>
								<li>
									<a href='logout.php'>
										Sair
									</a>
								</li>

			                    </ul>
			                </div>
			            </div>
			        </div>
			    </nav>";
			}
	
	}
	
	
	$parametros["charset"]="utf-8";
	$parametros["title"]="Stop Car";
	$parametros["links"][] = "css/bootstrap.min.css";
	$parametros["links"][] = "css/login.css";
	$parametros["links"][] = "css/todo.css";
	$parametros["links"][] = "css/estiloForm.css";	
	$parametros["links"][] = "https:/fonts.googleapis.com/icon?family=Material+Icons";
	$parametros["scripts"][] = "js/jquery-3.3.1.min.js";
	$parametros["scripts"][] = "js/bootstrap.min.js";
	//$parametros["scripts"][] = "js/todo.js";
	
	$c = new Cabecalho($parametros);
	$c->exibe();	
	
?>


	
 
