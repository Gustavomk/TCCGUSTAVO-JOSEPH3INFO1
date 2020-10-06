<!DOCTYPE html>
<html>
<head>
	<title>Cadastro</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="Cadastro.css">
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

	</div>
	<div class="box2">

				<div class="box2_1">
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
	    $query = "Insert INTO usuario(nome_completo, login, email, sexo, telefone, data_nasc, senha) 
	    VALUES ('$nome', '$login', '$mail', '$sexo', '$fone', '$nasc', '$senha');";
		$result = mysqli_query( $link, $query ) or die('Falha 1, Por favor reinicie a pagina e tente novamente');
	    $query1 = "select id_usuario from usuario order by id_usuario desc limit 1;";
		$result1 = mysqli_query( $link, $query1 ) or die('Falha 2, Por favor reinicie a pagina e tente novamente');
		while ( $row = mysqli_fetch_assoc( $result1 ) ) {
			$tabela[] = $row;
			}
		if ($tabela) { 
			foreach($tabela as $coluna) {	
		$id_usuario = $coluna["id_usuario"];	
		$query2 ="Insert INTO tipo_usuario(Usuario_id_Usuario, descricao, especialização_idespecialização) VALUES ('$id_usuario', '$tipo', '$id_usuario') ;";
		$result2 = mysqli_query( $link, $query2 ) or die('Falha 3, Por favor reinicie a pagina e tente novamente');
		
		}
		}
		?>
		<h2>Cadastrado com Sucesso</h2>
		<?php
	}
	else {
	 ?>
	 <h2> Confirmar Senha não coincide com a Senha.</h2>
	<?php
		}
}
			?>
							<h2>Bem-vindo Ao BusHelper!</h2>
	<p class="t1">BusHelper é o melhor site para que você possa comprar passagens, </br> descobrir rotas e verificar a horário do seu ônibus!</p>
		</div>
		<div class="box2_2">

			<form method="post" action="<?php echo $_SERVER['PHP_SELF']?>">
			<fieldset id="cadastro"><legend>Cadastro</legend>
			<p class="t2">Nome Completo </br> <input type="text" name="tName" id="input" size="90"
  maxlength="100" placeholder="Nome Sobrenome" type="cName" required/> </p>

				<p class="t2">Nome De Usuário </br> <input type="text" name="tNome" id="input" size="90"
  maxlength="100" placeholder="NomeUsuario123" type="cNome" required/> </p>

  				<p class="t2">Email </br> <input type="text" name="tEmail" id="input" size="90"
  maxlength="100" placeholder="NomeDoEmail@Email.com" type="cEmail" required/> </p>

	  <p class="t2"> Gênero </br>
	  	<input type="radio" value="Masculino" name="tSexo" id="cGen" required/>
        <label for="cMasc"> Masculino</label>
        <input type="radio" value="Feminino" name="tSexo" id="cGen" required/>
        <label for="cFem"> Feminino</label>
        <input type="radio" value="Outro" name="tSexo" id="cGen" required/>
        <label for="cFem"> Outro</label></p>

 	 <p>Data de nascimento: <input type="date" name="tNasc" id="input" required/></p>
  
  	<p>Telefone: <input type="tel" id="input" name="tFone" placeholder="xxxxx-xxxx" pattern="^\d{5}-\d{4}$" required /> </p>
 
  				<p class="t2">Senha </br> <input type="password" name="tSenha" id="input" size="90"
  maxlength="100" type="cSenha" required/> </p>

    			<p class="t2">Confirmar Senha </br> <input type="password" name="tConfiSenha" id="input" size="90"
  maxlength="100" type="cSenha" required/> </p>
  	  
  	  <p class="t2"> Tipo de Usuário </br>
	  	<input type="radio" value="Motorista" name="tTipo" id="cTipo" required/>
        <label for="cMot"> Motorista </label>
        <input type="radio" value="Passageiro" name="tTipo" id="cTipo" required/>
        <label for="cPas"> Passageiro </label></br>
        <input type="radio" value="Cobrador" name="tTipo" id="cTipo" required/>
        <label for="cCob"> Cobrador </label>
        <input type="radio" value="Deficiencia" name="tTipo" id="cTipo" required/>
        <label for="cDef"> Deficiencia </label></p>

        <input type="submit" value="Cadatrar!" id="Cad">


        
			</fieldset>
		</div>
	</div>
	<?php
		mysqli_close($link)
	?>
</body>
</html>