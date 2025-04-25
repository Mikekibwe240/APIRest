package org.example;

@Entity
public class Note {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long candidatId;
    private String cours;
    private Double note;
    // Getters et setters
}
