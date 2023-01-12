<?php
require __DIR__ . "/inc/bootstrap.php";
$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = explode( '/', $uri );
if ((isset($uri[2]) && $uri[2] != 'user') || !isset($uri[3])) {
    header("HTTP/1.1 404 Not Found");
    exit();
}
require PROJECT_ROOT_PATH . "/Controller/Api/UserController.php";
$objFeedController = new UserController();
$strMethodName = $uri[3] . 'Action';
$objFeedController->{$strMethodName}();
?>

<!-- <html>
<?php //require "./view/includes/head.php" ?>

<body>
    <?php //require "./view/includes/navbarLogin.php" ?>
    <?php //require "./view/includes/footer.php" ?>

<div class="container my-5">
    <div class="row">
        <div class="col">
            <h5 style="text-align: center">Melden Sie sich an um in unser Shop einzukaufen</h5>
            <h6 style="text-align: center">Wir freuen uns auf Sie</h6>
        </div>
    </div>
</div>

</body>

</html> -->