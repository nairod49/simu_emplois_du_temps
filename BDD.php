<?php
require ("service.php");






$sgbd="mysql";
$host="localhost";
$port =3306;
$charset="UTF8";
$db="simu";
$user="etudiant";
$pass="etudiant";
$bdd = new pdo("$sgbd:host=$host;port=$port;dbname=$db;charset=$charset", $user, $pass,array(PDO::ATTR_ERRMODE =>PDO::ERRMODE_EXCEPTION));

function insert_donne_formation(){
	global $bdd;
$lines = explode("\n",file_get_contents("formations.sql"));
//var_dump($lines);
//initialisation des variables
$req = "";
$finRequete = false;
//pour chaque ligne du fichier
foreach ($lines as $line) {
    //on saute les commentaires
    if (substr($line, 0, 2) == '--' || $line == '') {
        continue;
    }
    //on ajoute la ligne à la requête
    $req .= $line;
    //Permet de repérer quand il faut envoyer l'ordre SQL...
    if (substr(trim($line), -1, 1) == ';') {
        $finRequete = true;
    }
    //si requête terminé, on l'exécute et on recommence le traitement à partir de la ligne suivante
    if ($finRequete) {
        if (!$bdd->query($req)) {
            echo "<div class='alert alert-danger'>Erreur : " . $mysqli->error . "<br>" . $req . "</div>";
        }
        $req = "";
        $finRequete = false;
    }
}

base_formation();
base_ue();
base_matiere();



}

function efface_tout(){
global $bdd;

$str="TRUNCATE Table choix_etudiant";
$bdd->query($str);
$str="TRUNCATE Table choix_groupe";
$bdd->query($str);
$str="TRUNCATE Table appartenance_matiere";
$bdd->query($str);
$str="TRUNCATE Table affectations_prof";
$bdd->query($str);
$str="Delete from regroupement";
$bdd->query($str);
$str="Delete from classe";
$bdd->query($str);
$str="Delete from groupe";
$bdd->query($str);

$str="Delete from inscrit_formation";
$bdd->query($str);
$str="Delete from etudiant";
$bdd->query($str);
$str="Delete from partie";
$bdd->query($str);
$str="delete from incompatibilite";
$bdd->query($str);
$str="Delete from matiere";
$bdd->query($str);
$str="Delete from sous_matiere";
$bdd->query($str);
$str="Delete from ue";
$bdd->query($str);
$str="Delete from formation";
$bdd->query($str);
$str="Delete from professeurs";
$bdd->query($str);


}

function base_prof(){
global $bdd;
global $list_prof;


$str="select * from professeurs";
$p=$bdd->query($str);
$p=$p->fetchAll();

for($i=0;$i<count($p);$i++){
$a=new professeur($p[$i][0],$p[$i][1],$p[$i][2]);
$list_prof[$p[$i][0]]=$a;
}






}

function base_formation(){
global $list_formation,$bdd;

$qrt="Select * from formation";
$f=$bdd->query($qrt);
$f=$f->fetchAll();

for($i=0;$i<count($f);$i++) {
$a=new formation($f[$i][1]);


$qrt="select id from formation where nom='$a->nom'";
$id=$bdd->query($qrt);
$id=$id->fetchAll();
$id=$id[0][0];
$a->id=$id;

$list_formation[$f[$i][1]]=$a;

}
//var_dump($list_formation);
}

function insert_formation(formation &$f){


global $bdd;

$str="Insert into formation (nom,nb_bloc)  values ('$f->nom',2)";
$bdd->query($str);
$qrt="select id from formation where nom='$f->nom'";
$id=$bdd->query($qrt);
$id=$id->fetchAll();
$id=$id[0][0];

$f->id=$id;

}






function base_ue(){
global $bdd,$list_UE,$list_formation;

$qrt="select * from ue";
$f=$bdd->query($qrt);
$f=$f->fetchAll();


for($i=0;$i<count($f);$i++){
$a=new UE($f[$i][2],[],$f[$i]['bloc']);

$t=intval($f[$i][1]);
$qrt="select nom from formation where id=$t";
$p=$bdd->query($qrt);
$p=$p->fetchAll();

$a->nomformation=$p[0][0];


$qrt="select id from ue where nom='$a->nom' ";
$id=$bdd->query($qrt);
$id=$id->fetchAll();
$id=$id[0][0];
$a->id=$id;

$list_UE[$f[$i][2]]=$a;

$c=intval($f[$i]['id_formation']);
$qrt="select nom from formation where id=$c";
$b=$bdd->query($qrt);
$b=$b->fetchAll();
$b=$b[0][0];
$list_formation[$b]->ajout_UE($a);


}}

