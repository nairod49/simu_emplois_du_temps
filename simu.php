<?php
// projet de la facultés des sciences d'Angers 
// fait par Dorian Letort

require("BDD.php");

	//tableau qui contient tout les UE
	$list_UE=array();
	//tableau qui contient toute les formations 
	$list_formation=array();
	//tableau qui contient tout les élèves 
	$list_eleve=array();
	//tableau qui contient tout les groupes 
	$list_groupe=array();
	//tableau qui contient toutes les classes
	$list_classe=array();
	//tableau qui contient toute les matières
	$list_matiere=array();
	//tableau qui contient tout les professeurs
	$list_prof=array();

	//variable de l'interface
	global $donne;
	//variable de l'interface
	global $formation_choix;



	//fonction qui crée l'objet classe et l'ajoute dans le tableau list_classe
	function creation_classe2(string $n){
			
			$a=new classe("$n");	
			global $list_classe;
			$list_classe[$n]=$a;

	}


	//fonction qui crée l'objet matiere et l'ajout dans le tableau list_matiere
	function creation_matiere(string $n){
	
		$str="0101010101010000111";	
		$a=new matiere($n,str_shuffle($str));
		global $list_matiere;
		$list_matiere[$n]=$a;

	}

//fonction d'ajout d'une catégorie dans une matière
	function ajout_categories(string $n,float $h,$t=array(),matiere  &$m){

		if($n=="CM"){
				$d=1.25;}
	
			else $d=1.0;

		$a=new categorie($n,3,$h,$d,$t);
		$m->categories[$n]=$a;

	}



//fonction de création de plusieurs catégorie aléatoire pour une matière
	function creation_categorie_rand(string $s){
	
		global $list_matiere;
		global $list_classe;
		//nombre aléatoire entre 0 et 100
		$r=rand(0,100);
		
		$str="0101010101010000111";
			
			//95% de chance d'avoir un CM
			if($r<95) {
			
				$a=new categorie(str_shuffle($str),"CM",3,rand(18,25));
				$list_matiere[$s]->ajout_categories($a);
				
				//nombre aléatoire entre 0 et 100
				$r2=rand(0,100);
				
				//90% de chance d'avoir un TD et TP 
				if($r2<90) {
					$a=new categorie(str_shuffle($str),"TD",3,rand(10,30));
					$list_matiere[$s]->ajout_categories($a);
				
					//nombre aléatoire entre 0 et 100
					$r2=rand(0,100);
						
						//90% chance d'avoir un TP
						if($r2<90) {			
							$a=new categorie(str_shuffle($str),"TP",3,rand(10,30));
							$list_matiere[$s]->ajout_categories($a);					
						}
				}
				//10% chance de d'avoir un CM et un TP
				else {$a=new categorie(str_shuffle($str),"TP",3,rand(16,50));
					$list_matiere[$s]->ajout_categories($a);
					}
					
			}
			//5% chance d'avoir que des TP.
			else {
				$a=new categorie(str_shuffle($str),"TP",3,rand(16,23));
				$list_matiere[$s]->ajout_categories($a);
			}

	}



