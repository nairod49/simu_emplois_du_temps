<?php
require("calendrier.php");

require ("service.php");

$list_UE=array();
$list_formation=array();
$list_eleve=array();
$list_groupe=array();
$list_classe=array();
$list_matiere=array();
$list_prof=array();



function creation_groupe_rand(string $n) {
$i=rand(0, 30);
$a=new groupe($n,$i);
global $list_groupe;
$list_groupe[$n]=$a;

}


function creation_classe(string $n){
$a=new classe("$n");
global $list_classe;
$list_classe[$n]=$a;

}

function creation_matiere(string $n){
$a=new matiere($n);
global $list_matiere;
$list_matiere[$n]=$a;
}

function ajout_categories(string $n,float $h,$t=array(),matiere  &$m){


if($n=="CM"){
$d=1.25;}
else $d=1.0;

$a=new categorie($n,$h,$d,3.0,$t);
$m->categories[$n]=$a;

}



function ajout_grp_classe(string $n,$t=array()){
	global $list_classe;
	foreach( $list_classe as $val){
		if($val->nom==$n){
			foreach($t as $tab){
			$val->ajout_groupe($tab);
			}
		} 
	}
}



function creation_prof(string $n){
$a=new professeur($n);
global $list_prof;
$list_prof[$n]=$a;


}

function creation_prof_alea(int $nb){
$i=0;
global $list_prof;


$str="abcdefghijklmnopqrstuwxyz";

for($i;$i<$nb;$i++){

$a=new professeur(str_shuffle($str)); 

array_push($list_prof,$a);
}


}

function affectation_prof(float $n,string $p,matiere &$m,string $c){
global $list_matiere , $list_prof;
$a=$list_prof[$p];
$m->ajout_service($c,$a,$n);


}

function affectation_prof_rand(matiere &$n){

global $list_prof;


foreach($n->categories as $val){
while ($val->reste > 0){

$p=array_rand($list_prof,1);

$d=rand(1,$val->reste);	
	affectation_prof($d,$p,$n,$val->nom);
}
//var_dump($val);
}

}

function affectation_prof_formation(formation &$F){
foreach($F->UEs as $ue){
	foreach($ue->matiere as $m ){
		affectation_prof_rand($m);
		var_dump($m->categories);
	}
}

}



function creation_formation(string $n){
global $list_formation;
$a=new formation($n);
$list_formation[$n]=$a;
}

function creation_formation_L3S1_info(){
global $list_matiere;
global $list_classe;
global $list_formation;


$forma=new formation("L3 info");



creation_classe("Tous");

creation_matiere("anglais");
ajout_categories("TP",18.0,$list_classe["Tous"],$list_matiere["anglais"],$forma);


creation_matiere("fondement");
ajout_categories("CM",24.0,$list_classe["Tous"],$list_matiere["fondement"]);
ajout_categories("TD",24.0,$list_classe["Tous"],$list_matiere["fondement"]);


creation_matiere("THL");
ajout_categories("CM",20.0,$list_classe["Tous"],$list_matiere["THL"]);
ajout_categories("TD",16.0,$list_classe["Tous"],$list_matiere["THL"]);
ajout_categories("TP",12.0,$list_classe["Tous"],$list_matiere["THL"]);


creation_matiere("DECRA");
ajout_categories("CM",20.0,$list_classe["Tous"],$list_matiere["DECRA"]);
ajout_categories("TD",12.0,$list_classe["Tous"],$list_matiere["DECRA"]);
ajout_categories("TP",16.0,$list_classe["Tous"],$list_matiere["DECRA"]);


creation_matiere("archi");
ajout_categories("CM",24.0,$list_classe["Tous"],$list_matiere["archi"]);
ajout_categories("TD",14.0,$list_classe["Tous"],$list_matiere["archi"]);
ajout_categories("TP",10.0,$list_classe["Tous"],$list_matiere["archi"]);

creation_matiere("C++");
ajout_categories("CM",20.0,$list_classe["Tous"],$list_matiere["C++"]);
ajout_categories("TP",44.0,$list_classe["Tous"],$list_matiere["C++"]);

creation_matiere("graphe");
ajout_categories("CM",12.0,$list_classe["Tous"],$list_matiere["graphe"]);
ajout_categories("TD",4.0,$list_classe["Tous"],$list_matiere["graphe"]);
ajout_categories("TP",8.0,$list_classe["Tous"],$list_matiere["graphe"]);

$a=new UE("UE 1",[$list_matiere["anglais"]],false);
$forma->ajout_ue($a);
$a=new UE("UE 2",[$list_matiere["fondement"]],false);
$forma->ajout_ue($a);
$a=new UE("UE 3",[$list_matiere["THL"]],false);
$forma->ajout_UE($a);
$a=new UE("UE 4",[$list_matiere["DECRA"]],false);
$forma->ajout_UE($a);
$a=new UE("UE 5",[$list_matiere["archi"]],false);
$forma->ajout_UE($a);
$a=new UE("UE 6",[$list_matiere["C++"]],false);
$forma->ajout_UE($a);
$a=new UE("UE 7",[$list_matiere["graphe"]],false);
$forma->ajout_UE($a);

$list_formation[$forma->nom]=$forma;
}

