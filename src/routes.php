<?php
require_once __DIR__ . '/controllers/ApiController.php';
require_once __DIR__ . '/config/Database.php';

// Initialisation de la base de données
Database::getInstance(); // Force la connexion

// Gestion des routes
$request_uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$base_path = '/udbl-api/public'; // À adapter selon votre configuration

// Supprime le base_path de l'URI
$route = str_replace($base_path, '', $request_uri);

// Routeur simple
switch ($route) {
    // Service 1: Récupérer un étudiant
    case '/api/student':
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            ApiController::handleGetStudent();
        } else {
            http_response_code(405);
            echo json_encode(['error' => 'Méthode non autorisée']);
        }
        break;

    // Service 2: Récupérer les infos + notes
    case '/api/student-info':
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            ApiController::handleGetStudentInfo();
        } else {
            http_response_code(405);
            echo json_encode(['error' => 'Méthode non autorisée']);
        }
        break;

    // Service 3: Récupérer les infos des étudiants   
    case '/api/students':
        if ($_SERVER['REQUEST_METHOD']==='GET'){
            ApiController::handleGetAllStudents();
        } else {
            http_response_code(405);
            echo json_encode(['error' => 'Méthode non autorisée']);
        }
    

    // Route par défaut
    default:
        http_response_code(404);
        echo json_encode(['error' => 'Endpoint non trouvé']);
        break;
}
?>