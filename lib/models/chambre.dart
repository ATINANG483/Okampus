class Chambre {
  final int id;
  final String title;
  final String description;
  final String prix;
  final String imagePath;
  final double rating; // pour les étoiles

  Chambre({
    required this.id,
    required this.title,
    required this.description,
    required this.prix,
    required this.imagePath,
    required this.rating,
  });

  factory Chambre.fromJson(Map<String, dynamic> json) {
    return Chambre(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      prix: json['prix'],
      imagePath: json['imagePath'],
      rating: json['rating'].toDouble(),
    );
  }
}
