<?php
require APPPATH . '/libraries/REST_Controller.php';
class Todolist extends REST_Controller{
 
    public function __construct(){
        parent::__construct();
        $this->load->model('todolist_model');
        $this->load->model('view_model');
    }
    
    public function todolist_get(){
        if($data = $this->view_model->get_all()){
            $this->response(array(
                'status' => 'Success',
                'message' => $data
            ),200);
        }else{
            $this->response(array(
                'status' => 'Error'
            ),404);
        }
    }
    
    public function todolist_post(){
        $data = $this->post();
        if($this->todolist_model->insert($data)){
            $this->response(array(
                'status' => 'Success'
            ), 200);
        }
        else{
            $this->response(array(
                'status' => 'Error'
            ), 500);
        }
    }
    
    public function complete_post(){
        $id = $this->post();
        $data = array(
            'task_status'=>'2',
            'task_completed'=>date('Y-m-d H:i:s')
        );

        if($this->todolist_model->update($data,$id[0])){
            $this->response(array(
                    'status' => 'Success'
                ), 200);
            }
            else{
                $this->response(array(
                    'status' => 'Error'
                ), 500);
            }
    }
    
    public function update_post(){
        $data= $this->post();
        $id = $data['task_id'];
        unset($data['task_id']);

        if($this->todolist_model->get(array('task_id'=>$id,'task_status'=> 1))){
        if($this->todolist_model->update($data,$id)){
            $this->response(array(
                    'status' => 'Success'
                ), 200);
            }
            else{
                $this->response(array(
                    'status' => 'Error'
                ), 500);
            }
    }else{
            $this->response(array(
                    'status' => 'Error'
                ), 404);
        }
    }
}