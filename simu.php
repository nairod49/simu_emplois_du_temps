<?php
require("calendrier.php");
require("BDD.php");


$list_UE=array();
$list_formation=array();
$list_eleve=array();
$list_groupe=array();
$list_classe=array();
$list_matiere=array();
$list_prof=array();






function creation_classe(string $n){
	$a=new classe("$n");
	global $list_classe;
	$list_classe[$n]=$a;

}

function creation_matiere(string $n){
$str="0101010101010000111";	
	$a=new matiere($n,str_shuffle($str));
	global $list_matiere;
	$list_matiere[$n]=$a;
}

function ajout_categories(string $n,float $h,$t=array(),matiere  &$m){


	if($n=="CM"){
		$d=1.25;}
	else $d=1.0;

	$a=new categorie($n,3,$h,$d,$t);
	$m->categories[$n]=$a;

}



function creation_categorie_rand(string $s){
	creation_classe("Tous");
	global $list_matiere;
	global $list_classe;

	$r=rand(0,100);
$str="0101010101010000111";
	if($r<95) {
			
		$a=new categorie(str_shuffle($str),"CM",3,rand(18,25),$list_classe["Tous"]);
		$list_matiere[$s]->ajout_categories($a);
		
		$r2=rand(0,100);
		
			if($r2<90) {
			$a=new categorie(str_shuffle($str),"TD",3,rand(10,30),$list_classe["Tous"]);
			$list_matiere[$s]->ajout_categories($a);
		
			
			$r2=rand(0,100);
					if($r2<90) {
					$a=new categorie(str_shuffle($str),"TP",3,rand(10,30),$list_classe["Tous"]);
					$list_matiere[$s]->ajout_categories($a);
					
					}
			}
			else {$a=new categorie(str_shuffle($str),"TP",3,rand(16,50),$list_classe["Tous"]);
				$list_matiere[$s]->ajout_categories($a);
				}
	

	}
	else {
	$a=new categorie(str_shuffle($str),"TP",3,rand(16,23),$list_classe["Tous"]);
	$list_matiere[$s]->ajout_categories($a);

	}
}


