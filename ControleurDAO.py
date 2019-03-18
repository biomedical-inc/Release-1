##connection fait par un autre membre
import PersonneVO
cursor = cnx.cursor()

##classe pour recuperer le prenom,nom,id,password et date de naissance
##de la base de donner distant, puis retourne une personne
def getPersonne(inputIden,inputPasswrd):
	username=''.join(inputPasswrd)
	username[username.find('\'') : username.rfind('\'')]
	password=''.join(inputIden)
	password[password.find('\'') : password.rfind('\'')]
	cursor.execute("SELECT idClient FROM tblCLient WHERE identifiant = "+username+" AND password = "+password+";")
cnx.commit()
def Synchroniser():
	cursor.execute("")
cnx.commit()
def CreerPersonne(personne = PersonneVO()):
	cursor.execute("INSERT INTO tblClient(adresse,identifiant,passwd,prenom,nom,dateDeNaissance) VALUES ("
	+personne.adresse+","+personne.id+","+personne.pw+","+personne.prenom+","+personne.nom+","
	+personne.dateNaissance+");")
	
		 
cnx.commit()