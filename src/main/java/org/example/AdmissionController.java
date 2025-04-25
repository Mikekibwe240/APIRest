package org.example;

@RestController
@RequestMapping("/api/admission")
public class AdmissionController {

    @Autowired
    private CandidatRepository candidatRepository;

    @PostMapping("/preinscription")
    public ResponseEntity<Candidat> preinscription(@RequestBody Candidat candidat) {
        Candidat savedCandidat = candidatRepository.save(candidat);
        return ResponseEntity.ok(savedCandidat);
    }

    @GetMapping("/candidats")
    public List<Candidat> getCandidats() {
        return candidatRepository.findAll();
    }
}
