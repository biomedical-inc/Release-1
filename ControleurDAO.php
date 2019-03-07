<?php
include("PersonneVO.php");
	
class ControleurDAO{
	protected $pdo;
	
	public function UtilisateurDAO()
	{
		//Database admin nous donne les infos pour la connection
		try {
			$strConnection = 'mysql:host=localhost;dbname=';
			$this->pdo = new PDO($strConnection, 'root', '');
			$this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		}
		catch(PDOException $e) {
			$msg = 'ERREUR PDO dans ' . $e->getFile() . ' L.' . $e->getLine() . ' : ' . $e->getMessage();
			die($msg);
		}
	}
	
	public function gestionConnection($PersonneVO p){
		$query = "Select id, utilisateur, motDePasse, droit  FROM  utilisateurs WHERE utilisateur = '".$user."' and motDePasse = '".$pw."'";
		$prep = $this->pdo->prepare($query);
		$prep->execute();
		$result = $prep->fetch(PDO::FETCH_OBJ);
		$a = array();
		$utilisateur = new UtilisateurVO();
		
		if(!empty($result)){
			$utilisateur->setId($result->id);
			$utilisateur->setPassword($result->motDePasse);
			$utilisateur->setUtilisateur($result->utilisateur);
			$utilisateur->setDroit($result->droit);
			array_push($a, $utilisateur);
		}
		return $a;
	}
	//classe pour recuperer le prenom,nom,id,password et date de naissance
	//puis retourne une personne
	$utilisateurRecuperer = new PersonneVO();
	public function getPersonne(){
		$query = "";
		$prep = $this->pdo->prepare($query);
		$prep->execute();
		$result = $prep->fetch(PDO::FETCH_OBJ);
		
		if(!empty($result)){
			$utilisateurRecuperer->setId($result->id);
			$utilisateurRecuperer->setPassword($result->motDePasse);
		}
		return $utilisateurRecuperer;
	}
	public function Synchroniser(){}
	public function CreerPersonne(){}
}
?>