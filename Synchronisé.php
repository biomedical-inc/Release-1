<?php
	include(../ControleurDAO.php);
	include(../PersonneVO.php);
	
	protected $dao = new ControleurDAO();/*je sens qu'il faut faire deux 
		connection, une pour la base de donner a distance et une pour la
		base de donner embarque*/
	protected $utilisateur = new PersonneVO();/*je sens qu'il faut séparer le
		VO en deux pour donner client et test client*/
	
	public function Synchroniser(PersonneVO personne){
		//si dao.getPersonne n'est pas nulle
		if($dao.getPersonne()!=null){
			//si la personne existe insere son info
			if(personne.getId() == $dao.getPersonne().getId()){
				$utilisateur.setPrenom(personne.getPrenom());/*Possiblement inexistant,
					puisque personne viens de la base de donner du systeme embarque*/
				$utilisateur.setNom(personne.getNom());/*Possiblement inexistant,
					puisque personne viens de la base de donner du systeme embarque*/
				$utilisateur.setID(personne.getId());
				$utilisateur.setPw(personne.getPw());/*Possiblement inexistant,
					puisque personne viens de la base de donner du systeme embarque*/
				$utilisateur.setDateNaissance(personne.getDateNaissance());/*Possiblement inexistant,
					puisque personne viens de la base de donner du systeme embarque*/
				$utilisateur.setDatePriseTest(personne.getDatePriseTest());
				$utilisateur.setPressionSys(personne.getPressionSys());
				$utilisateur.setPressionDiaSys(personne.getPressionDiaSys());
				$utilisateur.setPoulCardiaque(personne.getPoulCardiaque());
				$dao.Synchroniser($utilisateur);
			}
			//sinon creer une nouvelle personne
			else{
				$utilisateur.setPrenom(personne.getPrenom());
				$utilisateur.setNom(personne.getNom());
				$utilisateur.setID(personne.getId());/*Possiblement inexistant,
					puisque la base de donner auto increment*/
				$utilisateur.setPw(personne.getPw());/*Possiblement inexistant,
					puisque la base a une procédure stocker automatique*/
				$utilisateur.setDateNaissance(personne.getDateNaissance());
				$utilisateur.setDatePriseTest(personne.getDatePriseTest());
				$utilisateur.setPressionSys(personne.getPressionSys());
				$utilisateur.setPressionDiaSys(personne.getPressionDiaSys());
				$utilisateur.setPoulCardiaque(personne.getPoulCardiaque());
				$dao.CreerPersonne($utilisateur);
			}
		}
	}
?>