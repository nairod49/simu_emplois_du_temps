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



function insert_base(){
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
$list_formation[$f[$i][1]]=$a;

}

}

function insert_formation(formation $f){


global $bdd;

$str="Insert into formation (nom,nb_bloc)  values ('$f->nom',2)";
$bdd->query($str);

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
$list_UE[$f[$i][2]]=$a;

$c=intval($f[$i]['id_formation']);
$qrt="select nom from formation where id=$c";
$b=$bdd->query($qrt);
$b=$b->fetchAll();
$b=$b[0][0];
$list_formation[$b]->ajout_UE($a);


}}

function insert_ue(UE $u){
global $bdd;


$qrt="select id from formation where nom='$u->nomformation' ";
$id=$bdd->query($qrt);

$id=$id->fetchAll();

$id=$id[0][0];
$qrt="insert into ue (id_formation,nom,description,bloc ) values ('$id','$u->nom','lorem pisumo',$u->nb_bloc)";
$bdd->query($qrt);


}



function base_matiere(){
global $list_matiere,$list_UE,$bdd;
$qrt="select * from matiere";
$m=$bdd->query($qrt);
$m=$m->fetchAll();

for($i=0;$i<count($m);$i++){
$a=new matiere($m[$i][1],$m[$i][0]);
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

function insert_categorie(categorie $cat) {
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
}
}}


}

/*base_formation();
base_ue();
base_matiere();
base_categorie();
*/


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






function insert_prof(string $n,string $p,int $s) {
global $bdd;
global $list_prof;
$str="Insert into professeurs (nom_professeur,prenom_professeur,service)  values ('$n','$p',$s)";
$bdd->query($str);

}


/*
function bdd_efface_tout(){
global $bdd;
$str="ALTER TABLE choix_etudiants DROP foreign key id_etu";
$bdd->query($str);
$str="TRUNCATE TABLE choix_etudiants";
$bdd->query($str);
$str="TRUNCATE TABLE etudiant";
$bdd->query($str);
$str="ALTER TABLE choix_etudiants add foreign key id_etu references etudiant(id)";
$bdd->query($str);
}
//bdd_efface_tout();
var_dump($p);*/

?>