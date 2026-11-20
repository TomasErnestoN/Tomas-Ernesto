<?php

if (empty($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

if (!empty($somente_admin) && ($_SESSION['user_tipo'] ?? '') !== 'administrador') {
    header('Location: index.php');
    exit;
}