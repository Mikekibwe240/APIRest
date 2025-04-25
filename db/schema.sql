-- Table des étudiants
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    matricule TEXT UNIQUE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    program TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des notes
CREATE TABLE grade (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER NOT NULL,
    course_code TEXT NOT NULL,
    grade REAL NOT NULL,
    semester TEXT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id)
);

-- Insertion de 5 étudiants avec leurs grade
-- Étudiant 1 (Génie logiciel)
INSERT INTO students (matricule, first_name, last_name, program) 
VALUES ('21km217', 'Mike', 'Kibwe', 'L4 Génie logiciel');

INSERT INTO grade (student_id, course_code, grade, semester) VALUES
(1, 'Genie logiciel', 16.5, 'Q2-2025'),
(1, 'Base de donnees', 17.0, 'Q1-2025'),
(1, 'Application Distribuee', 15.0, 'Q1-2025'),
(1, 'Ethique', 19.0, 'Q2-2025'),
(1, 'Machine Learning', 18.0, 'Q1-2025'),
(1, 'Programmation systeme', 20.0, 'Q2-2025'),
(1, 'Element de compilation', 18.0, 'Q1-2023');

-- Étudiant 2 (Génie logiciel)
INSERT INTO students (matricule, first_name, last_name, program)
VALUES ('21if075', 'Isesa', 'Fatuma', 'L4 Génie logiciel');

INSERT INTO grade (student_id, course_code, grade, semester) VALUES
(2, 'Genie logiciel', 13.0, 'Q2-2025'),
(2, 'Base de donnees', 15.0, 'Q1-2025'),
(2, 'Application Distribuee', 12.0, 'Q1-2025'),
(2, 'Ethique', 19.0, 'Q2-2025'),
(2, 'Machine Learning', 18.0, 'Q1-2025'),
(2, 'Programmation systeme', 20.0, 'Q2-2025'),
(2, 'Element de compilation', 14.0, 'Q1-2023');

-- Étudiant 3 (Génie logiciel)
INSERT INTO students (matricule, first_name, last_name, program)
VALUES ('21km107', 'Kabwala', 'Matabuko', 'L4 Génie logiciel');

INSERT INTO grade (student_id, course_code, grade, semester) VALUES
(3, 'Genie logiciel', 11.0, 'Q2-2025'),
(3, 'Base de donnees', 13.0, 'Q1-2025'),
(3, 'Application Distribuee', 12.0, 'Q1-2025'),
(3, 'Ethique', 19.0, 'Q2-2025'),
(3, 'Machine Learning', 18.0, 'Q1-2025'),
(3, 'Programmation systeme', 20.0, 'Q2-2025'),
(3, 'Element de compilation', 14.0, 'Q1-2023');

-- Étudiant 4 (Génie logiciel)
INSERT INTO students (matricule, first_name, last_name, program)
VALUES ('20km258', 'Kwand', 'Munung', 'L4 Génie logiciel');

INSERT INTO grade (student_id, course_code, grade, semester) VALUES
(4, 'Genie logiciel', 11.0, 'Q2-2025'),
(4, 'Base de donnees', 12.0, 'Q1-2025'),
(4, 'Application Distribuee', 14.0, 'Q1-2025'),
(4, 'Ethique', 15.0, 'Q2-2025'),
(4, 'Machine Learning', 18.0, 'Q1-2025'),
(4, 'Programmation systeme', 13.0, 'Q2-2025'),
(4, 'Element de compilation', 14.0, 'Q1-2023');

-- Étudiant 5 (Génie logiciel)
INSERT INTO students (matricule, first_name, last_name, program)
VALUES ('20kh206', 'Kavao', 'Hangi', 'L3 Génie logiciel');

INSERT INTO grade (student_id, course_code, grade, semester) VALUES
(5, 'Genie logiciel', 11.0, 'Q2-2025'),
(5, 'POO', 13.0, 'Q1-2025'),
(5, 'MOO', 12.0, 'Q1-2025'),
(5, 'Programmation web', 19.0, 'Q2-2025'),
(5, 'SQL', 18.0, 'Q1-2025'),
(5, 'PHN', 20.0, 'Q2-2025'),
(5, 'TAD', 14.0, 'Q1-2023');









