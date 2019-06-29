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
							//if($this->tabela_os == true){
								echo "<th>Ação</th>";
							//}

							
							echo "</tr>
								  </thead>
								  <tbody id='tabela-list'>";
						}
						
						echo "<tr class='dados'>";
						foreach($linha as $j=>$valor){					
							if(!is_numeric($j)){
								echo "<td class='$j'>$valor</td>";
							}
						}

						//if($this->tabela_os == true){
						echo "	
							<td>
								<div>";
								if($this->tabela_os == true){
									if($linha[10] == "Faturado"){
										echo "
										<a href='nota.php?cod_os=$linha[0]' target='_blank'><span class='mudar'><i class='material-icons' style='font-size:25px;color:lightblue'>assignment</i></span></a>";
									}
									echo"
									<span class='mudar'><i class='material-icons text-success' data-toggle='tooltip' title='Mudar status'>check</i></span>";
									
								}
								echo "
									<span class='alterar'><i class='material-icons text-warning' data-toggle='tooltip' title='Alterar'>create</i></span>";

								if($this->tabela_os == true){
									echo "<span class='delete'><i class='material-icons text-danger' data-toggle='tooltip' title='Cancelar'> cancel </i></span>";
								}
								echo"
								</div>
								</div>
							</td>";
							//
						//}
						
						echo "</tr>";					
					}
				}else{
					echo "<h6><center> Não a dados registrados. </center></h6>";
				}
			
			
			echo "</tbody></table>";
		}
		
		
	}


?>