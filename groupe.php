<?php

Class UE{
public $nom;
public $matiere;
public $otpion;

public function __construct(string $n,$m=array(),bool $o){
$this->nom=$n;
$this->option=$o;
foreach($m as $val){
array_push($this->matiere, $val);
}
}

}

Class formation {
public $nom;
public $UEs=array();

public function __construct(string $n,$t=array()){
$this->nom=$n;

foreach($t as $val){
$this->UEs[$val->nom]=$val;
}
}

}





Class etudiant{
public $id;
public $formation;
public $UE;
public $matiere;

public function __construct(string $n,formation $f){
$this->id=$n;
$this->formation=$f;
}

public function ajout_matiere(){}
}


//classe groupe représente les différent groupe crée
Class groupe{

//nom du groupe 
public $nom;
//effectif du groupe
public $effectif;

//fonction de construction
public function __construct(string $n,int $e){
	$this->nom=$n;
	$this->effectif=$e;
}


//fonction d'affichage du groupe
public function affiche_groupe(){
	echo "\"", $this->nom ,"\" : ", $this->effectif;
}

//fonction d'affichage du nom du groupe
public function affiche_nom(){
	echo "\"", $this->nom ,"\"";
}

}


//Classe classe qui représente des ensemble de groupe 
Class classe{
public $nom;
public $groupe;
public $totaleffectif;

public function __construct(string $n, $t=array() ){
	$this->totaleffectif=0;
	$this->nom=$n;
	$this->groupe=array();
		foreach($t as $val){
		$this->totaleffectif+=$val->effectif;	
		array_push($this->groupe, $val);
		}
} 	


//fonction qui ajoute un objet groupe a la classe
public function ajout_groupe(groupe $a){
	$this->totaleffectif+=$a->effectif;
	$this->groupe[$a->nom]=$a;
}



}





/*
Class affectation{
public $nom;
public $categories;


public function __construct(string $m,$C=array()){
	$this->nom=$m;
	$this->categories=array();
	foreach($C as $val){
	$this->categories[$val->nom]=$val;
	}

}



	public function affiche_affectation(){
	
	}

}
*/


?>