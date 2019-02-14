<?php

session_start();

include("ControleurDAO.php");
include("PersonneVO.php");

$controleurDAO = new ControleurDAO();
$personneVO = new PersonneVO();

if(!empty($_POST['utilisateur']) && !empty($_POST['motdepasse'])){
	
	$value->getUtilisateur();
	
}

?>