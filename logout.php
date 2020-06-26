<?php
if(isset($_SESSION['logado'])){
    // se você possui algum cookie relacionado com o login deve ser removido
    session_destroy();
    header("location: localhost/tcc_da_quarentena/login.php");
    exit();
}
?>