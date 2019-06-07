<?php

	class Button implements Exibicao{
		
		private $label;
		private $id;
		
		public function __construct($parametros){
			
			if(is_array($parametros)){
				$this->label =$parametros["label"];
				$this->id =$parametros["id"];
			}
			else{
				$this->label = $parametros;
			}		


		}
		
		public function exibe(){
			echo "<button id='$this->id'>$this->label</button>";
		}
		
	}


?>