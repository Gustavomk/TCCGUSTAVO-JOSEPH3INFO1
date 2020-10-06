<!DOCTYPE html>
<html>
<head>
	<title>Inicio</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="Inicio.css">
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
			<li><a href="Cadastro.php">Sair</a></li>
		</ul>
	</nav>

	<h1>BusHelper</h1>
		<div class="header_1">

		<nav id="nav_1">
	<ul>
			<li><a href="Passagem.php">Passagens</a></li>
			<li><a href="Busca.php">Busca</a></li>
			<li><a href="Usuario.php">Perfil</a></li>

		</ul>		
	</nav>
	</div>
	</div>

	<div class="box1">
 <img class="img" src="Onibus.png" alt="Ônibus" title="Ônibus">

	</div>
	<div class="box2">
</br>
		<div class="Box2_1">
				<div class="Box2_1_1">
					<h1>Principais Linhas</h1>
					</br>
					  <label for="linhas"><p id="lel">Escolha Linha</p></label>
					  <select name="linha" id="pamonhaslinha">
					<optgroup>
						<option value="linha1">linha1</option>
						<option value="linha2">linha2</option>
						<option value="linha3">linha3</option>
						<option value="linha4">linha4</option>
					</optgroup>
					  </select>
					</br>
					</br>
					<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d14283.417719920002!2d-49.09181785!3d-26.492631499999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1spt-BR!2sbr!4v1596814754634!5m2!1spt-BR!2sbr" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
					</br>
					</br>
					</br>
					</br>
					<h1>Notícias</h1>
					</br>
					<p class="t1">Nenhuma Noticia.</p>
				</div>
		</div>
	</div>

	<?php
		mysqli_close($link)
	?>
</body>
</html>