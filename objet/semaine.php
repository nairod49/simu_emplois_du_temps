<?php
require("jour.php");

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
?>