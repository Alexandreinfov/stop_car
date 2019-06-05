<?php

	include("conexao.php");
	include("classeValidacaoUsuario.php");

	$v = new ValidacaoUsuario($conexao,$_POST);

	$v->validar();

?>