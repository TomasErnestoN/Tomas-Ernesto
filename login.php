<?php
session_start();
require_once __DIR__ . '/conexao.php';
$erro = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $st = $pdo->prepare('SELECT id_user, nome, senha, tipo FROM user WHERE email = ?');
    $st->execute([trim($_POST['email'] ?? '')]);
    $u = $st->fetch();

    if ($u && password_verify($_POST['senha'] ?? '', $u['senha'])) {
        session_regenerate_id(true);
        $_SESSION['user_id'] = $u['id_user'];
        $_SESSION['user_nome'] = $u['nome'];
        $_SESSION['user_tipo'] = $u['tipo'];
        header('Location: index.php');
        exit;
    }
    $erro = 'E-mail ou senha inválidos.';
}
?>
<?php if ($erro): ?><p class="erro"><?= $erro ?></p><?php endif; ?>
<form method="post">
    <label>Email</label>
    <input type="email" name="email" />
    <label>Senha</label>
    <input type="password" name="senha" />
    <button type="submit">Entrar</button>
</form>
