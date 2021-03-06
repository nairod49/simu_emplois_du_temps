<?php

// projet de la facultés des sciences d'Angers 
// fait par Dorian Letort



//classe professeur qui ressence tout les profs
class professeur{

//prenom et nom id du professeur
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

	//fonction de construction des professeurs , paramètre: 
	public function __construct(string $id,string $i,string $c){
		$this->id=$id;
		$this->nom=$i;
		$this->prenom=$c;
		$this->service=192;
		$this->charge=0;
		$this->difference=-192;
		$this->affectation=array();
	}

//fonction qui met a jour les heure de charge et différence du prof et rajoute la catégorie a affectation 
	public function ajout_heure(float $h,string $n,float $nb){
		$this->charge+=$h;
		$this->difference=$this->charge - $this->service;
		$this->affectation[$n]=[$nb];
	}


}



//classe catégorie équivalent a un cours CM/TD/TP
class categorie{
//id classe
public $id;
//type catégorie (CM/TD/TP)
public $type;
//nombre d'heure de la catégorie
public $heure;
//coeficient de la catégorie selon le type 
public $coef;
//nombre de groupe dans la catégorie
public $nbgroupe;
//nombre d'heure d'équivalence pour les service (nbreheure*coef)
public $EDT;
//liste des professeurs affectées à la catégorie
public $service;
//nombre de groupe restant pour la catégorie
public $reste;
//nombre d'élève dans la catégorie
public $effectif;
//liste des classe affectée à la catégorie 
public $classe;


//fonction de construction des categories , paramètre : string de l'id , nom du type(CM/TD/TP), nombre de groupe , nombre d'heure
	public function __construct(string $id,string $n,int $g ,float $h){
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
		$this->classe=array();

	}
	
//fonction d'ajout  des afféctations des professeurs
	public function ajout_service(professeur $P,float $n,string $m){
		array_push($this->service,[$P,$n]);
		$this->reste-=$n;
		$a=$n*$this->EDT;
		$nom=$m."-".$this->type;
		$P->ajout_heure($a,$nom ,$n);
	}


//fonction qui ajoute un objet groupe a la classe
	public function ajout_classe(classe $a){
		$this->classe[$a->nom]=$a;
	}
}



//class matiere qui contient les catégories
class matiere{
	public $id;
	public $description;
	public $categories;
	public $effectif;
	public $reste_groupe;
	public $eleves;
	
 

	//fonction de construction de la matière , paramètre: nom de la matière , id de la matière 
	public function __construct(string $d,string $id){
		$this->id=$id;
		$this->description=$d;
		$this->categories=array();
		$this->eleves=array();
		$this->effectif=0;
		$this->reste_groupe=0;
	}

//fonction qui ajoute des catégorie au matière (CM TP etc)
	public function ajout_categories(categorie $g){
		$this->categories[$g->type]=$g;
		}
//fonction d'ajout d'élèves et mise a jour de l'effectif de la matiere
	public function ajout_eleve(etudiant $e){
	array_push($this->eleves,$e);
	$this->effectif+=1;
		
	}
//fonction d'ajout des affectations des professeurs
	public function ajout_service(string $c,professeur $P,float $n){
		foreach ($this->categories as $val){
			if($val->type==$c){
				$val->ajout_service($P,$n,$this->description);
			}	
		}
	}

}





//classe UE contenant les différentes matieres
Class UE{
	//id de l'ue
	public $id;
	//nom de l'ue
public $nom;
//liste des différentes matiere contenue dans l'ue
public $matiere;
//boolean pour savoir si l'ue est une option
public $option;
//nom de la formation où est contenue cette UE
public $nomformation;
//nombre de matiere contenue dans l'ue
public $nb_bloc;

//fonction de construction de l'ue , parametre : nom de l'ue , liste des matiere contenue dans l'ue et nombre de matiere
	public function __construct(string $n,$m=array(),int $nb){
		$this->nom=$n;
		$this->option=false;
		$this->nb_bloc=$nb;
		$this->matiere=array();
			foreach($m as $val){
				array_push($this->matiere, $val);
			}
	}

//fonction d'ajout de matiere dans l'ue
	public function ajout_matiere(matiere $m){
		array_push($this->matiere, $m);
	}

}	


