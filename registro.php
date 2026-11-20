<?php

session_start();
$somente_admin = true;
require_once __DIR__ . '/includes/sessao.php';
require_once __DIR__ . '/conexao.php';
$erro = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = trim($_POST['nome'] ?? '');  
    $senha = trim($_POST['senha'] ?? '');  
    $email = trim($_POST['email'] ?? ''); 
    $tipo = trim($_POST['tipo'] ?? '');

    $senha = password_hash($senha, PASSWORD_DEFAULT);
   
    $st = $pdo->prepare('INSERT INTO user (nome, senha, email, tipo) VALUES (?, ?, ?, ?)');
    $st->execute([$nome, $senha, $email, $tipo]);

    header('Location: index.php');
    exit;
   
}


?>

<form method="post">
    <label>Nome <input type="text" name="nome" required></label>
    <label>Email <input type="email" name="email" required></label>
    <label>Senha <input type="password" name="senha" required></label>
    <label for="tipo">Escolha um tipo:</label>
        <select id="tipo" name="tipo" required>
        <option value="" disabled selected>Selecione...</option>
        <option value="administrador">Administrador</option>
        <option value="operador">Operador</option>
        </select>


    <button type="submit">Salvar</button>
</form>
