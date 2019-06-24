<?php

	class Input implements Exibicao{
		
		private $name;
		private $id;
		private $type;
		private $value;
		private $placeholder;
		private $label;
		private $class;
		private $required;
		private $data_cript;
		private $modo;
		
		public function get_name(){
			return($this->name);
		}

		public function get_type(){
			return($this->type);
		}

		public function get_label(){
			return($this->label);
		}

		public function get_value(){
			return($this->value);
		}		
		
		public function __construct($parametros){
			$this->name = $parametros["name"];
			$this->id = $parametros["name"];
			$this->type = $parametros["type"];
			
			if(isset($parametros["value"])){
				$this->value = $parametros["value"];
			}
			if(isset($parametros["placeholder"])){
				$this->placeholder = $parametros["placeholder"];
			}
			if(isset($parametros["label"])){
				$this->label = $parametros["label"];
			}
			if(isset($parametros["class"])){
				$this->class = $parametros["class"];
			}			
			if(isset($parametros["required"])){
				$this->required = $parametros["required"];
			}
			if(isset($parametros["data_cript"])){
				$this->data_cript = $parametros["data_cript"];
			}
			if(isset($parametros["modo"])){
				$this->modo = $parametros["modo"];
			}
		}
		
		public function exibe(){
			
			if($this->label!=null){
				echo "<label>$this->label: </label>";
			}
			
			echo "<input type='$this->type' id='$this->id' name='$this->name'";
						
			if($this->value!=null){
				echo " value='$this->value' ";
			}
			if($this->placeholder!=null){
				echo " placeholder='$this->placeholder' ";
			}
			if($this->placeholder!=null){
				echo " placeholder='$this->placeholder' ";
			}
			if($this->class!=null){
				echo " class='$this->class' ";
			}
			if($this->required!=null){
				echo " required='$this->required' ";
			}
			if($this->data_cript!=null){
				echo " data-cript='$this->data_cript' ";
			}
				if($this->modo!=null){
				echo " $this->modo ";
			}
			echo " /><br />";
		}
		
	}

?>