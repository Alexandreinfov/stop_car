<?php

	class Option implements Exibicao{
		private $value;
		private $label;
		private $valor;
		
		public function __construct($parametros,$valor){
			$this->label = $parametros["label"];
			if(isset($parametros["value"])){
				$this->value = $parametros["value"];
			}
			$this->valor = $valor;
		}
		
		public function exibe(){
			echo "<option";
			
			if($this->value!=null){
				echo " value='$this->value'";
			}
			
			if($this->valor!="" && ($this->valor==$this->value)){
				echo " selected";
			}
			
			if($this->valor!="" && ($this->valor==$this->label)){
				echo " selected";
			}
			
			echo ">$this->label</option>";
		}
		
	}
?>	