class Etudiant {
  final String id;
  String nom;
  String prenom;
  int age;
  String email;
  String filiere;
  String description;
  String photo;

  Etudiant(
      {required this.id,
      required this.email,
      required this.age,
      required this.description,
      required this.filiere,
      required this.nom,
      required this.photo,
      required this.prenom});
}
