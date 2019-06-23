<?php

	include("classeOption.php");

	class Select implements Exibicao{

		private $name;
		private $options;
		private $label;
		
		public function __construct($parametros,$options,$valor){
			$this->name  = $parametros["name"];
			$this->label = $parametros["label"];

			if(isset($options)){
				foreach($options as $i=>$o){
					$this->options[] = new Option($o,$valor);
				}
			}	
		}
		
		public function exibe(){
			echo "
			<select name='$this->name' id='$this->name'>";
			
			if($this->options != null){
				echo "<option value='0'>Selecione $this->label</option>";
				foreach($this->options as $i=>$o){
					$o->exibe();
				}
			}else{
				echo "<option>Sem $this->label cadastrados</option>";
			}	
			
			echo "</select> <br />";
		}
		
		
	}


?>