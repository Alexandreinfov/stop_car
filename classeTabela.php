<?php

	class Tabela implements Exibicao{
		
		private $matriz;
		private $alterar;
		private $remover;
		private $tabela;
		private $tabela_os;
		
		public function __construct($matriz,$tabela,$alterar,$remover, $tabela_os){			
				$this->matriz = $matriz;
				$this->alterar = $alterar;
				$this->remover = $remover;
				$this->tabela = $tabela;

				if(isset($tabela_os)){
					$this->tabela_os = $tabela_os;
				}
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
							if($this->tabela_os == true){
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

						if($this->tabela_os == true){
							echo "<tr> </tr>";	
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