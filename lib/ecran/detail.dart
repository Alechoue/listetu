import 'package:flutter/material.dart';
import '../models/etu.dart';
//import 'crud.dart';
//import '../services/etuservice.dart';


class Detail extends StatelessWidget {
  final Etudiant etudiant;
  const Detail({required this.etudiant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(etudiant.photo),
            ),
            SizedBox(height: 16),
            Text(
              '${etudiant.prenom} ${etudiant.nom}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Filiere: ${etudiant.filiere}'),
            Text('Age: ${etudiant.age}'),
            Text('Email: ${etudiant.email}'),
            SizedBox(height: 16),
            Text(etudiant.description),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
/*                ElevatedButton(
                  onPressed: () async {
                    final modetu = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Crud(etudiant: etudiant),
                      ),
                    );
                  },
                  child: Text('Modifier'),
                ),
                */
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'delete');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Suprimer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
