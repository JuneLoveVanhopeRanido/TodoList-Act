var app =angular.module('Myapp',['ui-notification'])
app.controller('todoController', function($scope,$http,Notification,$interval){
    
    $scope.todolist = [] 
    $scope.todoinput ={}
    $scope.todocomplete={}
    $scope.todoupdate={}
    $scope.get = function(){
        $http.get('http://localhost/TodoList/todolist/Todolist')
            .then(function(success){
                $scope.todolist =success.data.message
            console.log(success)
            console.log($scope.todolist)
            })
         }
    $interval(function(){
        Notification.warning({message:"List Updated."});
        $scope.get()},3000)
    
    $scope.save = function(){
        $http.post('http://localhost/TodoList/todolist/Todolist',$scope.todoinput)
        .then(function(success){
            Notification.success({message:"You have successfully added a new task.", title: success.data.status});
            $scope.todoinput={};
        },function(error){
            Notification.error({message: "ERROR task not added.", title: error.data.status});
        })
        
    }
    
    $scope.completed = function(id){
    $http.post('http://localhost/TodoList/todolist/complete',id)
        .then(function(success){
            Notification.success({message:"Congratulations! Keep it going.", title: success.data.status});
        })
    
    }
    
    $scope.update = function(){ 
        $http.post('http://localhost/TodoList/todolist/update',$scope.todoupdate)
        .then(function(success){
            Notification.success({message:"You have successfully updated the task.", title: success.data.status});
            $scope.todoinput={};
        },function(error){
            Notification.error({message: "You cannot update a completed task.", title: error.data.status});
        })
    }
    
    
    
    
})