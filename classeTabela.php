<?php

	class Tabela implements Exibicao{
		
		private $matriz;
		private $alterar;
		private $remover;
		private $tabela;
		
		public function __construct($matriz,$tabela,$alterar,$remover){			
				$this->matriz = $matriz;
				$this->alterar = $alterar;
				$this->remover = $remover;
				$this->tabela = $tabela;
		}
		
		
		public function exibe(){
			
			echo "
			<div class='table-responsive'>
				<table class='dados-list table table-bordered table-striped table-hover table-dark '>";	
			
				if(isset($this->matriz)){
					foreach($this->matriz as $i=>$linha){		
						
						if($i==0){
							
							echo "
							<thead>
							<tr>";
							foreach($linha as $j=>$valor){					
								if(!is_numeric($j)){
									echo "<th>$j</th>";
								}
							}
							
							if($this->remover!=null || $this->alterar!=null){
								echo "<th>Ação</th>";
							}
							
							echo "</tr>
								  </thead>
								  <tbody id='tabela-list'>";
						}
						
						echo "<tr>";
						foreach($linha as $j=>$valor){					
							if(!is_numeric($j)){
								echo "<td class='$j'>$valor</td>";
							}
						}
						if($this->remover!=null || $this->alterar!=null){
							echo "<th>";
								if($this->alterar!=null){
									//echo "<a href='form_$this->tabela.php?id=$linha[0]'>Alterar</a> ";
									echo "<button class='alterar'>alterar</button>";
								}
								if($this->remover!=null){
									echo " <a href='remover.php?tabela=$this->tabela&id=$linha[0]'>Remover</a>";
								}
							echo "</th>";							
						}
						echo "</tr>";					
					}
				}else{
					echo "<h6><center> Não a dados registrados. </center></h6>";
				}
			
			
			echo "</tbody></table>";
		}
		
		
	}


?>