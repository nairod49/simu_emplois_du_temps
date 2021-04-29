<?php
//require "groupe.php";

//classe professeur qui ressence tout les prof
class professeur{

//prenom et nom du professeur
public $id;
//nombre d'heure a effectué
public $service;
//nombre d'heure qui a actuellement 
public $charge;
//nombre comparaison entre l'heure de charge et de service
public $difference;
//tableau des affectaction des categories
public $affectation;

public function __construct(string $i){
$this->id=$i;
$this->service=192;
$this->charge=0;
$this->difference=-192;
$this->affectation=array();
}

//fonction qui met a jour les heure de charge et différence du prof et rajoute la categorie a affectation 
public function ajout_heure(float $h,string $n,float $nb){
$this->charge+=$h;
$this->difference=$this->charge - $this->service;
$this->affectation[$n]=[$nb];
}

//fonction d'affichage d'un prof 
public function affiche(){
echo "Nom: ",$this->id," service: ",$this->service," charge: ",$this->charge," difference: ",$this->difference ,"<br>",$this->affiche_affectation();
}

//fonction d'affichage 
public function affiche_affectation(){
echo "affectaction : ";
foreach($this->affectation as $c => $val){
echo $c,": ",$val[0],"<br>";

}

}
}

class categorie{
public $nom;
public $heure;
public $coef;
public $nbgroupe;
public $EDT;
public $service;
public $reste;

public $effectif;
public $groupe;

public function __construct(string $n ,float $h,float $c,float $ng,$G=array()){
$this->nom=$n;
$this->heure=$h;

$this->coef=$c;
$this->nbgroupe=$ng;
$this->reste=$ng;
$this->EDT=$h*$c;
$this->service=array();
$this->groupe=array();
foreach($G as $val){
	//$this->effectif+=$val->effectif;
	array_push($this->groupe, $val);
} 
}

public function ajout_service(professeur $P,float $n){
$this->service[$P->id]=[$n];
$this->reste-=$n;
$a=$n*$this->EDT;
$P->ajout_heure($a,$this->nom,$n);
}


//fonction qui ajoute un objet groupe a la classe
public function ajout_groupe(groupe $a){
	$this->totaleffectif+=$a->effectif;
	$this->groupe[$a->nom]=$a;
}
}




class matiere{
	public $id;
	public $descritpion;
	public $categories;
	public $effectif;
	public $eleves;
	
 


	public function __construct(string $n){
		$this->id=$n;
		$this->categories=array();
		$this->eleves=array();
		$this->effectif=0;
	}

//fonction qui ajoute des categorie au matiere (CM TP etc)
	public function ajout_categories(categorie $g){
		$this->categories[$g->nom]=$g;
		}

	public function ajout_eleve(etudiant $e){
	array_push($this->eleves,$e);
	$this->efectif+=1;
		
	}

	public function ajout_service(string $c,professeur $P,float $n){
		foreach ($this->categories as $val){
			if($val->nom==$c){
				$val->ajout_service($P,$n);
			}	
		}
	}

}




/*
class semestre{
public $nom;
public $matieres;

public function __construct(string $i,$t =array()){
$this->nom=$i;
$this->matieres=$t;
}

public function ajout_matiere(matiere $m){
	array_push($this->matieres, $m);
}

}
*/

/*
class filiare{
public $nom;
public $descritpion;
public $semestre;

public function __construct(string $i,string $d){
$this->nom=$i;
$this->description=$d;
$this->semestre=array();

}
public function ajout_semestre(semestre $s){
array_push($this->semestre,$s);
}
}
*/

Class UE{
public $nom;
public $matiere;
public $otpion;

public function __construct(string $n,$m=array(),bool $o){
$this->nom=$n;
$this->option=$o;
$this->matiere=array();
foreach($m as $val){
array_push($this->matiere, $val);
}}


public function ajout_matiere(matiere $m){
array_push($this->matiere, $m);
}
}



Class formation {
public $nom;

public $UEs=array();

public function __construct(string $n){
$this->nom=$n;


}

public function ajout_ue(UE $u){
$this->UEs[$u->nom]=$u;
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
$this->UE=array();
$this->matiere=array();
}

public function ajout_UE(UE $m){
$this->UE[$m->nom]=$m;

}
public function ajout_matiere(matiere $m) {
$this->matiere[$m->id]=$m;

}

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


?>