function choix_matiere(etudiant &$e){
$u=$e->formation->UEs;
global $list_matiere;


foreach($u as $val){
	$e->ajout_UE($val);
	
	if($val->option==false){
		foreach($val->matiere as $mat){
			//var_dump($mat);
			$e->ajout_matiere($mat);
			$mat->ajout_eleve($e);
			
		}
		}

	}


}

function creation_groupe(formation &$F,int $td,int $tp){
global $list_eleve;
$a=new groupe("CM",150);
$F->ajout_groupe($a);
$F->nbgrCM=1;
$F->groupe["CM"]->ajout_tabeleve($F->eleve);
$nb=$F->effectif;

$numeleve=0;
$grtd=0;
$grtp=0;



while($nb>0 ) {
$ntd=$td;



$nomgroupetd="TD".$grtd;

	$grtd+=1;
	$nomgroupetd="TD".$grtd;
$c=new groupe($nomgroupetd,$td);


	
	while($ntd>0 && $nb>0) {
		$grtp+=1;
		$nomgroupetp="TP".$grtp;
		$b=new groupe($nomgroupetp,$tp);
		
		for ($i=0;$i<$tp;$i++) {
			if($ntd>0 && $nb>0){
			
		$c->ajout_eleve($F->eleve[$numeleve]);
		$b->ajout_eleve($F->eleve[$numeleve]);
		$numeleve+=1;	
		$ntd-=1;
		$nb-=1;	}
		}
		
		$F->ajout_groupe($b);
	  $F->ajout_groupe($c);
}
	$F->nbgrTD=$grtd;
		$F->nbgrTP=$grtp;

}

foreach($F->UEs as $ue){
	foreach($ue->matiere as $mat){
	foreach($mat->categories as $cat ){
		if($cat->nom=="CM"){
		$cat->nbgroupe=1;	
		$cat->reste=1;	
		}	
			if($cat->nom =="TD") { $cat->nbgroupe=$grtd; $cat->reste=$grtd; }
			if($cat->nom=="TP"){$cat->nbgroupe=$grtp; $cat->reste=$grtp;}
		
		}		
	}	
	}
}





function creation_groupe_etudiant(int $nb){
$i=0;
global $list_eleve;
global $list_formation;

$str="abcdefghijklmnopqrstuwxyz";

for($i;$i<$nb;$i++){
$b=rand(0,100)/10;
if($b<8.0) {
$a=new etudiant(str_shuffle($str),$list_formation["L3 info"]); 

}
else $a=new etudiant(str_shuffle($str),$list_formation["L2 info"]); 

array_push($list_eleve,$a);
}

}






creation_formation("L2 info");




creation_formation_L3S1_info();

creation_groupe_etudiant(100);


creation_groupe($list_formation["L2 info"],30,10);

creation_groupe($list_formation["L3 info"],30,10);


foreach($list_eleve as $val){
choix_matiere($val);
}


/*
creation_prof("Marc Legay");
creation_prof("David Lessaint");
creation_prof("David Genest");
creation_prof("Ait ei mekki Touria");
*/
creation_prof_alea(20);
affectation_prof_formation($list_formation["L3 info"]);
//affectation_prof_rand("DECRA");


//affectation_prof(2.0,"Marc Legay","Dev Web","CM");
//affectation_prof(1.0,"Marc Legay","ISI","CM");
//$list_prof["Marc Legay"]->affiche();
//$list_prof["David Genest"]->affiche();
//$list_prof["David Lessaint"]->affiche();



?>
