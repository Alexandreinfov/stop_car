<?php

	class Login implements Exibicao{
		
		private $logo;
		private $form;		
		
		public function __construct($parametros, Form $f){			
			$this->logo = $parametros["logo"];
			$this->form = $f;
		}

		
		public function exibe(){
			
			echo "<div class='login-form col-xs-10 offset-xs-1 
					col-sm-6 offset-sm-3 
					col-md-4 offset-md-4'>
					<header>
						<h1><img class='img-fluid' src='img/to-do.jpg' /></h1>
					</header>";
						
			$this->form->exibe();
		
			echo "<div class='float-left'>
					<button class='btn btn-default btn-cadastrar'
					data-toggle='modal' data-target='#NovoUsuario'>
					Cadastrar</button>
					
						<div>
							<button type='submit'
							class='btn btn-primary'>Entrar</button>
						</div>
					
				</div>";
		}
		
		
	}


?>