<?php
class matiere{
public $nom;
public $heureCM;
public $creneauCM;
public $dureeCM;

public $heureTD;
public $creneauTD;
public $dureeTD;

public $heureTP;
public $creneauTP;
public $dureeTP;

public $nbgrpCM;
public $nbgrpTD;
public $nbgrpTP;

public $profs;

public function __construct(string $n,int $cm ,int $td,int $tp,int $gcm,int $gtd ,int $gtp){
$this->profs=["CM"=>null,"TD"=>null,"TP"=>null];

$this->dureeCM=1.33;

$this->dureeTD=1.33;
$this->dureeTP=3.00;

$this->nom=$n;

$this->heureCM=$cm;
$this->creneauCM=$cm/$this->dureeCM;
$this->nbgrpCM=$gcm;

$this->heureTD=$td;
$this->creneauTD=$td/$this->dureeTD;
$this->nbgrpTD=$gtd;

$this->heureTP=$tp;
$this->creneauTP=$tp/$this->dureeTP;
$this->nbgrpTP=$gtp;

}
}

class professeur{
public $id;
public $service;
public $charge;
public $difference;






}



?>