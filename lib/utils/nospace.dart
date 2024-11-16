String? nospaces(String? value) {
  if (value == null || value.isEmpty) {
    return 'Champ vide';
  }
  if (value.contains(' ')) {
    return "Pas d'espace s'il vous plait.";
  }
  return null;
}
