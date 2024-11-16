import 'package:flutter/material.dart';
import '../models/etu.dart';

class Etucard extends StatelessWidget {
  final Etudiant etudiant;
  final VoidCallback onTap;

  const Etucard({required this.etudiant, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(etudiant.photo),
      ),
      title: Text('${etudiant.nom} ${etudiant.prenom}'),
      onTap: onTap,
    );
  }
}