//classe formation contenant les différentes UE
Class formation {
//id de la formation	
	public $id;
	//nom de la formation
public $nom;
//nombre d'élève dans la formation
public $effectif;
//nombre de groupe de CM
public $nbgrCM;
//nombre de groupe de TD
public $nbgrTD;
//nombre de groupe de TP
public $nbgrTP;
//liste des UE contenue dans la formation
public $UEs=array();
//liste des groupe contenue dans la formation
public $groupe=array();
//liste des élèves affectés dans la formation
public $eleve=array();
//liste des classes contenu dans la formation
public $classe=array();
//parcours des différentes option si elle existe
public $parcours=array();
//nombre d'etudiant par parcours
public $nbparcours=array();

//fonction de construction de la formation , paramètre: nom de la formation 
	public function __construct(string $n){
		$this->nom=$n;
		$this->semestres=array();
		$this->effectif=0;
		$this->nbgrCM=0;
		$this->nbgrTD=0;
		$this->nbgrTP=0;
	}

//fonction d'ajout des groupes dans la formation
	public function ajout_groupe(groupe $a){
		$this->groupe[$a->nom]=$a;
	}

//fonction d'ajout d'ue dans la formation
	public function ajout_ue(UE $u){
		$this->UEs[$u->nom]=$u;
	}

//fonction d'ajout des élèves dans la formation 
	public function ajout_eleve(etudiant $e){
		array_push($this->eleve,$e);
	}
//fonction d'ajout de parcours
	public function ajout_parcour(matiere &$a, matiere &$b){
	array_push($this->parcours,[$a,$b]);	
	}

}



//classe étudiant représentant les élèves
Class etudiant{
//id de l'étudiant
public $id;
//nom de l'étudiant
public $nom;
//prenom de l'étudiant 
public $prenom;
//formation dans laquelle est l'étudiant
public $formation;
//liste des UE choisi
public $UE;
//liste des matière choisie
public $matiere;
//groupe auquelle fait parti l'étudiant
public $groupe;

//fonction de construction d'un étudiant , paramètre : nom étudiant , prénom étudiant ,formation de l'étudiant 
	public function __construct(string $n,string $p,formation &$f){
		$this->nom=$n;
		$this->prenom=$p;
		$this->formation=$f;
		$f->effectif+=1;
		$f->ajout_eleve($this);
		$this->UE=array();
		$this->matiere=array();
		$this->groupe=array();
	}

	//focntion d'ajout de l'ue de l'étudiant
	public function ajout_UE(UE $m){
		$this->UE[$m->nom]=$m;
	}
	
	//fonction d'ajout des matieres a l'étudiant
	public function ajout_matiere(matiere $m) {
		$this->matiere[$m->id]=$m;
	}
//fonction d'ajout de groupe a l'étudiant 
	public function ajout_groupe(groupe $g){
		array_push($this->groupe,$g);
	}
	
}


//classe groupe représente les différent groupe crée
Class groupe{
public $id;
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

//fonction d'ajout d'un tableau d'élève au groupe
	public function ajout_tabeleve(&$t=array()){
		foreach($t as $val){
			$this->ajout_eleve($val);
		}
	}

//fonction d'ajout d'un élève au groupe 
	public function ajout_eleve(etudiant &$e){
		array_push($this->list_eleve, $e);
		$e->ajout_groupe($this);
	}
	


}


//Classe classe qui représente des ensemble de groupe 
Class classe{
//nom de la classe
public $nom;
//liste des groupes contenu dans la classe 
public $groupe;
//categories qui correspond a la classe
public $categorie;

//fonction de construction d'une classe n paramètre: nom de la classe , catégorie de la classe , liste des groupe de la classe 
	public function __construct(string $n,categorie $cat,$p=array() ){
		$this->totaleffectif=0;
		$this->nom=$n;
		$this->groupe=$p;
		$this->categorie=$cat;
	} 	


//fonction qui ajoute un objet groupe a la classe
	public function ajout_groupe(groupe $a){
		$this->totaleffectif+=$a->effectif;
		$this->groupe[$a->nom]=$a;
	}



}


?>