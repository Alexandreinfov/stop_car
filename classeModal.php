<?php
	class Modal implements Exibicao{
		
		private $action;
		private $method;		
		public $;	
		
		public function __construct($parametros, Form $f){			
			$this->logo = $parametros["logo"];
			$this->form = $f;
		}

		
		public function exibe(){
        echo '
            <div class="modal" tabindex="-1" role="dialog" id="NovoUsuario">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Novo Usuário</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                    <form action="'.$this->action.'" method="'.$this->method.'">
                    <div class="modal-body" >

                        <div class="row">
                            <div class="form-group col-sm-8 col-xs-12">';
                                <label for="nome">Nome completo:</label>
                                <input type="text" name="nome" id="nome" required="required" class="form-control" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-8 col-xs-12">
                                <label for="usuario">Usuário:</label>
                                <input type="text" name="usuario" id="usuario" required="required" class="form-control" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-6 col-xs-12">
                                <label for="senha">Senha:</label>
                                <input type="password" name="senha" id="senha" required="required" class="form-control password" data-cript="sha1"/>
                            </div>
                    
                            <div class="form-group col-sm-6 col-xs-12">
                                <label for="senhaConfirmacao">Confirmação:</label>
                                <input type="password" name="senha" id="senhaConfirmacao" required="required" class="form-control password" data-cript="sha1"/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-8 col-xs-12">
                                <label for="email">E-mail:</label>
                                <input type="email" name="email" id="email" required="required" class="form-control" />
                            </div>
                        </div>

                        </div>
                        <div class="modal-footer">
                            <button type="reset" class="btn btn-secondary">Limpar</button>
                            <button type="submit" class="btn btn-primary">Salvar</button>
                        </div>
                    </form>

            </div>
            </div>
        </div>
        
        <?php
            
			echo "<div class='login-form col-xs-10 offset-xs-1 
					col-sm-6 offset-sm-3 
					col-md-4 offset-md-4'>
					<header>
						<h1><img class='img-fluid' src='img/to-do.jpg' /></h1>
					</header>";
						
			$this->form->exibe();
		
			echo "<div class='float-left'>
					<button class='btn btn-default btn-cadastrar'
					data-toggle='modal' data-target='#NovoUsuario'>
					Cadastrar</button>
				</div>";
		}
		
		
	}
?>