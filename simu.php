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






function creation_classe2(string $n){
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
	
	global $list_matiere;
	global $list_classe;

	$r=rand(0,100);
$str="0101010101010000111";
	if($r<95) {
			
		$a=new categorie(str_shuffle($str),"CM",3,rand(18,25));
		$list_matiere[$s]->ajout_categories($a);
		
		$r2=rand(0,100);
		
			if($r2<90) {
			$a=new categorie(str_shuffle($str),"TD",3,rand(10,30));
			$list_matiere[$s]->ajout_categories($a);
		
			
			$r2=rand(0,100);
					if($r2<90) {
					$a=new categorie(str_shuffle($str),"TP",3,rand(10,30));
					$list_matiere[$s]->ajout_categories($a);
					
					}
			}
			else {$a=new categorie(str_shuffle($str),"TP",3,rand(16,50));
				$list_matiere[$s]->ajout_categories($a);
				}
	

	}
	else {
	$a=new categorie(str_shuffle($str),"TP",3,rand(16,23));
	$list_matiere[$s]->ajout_categories($a);

	}
}



function creation_formation_rand(formation &$f,int $n,string $s) {

	global $list_formation;
	global $list_matiere,$list_UE;

	
	$str="abcdefghijklmnopqrstuwxyz";
	
	
	$count_ue=1;
$option=rand(0,100);
$bool_option=true;
	while($n>0){
		$r=rand(0,100);
		
		
		if($option<=100) {
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
		$list_formation[$f->nom]->ajout_ue($ue);
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
				$f->ajout_ue($ue);
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
						 $f->ajout_ue($ue);
						
						
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
		foreach($mat->categories as $m){
		if($m->reste>0) {
			$f+=1;}
		}
	}

	return $f;
}



function affectation_prof_rand(){

	global $list_matiere;
	global $list_prof;

	$list=$list_matiere;
	$list_cate=[];
	$num=count($list_prof);
	
	$f=calcul_heure_reste();
	
	
	
	foreach($list_matiere as $val){
		foreach($val->categories as $cat){
		$list_cate[$cat->id]=$cat;
		}		
	}
	
	
	
	
	
	while(count($list_cate)>0 && $num>0){
			$p=array_rand($list_prof,1);
			$p=$list_prof[$p];

	
		while($p->difference>-80){
		$p=array_rand($list_prof,1);
			$p=$list_prof[$p];
		}
	
	
	
		while($p->difference<-80 && count($list)>0 && count($list_cate)>0){
		
		
		$num_cat=array_rand($list_cate,1);
		$cat=$list_cate[$num_cat];
		
		foreach($list as $val){
		foreach($val->categories as $licat){
		if($licat->id==$cat->id) {$m=$val;}		
		}		
		}
			
		foreach($m->categories as $val){
			
					
			
			
				if($val->type=="CM" && $val->reste>0 && $p->difference<=-80){
				affectation_prof(1.0,$p->id,$m,"CM");
				insert_affectation($p,$val,1.0);
					if($list_cate[$val->id]->reste==0){unset($list_cate[$val->id]);}
				
				
				}


				if($val->type=="TD" && $val->reste>0 && $p->difference<=-80) {
					$b=rand(0,100);
				
					if($b<80.0 ) 
					 {if($val->reste>3) {
						$c=rand(0,3);	}
							else $c=rand(1, $val->reste);
						
						affectation_prof($c,$p->id,$m,"TD");	
					insert_affectation($p,$val,$c);	
						
						if($list_cate[$val->id]->reste==0){unset($list_cate[$val->id]);}
						
								
						}	
					
				}
				
				if($val->type=="TP" && $val->reste>0 && $p->difference<=-80) {
					$b=rand(0,100);
				
					if($b<80.0 ) 
					 {if($val->reste>3) {
						$c=rand(0,3);	}
							else $c=rand(1, $val->reste);
						
						affectation_prof($c,$p->id,$m,"TP");
						insert_affectation($p,$val,$c);	
						if($list_cate[$val->id]->reste==0){unset($list_cate[$val->id]);}
							
						}}	
						
		
			if($m->reste_groupe<=0){ unset($list[$m->id]);}
			

	}

	if($p->difference>=-80) {$num-=1;}
	
	}
}


if(count($list_cate)>0) {
$num=count($list_prof);
while(count($list_cate)>0 && $num>0){
			$p=array_rand($list_prof,1);
			$p=$list_prof[$p];

	
		while($p->difference>-10){
		$p=array_rand($list_prof,1);
			$p=$list_prof[$p];
		}
	
	
	
		while($p->difference<-10 && count($list)>0 && count($list_cate)>0){
		
		
		$num_cat=array_rand($list_cate,1);
		$cat=$list_cate[$num_cat];
		
		foreach($list as $val){
		foreach($val->categories as $licat){
		if($licat->id==$cat->id) {$m=$val;}		
		}		
		}
			
		foreach($m->categories as $val){
			
					
			
			
				if($val->type=="CM" && $val->reste>0 && $p->difference<=-10){
				affectation_prof(1.0,$p->id,$m,"CM");
				insert_affectation($p,$val,1.0);
					if($list_cate[$val->id]->reste==0){unset($list_cate[$val->id]);}
				
				
				}


				if($val->type=="TD" && $val->reste>0 && $p->difference<=-10) {
					$b=rand(0,100);
				
					if($b<80.0 ) 
					 {if($val->reste>3) {
						$c=rand(0,3);	}
							else $c=rand(1, $val->reste);
						
						affectation_prof($c,$p->id,$m,"TD");	
					insert_affectation($p,$val,$c);	
						
						if($list_cate[$val->id]->reste==0){unset($list_cate[$val->id]);}
						
								
						}	
					
				}
				
				if($val->type=="TP" && $val->reste>0 && $p->difference<=-10) {
					$b=rand(0,100);
				
					if($b<80.0 ) 
					 {if($val->reste>3) {
						$c=rand(0,3);	}
							else $c=rand(1, $val->reste);
						
						affectation_prof($c,$p->id,$m,"TP");
						insert_affectation($p,$val,$c);	
						if($list_cate[$val->id]->reste==0){unset($list_cate[$val->id]);}
							
						}}	
						
		
			if($m->reste_groupe<=0){ unset($list[$m->id]);}
			

	}

	if($p->difference>=-10) {$num-=1;}
	
	}
}

}




}





function creation_formation(string $n){
	global $list_formation;
	$a=new formation($n);
	insert_formation($a);
	$list_formation[$n]=$a;
}



function choix_matiere(etudiant &$e,$t=array()){
	
	global $list_matiere;
	


	foreach($e->formation->UEs as $val){
		
		$e->ajout_UE($val);
	
		if($val->option==false){
			foreach($val->matiere as $mat){
			
					$e->ajout_matiere($mat);
					$mat->ajout_eleve($e);
					
			
			}
		}
		else { $opt=rand(0,100);
				$pour1=0;
				$pour2=$t[0];
				$i=0;
						foreach($e->formation->parcours as $parcour){
							array_push($e->formation->nbparcour,0);
						}
				
				foreach($e->formation->parcours as $parcour){
						if($opt>=$pour1 && $opt<$pour2){
								foreach($parcour as $mat){
									$e->ajout_matiere($mat);
									$mat->ajout_eleve($e);
									$e->formation->nbparcour[$i]++;
																		
								}
							}
							else{$pour1=$t[$i];
								$i++;
								$pour2=$t[$i];}						
						
				}
			
		}
	}
	insert_choix_etudiant($e);
}



function creation_groupe(formation &$F,int $td,int $tp){
	global $list_eleve,$list_groupe,$list_classe;

	$a=$F->nom;
	
	
	
	$F->nbgrCM=1;
	
	$nb=$F->effectif;

	$numeleve=0;
	$grtd=0;
	$grtp=0;

if(empty($F->parcours)) {

	while($nb>0 ) {
		$ntd=$td;
		$nomgroupetd="TD".$grtd;
		$grtd+=1;
		$nomgroupetd="TD".$grtd;
		
		
	
	$nom=$a." ,".$nomgroupetd;
	
	$listtd=array();
	
		while($ntd>0 && $nb>0) {
			$grtp+=1;
			$nomgroupetp="TP".$grtp;
			$b=new groupe($nom." ,".$nomgroupetp,$tp);
			$list_groupe[$b->nom]=$b;
			
			
			
			
			insert_groupe($b);
						
					foreach($F->UEs as $ue){
			foreach($ue->matiere as $mat){
				foreach($mat->categories as $cat){
					if($cat->type=="TP"){
					$classeb=new classe("TP-".$mat->description."-".$grtp,$cat,[$b]);	
					$list_classe[$classeb->nom]=$classeb;	
					$cat->ajout_classe($classeb);	
					insert_classe($classeb,$cat,[$b]);			
					}				
				}			
			}			
			}	
			
			for ($i=0;$i<$tp;$i++) {
				if($ntd>0 && $nb>0){			
					
					$b->ajout_eleve($F->eleve[$numeleve]);
					$numeleve+=1;	
					$ntd-=1;
					$nb-=1;	}
			}
		
			$F->ajout_groupe($b);
	 		array_push($listtd,$b);
		}
		
		foreach($F->UEs as $ue){
			foreach($ue->matiere as $mat){
				foreach($mat->categories as $cat){
					if($cat->type=="TD"){
					$classeb=new classe("TD-".$mat->description."-".$grtd,$cat,$listtd);		
					$list_classe[$classeb->nom]=$classeb;
					$cat->ajout_classe($classeb);		
					insert_classe($classeb,$cat,$listtd);				
					}				
				}			
			}			
			}
		
		$F->nbgrTD=$grtd;
		$F->nbgrTP=$grtp;
		
	}

	foreach($F->eleve as $val){
		//var_dump($val);
	insert_choix_groupe($val);	
	
	}		
		
	foreach($F->UEs as $ue){
		foreach($ue->matiere as $mat){
			foreach($mat->categories as $cat ){
				if($cat->type=="CM"){
					$cat->nbgroupe=1;	
					$cat->reste=1;	
					$mat->reste_groupe+=1;
				}	
			
				if($cat->type =="TD") { $cat->nbgroupe=$grtd;$mat->reste_groupe+=$grtd; $cat->reste=$grtd; }
				if($cat->type=="TP"){$cat->nbgroupe=$grtp;$mat->reste_groupe+=$grtp; $cat->reste=$grtp;}
		
			}		
		}	
	}}
	else {
		for($i=0;$i<count($F->parcours);$i++){
				
		
		}	
	}	
	
}






function creation_groupe_etudiant(int $nb,formation &$F){

	$i=0;
	global $list_eleve;
	global $list_formation;

	$str="abcdefghijklmnopqrstuwxyz";

		
	for($i;$i<$nb;$i++){
		
	
		
		 $a=new etudiant(str_shuffle($str),str_shuffle($str),$F);
					 
		
		

		
		insert_etudiant($a);
		array_push($list_eleve,$a);
	}
}







function generer_xml(){
	global $list_formation,$list_eleve,$list_UE,$list_classe,$list_groupe,$list_matiere,$list_prof;
$xml=fopen("timetabling.xml","w+");
	
$xw = xmlwriter_open_memory();
xmlwriter_set_indent($xw, 1);
$res = xmlwriter_set_indent_string($xw, ' ');

xmlwriter_start_document($xw, '1.0', 'UTF-8');


xmlwriter_start_element($xw,"teachers");

	foreach($list_prof as $prof){
	xmlwriter_start_element($xw,"teacher");
	xmlwriter_start_attribute($xw,"id");
	xmlwriter_text($xw,$prof->id);
	xmlwriter_end_attribute($xw);
	xmlwriter_start_attribute($xw,"name");
	xmlwriter_text($xw,$prof->nom);
	xmlwriter_end_attribute($xw);
	xmlwriter_end_element($xw);
	}
	
	xmlwriter_end_element($xw);
	
xmlwriter_start_element($xw,"Groupes");

foreach($list_groupe as $val){
xmlwriter_start_element($xw,"Groupe");
xmlwriter_start_attribute($xw,"id");
xmlwriter_text($xw,$val->id);
xmlwriter_end_attribute($xw);
xmlwriter_start_attribute($xw,"size");
xmlwriter_text($xw,$val->effectif);
xmlwriter_end_attribute($xw);
xmlwriter_start_attribute($xw,"label");
xmlwriter_text($xw,$val->nom);
xmlwriter_end_attribute($xw);
xmlwriter_end_element($xw);


}
xmlwriter_end_element($xw);



xmlwriter_start_element($xw,"formations");

	foreach($list_formation as $forma){
		//course
		xmlwriter_start_element($xw,"formation");
			xmlwriter_start_attribute($xw,"id");
			xmlwriter_text($xw,$forma->id);
			xmlwriter_end_attribute($xw);
			xmlwriter_start_attribute($xw,"label");
			xmlwriter_text($xw,$forma->nom);
		xmlwriter_end_attribute($xw);
	
		foreach($forma->UEs as $ue){
			foreach($ue->matiere as $mat){
				//courses
			xmlwriter_start_element($xw,"courses");		
				
				//course
				xmlwriter_start_element($xw,"course");
				
					xmlwriter_start_attribute($xw,"id");
					xmlwriter_text($xw,$mat->id);
					xmlwriter_end_attribute($xw);
			
					xmlwriter_start_attribute($xw,"nom");
					xmlwriter_text($xw,$mat->description);
					xmlwriter_end_attribute($xw);

						foreach($mat->categories as $cat){
										//part
							xmlwriter_start_element($xw,"part");
								
									xmlwriter_start_attribute($xw,"id");
									xmlwriter_text($xw,$cat->id);
									xmlwriter_end_attribute($xw);
									xmlwriter_start_attribute($xw,"nbsesion");
									xmlwriter_text($xw,$cat->heure);
									xmlwriter_end_attribute($xw);
									xmlwriter_start_attribute($xw,"lenght");
									xmlwriter_text($xw,"test");
									xmlwriter_end_attribute($xw);
									xmlwriter_start_attribute($xw,"label");
									xmlwriter_text($xw,$cat->type);
									xmlwriter_end_attribute($xw);
							
										xmlwriter_start_element($xw,"classes");
											
											foreach($cat->classe as $clas){
											xmlwriter_start_element($xw,"classe");
												xmlwriter_start_attribute($xw,"id");
												xmlwriter_text($xw,$clas->nom);
												xmlwriter_end_attribute($xw);
													
														foreach($clas->groupe as $gr){
														xmlwriter_start_element($xw,"groupeID");
															xmlwriter_start_attribute($xw,"id");															
															xmlwriter_text($xw,$gr->id);
															xmlwriter_end_attribute($xw);
															xmlwriter_text($xw,$gr->nom);														
														
														xmlwriter_end_element($xw);														
														}											
												
											
											xmlwriter_end_element($xw);
											}
										
										xmlwriter_end_element($xw);											
											
										//allowedteacher
										xmlwriter_start_element($xw,"allowedTeacher");
								
											xmlwriter_start_attribute($xw,"demand");
											xmlwriter_text($xw,"multiple");
											xmlwriter_end_attribute($xw);
								
												foreach($cat->service as $prof){
												
													$p=$prof[0];
												//teacher
												xmlwriter_start_element($xw,"teacher");
										
													xmlwriter_start_attribute($xw,"id");
													xmlwriter_text($xw,$p->id);
													xmlwriter_end_attribute($xw);
													xmlwriter_start_attribute($xw,"nbgroupe");
													xmlwriter_text($xw,$prof[1]);
													xmlwriter_end_attribute($xw);
													xmlwriter_start_attribute($xw,"nom");
													xmlwriter_text($xw,$p->nom);
													xmlwriter_end_attribute($xw);
													//teacher												
												xmlwriter_end_element($xw);									
										}
										//allowedteacher															
										xmlwriter_end_element($xw);
							//part
							xmlwriter_end_element($xw);		
						}					
					//course
				xmlwriter_end_element($xw);
			//courses
			xmlwriter_end_element($xw);
			}
		}	
	//formation
	xmlwriter_end_element($xw);
}
//formations
xmlwriter_end_element($xw);



xmlwriter_start_pi($xw, 'php');
xmlwriter_text($xw, '$foo=2;echo $foo;');
xmlwriter_end_pi($xw);

xmlwriter_end_document($xw);

fwrite($xml,xmlwriter_output_memory($xw));
fclose($xml);

}


function creation_tous_rand(){
	global $list_formation,$list_eleve,$list_UE,$list_classe,$list_groupe,$list_matiere,$list_prof;
efface_tout();
creation_formation("L1 MPCIE");
creation_formation_rand($list_formation['L1 MPCIE'],8,$list_formation['L1 MPCIE']->nom);
//creation_formation_rand(8,"L2 MPCIE");
//creation_formation_rand(8,"L3 MPCIE");

creation_groupe_etudiant(80);
creation_groupe($list_formation["L1 MPCIE"],40,20);
//creation_groupe($list_formation["L2 MPCIE"],35,15);

//creation_groupe($list_formation["L3 MPCIE"],30,10);

foreach($list_eleve as $val){
choix_matiere($val);
}

creation_prof_alea(8);

affectation_prof_rand();


}










?>
