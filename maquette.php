<? php
	/**
	 * 
	 */
	class Matiere
	{
		public $idMatiere;
		public $nom;
		public $hcm;
		public $htd;
		public $htp;
		public $description;
		
		public function __construct(int $id, string $n,int $cm,int $td, int $tp string $d)
		{
			$this->idMatiere=$id;
			$this->nom=$$n;
			$this->hcm=$cm;
			$this->htd=$td;
			$this->htp=$tp;
			$this->description=$d;
		}

		public function getIdM()(){
			return $this->idMatiere;
		}
		public function getNom(){
			return $this->nom;
		}
		public function getDescription()(){
			return $this->description;
		}


		public function ajouterMatiere(int $id, string $n, string $d){

		}


	}



	/**
	 * 
	 */
	class UE
	{
		public $idUe;
		public $nomUe;
		public $descriptionUe;
		public $matieres;
		
		public function __construct(int $id, string $nom, string $description, $tab=array())
		{
			$this->idUe=$id;
			$this->nom=$$n;
			$this->description=$d;
			$this->matieres=$tab;
		}

		public function ajouterMatiere(Matiere $m){
			arra_push($this->matieres, $m);
		}
	}


	/**
	 * 
	 */
	class Formation
	{
		public $idF;
		public $nomF;

		public $ue;
		
		public function __construct(int $id, string $nom, $ue=array())
		{
			$this->idF=$id;
			$this->nomF=$nom;
			$this->ue=$ue
		}

		public function ajouterUe(UE $ue){
			array_push($this->ue, $ue);

		}
	}
?>
