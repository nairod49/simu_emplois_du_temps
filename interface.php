<!doctype html>
<?php require "simu.php"; ?>
<html lang="fr">
    <head>
        <meta charset="UTF-8" />
        
        <meta name="viewport" content="width=device-width, initial-scale=1">	
        <title>Simulateur</title>
        <head>
        </head>
		<body>
		<h1>Simulateur d'emploi du temps</h1>
		<h3>( basé sur le programme de L3 informatique 1 semestre)</h3>
		<form method="POST" action="interface.php">
		<label>Simulation aléatoire :</label>		
		<input type="checkbox" id="aleatoire" checked /><br><br>
		<label>Nombre d'élève :</label>
		<input type="number" id="nbeleve" value="50"  min="20" max="500"><br><br>
		<label>Nombre de professeurs </label>
		<input type="number" id="nbprof"value="30" min="5" max="100">
		
		<br> <br>
		<input type="submit" id="submit" value="Création de la base ">
		</form>
		
<?php

if(isset($_POST["submit"]) ){
//creation_formation_L3S1_info();
echo "test";
}
?>		
		
		</body>        
		</html>