<?php
require("semaine.php");

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