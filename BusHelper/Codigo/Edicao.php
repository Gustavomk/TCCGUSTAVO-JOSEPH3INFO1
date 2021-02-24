<!DOCTYPE html>
<html>
<head>
	<title>Perfil do Usuário</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../Estilização/Edicao.css">
</head>
<body>
		<?php
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpassword = "";
    $dbname = "bd_tcc_gujo_20";

    $link = mysqli_connect($dbhost, $dbuser, $dbpassword, $dbname) or die('Error
    connecting to MySQL Server.'); 
        session_start();
	function isLoggedIn()
	{
	if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true)
	{
	return false;
	}
	return true;
	}
	if (!isLoggedIn())
	{
	header('Location: Login.php');
	}
	$UserId = $_SESSION['user_id'];
    $query = "select id_Usuario, nome_completo, login, email, sexo, telefone, data_nasc, Descricao, imagem from usuario, tipo_usuario where tipo_usuario.Usuario_id_Usuario = usuario.id_Usuario and id_Usuario = '$UserId';";
	$result = mysqli_query( $link, $query ) or die('Falha, Por favor reinicie a pagina e tente novamente');
		while ( $row = mysqli_fetch_assoc( $result ) ) {
			$tabela[] = $row;
			}
		if ($tabela) { 
			foreach($tabela as $coluna) {	
		$id_usuario = $coluna["id_Usuario"];
	}
	}
		$Ola = $_SESSION['user_id'];
	    $queryOla = "SELECT id_Usuario, login from usuario Where id_Usuario = '$Ola';";
		$resultOla = mysqli_query( $link, $queryOla ) or die('Falha 1, Por favor reinicie a pagina e tente novamente');	    
    		while ( $rowOla = mysqli_fetch_assoc( $resultOla ) ) {
			$tabelaOla[] = $rowOla;
			}
		if ($tabelaOla) { 
			foreach($tabelaOla as $colunaOla) {	
		$OlaUsuario = $colunaOla["login"];
	}
	}
?>

	<div class="header">
	<nav id="nav">
		<ul>
			<li> Olá <?php echo $OlaUsuario; ?>! </li>
			<li><a href="Logout.php">Sair</a></li>
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
 <img class="img" src="../Imagens/Onibus.png" alt="Ônibus" title="Ônibus">

	</div>
	<div class="box2">
</br>
		<div class="Box2_1">
		<?php
		if ($coluna['imagem']) {
echo '<img class = "perfil" src="data:image/jpeg;base64,'.base64_encode( $coluna['imagem'] ).'" alt="Imagem de Perfil" title="Imagem de Perfil" />'; ?>
		<?php
		}
else{
	?>	


	<img class="perfil" src="../Imagens/perfil.jpg" alt="Imagem de Perfil" title="Imagem de Perfil">
<?php
}
?>
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

			if ($coluna["Descricao"] != "Motorista") { 

			if ($tipo == 'Motorista') {
			
			header("location:MotoEdicao.php");
			}
			else{
		    $query8 = "UPDATE tipo_usuario SET Descricao = '$tipo' WHERE Usuario_id_usuario = '$id_usuario';";
		        
		    $result8 = mysqli_query( $link, $query8 ) or die('Falha 8, Por favor reinicie a pagina e tente novamente');
		    		header("location:Usuario.php");
				
			}
			}
			else{
		    $query8 = "UPDATE tipo_usuario SET Descricao = '$tipo' WHERE Usuario_id_usuario = '$id_usuario';";
		        
		    $result8 = mysqli_query( $link, $query8 ) or die('Falha 8, Por favor reinicie a pagina e tente novamente');
		    		header("location:Usuario.php");
		}
		}
		else{
		header("location:Usuario.php");

		}
		

		



	}
	else {
	 ?>
		<script> 
			alert('Confirmar Senha não coincide com a Senha.');

	</script>
	<?php
		}
}

?>
<form method="post" action="<?php echo $_SERVER['PHP_SELF']?>">

			<p class="t2">Nome Completo </br> <input type="text" name="tName" id="input" size="45"
  maxlength="45" placeholder="<?php echo $coluna["nome_completo"] ?>" type="cName" /> </p>

			<p class="t2">Nome De Usuário </br> <input type="text" name="tNome" id="input" size="45"
  maxlength="45" placeholder="<?php echo $coluna["login"] ?>" type="cNome" /> </p>

  			<p class="t2">Email </br> <input type="text" name="tEmail" id="input" size="45"
  maxlength="45" placeholder="<?php echo $coluna["email"] ?>" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" type="cEmail" /> </p>

  	  <p class="t2"> Gênero </br>
	  	<input type="radio" value="Masculino" name="tSexo" id="cGen" <?php if ($coluna["sexo"] == "Masculino") { ?> Checked <?php } ?>/>
        <label for="cMasc"> Masculino </label>
        <input type="radio" value="Feminino" name="tSexo" id="cGen" <?php if ($coluna["sexo"] == "Feminino") { ?> Checked <?php } ?>/>
        <label for="cFem"> Feminino</label>
        <input type="radio" value="Outro" name="tSexo" id="cGen" <?php if ($coluna["sexo"] == "Outro") { ?> Checked <?php } ?>/>
        <label for="cFem"> Outro</label></p>

 	 <p>Data de nascimento:  	<?php
 	 		while ( $row = mysqli_fetch_assoc( $result ) ) {
	$tabela[] = $row;
	}

if ($tabela) { //Check if there are any rows to be displayed
	//Retrieve each element of the array
	foreach($tabela as $coluna) {
	

	?>
<?php echo $coluna["data_nasc"]; ?>


	<?php

	}
	}
?>
   <input type="date" name="tNasc" id="input" /></p>


  	<p>Telefone: <input type="tel" id="input" name="tFone" placeholder="<?php echo $coluna["telefone"] ?>" pattern="^\d{5}-\d{4}$"  /> </p>
 
  				<p class="t2">Senha </br> <input type="password" name="tSenha" id="input" size="45"
  maxlength="45" type="cSenha" /> </p>

    			<p class="t2">Confirmar Senha </br> <input type="password" name="tConfiSenha" id="input" size="45"
  maxlength="45" type="cSenha" /> </p>
  	  
  	  <p class="t2"> Tipo de Usuário </br>
	  	<input type="radio" value="Motorista" name="tTipo" id="cTipo" <?php if ($coluna["Descricao"] == "Motorista") { ?> Checked <?php } ?>/>
        <label for="cMot"> Motorista </label>
        <input type="radio" value="Passageiro" name="tTipo" id="cTipo" <?php if ($coluna["Descricao"] == "Passageiro") { ?> Checked <?php } ?>/>
        <label for="cPas"> Passageiro </label></br>
        <input type="radio" value="Cobrador" name="tTipo" id="cTipo" <?php if ($coluna["Descricao"] == "Cobrador") { ?> Checked <?php } ?>/>
        <label for="cCob"> Cobrador </label>
        <input type="radio" value="Deficiente" name="tTipo" id="cTipo" <?php if ($coluna["Descricao"] == "Deficiente") { ?> Checked <?php } ?>/>
        <label for="cDef"> Deficiente </label></p>

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