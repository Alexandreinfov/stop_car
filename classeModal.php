<?php
	class Modal implements Exibicao{
				
		private $form;	
        private $titulo;
        private $id;
		
		public function __construct($parametros, Form $f){			
			$this->titulo = $parametros["titulo"];
            $this->id = $parametros["id"];
			$this->form = $f;
		}

		
		public function exibe(){
        echo '
            <div class="modal" tabindex="-1" role="dialog" id="$this->id">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">$this->titulo</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            </button>
                        </div>';
            $this->form->exibe();


            echo "</div></div></div>";
		}
		
		
	}
?>