<?php
session_start();
?>
<html>
<head>
	<title>Perfil</title>
	<meta charset="utf-8">
</head>
<body>
	<link rel="stylesheet" type="text/css" href="Perfil.css">
	<nav id="menu">
<ul>
	<li><a href="projetotcchome.php">HOME</a></li>
	<li><a href="Linhas.php">LINHAS</a></li>
	<li><a href="Bilhete.php">BILHETES</a></li>
</ul>
</nav>

<?php
$dbservername = 'localhost';
$dbusername = 'root';
$dbpassword= '';
$dbdatabase = 'usuarios';

    $connect = mysqli_connect ($dbservername, $dbusername, $dbpassword, $dbdatabase);
$db->$connect = mysql_select_db("$banco") or die(mysql_error());

$sql = "SELECT * FROM tabela WHERE log  in='$login'";

$rt = mysql_query($sql) or die (mysql_error());

while ($l=mysql_fetch_array($rt)or die(mysql_error()));{
}
$id = $l["id"];
//bota as variavel  do perfil dps o joseph se vira pra faze o css

echo ("Olá $nome você é o usuário número $id. Está cadastrado desde $data");

echo ("<BR><BR>Nome: $nome<br>E-mail: $email<br> Cidade: $cidade<br>MSN: $MSN<br>Orkut: $orkut<Br>Site: <a href=$site>$site</a>");
print ("<a href='logout.php'>Sair</a>");

?>


</body>
</html>