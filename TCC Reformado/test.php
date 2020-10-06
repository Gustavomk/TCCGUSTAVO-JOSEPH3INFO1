<!DOCTYPE html>
<html>
<head>
	<title>Teste</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="test.css">
</head>
<body>
			<?php
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpassword = "";
    $dbname = "bd_tcc_gujo_20";

    $link = mysqli_connect($dbhost, $dbuser, $dbpassword, $dbname) or die('Error
    connecting to MySQL Server.'); 

	    $query1 = "select id_usuario from usuario order by id_usuario desc limit 1;";
		$result1 = mysqli_query( $link, $query1 ) or die('Falha 2, Por favor reinicie a pagina e tente novamente');
		while ( $row = mysqli_fetch_assoc( $result1 ) ) {
	$tabela[] = $row;
	}
if ($tabela) { 
	foreach($tabela as $coluna) {
	?>
			<div class="Box2_1">

	<?php
echo $coluna['id_usuario'];
}
}

		mysqli_close($link)
	?>
</body>
</html>