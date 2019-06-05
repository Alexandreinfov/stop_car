<?php

	class Usuario{
	
		private $id_usuario;
		private $nome;
		private $sexo;
		private $data_nascimento;
		private $email;
		private $senha;
		private $permissao;
		
		public function __construct($parametros){
			if(isset($parametros["id_usuario"])){
				$this->id_usuario = $parametros["id_usuario"];
			}
			$this->nome = $parametros["nome"];
			$this->sexo = $parametros["sexo"];
			$this->data_nascimento = $parametros["data_nascimento"];
			$this->email = $parametros["email"];
			$this->senha = $parametros["senha"];
			$this->permissao = $parametros["permissao"];			
		}
		
		public function get_nome(){
			return($this->nome);
		}
	
	
	}



?>