<?php
require_once __DIR__.'/../config/Database.php';

class StudentModel {
    public static function getStudent($matricule) {
        $pdo = Database::getInstance();
        $stmt = $pdo->prepare("SELECT * FROM students WHERE matricule = ?");
        $stmt->execute([$matricule]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public static function getStudentInfo($matricule) {
        $pdo = Database::getInstance();
        
        // Get student
        $student = self::getStudent($matricule);
        if (!$student) return null;
        
        // Get grades
        $stmt = $pdo->prepare("SELECT course_code, grade, semester FROM grades WHERE student_id = ?");
        $stmt->execute([$student['id']]);
        $grades = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        return [
            'student' => $student,
            'grades' => $grades
        ];
    }
    public static function getAllStudents() {
        $pdo = Database::getInstance();
        $stmt = $pdo->query("SELECT * FROM students ORDER BY last_name, first_name");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>