function insert_ue(UE &$u){
global $bdd;


$qrt="select id from formation where nom='$u->nomformation' ";
$id=$bdd->query($qrt);

$id=$id->fetchAll();

$id=$id[0][0];
$qrt="insert into ue (id_formation,nom,description,bloc ) values ('$id','$u->nom','lorem pisumo',$u->nb_bloc)";
$bdd->query($qrt);

$qrt="select id from ue where nom='$u->nom'";
$id_ue=$bdd->query($qrt);
$id_ue=$id_ue->fetchAll();
$id_ue=$id_ue[0][0];
$u->id=$id_ue;


}



function base_matiere(){
global $list_matiere,$list_UE,$bdd;
$qrt="select * from matiere";
$m=$bdd->query($qrt);
$m=$m->fetchAll();
//var_dump($m);
for($i=0;$i<count($m);$i++){
$a=new matiere($m[$i][4],$m[$i][0]);
$list_matiere[$a->description]=$a;

$c=intval($m[$i]['id_ue']);
$qrt="select nom from ue where id=$c";
$u=$bdd->query($qrt);
$u=$u->fetchAll();

$u=$u[0][0];
$list_UE[$u]->ajout_matiere($a);


}
}

function insert_matiere(matiere &$m) {
global $bdd,$list_UE;


foreach($list_UE as $ue){
	
foreach($ue->matiere as $mat){
	if($mat->description==$m->description){
	
$n=$ue->nom;

$qrt="select id from ue where nom='$n' ";
$u=$bdd->query($qrt);
$u=$u->fetchAll();
$u=$u[0][0];
$qrt="insert into matiere (descriptif,id_ue,nom_matiere,mat_verrouille ) values ('$m->description',$u,'$m->description',0)";
$bdd->query($qrt);
$qrt="select id from matiere where descriptif='$m->description' ";
$p=$bdd->query($qrt);
$p=$p->fetchAll();
$p=intval($p[0][0]);

$m->id=$p;

$qrt="insert into sous_matiere (description) values ('$m->description')";
$bdd->query($qrt);
$qrt="select id from sous_matiere where description='$m->description' ";
$a=$bdd->query($qrt);
$a=$a->fetchAll();
$a=intval($a[0][0]);

$qrt="select id from matiere where descriptif='$m->description'";
$b=$bdd->query($qrt);
$b=$b->fetchAll();
$b=intval($b[0][0]);
$qrt="Insert into appartenance_matiere values($b,$a)";
$bdd->query($qrt);

}
}}

}

function base_categorie() {
global $bdd,$list_matiere;

$qrt="select * from partie";
$u=$bdd->query($qrt);
$u=$u->fetchAll();
//var_dump($u);

for($i=0;$i<count($u);$i++){
$a=new categorie($u[$i][0],$u[$i][2],$u[$i][5],$u[$i][4],[]);
$c=intval($u[$i][1]);
$qrt="select id_matiere from appartenance_matiere where id_sous_matiere='$c' ";
$mat=$bdd->query($qrt);
$mat=$mat->fetchAll();
$mat=intval($mat[0][0]);
$qrt="select descriptif from matiere where id=$mat ";
$m=$bdd->query($qrt);
$m=$m->fetchAll();

$m=$m[0][0];

$list_matiere[$m]->ajout_categories($a);


}

}

function insert_categorie(categorie &$cat) {
global $bdd,$list_matiere;

foreach($list_matiere as $mat){
foreach($mat->categories as $c){
if($c->id==$cat->id) {

$qrt="select id_sous_matiere from appartenance_matiere where id_matiere='$mat->id'";
$a=$bdd->query($qrt);
$a=$a->fetchAll();

$a=intval($a[0][0]);


$qrt="insert into partie ( id_sous_matiere,type,nbre_heure,nbre_groupe,nb_etudiants ) values ($a,'$cat->type','$cat->heure','$cat->nbgroupe','$cat->effectif' ) ";
$bdd->query($qrt);

$qrt="select id_partie from partie where id_sous_matiere='$a' and type='$cat->type'";
$id=$bdd->query($qrt);
$id=$id->fetchAll();
$id=intval($id[0][0]);
$cat->id=$id;

}
}}


}

function base_etudiant(){
global $bdd,$list_eleve,$list_formation;

$qrt="select * from etudiant";
$etu=$bdd->query($qrt);
$etu=$etu->fetchAll();
//var_dump($etu);
for($i=0;$i<count($etu);$i++){
$id_etu=intval($etu[$i][0]);
$nom_etu=$etu[$i][2];
$prenom_etu=$etu[$i][3];

$qrt="select id_formation from inscrit_formation where id_etudiant=$id_etu ";
$id_forma=$bdd->query($qrt);
$id_forma=$id_forma->fetchAll();
$id_forma=intval($id_forma[0][0]);

foreach($list_formation as $val){
	
if($val->id==$id_forma){
	
$mat=$val;

}
}
$a=new etudiant($nom_etu,$prenom_etu,$mat);

$qrt="select id from etudiant where nom='$a->nom' and prenom='$a->prenom'";
$id=$bdd->query($qrt);
$id=$id->fetchAll();
$id=$id[0][0];
$a->id=$id;
$list_eleve[$a->id]=$a;

}
}



