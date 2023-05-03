
class EventModel {
  final String? id;
  final String? name;
    // final String? description;
  final String? description;
  final String? fichier;
  final String? duree;
  // final String? month;
   //final User user;

  EventModel({
    this.id,
   

    this.name,
    this.description,
    this.fichier,
    this.duree,
    // this.month,
  });
}

final events = [
  EventModel(
    id: '1',
    name: 'Flutter Cross pmlateform training ',
    description: 'Marsa, Tunis',
    fichier: 'assets/img_event_1.png',
    duree: '9',
    // month: 'Sept',

  ),
  EventModel(
    id: '2',
    name: 'Hybrid development training',
    description: 'Ben Arous, Tunise',
    fichier: 'assets/img_event_2.png',
    duree: '12',
    // month: 'Sept',
  ),
];