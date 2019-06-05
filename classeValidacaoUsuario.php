<?php

	include("classeUsuario.php");

	class ValidacaoUsuario{
		
		private $conexao;
		private $email;
		private $senha;
		
		public function __construct($conexao,$valores){
			$this->conexao=$conexao;
			$this->email=$valores["email"];
			$this->senha=$valores["senha"];			
		}
		
		public function validar(){
			$consulta = "SELECT * FROM usuario 
						WHERE email=:email AND senha=:senha";
			
			$stmt = $this->conexao->prepare($consulta);
			$stmt->bindValue(":email",$this->email);
			$stmt->bindValue(":senha",$this->senha);
			
			$stmt->execute();
			
			if($stmt->rowCount()==1){
				session_start();
				$linha = $stmt->fetch();
				$_SESSION["usuario"] = new Usuario($linha);
				header("location: index.php");
			}
			else{
				header("location: form_login.php?erro=1");
			}
			
		}
		
	}


?>