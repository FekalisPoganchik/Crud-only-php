<?php
  require_once 'config/connect.php';
  $product_id = $_GET['id'];
  $product = mysqli_query($connect, "SELECT * FROM `items` WHERE `id`='$product_id'");
  $product = mysqli_fetch_assoc($product);
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/style.css">
  <title>Просмотр товара</title>
</head>
<body>

  <a href="/">Главная</a>
  <hr>

  <h2><?= $product['title'] ?></h2>
  <p><?= $product['description'] ?></p>
  <p><b>Цена:</b> <?= $product['price'] ?></p>

  <hr>


</body>
</html>