//fonction de création d'une formation aléatoire 
	function creation_formation_rand(formation &$f,int $n,string $s) {

		global $list_formation;
		global $list_matiere,$list_UE;

	
		$str="abcdefghijklmnopqrstuwxyz";
	
	
		$count_ue=1;
		
		$option=rand(0,100);

		$bool_option=true;
			
			//tant qu'il reste des matière
			while($n>0){
				$r=rand(0,100);		
		
				if($option<=100) {
					//5% de chance d'avoir 3 matière dans l'ue 
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
			
							//ajout des catégorie dans la base de données
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
					//5% de chance d'avoir 2 matière dans l'ue
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
				
						//ajout des catégorie dans la base de données
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
					
				else {//90% de chance d'avoir une matière dans l'ue
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








//fonction de création de professeurs aléatoire
	function creation_prof_alea(int $nb){
		$i=0;
		global $bdd;
		global $list_prof;


		$str="abcdefghijklmnopqrstuwxyz";
		//création de n professeurs
		for($i;$i<$nb;$i++){
			//nom et prénom aléatoire
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



//fonction de création des affectation  entre les prof et les matière
	function affectation_prof(float $n,string $p,matiere &$m,string $c){
	
		global $list_matiere , $list_prof;
		$a=$list_prof[$p];
		$m->ajout_service($c,$a,$n);
		$m->reste_groupe-=$n;
	}



//fonction qui calcul le nombre de groupe qu'il reste a affecté dans les toutes les matières	
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


//fonction qui fait les affectation aléatoire pour les professeurs 
	function affectation_prof_rand(){

			global $list_matiere;
			global $list_prof;
		
		//tableau des matières
		$list=$list_matiere;
		//tableau des categorie restante
		$list_cate=[];
		//nombre de prof 
		$num=count($list_prof);
		//calcul du nombre de groupe qu'il reste a affecté
		$f=calcul_heure_reste();
	
	
		//ajout de toute les catégorie dans le tableau cate
		foreach($list_matiere as $val){
			foreach($val->categories as $cat){
				$list_cate[$cat->id]=$cat;
			}		
		}
	
	
		//tant qu'il a des cours et qu'il a des prof 
		while(count($list_cate)>0 && $num>0){
			
			//on recherche un professeurs	
				$p=array_rand($list_prof,1);
				$p=$list_prof[$p];

	
				while($p->difference>-80){
					$p=array_rand($list_prof,1);
					$p=$list_prof[$p];
				}
	
	
			//tant que le prof a une différence inférieur a -80 , qu'il reste des matière et des cours 
			while($p->difference<-80 && count($list)>0 && count($list_cate)>0){
		
					//on choisi au hasard un cour
					$num_cat=array_rand($list_cate,1);
					$cat=$list_cate[$num_cat];
		
					//on cherche la matière a qui appartient le cours précédemment choisi
					foreach($list as $val){
						foreach($val->categories as $licat){
							if($licat->id==$cat->id) {$m=$val;}		
							}		
						}
			
					//pour chaque catégorie de la matière 
					foreach($m->categories as $val){			
						//si le cours est un CM non affecté on l'affecte au prof choisi
						if($val->type=="CM" && $val->reste>0 && $p->difference<=-80){
							affectation_prof(1.0,$p->id,$m,"CM");
							insert_affectation($p,$val,1.0);
								//si la catégorie ne lui reste plus de cours a affecté on le supprime de la liste des catégorie
								if($list_cate[$val->id]->reste==0){unset($list_cate[$val->id]);}
						}

						//si le cours est un TD
						if($val->type=="TD" && $val->reste>0 && $p->difference<=-80) {
							$b=rand(0,100);
							//si le chiffre aléatoire est inférieur a 80 on affecte le TD au prof 
							if($b<80.0 ) 
							 {if($val->reste>3) {
									$c=rand(1,3);	}
								else $c=rand(1, $val->reste);
						
								affectation_prof($c,$p->id,$m,"TD");	
								insert_affectation($p,$val,$c);	
								//si la catégorie ne lui reste plus de cours a affecté on le supprime de la liste des catégorie
								if($list_cate[$val->id]->reste==0){unset($list_cate[$val->id]);}
						
								
							}	
					
						}
				
						//si le cours est un TP 
						if($val->type=="TP" && $val->reste>0 && $p->difference<=-80) {
							$b=rand(0,100);
							//si le chiffre aléatoire est inférieur a 80 on affecte le TP au prof 
							if($b<80.0 ) 
							 {if($val->reste>3) {
									$c=rand(1,3);	}
								else $c=rand(1, $val->reste);
						
								affectation_prof($c,$p->id,$m,"TP");
								insert_affectation($p,$val,$c);	
								//si la catégorie ne lui reste plus de cours a affecté on le supprime de la liste des catégorie
								if($list_cate[$val->id]->reste==0){unset($list_cate[$val->id]);}
							
							}}	
						
						//si la matière sélectionne n'a plus de cours a attribué on le retire de la list 
						if($m->reste_groupe<=0){ unset($list[$m->id]);}
			

				}
			//si le professeur a une différence de plus de -80 alors on retire un prof 
			if($p->difference>=-80) {$num-=1;}
	
	}
}

//on recommence exactement le même processus mais avec une différence inférieur a -10
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
										$c=rand(1,3);	}
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
									$c=rand(1,3);	}
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




//fonction qui permet de crée une formation et le rajoute dans le tableau 
	function creation_formation(string $n){
		global $list_formation;
		$a=new formation($n);
		insert_formation($a);
		$list_formation[$n]=$a;
	}


//fonction qui permet a un élève de choisir ces matières
	function choix_matiere(etudiant &$e,$t=array()){
	
		global $list_matiere;
	

		//parcours des UE de la formation de l'élève
		foreach($e->formation->UEs as $val){
		
			$e->ajout_UE($val);
			//si UE n'est pas avec des option alors
			if($val->option==false){
				foreach($val->matiere as $mat){
						//ajout de chaque matière a l'élève
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


//fonction de qui permet de formé des groupes
	function creation_groupe(formation &$F,int $td,int $tp){
		global $list_eleve,$list_groupe,$list_classe;

		$a=$F->nom;	
		$F->nbgrCM=1;
	
		$nb=$F->effectif;

		$numeleve=0;
		$grtd=0;
		$grtp=0;
		//si la formation n'a pas de parcours a choisir
		if(empty($F->parcours)) {
			//tant qu'il y a des élève
			while($nb>0 ) {
				$ntd=$td;
				$nomgroupetd="TD".$grtd;
				$grtd+=1;
				$nomgroupetd="TD".$grtd;
	
				$nom=$a." ,".$nomgroupetd;
	
				$listtd=array();
				//tant que la jauge de td n'a pas été atteinte 
				while($ntd>0 && $nb>0) {
					$grtp+=1;
					$nomgroupetp="TP".$grtp;
					$b=new groupe($nom." ,".$nomgroupetp,$tp);
					$list_groupe[$b->nom]=$b;
												
					insert_groupe($b);
						//parcours les catégorie
					foreach($F->UEs as $ue){
						foreach($ue->matiere as $mat){
							foreach($mat->categories as $cat){
								if($cat->type=="TP"){
									$classeb=new classe("TP-".$mat->description."-".$grtp,$cat,[$b]);	
									$list_classe[$classeb->nom]=$classeb;	
									$cat->ajout_classe($classeb);
									//création des classes					
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
	//pour chaque élève de la formation on ajoute le choix du groupe dans la base de donnée
	foreach($F->eleve as $val){
		
		insert_choix_groupe($val);		
	}		
		//modification du nombre de groupe que possèdera les cours
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
	}
	}
		else {//parti non terminer qui permettera la création des groupe en fonction des parcours
			for($i=0;$i<count($F->parcours);$i++){
				
		
		}	
	}	
	
}





//fonction de création d'un groupe d'étudiants
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






//fonction de génération du fichier xml final 
	function generer_xml(){
	global $formation_choix2;
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

	$forma=$list_formation[$formation_choix2];
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

	//formations
	xmlwriter_end_element($xw);



	xmlwriter_start_pi($xw, 'php');

	xmlwriter_end_pi($xw);

	xmlwriter_end_document($xw);

	fwrite($xml,xmlwriter_output_memory($xw));
	fclose($xml);

	}











?>
