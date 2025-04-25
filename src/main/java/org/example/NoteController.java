package org.example;

@RestController
@RequestMapping("/api/notes")
public class NoteController {

    @Autowired
    private NoteRepository noteRepository;

    @Autowired
    private CandidatRepository candidatRepository;

    @PostMapping("/ajouter")
    public ResponseEntity<Note> ajouterNote(@RequestBody Note note) {
        noteRepository.save(note);
        return ResponseEntity.ok(note);
    }

    @GetMapping("/candidat/{id}")
    public List<Note> getNotesByCandidat(@PathVariable Long id) {
        return noteRepository.findByCandidatId(id);
    }
}
