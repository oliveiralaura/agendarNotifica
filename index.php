<?php
    include_once 'config.php';

    $status = $statusMsg = '';
    if(!empty($_SESSION['status_response'])){
        $status_response['status'];
        $status = $status_response['status'];
        $statusMsg = $status_response['status_msg'];
    }

    $postData = '';
    if(!empty($_SESSION['postData'])){
        $postData = $_SESSION['postData'];
        unset($_SESSION['postData']);
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionando evento a agenda</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h1>Adicionando evento ao calendário do google</h1>
        <div class="wrapper">
            <?php if(!empty($statusMsg)){ ?>
                <div class="alert alert-<?php echo $status; ?>"><?php $statusMsg; ?></div>
            <?php } ?>
            <div class="col-md-12">
                <form action="addEvent.php" method="post" class="form">
                    <div class="form-group">
                        <label>Título do evento</label>
                        <input type="text" name="title" id="" class="form-control" id="title" value="<?php echo !empty($postData['title'])?$postData['title']:''; ?>" require="">
                    </div>
                    <div class="form-group">
                        <label>Descrição do evento</label>
                        <textarea name="description" id="description" cols="30" rows="10" class="form-control"><?php echo !empty($postData['description'])?$postData['description']:''; ?></textarea>
                    </div>
                    <div class="form-group">
                        <label>Local</label>
                        <input type="text" name="location" class="form-control" id="location" value="<?php echo !empty($postData['location'])?$postData['location']:''; ?>">
                    </div>
                    <div class="form-group">
                        <label>Data</label>
                        <input type="date" name="date" class="form-control" id="date" value="<?php echo !empty($postData['date'])?$postData['date']:''; ?>">
                    </div>
                    <div class="form-group">
                        <label>Hora</label>
                        <input type="time" name="time-from" class="form-control" id="time-from" value="<?php echo !empty($postData['time_from'])?$postData['time_from']:''; ?>">
                        <span>TO</span>
                        <input type="time" name="time-to" id="time-to" class="form-control" value="<?php echo !empty($postData['time_to'])?$postData['time_to']:''; ?>">
                    </div>
                    <div class="form-group">
                        <input type="submit" name="submit" class="form-control btn-primary" id="submit" value="Adicionar evento">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>