function insert_etudiant(etudiant &$e){
global $bdd,$list_eleve;

$str="insert into etudiant (categorie,nom,prenom) values ('NORMAL','$e->nom','$e->prenom')";
$bdd->query($str);

$str="select id from etudiant where nom='$e->nom' and prenom='$e->prenom'";
$id=$bdd->query($str);
$id=$id->fetchAll();
$id=$id[0][0];
$e->id=$id;

$id_format=$e->formation->id;
$qrt="insert into inscrit_formation values ('$e->id','$id_format')";
$bdd->query($qrt);




} 


function insert_choix_etudiant(etudiant $e){
global $bdd;
foreach($e->matiere as $val){
$id=$val->id;

$str="insert into  choix_etudiant values ('$id','$e->id')" ; 
$bdd->query($str);

}


}


function base_groupe(){
global $bdd,$list_groupe,$list_eleve,$list_formation;

$str="select * from groupe";
$g=$bdd->query($str);
$g=$g->fetchAll();

for($i=0;$i<count($g);$i++){
$str="select id_etu from choix_groupe";
$id_etu=$bdd->query($str);
$id_etu=$id_etu->fetchAll();

$a=new groupe($g[$i][1],count($id_etu));
$a->id=$g[$i][0];
$list_groupe[$a->nom]=$a;
}
$str="select * from choix_groupe";
$id_etu=$bdd->query($str);
$id_etu=$id_etu->fetchAll();

for($i=0;$i<count($id_etu);$i++){
	
foreach($list_eleve as $val){
	
if($val->id==$id_etu[$i][0]){
	
	$id=intval($id_etu[$i][1]);
 
$qrt="select nom from groupe where id=$id";
$nom=$bdd->query($qrt);
$nom=$nom->fetchAll();

$nom=$nom[0][0];
$val->ajout_groupe($list_groupe[$nom]);
$nom_formation=$val->formation->nom;
$list_formation[$nom_formation]->ajout_groupe($list_groupe[$nom]);
}
}

}


}

function insert_groupe(groupe &$g){
global $bdd,$list_groupe;

$str="insert into groupe (nom) values ('$g->nom')";
$bdd->query($str);

$str="select id from groupe where nom='$g->nom'";
$id=$bdd->query($str);
$id=$id->fetchAll();
$id=$id[0][0];
$g->id=$id;



}

function insert_choix_groupe(etudiant $e){
global $list_groupe,$bdd;

$id_etu=intval($e->id);


foreach($e->groupe as $val){

$id_grou=$val->id;
$qrt="insert into choix_groupe values ($id_etu,$id_grou)";
$bdd->query($qrt);}
}


function base_affectation(){
	global $bdd;
global $list_prof;

$str="Select * from affectations_prof";
$p=$bdd->query($str);
$p=$p->fetchAll();
var_dump($p);
for($i=0;$i<count($p);$i++){	

$e=intval($p[$i][1]);
$art="select id_sous_matiere,type from partie where id_partie='$e' ";
$id_sous=$bdd->query($art);
$id_sous=$id_sous->fetchAll();
$type=$id_sous[0][1];
$e=intval($id_sous[0][0]);
$art="Select id_matiere from appartenance_matiere where id_sous_matiere=$e";
$id_mat=$bdd->query($art);
$id_mat=$id_mat->fetchAll();

$e=intval($id_mat[0][0]);
$art="select descriptif from matiere where id=$e";
$nom_mat=$bdd->query($art);
$nom_mat=$nom_mat->fetchAll();
$nom_mat=$nom_mat[0][0];

echo $type;
}

}


function insert_affectation(professeur $p,categorie $c,int $b){
global $list_prof,$bdd;
$id_partie=intval($c->id);

$id_prof=intval($p->id);

$qrt="insert into affectations_prof (id_partie,id_professeur,nbre_groupe_prof) values ($id_partie,$id_prof,$b)";
$bdd->query($qrt);


}



function insert_prof(string $n,string $p,int $s) {
global $bdd;
global $list_prof;
$str="Insert into professeurs (nom_professeur,prenom_professeur,service,id_departement)  values ('$n','$p',$s,1)";
$bdd->query($str);

}

function insert_classe(classe &$cla,categorie $cat,$t=array()){
global $bdd,$list_classe;



$str="insert into classe (nom,id_partie) values ('$cla->nom','$cat->id')";
$bdd->query($str);

$str="select id from classe where nom='$cla->nom'";
$id=$bdd->query($str);
$id=$id->fetchAll();
$id=$id[0][0];
$cla->id=$id;
 

foreach($t as $val){
$str="insert into regroupement values ('$val->id','$cla->id')";
$bdd->query($str);


}

}



?>