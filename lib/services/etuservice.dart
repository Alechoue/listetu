import 'package:listetu/models/etu.dart';

class Service {
  final List<Etudiant> _etudiants = [];
  List<Etudiant> get etudiants => _etudiants;

  void addetu(Etudiant etudiant) {
    _etudiants.add(etudiant);
  }

  void modetu(String id, Etudiant modetu) {
    final index = _etudiants.indexWhere((s) => s.id == id);
    if (index != -1) {
      _etudiants[index] = modetu;
    }
  }

 void deletu(String id) {
    _etudiants.removeWhere((s) => s.id == id);
  }
}
