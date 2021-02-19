<!DOCTYPE html>
<html>
<head>
	<title>Cadastro</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="Motorista.css">
</head>
<body>
		<?php
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpassword = "";
    $dbname = "bd_tcc_gujo_20";

    $link = mysqli_connect($dbhost, $dbuser, $dbpassword, $dbname) or die('Error
    connecting to MySQL Server.'); 


    ?>
	<div class="header">
	<nav id="nav">
		<ul>
			<li><a href="Login.php">Entrar</a></li>
		</ul>
	</nav>
	<h1>BusHelper</h1>
	</div>
	<div class="box1">
 <img class="img" src="Onibus.png" alt="Ônibus" title="Ônibus">
<?php
if ($_POST) {
    $tip = $_POST['tTip'];
    $cnh = $_POST['tcnh'];
	    	    $query1 = "select id_usuario from usuario order by id_usuario desc limit 1;";
		$result1 = mysqli_query( $link, $query1 ) or die('Falha 1, Por favor reinicie a pagina e tente novamente');
		while ( $row = mysqli_fetch_assoc( $result1 ) ) {
			$tabela[] = $row;
			}
		if ($tabela) { 
			foreach($tabela as $coluna) {	
		$id_usuario = $coluna["id_usuario"];
		}	
	}
	    $query2 = "Update usuario SET  CNH_Motorista = '$cnh', tipo_carteira = '$tip' where id_Usuario = '$id_usuario';";
		$result = mysqli_query( $link, $query2 ) or die('Falha 2, Por favor reinicie a pagina e tente novamente');
		?>
		<script> 
			alert('Verificaremos a autenticidade dos dados de sua carteira de motorista, mas você já pode usar seu login e senha para acessar o site!');
             window.location.href = "Cadastro.php";
	</script>
		<?php
}
			?>
		</div>
		<div class="box2">
	</br>
			<div class="Box2_1">

	</br>
			<form method="post" action="<?php echo $_SERVER['PHP_SELF']?>">
			<fieldset id="cadastro"><legend>Cadastro</legend>
				<p class="t1">Parece que você deseja se cadastrar como um motorista, por favor preencha os dados de sua carteira de motorista.</p>
			<p class="t2">Tipo de Carteira</br> <input type="text" name="tTip" id="input" size="20"
  maxlength="1" placeholder="X" required/> </p>

  			<p class="t2">CNH </br> <input type="text" id="input" name="tcnh" placeholder="01234567890"  maxlength="11" required /> </p>
		</br>
        <input type="submit" value="Cadatrar!" id="Cad">
        
			</fieldset>
		</div>
	</div>
	<?php
		mysqli_close($link)
	?>
</body>
</html>