<?php
require_once __DIR__.'/../models/StudentModel.php';

class ApiController {
    public static function handleRequest() {
        header("Content-Type: application/json");
        
        $uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
        $method = $_SERVER['REQUEST_METHOD'];
    
        // Routeur amélioré
        switch (true) {
            case $uri === '/api/students' && $method === 'GET':
                self::handleGetAllStudents();
                break;
                
            case $uri === '/api/student' && $method === 'GET':
                self::handleGetStudent();
                break;
                
            case $uri === '/api/student-info' && $method === 'GET':
                self::handleGetStudentInfo();
                break;
                
            default:
                http_response_code(404);
                echo json_encode(['error' => 'Endpoint not found']);
        }
    }
    
    
    private static function handleGetStudent() {
        $matricule = $_GET['matricule'] ?? null;
        if (!$matricule) {
            http_response_code(400);
            echo json_encode(['error' => 'Matricule parameter is required']);
            return;
        }
        
        $student = StudentModel::getStudent($matricule);
        if ($student) {
            echo json_encode($student);
        } else {
            http_response_code(404);
            echo json_encode(['error' => 'Student not found']);
        }
    }
    
    private static function handleGetStudentInfo() {
        $matricule = $_GET['matricule'] ?? null;
        if (!$matricule) {
            http_response_code(400);
            echo json_encode(['error' => 'Matricule parameter is required']);
            return;
        }
        
        $info = StudentModel::getStudentInfo($matricule);
        if ($info) {
            echo json_encode($info);
        } else {
            http_response_code(404);
            echo json_encode(['error' => 'Student not found']);
        }
    }

    private static function handleGetAllStudents(){
        $students = StudentModel::getAllStudents();
        echo json_encode([
            'count' => count($students),
            'students' => $students
        ]);
    }
}
?>