class Player {
  final int? id;
  final String name;

  Player({this.id, required this.name});

  factory Player.fromMap(Map<String, dynamic> json) => Player(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
