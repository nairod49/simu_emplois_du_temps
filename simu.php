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
$b=rand(15, 30);

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

function affectation_prof(float $n,string $p,string $m,string $c){
global $list_matiere , $list_prof;
$a=$list_prof[$p];
$list_matiere[$m]->ajout_service($c,$a,$n);


}

function affectation_prof_rand(string $n){
global $list_matiere;
global $list_prof;
$a=count($list_prof, $mode = null);
$m=$list_matiere[$n];
foreach($m->categories as $val){
while ($val->reste > 0){
var_dump($val, $expression = null);
$p=array_rand($list_prof,1);
var_dump($p, $expression = null);
$d=rand(1,$val->reste);	
	affectation_prof($d,$p,$n,$val->nom);
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
ajout_categories("TP",18.0,$list_classe["Tous"],$list_matiere["anglais"]);


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

$a=new UE("UE 1",$list_matiere["anglais"],false);
$forma->ajout_ue($a);
$a=new UE("UE 2",$list_matiere["fondement"],false);
$forma->ajout_ue($a);
$a=new UE("UE 3",$list_matiere["THL"],false);
$forma->ajout_UE($a);
$a=new UE("UE 4",$list_matiere["DECRA"],false);
$forma->ajout_UE($a);
$a=new UE("UE 5",$list_matiere["archi"],false);
$forma->ajout_UE($a);
$a=new UE("UE 6",$list_matiere["C++"],false);
$forma->ajout_UE($a);
$a=new UE("UE 7",$list_matiere["graphe"],false);
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
			$e->ajout_matiere($mat);
			$mat->ajout_eleve($e);
			
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
if($b>0.80) {
$a=new etudiant(str_shuffle($str),$list_formation["L3 info"]); 

}
else $a=new etudiant(str_shuffle($str),$list_formation["L2 info"]); 

array_push($list_eleve,$a);
}

}






creation_formation("L2 info");
creation_formation_L3S1_info();

creation_groupe_etudiant(10);
foreach($list_eleve as $val){
choix_matiere($val);
}
var_dump($list_matiere["DECRA"], $expression = null);
/*
creation_groupe_rand("opt_1");
creation_groupe_rand("opt_2i");
creation_groupe_rand("opt_2d");
creation_groupe_rand("opt_3");



creation_classe("Tous");
creation_classe("G1");
creation_classe("G2");
creation_classe("O1");
creation_classe("O2",$list_classe);
creation_classe("O3",$list_classe);

ajout_grp_classe("Tous",$list_groupe);
ajout_grp_classe("G1",[$list_groupe["opt_3"],$list_groupe["opt_1"]]);
ajout_grp_classe("G2",[$list_groupe["opt_2i"],$list_groupe["opt_2d"]]);
ajout_grp_classe("O1",[$list_groupe["opt_1"]]);
ajout_grp_classe("O2",[$list_groupe["opt_2i"],$list_groupe["opt_2d"]]);
ajout_grp_classe("O3",[$list_groupe["opt_3"]]);


creation_matiere("Dev Web",$list_matiere);
creation_matiere("ISI",$list_matiere);

ajout_categories("CM",[$list_classe["Tous"]],$list_matiere["Dev Web"]);
ajout_categories("TD",[$list_classe["G1"],$list_classe["G2"]],$list_matiere["Dev Web"]);
ajout_categories("TP",[$list_classe["O1"],$list_classe["O2"],$list_classe["O3"]],$list_matiere["Dev Web"]);

ajout_categories("CM",[$list_classe["G1"]],$list_matiere["ISI"]);
ajout_categories("TD",[$list_classe["O1"],$list_classe["O3"]],$list_matiere["ISI"]);

ajout_categories("TP",[$list_classe["O1"],$list_classe["O3"]],$list_matiere["ISI"]);


creation_prof("Marc Legay");
creation_prof("David Lessaint");
creation_prof("David Genest");

affectation_prof_rand("Dev Web");

//affectation_prof(2.0,"Marc Legay","Dev Web","CM");
//affectation_prof(1.0,"Marc Legay","ISI","CM");
$list_prof["Marc Legay"]->affiche();
$list_prof["David Genest"]->affiche();
$list_prof["David Lessaint"]->affiche();
*/


?>
