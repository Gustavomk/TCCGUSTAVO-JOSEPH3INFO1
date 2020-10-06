<!DOCTYPE html>
<html>
<head>
	<title>Perfil do Usuário</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="Edicao.css">
</head>
<body>
		<?php
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpassword = "";
    $dbname = "bd_tcc_gujo_20";

    $link = mysqli_connect($dbhost, $dbuser, $dbpassword, $dbname) or die('Error
    connecting to MySQL Server.'); 

    $query = "select id_usuario, nome_completo, login, email, sexo, telefone, data_nasc, Descricao from usuario, tipo_usuario
where tipo_usuario.Usuario_id_Usuario = usuario.id_Usuario order by id_usuario desc limit 1;";
	$result = mysqli_query( $link, $query ) or die('Falha, Por favor reinicie a pagina e tente novamente');
		while ( $row = mysqli_fetch_assoc( $result ) ) {
			$tabela[] = $row;
			}
		if ($tabela) { 
			foreach($tabela as $coluna) {	
		$id_usuario = $coluna["id_usuario"];
	}
	}

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
			<li><a href="Inicio.php">Inicio</a></li>
			<li><a href="Passagem.php">Passagens</a></li>
			<li><a href="Busca.php">Busca</a></li>

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
	<img class="perfil" src="perfil.jpg" alt="Imagem de Perfil" title="Imagem de Perfil">
	<div class="Box2_1_1">

 <?php

if ($_POST) {
    $nome = $_POST['tName'];
    $login = $_POST['tNome'];
    $mail = $_POST['tEmail'];
    $sexo = $_POST['tSexo'];
    $nasc = $_POST['tNasc'];
    $fone = $_POST['tFone'];
    $senha = $_POST['tSenha'];
    $confiSenha = $_POST['tConfiSenha'];
    $tipo = $_POST['tTipo'];

	if ($senha == $confiSenha){
		if ($nome) {

		    $query1 = "UPDATE usuario SET nome_completo = '$nome' WHERE id_Usuario = '$id_usuario';";
		        
		    $result1 = mysqli_query( $link, $query1 ) or die('Falha 1, Por favor reinicie a pagina e tente novamente');
		}

		if ($login) {

		    $query2 = "UPDATE usuario SET login = '$login' WHERE id_Usuario = '$id_usuario';";
		        
		    $result2 = mysqli_query( $link, $query2 ) or die('Falha 2, Por favor reinicie a pagina e tente novamente');
		}

		if ($mail) {

		    $query3 = "UPDATE usuario SET email = '$mail' WHERE id_Usuario = '$id_usuario';";
		        
		    $result3 = mysqli_query( $link, $query3 ) or die('Falha 3, Por favor reinicie a pagina e tente novamente');
		}

		if ($sexo) {

		    $query4 = "UPDATE usuario SET sexo = '$sexo' WHERE id_Usuario = '$id_usuario';";
		        
		    $result4 = mysqli_query( $link, $query4 ) or die('Falha 4, Por favor reinicie a pagina e tente novamente');
		}

		if ($nasc) {

		    $query5 = "UPDATE usuario SET data_nasc = '$nasc' WHERE id_Usuario = '$id_usuario';";
		        
		    $result5 = mysqli_query( $link, $query5 ) or die('Falha 5, Por favor reinicie a pagina e tente novamente');
		}
		if ($fone) {

		    $query6 = "UPDATE usuario SET telefone = '$fone' WHERE id_Usuario = '$id_usuario';";
		        
		    $result6 = mysqli_query( $link, $query6 ) or die('Falha 6, Por favor reinicie a pagina e tente novamente');
		}
		if ($senha) {

		    $query7 = "UPDATE usuario SET senha = '$senha' WHERE id_Usuario = '$id_usuario';";
		        
		    $result7 = mysqli_query( $link, $query7 ) or die('Falha 7, Por favor reinicie a pagina e tente novamente');
		}
		if ($tipo) {

		    $query8 = "UPDATE tipo_usuario SET Descricao = '$tipo' WHERE Usuario_id_usuario = '$id_usuario';";
		        
		    $result8 = mysqli_query( $link, $query8 ) or die('Falha 8, Por favor reinicie a pagina e tente novamente');
		}
		header("location:Usuario.php");


	}
	else {
	 ?>
	 <p class="t1"> Confirmar Senha não coincide com a nova Senha.</p>
	<?php
		}
}
		while ( $row = mysqli_fetch_assoc( $result ) ) {
	$tabela[] = $row;
	}

if ($tabela) { //Check if there are any rows to be displayed
	//Retrieve each element of the array
	foreach($tabela as $coluna) {
	

	?>
<p class="t1"><?php echo $coluna["nome_completo"] ?></p>

<p class="t1"><?php echo $coluna["login"] ?></p>

<p class="t1"><?php echo $coluna["email"] ?></p>

<p class="t1"><?php echo $coluna["sexo"] ?></p>

<p class="t1"><?php echo $coluna["telefone"] ?></p>

<p class="t1"><?php echo $coluna["data_nasc"] ?></p>

<p class="t1"><?php echo $coluna["Descricao"] ?></p>

	<?php

	}
	}

?>
<form method="post" action="<?php echo $_SERVER['PHP_SELF']?>">
			<p class="t2">Nome Completo </br> <input type="text" name="tName" id="input" size="45"
  maxlength="45" placeholder="Nome Sobrenome" type="cName" /> </p>

			<p class="t2">Nome De Usuário </br> <input type="text" name="tNome" id="input" size="45"
  maxlength="45" placeholder="NomeUsuario123" type="cNome" /> </p>

  			<p class="t2">Email </br> <input type="text" name="tEmail" id="input" size="45"
  maxlength="45" placeholder="NomeDoEmail@Email.com" type="cEmail" /> </p>

  	  <p class="t2"> Gênero </br>
	  	<input type="radio" value="Masculino" name="tSexo" id="cGen" />
        <label for="cMasc"> Masculino</label>
        <input type="radio" value="Feminino" name="tSexo" id="cGen" />
        <label for="cFem"> Feminino</label>
        <input type="radio" value="Outro" name="tSexo" id="cGen" />
        <label for="cFem"> Outro</label></p>

 	 <p>Data de nascimento: <input type="date" name="tNasc" id="input" /></p>
  
  	<p>Telefone: <input type="tel" id="input" name="tFone" placeholder="xxxxx-xxxx" pattern="^\d{5}-\d{4}$"  /> </p>
 
  				<p class="t2">Senha </br> <input type="password" name="tSenha" id="input" size="45"
  maxlength="45" type="cSenha" /> </p>

    			<p class="t2">Confirmar Senha </br> <input type="password" name="tConfiSenha" id="input" size="45"
  maxlength="45" type="cSenha" /> </p>
  	  
  	  <p class="t2"> Tipo de Usuário </br>
	  	<input type="radio" value="Motorista" name="tTipo" id="cTipo" />
        <label for="cMot"> Motorista </label>
        <input type="radio" value="Passageiro" name="tTipo" id="cTipo" />
        <label for="cPas"> Passageiro </label></br>
        <input type="radio" value="Cobrador" name="tTipo" id="cTipo" />
        <label for="cCob"> Cobrador </label>
        <input type="radio" value="Deficiencia" name="tTipo" id="cTipo" />
        <label for="cDef"> Deficiencia </label></p>

        <input type="submit" value="Alterar Informações!" id="Editar">

</form>
</div>
</div>
	</div>

	<?php
		mysqli_close($link)
	?>
</body>
</html>