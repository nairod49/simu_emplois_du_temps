
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

?>