<?php
include("PersonneVO.php");
	
class ControleurDAO{
	protected $pdo;
	
	public function UtilisateurDAO()
	{
		//Database admin nous donne les infos pour la connection
		try {
			$strConnection = 'mysql:host=localhost;dbname=bdd_biomedical';
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
	//de la base de donner distant, puis retourne une personne
	$utilisateurRecuperer = new PersonneVO();
	public function getPersonne(){
		$query = "";
		$prep = $this->pdo->prepare($query);
		$prep->execute();
		$result = $prep->fetch(PDO::FETCH_OBJ);
		
		if(!empty($result)){
			$utilisateurRecuperer->setPrenom($result->prenom);
			$utilisateurRecuperer->setNom($result->nom);
			$utilisateurRecuperer->setID($result->idClient);
			$utilisateurRecuperer->setPw($result->password);
			$utilisateurRecuperer->setDateNaissance($result->date de naissance);
			return $utilisateurRecuperer;
		}
		else
			return null;
	}
	public function Synchroniser($PersonneVO p){
		$query = "INSERT (LesValeurs) INTO (NomDeLaTable) VALUES (";
		//si il y a eu des changements au prenom|nom|id|password|date de naissance On ajout leur requet de changements,
		//sinon on insert La date de prise du test, La pression systolique, La pression diasystolique, Le pouls cardiaque
		if(isset($utilisateurRecuperer)){
			if($utilisateurRecuperer.getPrenom()!=$p.getPrenom()){
				$query +=" ,";
			}
			if($utilisateurRecuperer.getNom()!=$p.getNom()){
				$query +=" ,";
			}
			if($utilisateurRecuperer.getId()!=$p.getId()){
				$query +=" ,";
			}
			if($utilisateurRecuperer.getPw()!=$p.getPw()){
				$query +=" ,";
			}
			if($utilisateurRecuperer.getDateNaissance()!=$p.getDateNaissance()){
				$query +=" ,";
			}
		}
		$query +=$p.getDatePriseTest()+", "+$p.getPressionSys()+", "+$p.getPressionDiaSys()+", "+$p.getPoulCardiaque()+");";
		
		$prep = $this->pdo->prepare($query);
		$prep->execute();
		$result = $prep->fetch(PDO::FETCH_OBJ);
		//ne se souvient pas si return est utiliser lors d'un insrt
		return $result;
	}
	/*Une fonction utiliser seulement si insert nest pas utiliser quant on veut update une valeur
	public function Update(){}*/
	public function CreerPersonne($PersonneVO p){
		$query = "INSERT (prenom,nom,id,motDePasse,dateNaissance,datePriseTest,pressionSys,pressionDiaSys,poulCardiaque)"
		+" INTO (NomDeLaTable) VALUES ("+$p.getPrenom()+$p.getNom()+$p.getId()+$p.getPw()+$p.getDateNaissance()
		+$p.getDatePriseTest()+", "+$p.getPressionSys()+", "+$p.getPressionDiaSys()+", "+$p.getPoulCardiaque()+");";
		$prep = $this->pdo->prepare($query);
		$prep->execute();
		$result = $prep->fetch(PDO::FETCH_OBJ);
		//ne se souvient pas si return est utiliser lors d'un insrt
		return $result;
	}
}
?>