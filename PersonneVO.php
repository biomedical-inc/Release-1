<?php
class PersonneVO{
	
	protected $prenom;
	protected $nom;
	protected $id;
	protected $pw;
	protected $dateNaissance;
	protected $datePriseTest;
	protected $pressionSys;
	protected $pressionDiaSys;
	protected $poulCardiaque;
	
	public function getPrenom(){
		return $this->prenom;
	}
	public function setPrenom($id){
		$this->id = $id;
	}
	public function getNom(){
		return $this->nom;
	}
	public function setNom($nom){
		$this->nom = $nom;
	}
	
	public function getId(){
		return $this->id;
	}
	public function setID($id){
		$this->id = $id;
	}
	
	public function getPw(){
		return $this->pw;
	}
	public function setPw($pw){
		$this->pw = $pw;
	}
	
	public function getDateNaissance(){
		return $this->dateNaissance;
	}
	public function setDateNaissance($dateNaissance){
		$this->dateNaissance = $dateNaissance;
	}
	
	public function getDatePriseTest(){
		return $this->datePriseTest;
	}
	public function setDatePriseTest($datePriseTest){
		$this->datePriseTest = $datePriseTest;
	}
	
	public function getPressionSys(){
		return $this->pressionSys;
	}
	public function setPressionSys($pressionSys){
		$this->pressionSys = $pressionSys;
	}
	
	public function getPressionDiaSys(){
		return $this->pressionDiaSys;
	}
	public function setPressionDiaSys($pressionDiaSys){
		$this->pressionDiaSys = $pressionDiaSys;
	}
	
	public function getPoulCardiaque(){
		return $this->poulCardiaque;
	}
	public function setPoulCardiaque($poulCardiaque){
		$this->poulCardiaque = $poulCardiaque;
	}
}
?>
