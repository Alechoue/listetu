import 'package:flutter/material.dart';
import '../ecran/detail.dart';
import '../models/etu.dart';
import '../widgets/etucard.dart';
import '../ecran/crud.dart';

class Accueil extends StatefulWidget {
  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final List<Etudiant> etudiants = [];

  void _addetu() async {
    final newetu = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Crud(),
      ),
    );

    if (newetu != null) {
      setState(() {
        etudiants.add(newetu);
      });
    }
  }

  void _viewDetails(Etudiant student) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Detail(etudiant: student),
      ),
    );

    if (result == 'delete') {
      setState(() {
        etudiants.removeWhere((s) => s.id == student.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des etudiants'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addetu,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: etudiants.length,
        itemBuilder: (ctx, index) => Etucard(
          etudiant: etudiants[index],
          onTap: () => _viewDetails(etudiants[index]),
        ),
      ),
    );
  }
}
