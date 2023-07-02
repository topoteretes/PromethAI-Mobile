class Prompt {
  final String id;
  final String content;
  final DateTime dateCreated;

  Prompt({required this.id, required this.content, required this.dateCreated});

  factory Prompt.fromJson(Map<String, dynamic> json) {
    return Prompt(
      id: json['id'],
      content: json['content'],
      dateCreated: DateTime.parse(json['dateCreated']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'dateCreated': dateCreated.toIso8601String(),
    };
  }
}