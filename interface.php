<!doctype html>
<?php require "simu.php"; 
// projet de la facultés des sciences d'Angers 
// fait par Dorian Letort
?>
<html lang="fr">
    <head>
        <meta charset="UTF-8" />
        
        <meta name="viewport" content="width=device-width, initial-scale=1">	
        <title>Simulateur</title>
        <head>
        </head>
		<body>
		<h1>Simulateur d'emploi du temps</h1>
		


 <h5>insérer donnée </h5>
 <!-- formulaire des maquettes-->
<form action="<?php echo $_SERVER['PHP_SELF'];?>" method="post">
			<input type="file" id ="fichier" name="fichier" accept=".sql" />
			
			<br>
			<h3>Les Maquettes :</h3>
			
			
			<input type="radio" id='l1' name="formation" value="L1 MPCIE" checked />
			<label >L1 MPCIE</label>

			<input type="radio" id='l2' name="formation" value="L2 MPCIE"  />
			<label>L2 MPCIE</label>
			
			<input type="radio" id='l3i' name="formation"value="L3 Info"  />
			<label>L3 INFO</label>
			
			<input type="radio" id='l3p' name="formation" value="L3 PRO"  />
			<label>L3 PRO</label>
			<br>
			<input type="radio" id='reel' name='donne' value="réel" />
			<label>Données réels</label>
			<input type="radio" id="alea" name="donne"value="Donnée aléatoire" checked />
			<label>Données aléatoires</label><br>
			<label>nombre de matières  :</label>
			<input type='number' id="nbmat" name="nbmat" value="8" min="2" max="15" >
			<br>
				<label>nombre d'élèves max par TD</label>
			<input type="number" id="nbtd" name="nbtd" value="40" min="10" max="80">
			<br>
			<label>nombre d'élèves max par TP</label>
			<input type="number" id="nbtp" name="nbtp" value="20" min="10" max="80">
			<br><br>
			 <input type="submit" id="donne" name="donne_forma" value="Chargement données maquette">
			<br><br>	<br>
			
<?php 
							
	if(!empty($_POST['donne_forma'])) {
		efface_tout();
	
		if(isset($_POST["formation"])){
			if($_POST['donne']=="réel") {		
			insert_donne_formation();		
			}
			else {
				$nomforma=$_POST['formation'];			
				creation_formation($nomforma);
				$nombre_mat=$_POST['nbmat'];
				creation_formation_rand($list_formation[$nomforma],$nombre_mat,$list_formation[$nomforma]->nom);		
			}
		}	
	
		$formation_choix=$_POST['formation'];
		$donne=$_POST['donne'];	
	}
?>
<!--formulaire des service et des étudiants -->
			<h3>Les Services</h3>
			<input type="radio" name="donne_prof" id="prof_reel" value="reel" checked/>
			<label>Liste enseignants réels</label>
			
			<input type="radio" name="donne_prof" id="prof_alea" value="alea"/>
			<label>Liste enseignants aléatoires</label>
			<br>
			<label>Nombre de professeurs crées</label>
			<input type="number" name="nbprof" id="nbprof" value="30" max="300" min="2"/>
			<br>
			<input type="radio" name="donne_service" id="service_reel" value="reel" checked/>
			<label>Service réel</label>
			<input type="radio" name="donne_service" id="service_alea1" value="alea1"/>
			<label>Service aléatoire 1</label>
			<input type="radio" name="donne_service" id="service_alea2" value="alea2" />
			<label>Service aléatoire 2(non fonctionnelle)</label> 
			
			
			
	<br><br>
	
	<h3>Les Etudiants</h3>
		<input type="radio" name="donne_eleve" id="eleve_reel" value="reel" checked/>
		<label>Liste étudiants réel</label>	
		<input type="radio" name="donne_eleve" id="eleve_alea" value="alea"/>
		<label>Liste étudiants aléatoires</label>
		<br>
		
		<label>Nombre d'élève :</label>
		<input type="number" id="nbeleve" name="nbeleve" value="50"  min="2" max="500" > <br><br>
			
			<label>Pourcentage choix parcours</label>
			
		<br><br>
		
		
    <input type="submit" id="envoyer" name="envoyer" value="Chargement données">
    
<form>
		
		
<?php

	if(isset($_POST['envoyer'])) {
		base_tout();
		$formation_choix=$_POST['formation'];
		$donne=$_POST['donne'];
		$donne2=$donne;
		$formation_choix2=$formation_choix;

		if($_POST['donne_eleve']=="reel"){
		//ajout donne reel au programme		
		}
		else {
				if($donne2=="réel"){
					foreach($list_formation as $fo){
						foreach($fo->UEs as $ue){
							foreach($ue->matiere as $mat){
								creation_categorie_rand($mat->description);																				
							}					
						}
					}
					
					foreach($list_matiere as $mat){
						foreach($mat->categories as $val){							
							insert_categorie($val);
							ajoutnb_eleve($val);
						}
					}										
				}
		
			creation_groupe_etudiant($_POST['nbeleve'],$list_formation[$formation_choix2]);
			foreach($list_eleve as $val){
		   choix_matiere($val);
			}
					
		}
		
		creation_groupe($list_formation[$formation_choix2],$_POST['nbtd'],$_POST['nbtp']);	
	
		
		if($_POST['donne_prof']=="reel") {
		//ajout donne reel au programme		
		}
		else{
		creation_prof_alea($_POST['nbprof']);		
		}
		if($_POST['donne_service']=="reel") {
		//ajout donne reel au programme		
		}
		if($_POST['donne_service']=="alea1") {
		affectation_prof_rand();	
		}
		if($_POST['donne_service']=="alea2"){
		//programme 2 d'affectation des service		
		}

	
	
	generer_xml();
	
	$database = 'simu';
	$user = 'etudiant';
	$pass = 'etudiant';
	$host = 'localhost';
	$dir = dirname(__FILE__) . '/dump.sql';

	exec("mysqldump --user={$user} --password={$pass} --host={$host} {$database} --result-file={$dir} 2>&1", $output);
			echo "<script>alert(\"génération reussi\")</script>";		
			echo "<a href='dump.sql' download='dump.sql'> Télécharger BDD</a>";
			echo "<a href='timetabling.xml' download='timetabling.xml' > Télécharger XML </a>";
}
?>
		
		</body>        
		</html>
		
		
	