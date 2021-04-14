<?php



Class groupe{

public $nom;
public $effectif;

public function __construct(string $n,int $e){
	$this->nom=$n;
	$this->effectif=$e;
}

public function affiche_groupe(){
	echo "\"", $this->nom ,"\" : ", $this->effectif;
}

public function affiche_nom(){
	echo "\"", $this->nom ,"\"";
}

}



Class classe{
public $nom;
public $groupe;
public $totaleffectif;

public function __construct(string $n, $t=array() ){
	$this->totaleffectif=0;
	$this->nom=$n;
	$this->groupe=array();
		foreach($t as $val){
		$this->totaleffectif+=$val->effectif;	
		array_push($this->groupe, $val);
		}
} 	

public function affiche_groupe(){
	echo "\"",$this->nom,"\": [";
		
		foreach($this->groupe as $val){
			echo $val->affiche_nom() ," "; 
		}

	echo "]<br> effectif :",$this->totaleffectif,"<br>";
}


public function ajout_groupe(groupe $a){
	array_push($this->groupe, $a);
}

}

Class affectation{
public $matiere;
public $table;
public $effectifCM;
public $effectifTD;
public $effectifTP;

public function __construct(string $m,$cm=array(),$td=array(),$tp=array()){
	$this->matiere=$m;
	$this->effectifCM=0;
	$this->effectifTD=0;
	$this->effectifTP=0;
	$this->table=array("CM"=>array(),"TD"=>array(),"TP"=>array());
		foreach($cm as $val){
		$this->effectifCM+=$val->totaleffectif;	
		array_push($this->table["CM"],$val);
		}
		
		foreach($td as $val){
		$this->effectifTD+=$val->totaleffectif;
		array_push($this->table["TD"],$val);
		}

		foreach($tp as $val){
		$this->effectifTP+=$val->totaleffectif;
		array_push($this->table["TP"],$val);
		}

		if($this->effectifCM==$this->effectifTD && $this->effectifCM==$this->effectifTP) {		

		}

}

public function ajout_CM(classe $c){
	$this->effectifCM+=$c->totaleffectif;
	array_push($this->table["CM"],$c);
}

public function ajout_TD(classe $c){
	$this->effectifTD+=$c->totaleffectif;
	array_push($this->table["TD"],$c);
}

public function ajout_TP(classe $c){
	$this->effectifTP+=$c->totaleffectif;
	array_push($this->table["TP"],$c);
}

	public function affiche_affectation(){
	echo "\"",$this->matiere ,"\" :[\"CM\":";
		foreach($this->table["CM"] as $val){
		echo $val->nom ," ";
		} 	
	echo "] ,[\"TD\": ";
	
		foreach($this->table["TD"] as $val){
		echo $val->nom ," ";
		}
		
	echo "] ,[\"TP\": ";
		
		foreach($this->table["TP"] as $val){
		echo $val->nom ," ";
		}
		
	echo "] <br> effectif totale : ", $this->effectifCM,"<br>"; 
	}

}

?>