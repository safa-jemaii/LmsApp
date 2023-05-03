class Events {
  final String id;
  final String name;
  final String description;
  final String fichier;
  final String duree;
  // final String month;
  final String updated;

  Events({this.id="", required this.name, required this.description, required this.fichier, required this.duree,  required this.updated });

  factory Events.fromJson(Map<String, dynamic> json) {
    return Events(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      fichier: json['fichier'] as String,
      duree: json['duree'] as String,
      // month: json['month'] as String,
      updated: json['updated'] as String,
    );
  }

  @override
  String toString() {
    return 'Cases{id: $id, name: $name, age: $description}';
  }
}