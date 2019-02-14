<?php
	include(../PersonneDAO.php);
	include(../PersonneVO.php);
	
	protected $dao = new DAO();
	
	public function Synchroniser(PersonneVO personne){
		//si la personne existe insere son info
		if(personne.identifiant == $dao.getPersonne(personne.identifiant)){
			$dao.InsertPersonne(personne.DPrsTst,personne.PrsnSys,personne.PrsnDiasys,personne.PlCard);
		}
		else{
			$dao.CreerPersonne(personne.identifiant,personne.Pwd)
		}
	}
?>