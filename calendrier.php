<?php

class Jour{
public $id;
public $ferie;
public $tabhorraire;


public function __construct(string $i,bool $f ){

$this->id=$i;
$this->ferie=$f;
$this->tabhorraire=array();


}

public function ajoutheure(string $h){
$this->tabhorraire[$h]=NULL;


}

public function ajourinstance(String $i){}

}

class Semaine{
 public $id;
 public $tablejour;
 public $vacance;

public function __constuct(string $i ,bool $v)
{$this->id=$i;
$this->vacance=$v;
$this->tablejour=array();}

public function ajoutjour(string $i,bool $f){
$a=new jour($i,$f);
$this->tablejour[$i]=$a;
}
}


class Calendrier{
public $id;
public $semaine;
public $datedeb;

public function __construct(string $i ,string $d ){
$this->id=$i;
$this->datedeb=$d;
$this->semaine=array();
}
public function ajoutsemaine(string $i,bool $vacance)
{$a=new semaine($i,$vacance);
$this->semaine[$i]=$a;

}
public function affiche(){




}
} 
?>