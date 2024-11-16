import 'package:flutter/material.dart';
import 'package:listetu/utils/nospace.dart';
import '../models/etu.dart';

class Crud extends StatefulWidget {
  final Etudiant?
      etudiant; // Null pour un ajout, non-null pour une modification

  const Crud({this.etudiant});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<Crud> {
  final _formKey = GlobalKey<FormState>();

  // Champs de formulaire
  late String prenom;
  late String nom;
  late String email;
  late String filiere;
  late String description;
  late String photo;
  late int age;

  @override
  void initState() {
    super.initState();
    if (widget.etudiant != null) {
      // Pré-remplir les champs si on modifie un étudiant
      prenom = widget.etudiant!.prenom;
      nom = widget.etudiant!.nom;
      email = widget.etudiant!.email;
      filiere = widget.etudiant!.filiere;
      description = widget.etudiant!.description;
      photo = widget.etudiant!.photo;
      age = widget.etudiant!.age;
    } else {
      prenom = '';
      nom = '';
      email = '';
      filiere = '';
      description = '';
      photo = '';
      age = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.etudiant == null
            ? 'Ajouter un etudiant'
            : 'Modifier un étudiant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  initialValue: prenom,
                  decoration: InputDecoration(labelText: 'Prenom'),
                  onSaved: (value) => prenom = value!,
                  validator: nospaces,
                ),
                TextFormField(
                  initialValue: nom,
                  decoration: InputDecoration(labelText: 'Nom'),
                  onSaved: (value) => nom = value!,
                  validator: nospaces,
                ),
                TextFormField(
                  initialValue: age > 0 ? age.toString() : '',
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) => age = int.parse(value!),
                  validator: (value) =>
                      value!.isEmpty || int.tryParse(value) == null
                          ? 'Age invalide'
                          : null,
                ),
                TextFormField(
                  initialValue: filiere,
                  decoration: InputDecoration(labelText: 'Filiere'),
                  onSaved: (value) => filiere = value!,
                  validator: nospaces,
                ),
                TextFormField(
                  initialValue: email,
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) => email = value!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Champ requis';
                    }
                    if (!value.contains('@')) {
                      return 'Entrez un  email valide';
                    }
                    if (value.contains(' ')) {
                      return "Pas d'espace s'il vous plait";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: description,
                  decoration: InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  onSaved: (value) => description = value!,
                ),
                TextFormField(
                  initialValue: photo,
                  decoration: InputDecoration(labelText: 'URL de l’image'),
                  onSaved: (value) => photo = value!,
                  validator: nospaces,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final newetu = Etudiant(
                        id: widget.etudiant?.id ?? DateTime.now().toString(),
                        prenom: prenom,
                        nom: nom,
                        email: email,
                        age: age,
                        filiere: filiere,
                        description: description,
                        photo: photo,
                      );

                      // Ajout ou mise à jour
                      Navigator.of(context).pop(newetu);
                    }
                  },
                  child:
                      Text(widget.etudiant == null ? 'Ajouter' : 'Enregistrer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
