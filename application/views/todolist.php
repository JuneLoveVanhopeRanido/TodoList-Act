<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="<?php echo base_url('assets/notification.css'); ?>">
</head>
<body ng-app="Myapp">
    <div ng-controller="todoController" >
        <button ng-click="get()">Get</button>
        <div ng-repeat="i in todolist">
            {{ i.task_id }}
            {{i.task_name}}
            <button ng-click="delete(i.id)">Delete</button>
        </div>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <script src="<?php echo base_url('assets/notification.js'); ?>"></script>
    <script src="<?php echo base_url('assets/app.js'); ?>"></script>
</body>
</html>