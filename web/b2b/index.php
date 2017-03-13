<?php
try{
    $sql='SELECT * from test.clients';
    $dbh = new PDO('mysql:host=172.17.0.1;dbname=test','pseudo','wt17');
    $sth = $dbh->prepare($sql);
    $infos = $sth->execute();
    $infos = $sth->fetchAll(PDO::FETCH_ASSOC);
    $dbh = null;
    $ligne="<article><table><tr><th>NOM</th><th>PRENOM</th></tr>";
    foreach($infos as $key=>$value){
	    $ligne.='<tr>';
	    $ligne.='<td>'.$array[$key]["nom"].'</td>';
	    $ligne.='<td>'.$array[$key]["prenom"].'</td>';
	    $ligne.='</tr>';
    }
    $ligne.="</table></article>";
}
catch (PDOException $Exception){
    $ligne='<tr><td>'.$Exception->getMessage( ).'</td></tr>';
}
echo'
<html>
	<head>
		<link rel=stylesheet href="style.css">
		<title>Site Dynamique</title>
		<meta charset="UTF-8">
	</head>
  <body>
	<nav>
		<ul>
		 <li><a href=http://www.wt17.ephec-ti.be>Site statique</a></li>
		 <li><a href=http://b2b.wt17.ephec-ti.be>Site dynamique</a></li>
		 <li><a href=http://intranet.wt17.ephec-ti.be>Intranet</a></li>
		</ul>
	</nav>
    <h1>Site Dynamique [b2b]</h1>
	<section>
		<fieldset>
			<legend> Répartition du travail </legend>
			<article>
				<h4>Scuflaire Thomas 2TL2</h4>
				<hr>
				<p> Responsable de la partie web. Mise en place du serveur apache 7.0, la configuration
					se trouve sur Github qui est relié à Dockerhub ce qui permet le build automatique à 
					chaques modifications.</p>
			</article>
			<article>
				<h4>Marquebreucq Emmanuel 2TL2</h4>
				<hr>
				<p> Responsable de la partie DNS. </p>
			</article>
			<article>
				<h4>Brancart Clément 2TL2</h4>
				<hr>
				<p> Responsable de la partie Base de Donnée. Utilisation des bdd Mysql.</p>
			</article>
		</fieldset>
	</section>
	<hr>
    <p> Tableau de donnée venant de la base de donnée :
<table>
		  <tr><th>NOM</th><th>PRENOM</th></tr>
'.$ligne.'
	  </table>
	    
	    <br><br> Adresse du site : <b>b2b.wt17.ephec-ti.be</b> </p>
  </body>
</html>';


