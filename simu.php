<?php
require("calendrier.php");
require("groupe.php");
require ("service.php");

$i=rand(0, 30);
$a=new groupe("opt_1",$i);

$i=rand(0, 30);
$b=new groupe("opt_2d",$i);

$i=rand(0, 30);
$c=new groupe("opt_2i",$i);

$i=rand(0, 30);
$d=new groupe("opt_3",$i);

$tous=new classe("Tous",[$a,$b,$c,$d]);
$G1=new classe("G1",[$d,$a]);
$G2=new classe("G2",[$b,$c]);
$o1=new classe("O1",[$a]);
$o2=new classe("O2",[$b,$c]);
$o3=new classe("O3",[$d]);

$devweb=new affectation("DevWeb",[$tous],[$G1,$G2],[$o1,$o2,$o3]);
$ISI=new affectation("ISI",[$G1],[$o1,$o3],[$o1,$o3]);

$tous->affiche_groupe();
echo "<br>";
$G1->affiche_groupe();
echo "<br>";

$devweb->affiche_affectation();
echo "<br>";
$ISI->affiche_affectation();

?>
