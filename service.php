<?php


//classe professeur qui ressence tout les prof
class professeur{

//prenom et nom du professeur
public $id;
public $nom;
public $prenom;
//nombre d'heure a effectué
public $service;
//nombre d'heure qui a actuellement 
public $charge;
//nombre comparaison entre l'heure de charge et de service
public $difference;
//tableau des affectaction des categories
public $affectation;

public function __construct(string $id,string $i,string $c){
$this->id=$id;
$this->nom=$i;
$this->prenom=$c;
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


public $id;
public $type;
public $heure;
public $coef;
public $nbgroupe;
public $EDT;
public $service;
public $reste;

public $effectif;
public $groupe;



public function __construct(string $id,string $n,int $g ,float $h,$G=array()){

$this->id=$id;

$this->type=$n;
$this->heure=$h;
$this->effectif=0;
if($n=="CM") {
$this->coef=1.25;}
else {$this->coef=1.0;}
$this->nbgroupe=$g;
$this->reste=$g;
$this->EDT=$h*$this->coef;
$this->service=array();
$this->groupe=array();
foreach($G as $val){
	//$this->effectif+=$val->effectif;
	array_push($this->groupe, $val);
} 
}

public function ajout_service(professeur $P,float $n,string $m){
$this->service[$P->id]=$n;
$this->reste-=$n;
$a=$n*$this->EDT;
$nom=$m."-".$this->nom;

$P->ajout_heure($a,$nom ,$n);
}


//fonction qui ajoute un objet groupe a la classe
public function ajout_groupe(groupe $a){
	$this->effectif+=$a->effectif;
	$this->groupe[$a->nom]=$a;
}
}




class matiere{
	public $id;
	public $description;
	public $categories;
	public $effectif;
	public $reste_groupe;
	public $eleves;
	
 


	public function __construct(string $d,string $id){
		$this->id=$id;
		$this->description=$d;
		$this->categories=array();
		$this->eleves=array();
		$this->effectif=0;
		$this->reste_groupe=0;
	}

//fonction qui ajoute des categorie au matiere (CM TP etc)
	public function ajout_categories(categorie $g){
		$this->categories[$g->type]=$g;
		}

	public function ajout_eleve(etudiant $e){
	array_push($this->eleves,$e);
	$this->effectif+=1;
		
	}

	public function ajout_service(string $c,professeur $P,float $n){
		foreach ($this->categories as $val){
			if($val->nom==$c){
				$val->ajout_service($P,$n,$this->id);
			}	
		}
	}

}






Class UE{
public $nom;
public $matiere;

public $nomformation;
public $nb_bloc;

public function __construct(string $n,$m=array(),int $nb){
$this->nom=$n;
$this->nb_bloc=$nb;
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
public $effectif;
public $nbgrCM;
public $nbgrTD;
public $nbgrTP;
public $UEs=array();
public $groupe=array();
public $eleve=array();

public function __construct(string $n){
$this->nom=$n;
$this->effectif=0;
$this->nbgrCM=0;
$this->nbgrTD=0;
$this->nbgrTP=0;
}

public function ajout_groupe(groupe $a){
$this->groupe[$a->nom]=$a;
}

public function ajout_ue(UE $u){
$this->UEs[$u->nom]=$u;
}

public function ajout_eleve(etudiant $e){
array_push($this->eleve,$e);
}

}





Class etudiant{
public $id;
public $formation;
public $UE;
public $matiere;
public $groupe;

public function __construct(string $n,formation &$f){
$this->id=$n;
$this->formation=$f;
$f->effectif+=1;
$f->ajout_eleve($this);
$this->UE=array();
$this->matiere=array();
$this->groupe=array();
}

public function ajout_UE(UE $m){
$this->UE[$m->nom]=$m;

}
public function ajout_matiere(matiere $m) {
$this->matiere[$m->id]=$m;

}

public function ajout_groupe(groupe $g){
array_push($this->groupe,$g);
}
}


//classe groupe représente les différent groupe crée
Class groupe{

//nom du groupe 
public $nom;
//effectif du groupe
public $effectif;
//list eleve
public $list_eleve=array();

//fonction de construction
public function __construct(string $n,int $e){
	$this->nom=$n;
	$this->effectif=$e;
}

public function ajout_tabeleve(&$t=array()){
foreach($t as $val){
$this->ajout_eleve($val);

}

}

public function ajout_eleve(etudiant &$e){
array_push($this->list_eleve, $e);
$e->ajout_groupe($this);
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