function creation_formation_rand(int $n,string $s) {

	global $list_formation;
	global $list_matiere,$list_UE;

	
	$str="abcdefghijklmnopqrstuwxyz";
	creation_formation($s);
	insert_formation($list_formation[$s]);
	$count_ue=1;

	while($n>0){
		$r=rand(0,100);
		
		if($r>=95) {
		$c=str_shuffle($str);				
		creation_matiere($c);
		
		creation_categorie_rand($c);
		
		$d=str_shuffle($str);
		creation_matiere($d);
		creation_categorie_rand($d);
		
		$e=str_shuffle($str);
		creation_matiere($e);
		creation_categorie_rand($e);
		
		$ue=new UE("UE".$count_ue,[$list_matiere[$e],$list_matiere[$c],$list_matiere[$d]],3);
		$ue->nomformation=$s;
		$list_UE[$ue->nom]=$ue;
		$list_formation[$s]->ajout_ue($ue);
		insert_ue($ue);
		insert_matiere($list_matiere[$c]);
		foreach($list_matiere[$c]->categories as $val){
		
		insert_categorie($val);	
		}		
		

		insert_matiere($list_matiere[$d]);
		foreach($list_matiere[$d]->categories as $val){
		
		insert_categorie($val);	
			
		}
		insert_matiere($list_matiere[$e]);
		foreach($list_matiere[$e]->categories as $val){
		
		insert_categorie($val);	
			
		}
		$n-=3;

		}
			else {
				if($r>=90){
				$c=str_shuffle($str);				
				creation_matiere($c);
				creation_categorie_rand($c);
				
				$d=str_shuffle($str);
				creation_matiere($d);
				creation_categorie_rand($d);
	
				$ue=new UE("UE".$count_ue,[$list_matiere[$c],$list_matiere[$d]],2);
				$ue->nomformation=$s;
				$list_UE[$ue->nom]=$ue;
$list_formation[$s]->ajout_ue($ue);
				insert_ue($ue);
				insert_matiere($list_matiere[$c]);
				foreach($list_matiere[$c]->categories as $val){
		
		insert_categorie($val);	
		}		
		
		insert_matiere($list_matiere[$d]);
		foreach($list_matiere[$d]->categories as $val){
		
		insert_categorie($val);	
		}		
		
				$n-=2;		
	
				}
					else {
						$c=str_shuffle($str);				
						 creation_matiere($c);
						 creation_categorie_rand($c);

						 $ue=new UE("UE".$count_ue,[$list_matiere[$c]],1);
						 $ue->nomformation=$s;
						 $list_UE[$ue->nom]=$ue;
						 $list_formation[$s]->ajout_ue($ue);
						 insert_ue($ue);
	insert_matiere($list_matiere[$c]);
	
		foreach($list_matiere[$c]->categories as $val){
			
				insert_categorie($val);	
				}		
				
							$n-=1;
							
					}
		}	
		
		$count_ue+=1;
		

}


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







function creation_prof_alea(int $nb){
	$i=0;
	global $bdd;
	global $list_prof;


	$str="abcdefghijklmnopqrstuwxyz";

	for($i;$i<$nb;$i++){
		$n=str_shuffle($str);
		$p=str_shuffle($str);
		$a=new professeur(0,$n,$p);
		insert_prof($n,$p,192);
		$qrt="Select id_professeur from professeurs where nom_professeur='$n' and prenom_professeur='$p'";
		$r=$bdd->query($qrt);
		$r=$r->fetchAll();
		$a->id=intval($r[0][0]);	
		
		$list_prof[intval($r[0][0])]=$a;
	}
}



function affectation_prof(float $n,string $p,matiere &$m,string $c){

	global $list_matiere , $list_prof;
	$a=$list_prof[$p];
	$m->ajout_service($c,$a,$n);
	$m->reste_groupe-=$n;
}



function calcul_heure_reste(){

	global $list_matiere;
	$f=0;
	foreach($list_matiere as $mat){
		
			$f+=$mat->reste_groupe;
		
	}

	return $f;
}



function affectation_prof_rand(){

	global $list_matiere;
	global $list_prof;

	$list=$list_matiere;
	
	$num=count($list_prof);

	$f=calcul_heure_reste();
	
	
	
	
	while($f>0 && $num>0){
			$p=array_rand($list_prof,1);
			$p=$list_prof[$p];

	
		while($p->difference>=-10) {
			$p=array_rand($list_prof,1);
			$p=$list_prof[$p];
			}
	
	
	
		while($p->difference<-10 && count($list)>0){
		$m=array_rand($list,1);
		$m=$list_matiere[$m];
		
			foreach ($m->categories as $val){
		
				if($val->nom=="CM" && $val->reste>0){
				affectation_prof(1.0,$p->id,$m,"CM");
				}


				if($val->nom=="TD" && $val->reste>0) {
					$b=rand(0,100);
				
					if($b<80.0 ) 
					 {if($val->reste>3) {
						$c=rand(0,3);	}
							else $c=rand(1, $val->reste);
						
						affectation_prof($c,$p->id,$m,"TD");				
						}	
					
				}
				
				if($val->nom=="TP" && $val->reste>0) {
					$b=rand(0,100);
				
					if($b<80.0 ) 
					 {if($val->reste>3) {
						$c=rand(0,3);	}
							else $c=rand(1, $val->reste);
						
						affectation_prof($c,$p->id,$m,"TP");				
						}}	
						
		}
			if($m->reste_groupe<=0){unset($list[$m->id]);}
			$f=calcul_heure_reste();

	}

	if($p->difference>=-10) {$num-=1;}
	
	
	}
}





function creation_formation(string $n){
	global $list_formation;
	$a=new formation($n);
	insert_formation($a);
	$list_formation[$n]=$a;
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
					$mat->reste_groupe+=1;
				}	
			
				if($cat->nom =="TD") { $cat->nbgroupe=$grtd;$mat->reste_groupe+=$grtd; $cat->reste=$grtd; }
				if($cat->nom=="TP"){$cat->nbgroupe=$grtp;$mat->reste_groupe+=$grtp; $cat->reste=$grtp;}
		
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
		$b=rand(0,100);
		if($b<33) {
			$a=new etudiant(str_shuffle($str),$list_formation["L3 info"]); 
		}
		
		if($b>=33 && $b<66) $a=new etudiant(str_shuffle($str),$list_formation["L2 info"]); 

		if($b>=66) $a=new etudiant(str_shuffle($str),$list_formation["L1 info"]);

		array_push($list_eleve,$a);
	}
}






//creation_formation_rand(8,"L2 info");




//creation_formation_L3S1_info();
//creation_formation_rand(10,"L1 info");
//creation_groupe_etudiant(300);

//creation_groupe($list_formation["L2 info"],30,10);

//creation_groupe($list_formation["L3 info"],30,10);

//creation_groupe($list_formation["L1 info"],30,10);
/*
foreach($list_eleve as $val){
choix_matiere($val);
}
//creation_prof_alea(35);


affectation_prof_rand();
var_dump($list_prof);
echo "reussi";

*/





?>
